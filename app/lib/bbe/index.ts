import * as config from 'config';
import * as moment from 'moment';
import * as winston from 'winston';

import { optionsConfig, optionsWeb } from './game/types/options';

import Game from './game';
import Constants from './game/constants';
import ExtendedConfig from './game/extendedConfig';
// import Friend from './game/friend';

import Request from './request';
import RequestWeb from './requestWeb';
import TelegramBot, { TelegramBotLogger } from './telegram';

import DatingModule from './modules/dating';
import DuelModule from './modules/duel';
import InventoryModule from './modules/inventory';
import MovieModule from './modules/movie';
import QuestModule from './modules/quest';

// @ts-ignore
Promise.serial = async function resolveSerial(promises: Promise<any>[]): Promise<any[]> {
  const results = [];

  for (let i = 0, tot = promises.length; i < tot; i += 1) {
    results.push(await promises[i]);
  }

  return results;
};

export default class BigBangEmpireBot {
  readonly game: Game;
  private extendedConfig: ExtendedConfig;
  private constants: Constants;
  private offers: { consumable; normal; special; text };
  // private friends: Friend[];

  private level: number = 0;
  public rank = {
    character: {
      honor: 0,
      level: 0,
      fans: 0,
    },
    guild: {
      honor: 0,
      level: 0,
      fans: 0,
    },
  };

  readonly options: optionsConfig;
  private optionsWeb: optionsWeb;

  readonly request: Request;
  readonly requestWeb: RequestWeb;

  readonly dating: DatingModule;
  readonly duel: DuelModule;
  readonly inventory: InventoryModule;
  readonly movie: MovieModule;
  readonly quest: QuestModule;

  readonly bot: TelegramBot;
  readonly log: winston.Logger;

  static BASE_URL: string = 'https://{SERVER}.bigbangempire.com';

  constructor(options?: optionsConfig) {
    this.options = options || config.get('bbe');
    this.game = new Game();

    this.request = new Request(BigBangEmpireBot.BASE_URL, this.options.auth.server, this.options.auth.email, this.options.auth.password, this.game);
    this.requestWeb = new RequestWeb(BigBangEmpireBot.BASE_URL, this.options.auth.server);

    this.bot = new TelegramBot(this);

    this.log = winston.createLogger({
      level: 'silly',
      format: winston.format.combine(
        winston.format.timestamp(),
        winston.format.printf(info => `${info.timestamp} [${info.level}] ${info.message}`),
      ),
      transports: [
        new winston.transports.Console(),
        new TelegramBotLogger({
          bot: this.bot,
          level: 'info',
        }),
      ],
    });

    this.dating = new DatingModule(this.game, this.request, this.log, this.bot);
    this.duel = new DuelModule(this.game, this.request, this.log, this.bot);
    this.inventory = new InventoryModule(this.game, this.request, this.log, this.bot);
    this.movie = new MovieModule(this.game, this.request, this.log, this.bot);
    this.quest = new QuestModule(this.game, this.request, this.log, this.bot);
  }

  async run() {
    await this.initConfigFromWeb();
    await this.initEnvironment();
    await this.initGame();
    await this.login();
    await this.initOffers();
    await this.initFriends();

    await this.playRound();
  }

  async initConfigFromWeb() {
    this.optionsWeb = await this.requestWeb.initConfigFromWeb();
  }

  async initEnvironment() {
    this.extendedConfig = await this.request.initEnvironment();
  }

  async initGame() {
    const { constants, extendedConfig } = await this.request.initGame(this.optionsWeb);

    this.constants = constants;
    this.extendedConfig.update(extendedConfig);
  }

  async login() {
    await this.request.login(this.options.auth.email, this.options.auth.password);
  }

  async initOffers() {
    this.offers = await this.request.initOffers(this.optionsWeb.locale);
  }

  async initFriends() {
    /* this.friends = */ await this.request.initFriends();
  }

  async playRound() {
    try {
      await this.syncGame();

      await this.handleVoucher();

      this.handleNewLevel();

      await this.dating.handle();
      await this.inventory.handle();
      await this.movie.handle();
      await this.quest.handle();

      await this.handleCollectWork();

      await this.handleMessages();
      await this.handleResourceRequests();
      await this.handleGuildMessages();

      await this.handleCompleteGoals();

      await this.handleRankRetrieval();
    } catch (err) {
      this.log.error(err);
      this.log.debug(err.stack);
    }

    setTimeout(() => this.playRound(), this.options.delaySyncTime);
  }

