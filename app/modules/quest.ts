import * as moment from 'moment';

import request from '../lib/request';
import game from '../models/game';

import AbstractModule from '.';

import { questStatus } from '../models/abstracts/quest';
import Quest from '../models/quest';
import { resource } from '../models/types/common';

export default class QuestModule extends AbstractModule {
  static MAX_DAILY_REFILL = 200;
  static REFILL_AMOUNT = 50;

  get questEnergyRefillAmountToday() {
    return game.character.questEnergyRefillAmountToday;
  }

  get questEnergy() {
    return game.character.questEnergy;
  }

  get maxQuestEnergy() {
    return game.character.maxQuestEnergy;
  }

  get currentQuest() {
    return game.currentQuest;
  }

  get quests() {
    return game.quests;
  }

  get unusedResources() {
    return game.character.unusedResources;
  }

  get usedResources() {
    return game.character.usedResources;
  }

  get storyDungeon() {
    return game.storyDungeon;
  }

  async handle(): Promise<void> {
    await this.handleBuyEnergy();

    await this.handleCurrentQuest();

    await this.handleStoryDungeon();

    await this.handleStartQuest();
  }

  private async handleBuyEnergy(): Promise<void> {
    if (this.questEnergyRefillAmountToday < QuestModule.MAX_DAILY_REFILL && this.questEnergy + QuestModule.REFILL_AMOUNT < this.maxQuestEnergy) {
      await request.buyQuestEnergy();
    }
  }

  get hasEnergy() {
    return this.questEnergy + QuestModule.MAX_DAILY_REFILL - this.questEnergyRefillAmountToday >= 2;
  }

  private async handleCurrentQuest(): Promise<void> {
    if (!this.currentQuest || this.currentQuest.tsComplete.isAfter(moment())) {
      return;
    }

    const currentQuestUpdate = await request.checkForQuestComplete();
    if (currentQuestUpdate) {
      this.currentQuest.update(currentQuestUpdate);
    }

    if (!this.currentQuest || this.currentQuest.status !== questStatus.FINISHED) {
      return;
    }

    await request.claimQuestRewards();
  }

  private async handleStartQuest(): Promise<void> {
    if (this.currentQuest) {
      return;
    }

    if (this.questEnergy < 2) {
      this.log.verbose('Energy low');
      return;
    }

    this.log.debug(`Current energy: ${this.questEnergy}`);

    const quest = this.quests.find((quest: Quest) => quest.energyCost < this.questEnergy);

    if (quest) {
      await this.doQuest(quest);
      await this.doUseResources(quest);
    }
  }

  private async doQuest(currentQuest: Quest) {
    const messageArr = [];
    messageArr.push('Starting a new quest:');
    messageArr.push(`- ${currentQuest.xpPerEnergy} xp/energy`);
    messageArr.push(`- ${currentQuest.energyCost} energy`);

    messageArr.push(...currentQuest.rewards.nonStandardAttributes.map(nonStandardAttribute => `- with a ${nonStandardAttribute}`));

    if (currentQuest.rewards.dungeonKey) {
      this.log.warn(`Got a new dungeonKey in ${currentQuest.energyCost} minutes`);
    }

    this.log.debug(messageArr.join('\n'));

    const quest = await request.startQuest(currentQuest.id);

    currentQuest.update(quest);
  }

  private async doUseResources(currentQuest: Quest) {
    if (this.unusedResources[resource.QUEST_REDUCTION] > 0 && (!this.usedResources || this.usedResources[resource.QUEST_REDUCTION] < 4) && currentQuest.energyCost > 8) {
      const savedSeconds = await request.useResource(resource.QUEST_REDUCTION);

      this.log.info(`Quest reduction resource used: ${savedSeconds} seconds saved`);
    }
  }

  private async handleStoryDungeon() {
    if (this.currentQuest || this.questEnergy === 0) {
      return;
    }

    if (!this.storyDungeon) {
      return;
    }

    // TODO: isFinished???
    if (this.storyDungeon.tsLastAttack.isBefore(moment().subtract(1, 'hour'))) {
      this.log.info('Starting a story dungeon attack');

      await request.startStoryDungeonBattle(this.storyDungeon);
      await request.claimStoryDungeonReward(this.storyDungeon);
    }
  }

  get remainingTime() {
    const now = moment();

    if (!this.currentQuest || this.currentQuest.tsComplete.isBefore(now)) {
      return 'no quest in progress';
    }

    const diff = this.currentQuest.tsComplete.diff(now, 'seconds');

    const minutes = Math.round(diff / 60);
    const seconds = diff % 60;

    return `${minutes} minute${minutes === 1 ? '' : 's'} ${seconds} second${seconds === 1 ? '' : 's'}`;
  }
}
