import * as config from 'config';

// @ts-ignore
Promise.serial = async function resolveSerial(promises: Promise<any>[]): Promise<any[]> {
  const results = [];

  for (let i = 0, tot = promises.length; i < tot; i += 1) {
    results.push(await promises[i]);
  }

  return results;
};

import { optionsConfig, optionsWeb } from './models/types/options';

import game from './models/game';
import constants from './models/constants';
// import Friend from './models/friend';

import log from './lib/log';
import request from './lib/request';
import requestWeb from './lib/requestWeb';
import bot from './lib/telegram';

import DatingModule from './modules/dating';
import DuelModule from './modules/duel';
import GuildModule from './modules/guild';
import InventoryModule from './modules/inventory';
import MailboxModule from './modules/mailbox';
import MovieModule from './modules/movie';
import ProfileModule from './modules/profile';
import QuestModule from './modules/quest';

export default class BigBangEmpireBot {
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

  private optionsWeb: optionsWeb;

  readonly dating: DatingModule;
  readonly duel: DuelModule;
  readonly guild: GuildModule;
  readonly inventory: InventoryModule;
  readonly mailbox: MailboxModule;
  readonly movie: MovieModule;
  readonly profile: ProfileModule;
  readonly quest: QuestModule;

  public restartGame: boolean = false;
  public closeGame: boolean = false;
  public closeWhenNoQuestEnergy: boolean = true;

  static BASE_URL: string = 'https://{SERVER}.bigbangempire.com';

  constructor(readonly options: optionsConfig = config.get('bbe')) {
    bot.setBBE(this);

    this.dating = new DatingModule();
    this.duel = new DuelModule();
    this.guild = new GuildModule();
    this.inventory = new InventoryModule();
    this.mailbox = new MailboxModule();
    this.movie = new MovieModule();
    this.profile = new ProfileModule();
    this.quest = new QuestModule();
  }

  async run() {
    this.optionsWeb = await requestWeb.initConfigFromWeb();
    await request.initEnvironment();
    await request.initGame(this.optionsWeb);
    await request.login(this.options.auth.email, this.options.auth.password);
    this.offers = await request.initOffers(this.optionsWeb.locale);
    /* this.friends = */ await request.initFriends();

    await this.playRound();
  }

  runClose() {
    bot.stop();
  }

  restart() {
    this.restartGame = true;
  }

  close() {
    this.closeGame = true;
  }

  async playRound() {
    if (this.restartGame) {
      this.restartGame = false;

      log.warn('Restarting');

      return this.run();
    }

    if (this.closeGame) {
      return this.runClose();
    }

    if (!this.quest.hasEnergy && this.closeWhenNoQuestEnergy) {
      log.warn('No more energy: closing');

      return this.runClose();
    }

    try {
      await this.syncGame();

      this.handleNewLevel();

      await this.dating.handle();
      await this.duel.handle();
      await this.inventory.handle();
      await this.guild.handle();
      await this.mailbox.handle();
      await this.movie.handle();
      await this.profile.handle();
      await this.quest.handle();

      await this.handleRankRetrieval();
    } catch (err) {
      log.error(err);
      log.debug(err.stack);
    }

    setTimeout(() => this.playRound(), this.options.delaySyncTime);
  }

  async syncGame() {
    await request.syncGame();
  }

  handleNewLevel() {
    if (this.level !== game.character.level && this.level !== 0) {
      log.info(`New level: ${game.character.level}!!`);
    }

    this.level = game.character.level;
  }

  async handleRankRetrieval() {
    await Promise.all([1, 2, 3].map(async (sortType) => {
      const characterRank = await request.retrieveLeaderboard(sortType);
      const guildRank = await request.retrieveGuildLeaderboard(sortType);

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

    this.rank.movieTournament = await request.retrieveMovieTournamentLeaderboard();
    this.rank.temple = await request.retrieveSoloGuildCompetitionTournamentLeaderboard();
  }

  get datingStepPercentage() {
    const unlockPointsNeeded = this.dating.currentStep.repeat ? this.dating.currentConstantStep.unlockPointsNeededRepeat : this.dating.currentConstantStep.unlockPointsNeeded;

    return this.dating.currentStep.pointsCollected / unlockPointsNeeded;
  }
}

new BigBangEmpireBot().run()
  .catch(err => console.error(err));
