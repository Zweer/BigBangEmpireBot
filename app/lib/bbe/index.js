const config = require('config');
const crypto = require('crypto');
const moment = require('moment');
const cheerio = require('cheerio');
const request = require('request-promise');
const Telegraf = require('telegraf');

const Character = require('./character');

class Game {
  constructor(game) {
    this.game = game;

    this.quests = this.game.quests.map((rawQuest) => {
      const quest = rawQuest;

      quest.rewards = typeof quest.rewards === 'string' ? JSON.parse(quest.rewards) : quest.rewards;
      delete quest.movie_votes;

      return quest;
    });
  }

  update(game) {
    Object.assign(this.game, game);
  }
}

class User {
  constructor(user) {
    this.user = user;
  }

  get id() {
    return this.user.id;
  }

  get sessionId() {
    return this.user.session_id;
  }

  update(user) {
    Object.assign(this.user, user);
  }
}

class BBEError extends Error {
  constructor(code, action, params) {
    super(`${code} @ ${action} ${JSON.stringify(params)}`);

    this.code = code;
    this.action = action;
    this.params = params;
  }
}

class BBE {
  static get CLIENT_VERSION() { return 81; }

  static get AUTH_SALT() { return 'bpHgj5214'; }

  static get BASE_URL() { return 'https://{SERVER}.bigbangempire.com'; }

  static get ENDPOINT_REQUEST() { return '/request.php'; }

  static get ACTION_INIT_ENVIRONMENT() { return 'initEnvironment'; }
  static get ACTION_INIT_GAME() { return 'initGame'; }
  static get ACTION_LOGIN() { return 'loginUser'; }
  static get ACTION_GET_SSTANDALONE_PAYMENT_OFFERS() { return 'getStandalonePaymentOffers'; }
  static get ACTION_LOGIN_FRIEND_BAR() { return 'loginFriendBar'; }
  static get ACTION_SYNC_GAME() { return 'syncGame'; }
  static get ACTION_START_QUEST() { return 'startQuest'; }

  constructor(options) {
    this.options = options || config.get('bbe');
    this.configFromWeb = {};
    this.extendedConfig = {};

    this.userSessionId = 0;
    this.userId = 0;

    this.clientId = `${this.options.auth.server}${moment().format('X')}`;
  }

  get baseUrl() {
    return BBE.BASE_URL.replace('{SERVER}', this.options.auth.server);
  }

  async request(action, parameters) {
    const url = `${this.baseUrl}${BBE.ENDPOINT_REQUEST}`;
    const form = {
      action,
      rct: 1,
      keep_alive: true,
      device_type: 'web',
      client_version: `flash_${BBE.CLIENT_VERSION}`,
      user_session_id: this.userSessionId,
      user_id: this.userId,
      auth: crypto.createHash('md5').update(`${action}${BBE.AUTH_SALT}${this.userId}`).digest('hex'),

      ...parameters,
    };

    const { data, error } = await request.post({ url, form, json: true });

    if (error) {
      throw new BBEError(error, action, form);
    }

    if (data.character) {
      this.character = new Character(data.character);
    }

    if (data.user) {
      this.user = this.user ? this.user.update(data.user) : new User(data.user);
    }

    return data;
  }

  async run() {
    await this.initConfigFromWeb();
    await this.initEnvironment();
    await this.initGame();
    await this.login();
    await this.initOffers();
    await this.initFriends();

    return this.playRound();
  }

  async initConfigFromWeb() {
    const $ = await request.get({
      url: this.baseUrl,
      transform: body => cheerio.load(body),
    });

    const jsCode = $('#flashContainer script').text();

    jsCode.split('\n').forEach((unformattedLine) => {
      const line = unformattedLine.trim();
      const matchUrlParam = line.match(/^url(\w+): "(.+)\?(.+)",?$/);

      if (matchUrlParam) {
        switch (matchUrlParam[1]) {
          case 'SwfUi':
            [, , , this.configFromWeb.swfUi] = matchUrlParam;
            break;

          case 'SwfMain':
            [, , , this.configFromWeb.swfMain] = matchUrlParam;
            break;

          case 'SwfCharacter':
            [, , , this.configFromWeb.swfCharacter] = matchUrlParam;
            break;

          case 'SwfMovieCover':
            [, , , this.configFromWeb.swfMovieCover] = matchUrlParam;
            break;

          default: // do nothing
        }

        return;
      }

      const matchVar = line.match(/^(.+): "(.+)",?$/);

      if (matchVar) {
        switch (matchVar[1]) {
          case 'localeVersion':
            [, , this.configFromWeb.localeVersion] = matchVar;
            break;

          case 'default_locale':
            [, , this.configFromWeb.locale] = matchVar;
            break;

          default: // do nothing
        }
      }
    });
  }

