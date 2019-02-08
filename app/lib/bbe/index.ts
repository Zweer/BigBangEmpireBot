import * as config from 'config';
import * as moment from 'moment';
import * as numeral from 'numeral';
import * as winston from 'winston';

import {questStatus, questType} from './game/abstracts/quest';

import {resource} from './game/types/common';
import {itemType} from './game/types/item';
import {optionsConfig, optionsWeb} from './game/types/options';

import Game from './game';
import Constants from './game/constants';
import ExtendedConfig from './game/extendedConfig';
import Friend from './game/friend';
import {movieStatus} from './game/movie';
import Opponent from './game/duel/opponent';
import Quest from './game/quest';

import Request from './request';
import RequestWeb from './requestWeb';
import TelegramBot, {TelegramBotLogger} from './telegram';

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
  private friends: Friend[];

  private level: number = 0;
  private statPointAvailable: number = 0;
  private canDuel: boolean = true;
  private alertMissiles: boolean = true;
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
  private notifiedItems: number[] = [];
  private refreshShop: boolean = false;

  readonly options: optionsConfig;
  private optionsWeb: optionsWeb;

  readonly request: Request;
  readonly requestWeb: RequestWeb;
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
    this.friends = await this.request.initFriends();
  }

  async playRound() {
    try {
      await this.syncGame();

      this.handleNewLevel();
      this.handleInventoryBasic();
      await this.handleInventoryAdvanced();
      await this.handleRefreshShop();
      await this.handleInventoryShop();
      await this.handleStatPointAvailable();

      await this.handleDuel();
      await this.handleMissedDuels();

      await this.handleCurrentMovieQuest();
      await this.handleMovieVotes();
      await this.handleMovieRefresh();
      await this.handleMovieChoice();
      await this.handleMovie();
      await this.handleMovieStar();

      await this.handleBuyEnergy();

      await this.handleCurrentQuest();
      await this.handleStartQuest();

      await this.handleCollectWork();

      await this.handleMessages();
      await this.handleResourceRequests();

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

  handleNewLevel() {
    if (this.level !== this.game.character.level && this.level !== 0) {
      this.log.info(`New level: ${this.game.character.level}!!`);
    }

    this.level = this.game.character.level;
  }

  handleInventoryBasic() {
    if (this.game.inventory.missilesItemId === 0) {
      this.canDuel = false;

      if (this.alertMissiles) {
        this.alertMissiles = false;

        this.log.warn('No more missiles!');
      }
    } else if (!this.canDuel) {
      this.canDuel = true;
      this.alertMissiles = true;

      this.log.verbose('More missiles...');
    }

    if (this.game.inventory.bagItemsId.every(bagItemId => bagItemId !== 0)) {
      this.canDuel = false;

      this.log.warn('Inventory is full!');
    }
  }

  async handleInventoryAdvanced() {
    let modified;

    do {
      modified = false;

      // @ts-ignore
      await Promise.serial(this.game.inventory.bagItemsId.map((bagItemId) => {
        if (modified) {
          return;
        }

        const item = this.game.getItem(bagItemId);
        if (!item) {
          return;
        }

        const equippedItemId = this.game.inventory.getItemBySlot(item.type);

        if (!equippedItemId) {
          if (item.isOutfitItem) {
            this.log.verbose(`Moving item: ${item.slot} (empty slot)`);

            modified = true;

            return this.request.moveInventoryItem(item.id, item.type);
          }

          if (item.isUsable) {
            return this.request.useInventoryItem(item);
          }
        }

        const equippedItem = this.game.getItem(equippedItemId);

        if (item.statTotal <= equippedItem.statTotal) {
          if (item.type === itemType.MISSILES) {
            return;
          }

          this.log.verbose(`Selling item: ${item.slot}\n- my: ${equippedItem.statTotal}\n- bag: ${item.statTotal}`);

          return this.request.sellInventoryItem(item.id);
        }

        if (!item.battleSkill && !equippedItem.battleSkill) {
          this.log.verbose(`Moving item: ${item.slot} (better item)`);

          modified = true;

          return this.request.moveInventoryItem(item.id, item.type);
        }

        this.log.verbose(`New item: ${item.slot}\n- my: ${equippedItem.statTotal}\n- bag: ${item.statTotal}`);
      }));
    } while (modified);
  }

  async handleRefreshShop() {
    if (!this.game.character.hasRefreshedShopToday && this.refreshShop) {
      this.log.info('Refreshing shop');

      await this.request.refreshShopItems();
    }
  }

  async handleInventoryShop() {
    await Promise.all(this.game.inventory.shopItemsId.map(async (shopItemId) => {
      if (!shopItemId) {
        return;
      }

      const item = this.game.getItem(shopItemId);
      const equippedItemId = this.game.inventory.getItemBySlot(item.slot);
      const equippedItem = equippedItemId && this.game.getItem(equippedItemId);

      const isUnequipped = !equippedItem;
      const isBetter = equippedItem && item.statTotal > equippedItem.statTotal;
      const isMissiles = item.type === itemType.MISSILES;

      if (isUnequipped || isBetter || isMissiles) {
        const messages = [];
        messages.push(`- ${item.slot}`);
        messages.push(`- ${item.buyPrice} ${item.premiumItem ? 'diamonds' : 'coins'}`);

        if (isUnequipped) {
          messages.push('- You don\'t have this slot equipped');
        }

        if (isBetter) {
          messages.push(`- It's ${item.statTotal - equippedItem.statTotal} points better`);
        }

        if (isMissiles) {
          messages.push('- It\'s missiles');
        }

        if (item.premiumItem) {
          if (this.notifiedItems.includes(item.id)) {
            return;
          }

          this.notifiedItems.push(item.id);

          return this.bot.askForItemPurchase(item, messages, this.game.inventory);
        }

        this.log.info(['You are buying an item:', ...messages].join('\n'));

        return this.request.buyShopItem(item, this.game.inventory.firstAvailableSlot);
      }
    }));

    this.refreshShop = true;
  }

  async handleStatPointAvailable() {
    if (!this.game.character.statPointsAvailable) {
      return;
    }

    if (this.statPointAvailable !== this.game.character.statPointsAvailable) {
      this.log.verbose(`You have stat points available: ${this.game.character.statPointsAvailable}`);
    }

    this.statPointAvailable = this.game.character.statPointsAvailable;
  }

  async handleDuel() {
    if (this.game.character.duelStamina < this.game.character.duelStaminaCost || !this.canDuel) {
      return;
    }

    this.log.debug(`Duel stamina: ${this.game.character.duelStamina}`);

    const opponents = await this.request.getDuelOpponents();

    if (!opponents) {
      this.log.error('No duel opponents');
    }

    const sortedOpponents = opponents
      .filter(o => !o.name.startsWith('deleted_'))
      .filter(o => !!o)
      .sort((a, b) => b.honor - a.honor);

    const opponent = sortedOpponents.find(o => o.totalStats < this.game.character.statTotal) || sortedOpponents.pop();

    if (opponent) {
      await this.makeDuel(opponent);
    }
  }

  async makeDuel(opponent: Opponent) {
    this.log.verbose(`Starting duel with ${opponent.name}`);

    const { battle, duel, item } = await this.request.startDuel(opponent.id);

    const addendum = [''];

    if (duel.characterARewards.premium) {
      addendum.push(`- ${duel.characterARewards.premium} gems`);
    }

    if (duel.characterARewards.item) {
      addendum.push(`- ${duel.characterARewards.item} item`);
    }

    this.log.verbose(`You ${battle.won ? 'won' : 'lost'} the duel!\n- ${duel.characterARewards.honor} honor${addendum.join('\n')}`);

    await this.request.checkForDuelComplete();
    await this.request.claimDuelRewards();
  }

  async handleMissedDuels() {
    if (this.game.missedDuels === 0) {
      return;
    }

    const missedDuels = await this.request.getMissedDuelsNew();

    missedDuels.forEach(missedDuel => this.log.verbose(`Missed duel: ${missedDuel.won ? 'won' : 'lost'}\n- ${missedDuel.opponent.name}\n- ${numeral(missedDuel.characterBRewards.honor).format('+0')} honor`));

    await this.request.claimMissedDuelsRewards();
  }

  async handleCurrentMovieQuest() {
    if (!this.game.movie) {
      return true;
    }

    try {
      await this.request.claimMovieQuestRewards();
    } catch (error) {
      // do nothing
    }
  }

  async handleMovieVotes() {
    if (this.game.character.movieVotes === 0) {
      return;
    }

    const { movies } = await this.request.getMoviesToVote();
    const [movie] = movies;

    await this.request.voteForMovie(movie);
  }

  async handleMovieRefresh() {
    if (this.game.movie && this.game.movie.status !== movieStatus.FINISHED) {
      return;
    }

    if (this.game.character.tsLastMovieFinished.isAfter(moment().subtract(1, 'hour'))) {
      return;
    }

    await this.request.refreshMoviePool();
  }

  async handleMovieChoice() {
    if (this.game.movie || !(this.game.movies && this.game.movies.length)) {
      return;
    }

    this.log.debug('Choosing the next movie');

    const movie = this.game.movies
      .sort((a, b) => b.fans - a.fans)
      .find(m => !!m);

    await this.request.startMovie(movie);
  }

  async handleMovie() {
    if (!this.game.movie || !(this.game.movieQuests && this.game.movieQuests.length)) {
      return;
    }

    if (this.game.movie.status === movieStatus.TIMEUP) {
      await this.request.extendMovieTime();
    }

    const quest = this.game.movieQuests.find(q => q.type === questType.STAT);

    if (quest && this.game.character.movieEnergy >= quest.energyCost) {
      this.log.verbose(`Starting a movie quest: ${quest.rewards.movieProgress} reward`);

      await this.request.startMovieQuest(quest);
    }
  }

  async handleMovieStar() {
    if (!this.game.movie) {
      return true;
    }

    if (this.game.movie.isWaitingForClaim) {
      await this.request.claimMovieStar();

      this.log.info(`🎥 ${numeral(this.game.movie.claimedStars).format('0o')} star claimed`);
    }

    if (this.game.movie.isWaitingForFinish) {
      await this.request.finishMovie();

      this.log.info('🎥 Finished');
    }
  }

  async handleBuyEnergy() {
    if (this.game.character.questEnergyRefillAmountToday < 200 && this.game.character.questEnergy + 50 < this.game.character.maxQuestEnergy) {
      await this.request.buyQuestEnergy();
    }
  }

  async handleCurrentQuest() {
    const currentQuest = this.game.currentQuest;

    if (!currentQuest || currentQuest.tsComplete.isAfter(moment())) {
      return;
    }

    const currentQuestUpdate = await this.request.checkForQuestComplete();
    if (currentQuestUpdate) {
      currentQuest.update(currentQuestUpdate);
    }

    if (!currentQuest || currentQuest.status !== questStatus.FINISHED) {
      return;
    }

    await this.request.claimQuestRewards();
  }

  async handleStartQuest() {
    if (this.game.currentQuest) {
      return;
    }

    if (this.game.character.questEnergy < 2) {
      this.log.verbose('Energy low');
      return;
    }

    this.log.debug(`Current energy: ${this.game.character.questEnergy}`);

    const quest = this.game.quests.find((quest: Quest) => quest.energyCost < this.game.character.questEnergy);

    if (quest) {
      await this.doQuest(quest);
    }
  }

  async doQuest(currentQuest: Quest) {
    let startingQuestString = 'Starting a new quest:\n';
    startingQuestString += `- ${currentQuest.xpPerEnergy} xp/energy\n`;
    startingQuestString += `- ${currentQuest.energyCost} energy\n`;

    startingQuestString += currentQuest.rewards.nonStandardAttributes.map(nonStandardAttribute => `- with a ${nonStandardAttribute}\n`).join('');

    if (currentQuest.rewards.dungeonKey) {
      this.log.warn(`Got a new dungeonKey in ${currentQuest.energyCost} minutes`);
    }

    this.log.debug(startingQuestString);

    const quest = await this.request.startQuest(currentQuest.id);

    currentQuest.update(quest);

    if (this.game.character.unusedResources[resource.QUEST_REDUCTION] > 0 && (!this.game.character.usedResources || this.game.character.usedResources[resource.QUEST_REDUCTION] < 4) && currentQuest.energyCost > 8) {
      await this.request.useResource(resource.QUEST_REDUCTION);
    }
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

    if (!currentQuest || currentQuest.tsComplete.isAfter(now)) {
      return;
    }

    const diff = currentQuest.tsComplete.diff(now, 'seconds');

    const minutes = Math.round(diff / 60);
    const seconds = diff % 60;

    return `${minutes} minute${minutes === 1 ? '' : 's'} ${seconds} second${seconds === 1 ? '' : 's'}`;
  }
}

new BigBangEmpireBot().run()
  .catch(err => console.error(err));