  async syncGame() {
    await this.request.syncGame();
  }

  async handleVoucher() {
    if (this.game.character.newUserVoucherIds.length) {
      console.log('ooo');
    }
  }

  handleNewLevel() {
    if (this.level !== this.game.character.level && this.level !== 0) {
      this.log.info(`New level: ${this.game.character.level}!!`);
    }

    this.level = this.game.character.level;
  }

  async handleCollectWork() {
    const threeHoursAgo = moment().subtract(3, 'hours');

    if (this.game.character.tsLastWorkCollection.isBefore(threeHoursAgo)) {
      const collectedWork = await this.request.collectWork();

      this.log.verbose(`Collected work: ${collectedWork.gameCurrencyReward} coins (${collectedWork.offer})`);
    }
  }

  async handleMessages() {
    if (this.game.newMessages === 0) {
      return;
    }

    this.log.info(`You have ${this.game.newMessages} new messages (${this.game.character.pendingResourceRequests} resource requests)`);

    if (this.game.character.pendingResourceRequests > 0) {
      this.log.debug('Accepting all resource requests');

      await this.request.acceptAllResourceRequests();
    }
  }

  async handleResourceRequests() {
    const friends = await this.request.getAvailableResourceRequestFriends();

    if (friends.length) {
      await this.request.createResourceRequest(friends);
    }
  }

  async handleGuildMessages() {
    if (this.game.newGuildLogEntries) {
      const guildMessages = await this.request.getGuildLog();

      guildMessages.forEach(guildMessage => this.log.info(`👥 ${guildMessage}`));
    }
  }

  async handleCompleteGoals() {
    await Object.keys(this.game.currentGoalValue)
      .map((goalName) => {
        const currentGoalValue = this.game.currentGoalValue[goalName];
        const collectedGoal = this.game.collectedGoals[goalName] || { value: 0 };
        const goal = this.constants.goals[goalName];

        if (currentGoalValue.currentValue <= collectedGoal.value) {
          return;
        }

        let nextGoalValue;
        Object.keys(goal.values)
          .sort((a, b) => parseInt(a, 10) < parseInt(b, 10) ? -1 : 1)
          .every((goalValue) => {
            if (parseInt(goalValue, 10) > collectedGoal.value) {
              nextGoalValue = goalValue;

              return false;
            }

            return true;
          });

        if (nextGoalValue && currentGoalValue.value >= nextGoalValue) {
          return { goalName, nextGoalValue };
        }
      })
      .filter(goal => !!goal)
      .reduce((previousPromise, { goalName, nextGoalValue }) => previousPromise.then(async () => {
        this.log.verbose(`Completing a goal: ${goalName} (${nextGoalValue})`);

        await this.request.collectGoalReward(goalName, nextGoalValue);
      }), Promise.resolve());

    this.game.currentGoalValue = {};
  }

  async handleRankRetrieval() {
    await Promise.all([1, 2, 3].map(async (sortType) => {
      const rank = await this.request.retrieveLeaderboard(sortType);

      switch (sortType) {
        case 1:
          this.rank.character.honor = rank;
          break;

        case 2:
          this.rank.character.level = rank;
          break;

        case 3:
          this.rank.character.fans = rank;
          break;

        default: // do nothing
      }
    }));
  }

  get levelPerc() {
    const lvl = this.game.character.level;
    const nextLvl = lvl + 1;

    const xp = this.game.character.xp;
    const lvlXp = this.constants.levels[lvl].xp;
    const nextLvlXp = this.constants.levels[nextLvl].xp;

    const diff = xp - lvlXp;
    const diffNext = nextLvlXp - lvlXp;

    return diff / diffNext;
  }

  get questRemaining() {
    const currentQuest = this.game.currentQuest;
    const now = moment();

    if (!currentQuest || currentQuest.tsComplete.isBefore(now)) {
      return 'no quest in progress';
    }

    const diff = currentQuest.tsComplete.diff(now, 'seconds');

    const minutes = Math.round(diff / 60);
    const seconds = diff % 60;

    return `${minutes} minute${minutes === 1 ? '' : 's'} ${seconds} second${seconds === 1 ? '' : 's'}`;
  }
}

new BigBangEmpireBot().run()
  .catch(err => console.error(err));
