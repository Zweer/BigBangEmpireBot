import * as config from 'config';
import * as moment from 'moment';
import * as winston from 'winston';

// @ts-ignore
Promise.serial = async function resolveSerial(promises: Promise<any>[]): Promise<any[]> {
  const results = [];

  for (let i = 0, tot = promises.length; i < tot; i += 1) {
    results.push(await promises[i]);
  }

  return results;
};

import { optionsConfig, optionsWeb } from './models/types/options';

import Game from './models/game';
import Constants from './models/constants';
import ExtendedConfig from './models/extendedConfig';
// import Friend from './models/friend';

import Request from './request';
import RequestWeb from './requestWeb';
import TelegramBot, { TelegramBotLogger } from './telegram';

import DatingModule from './modules/dating';
import DuelModule from './modules/duel';
import GuildModule from './modules/guild';
import InventoryModule from './modules/inventory';
import MailboxModule from './modules/mailbox';
import MovieModule from './modules/movie';
import ProfileModule from './modules/profile';
import QuestModule from './modules/quest';

export default class BigBangEmpireBot {
  readonly game: Game;
  private extendedConfig: ExtendedConfig;
  public constants: Constants;
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
      glory: 0,
      expansion: 0,
      fans: 0,
    },
    movieTournament: 0,
    temple: 0,
  };

  readonly options: optionsConfig;
  private optionsWeb: optionsWeb;

  readonly request: Request;
  readonly requestWeb: RequestWeb;

  readonly dating: DatingModule;
  readonly duel: DuelModule;
  readonly guild: GuildModule;
  readonly inventory: InventoryModule;
  readonly mailbox: MailboxModule;
  readonly movie: MovieModule;
  readonly profile: ProfileModule;
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
    this.guild = new GuildModule(this.game, this.request, this.log, this.bot);
    this.inventory = new InventoryModule(this.game, this.request, this.log, this.bot);
    this.mailbox = new MailboxModule(this.game, this.request, this.log, this.bot);
    this.movie = new MovieModule(this.game, this.request, this.log, this.bot);
    this.profile = new ProfileModule(this.game, this.request, this.log, this.bot);
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

    this.constants = this.profile.constants = constants;
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

      this.handleNewLevel();

      await this.dating.handle();
      await this.duel.handle();
      await this.inventory.handle();
      await this.guild.handle(),
      await this.mailbox.handle();
      await this.movie.handle();
      await this.profile.handle();
      await this.quest.handle();

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

  handleNewLevel() {
    if (this.level !== this.game.character.level && this.level !== 0) {
      this.log.info(`New level: ${this.game.character.level}!!`);
    }

    this.level = this.game.character.level;
  }

  async handleRankRetrieval() {
    await Promise.all([1, 2, 3].map(async (sortType) => {
      const characterRank = await this.request.retrieveLeaderboard(sortType);
      const guildRank = await this.request.retrieveGuildLeaderboard(sortType);

      switch (sortType) {
        case 1:
          this.rank.character.honor = characterRank;
          this.rank.guild.glory = guildRank;
          break;

        case 2:
          this.rank.character.level = characterRank;
          this.rank.guild.expansion = guildRank;
          break;

        case 3:
          this.rank.character.fans = characterRank;
          this.rank.guild.fans = guildRank;
          break;

        default: // do nothing
      }
    }));

    this.rank.movieTournament = await this.request.retrieveMovieTournamentLeaderboard();
    this.rank.temple = await this.request.retrieveSoloGuildCompetitionTournamentLeaderboard();
  }

  get characterLevelPercentage() {
    const lvl = this.game.character.level;
    const nextLvl = lvl + 1;

    const xp = this.game.character.xp;
    const lvlXp = this.constants.levels[lvl].xp;
    const nextLvlXp = this.constants.levels[nextLvl].xp;

    const diff = xp - lvlXp;
    const diffNext = nextLvlXp - lvlXp;

    return diff / diffNext;
  }

  get questRemainingTime() {
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