  async initEnvironment() {
    const { extendedConfig, textures } = await this.request(BBE.ACTION_INIT_ENVIRONMENT);

    this.textures = textures;
    Object.assign(this.extendedConfig, extendedConfig);
  }

  async initGame() {
    const { extendedConfig, constants } = await this.request(BBE.ACTION_INIT_GAME, {
      swf_ui_hash: this.configFromWeb.swfUi,
      locale_version: this.configFromWeb.localeVersion,
      swf_main_hash: this.configFromWeb.swfMain,
      swf_character_hash: this.configFromWeb.swfCharacter,
      swf_movie_cover_hash: this.configFromWeb.swfMovieCover,
      no_text: true,
    });

    this.constants = constants;
    Object.assign(this.extendedConfig, extendedConfig);
  }

  async login() {
    const data = await this.request(BBE.ACTION_LOGIN, {
      platform_user_id: '',
      platform: '',
      app_version: BBE.CLIENT_VERSION,
      client_id: this.clientId,
      email: this.options.auth.email,
      password: this.options.auth.password,
    });

    this.game = new Game(data);

    this.userId = this.user.id;
    this.userSessionId = this.user.sessionId;
  }

  async initOffers() {
    const {
      consumable_offers: consumable,
      normal_offers: normal,
      special_offers: special,
      text,
    } = await this.request(BBE.ACTION_GET_SSTANDALONE_PAYMENT_OFFERS, {
      locale: this.configFromWeb.locale,
    });

    this.offers = {
      consumable,
      normal,
      special,
      text,
    };
  }

  async initFriends() {
    const { friend_data: friends } = await this.request(BBE.ACTION_LOGIN_FRIEND_BAR, {
      platform: 'standalone',
      existing_session_id: this.userSessionId,
      existing_user_id: this.userId,
    });

    this.friends = friends;
  }

  async playRound() {
    await this.syncGame();

    await this.handleCurrentQuest();
    await this.handleStartQuest();

    console.log('oo');
  }

  async syncGame() {
    const {
      convention_character_data: conventionCharacterData,
      ingame_notifications: notifications,
      missed_duels: missedDuels,
      new_messages: newMessages,
      special_offers: specialOffers,
      sync_states: syncStates,
    } = await this.request(BBE.ACTION_SYNC_GAME, { force_sync: false });

    this.conventionCharacterData = conventionCharacterData;
    this.notifications = notifications;
    this.missedDuels = missedDuels;
    this.newMessages = newMessages;
    this.specialOffers = specialOffers;
    this.syncStates = syncStates;
  }

  async handleCurrentQuest() {
    try {
      const { quest } = await this.request('checkForQuestComplete');

      if (quest.status !== 4) {
        return;
      }
    } catch (err) {
      if (err.code !== 'errFinishInvalidStatus') {
        throw err;
      }
    }

    // eslint-disable-next-line camelcase
    const { quests, current_goal_values } = await this.request('claimQuestRewards', {
      discard_item: false,
      create_new: true,
    });

    this.game.update({ quests, current_goal_values });
    this.endQuest = 0;
  }

  async handleStartQuest() {
    if (this.character.hasActiveQuest) {
      this.log('Character already on a quest');
      return;
    }

    if (this.character.energy < 2) {
      this.log('Energy low');
      return;
    }

    this.log(`Current energy: ${this.character.energy}`);

    const quests = this.game.quests.sort((a, b) => {
      if (Object.keys(a.rewards).length > 6) {
        return -1;
      }

      if (Object.keys(b.rewards).length > 6) {
        return 1;
      }

      if (a.rewards.item !== 0) {
        return -1;
      }

      if (b.rewards.item !== 0) {
        return 1;
      }

      return (a.rewards.xp / a.energy_cost) > (b.rewards.xp / b.energy_cost) ? -1 : 1;
    });

    const quest = quests.find(tmpQuest => tmpQuest.energy_cost <= this.character.energy);

    if (quest) {
      await this.doQuest(quest);
    }
  }

  async doQuest(quest) {
    let startingString = 'Starting a quest\n';
    startingString += `- ${Math.round(quest.rewards.xp / quest.energy_cost)} xp/energy\n`;
    startingString += `- ${quest.energy_cost} energy`;

    const rewardKeys = Object.keys(quest.rewards);

    if (rewardKeys.length > 6) {
      rewardKeys.slice(6).forEach((reward) => {
        if (reward === 'dungeon_key') {
          this.broadcastMsg(`Got a new "${reward}" in ${quest.energy_cost} minutes`);
        }

        startingString += `\n- with a "${reward}"`;
      });
    }

    if (quest.rewards.item) {
      startingString += '\n- with an item';
    }

    this.log(startingString);

    const questResponse = await this.request(BBE.ACTION_START_QUEST, {
      quest_id: quest.id,
    });

    console.log(questResponse);
  }

  log(message) {
    console.log(message);
  }
}

module.exports = BBE;

new BBE().run()
  .catch(err => console.error(err));
