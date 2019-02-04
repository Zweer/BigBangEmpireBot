import { createHash } from 'crypto';
import * as moment from 'moment';
import * as request from 'request-promise';

import BigBangEmpireError from './game/error';

import { resource } from './game/types/common';
import { optionsWeb } from './game/types/options';

import Constants from './game/constants';
import ExtendedConfig from './game/extendedConfig';
import Friend from './game/friend';
import Game from './game';
import Quest from './game/quest';

export default class Request {
  readonly baseUrl: string;
  readonly clientId: string;

  private userId: number = 0;
  private userSessionId: number = 0;

  static CLIENT_VERSION: number = 82;
  static AUTH_SALT: string = 'bpHgj5214';

  static ENDPOINT_REQUEST: string = '/request.php';

  static ACTION_INIT_ENVIRONMENT = 'initEnvironment';
  static ACTION_INIT_GAME = 'initGame';
  static ACTION_LOGIN_USER = 'loginUser';
  static ACTION_GET_STANDALONE_PAYMENT_OFFERS = 'getStandalonePaymentOffers';
  static ACTION_LOGIN_FRIEND_BAR = 'loginFriendBar';
  static ACTION_SYNC_GAME = 'syncGame';
  static ACTION_CHECK_FOR_QUEST_COMPLETE = 'checkForQuestComplete';
  static ACTION_CLAIM_QUEST_REWARDS = 'claimQuestRewards';
  static ACTION_START_QUEST = 'startQuest';
  static ACTION_USE_RESOURCES = 'useResource';
  static ACTION_USE_COLLEECTED_GOAL_REWARD = 'collectGoalReward';

  static STATUS_CHECK_FOR_QUEST_COMPLETE = ['errFinishInvalidStatus', 'errCheckForQuestCompleteNoActiveQuest', 'errFinishNotYetCompleted'];

  constructor(baseUrl: string, readonly server: string, readonly email: string, readonly password: string, readonly game: Game) {
    this.baseUrl = baseUrl.replace('{SERVER}', this.server);
    this.clientId = `${this.server}${moment().format('X')}`;
  }

  async request(action: string, parameters: object = {}): Promise<any> {
    const url = `${this.baseUrl}${Request.ENDPOINT_REQUEST}`;
    const form = {
      action,
      rct: 1,
      keep_alive: true,
      device_type: 'web',
      client_version: `flash_${Request.CLIENT_VERSION}`,
      user_session_id: this.userSessionId,
      user_id: this.userId,
      auth: createHash('md5').update(`${action}${Request.AUTH_SALT}${this.userId}`).digest('hex'),

      ...parameters,
    };

    const { data, error } = await request.post({ url, form, json: true });

    if (error) {
      throw new BigBangEmpireError(error, action, form);
    }

    return data;
  }

  async initEnvironment(): Promise<ExtendedConfig> {
    const { textures, extendedConfig } = await this.request(Request.ACTION_INIT_ENVIRONMENT);

    return new ExtendedConfig(extendedConfig);
  }

  async initGame(parameters: optionsWeb): Promise<{ constants: Constants, extendedConfig: ExtendedConfig }> {
    const { constants, extendedConfig } = await this.request(Request.ACTION_INIT_GAME, {
      swf_ui_hash: parameters.swfUi,
      locale_version: parameters.localeVersion,
      swf_main_hash: parameters.swfMain,
      swf_character_hash: parameters.swfCharacter,
      swf_movie_cover_hash: parameters.swfMovieCover,

      no_text: true,
    });

    return {
      constants: new Constants(constants),
      extendedConfig: new ExtendedConfig(extendedConfig),
    };
  }

  async login(email, password): Promise<void> {
    const game = await this.request(Request.ACTION_LOGIN_USER, {
      email,
      password,
      platform_user_id: '',
      platform: '',
      app_version: Request.CLIENT_VERSION,
      client_id: this.clientId,
    });

    this.game.update(game);
    this.userId = this.game.user.id;
    this.userSessionId = this.game.user.sessionId;
  }

  async initOffers(locale) {
    const {
      consumable_offers: consumable,
      normal_offers: normal,
      special_offers: special,
      text,
    } = await this.request(Request.ACTION_GET_STANDALONE_PAYMENT_OFFERS, { locale });

    return { consumable, normal, special, text };
  }

  async initFriends(): Promise<Friend[]> {
    const { friend_data: friendsRaw } = await this.request(Request.ACTION_LOGIN_FRIEND_BAR, {
      platform: 'standalone',
      existing_session_id: this.userSessionId,
      existing_user_id: this.userId,
    });

    return friendsRaw.map(friendRaw => new Friend(friendRaw));
  }

  async syncGame(): Promise<void> {
    const game = await this.request(Request.ACTION_SYNC_GAME, { force_sync: false });

    this.game.update(game);
  }

  async checkForQuestComplete(): Promise<Quest> {
    try {
      const { quest } = await this.request(Request.ACTION_CHECK_FOR_QUEST_COMPLETE);

      return new Quest(quest);
    } catch (errorRaw) {
      const error = errorRaw as BigBangEmpireError;

      if (Request.STATUS_CHECK_FOR_QUEST_COMPLETE.includes(error.code)) {
        return null;
      }

      throw errorRaw;
    }
  }

  async claimQuestRewards(): Promise<{ currentGoalValues: object, currentItemPatternValues: object }> {
    const {
      character,
      current_goal_values: currentGoalValues = {},
      current_item_pattern_values: currentItemPatternValues = {},
      inventory,
      quests,
      user,
    } = await this.request(Request.ACTION_CLAIM_QUEST_REWARDS, {
      discard_item: false,
      create_new: true,
    });

    this.game.character.update(character);
    this.game.inventory.update(inventory);
    this.game.user.update(user);

    this.game.quests = quests.map(quest => new Quest(quest));

    Object.assign(this.game.currentGoalValue, currentGoalValues);
    Object.assign(this.game.currentItemPatternValues, currentItemPatternValues);

    return {
      currentGoalValues,
      currentItemPatternValues,
    };
  }

  async startQuest(questId: number): Promise<Quest> {
    const { character, quest, user } = await this.request(Request.ACTION_START_QUEST, { quest_id: questId });

    this.game.character.update(character);
    this.game.user.update(user);

    return new Quest(quest);
  }

  async useResource(resourceType: resource) {
    const response = await this.request(Request.ACTION_USE_RESOURCES, {
      feature_type: resourceType,
    });

    console.log(response);
  }

  async collectGoalReward(goalName, nextGoalValue) {
    const { character, user /*, collected_goals */ } = await this.request(Request.ACTION_USE_COLLEECTED_GOAL_REWARD, {
      value: nextGoalValue,
      identifier: goalName,
      discard_item: false,
    });

    this.game.character.update(character);
    this.game.user.update(user);
  }
}
