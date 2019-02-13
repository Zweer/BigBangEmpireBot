import * as moment from 'moment';

import AbstractModule from '.';

import { questStatus } from '../game/abstracts/quest';
import Quest from '../game/quest';
import { resource } from '../game/types/common';

export default class QuestModule extends AbstractModule {
  static MAX_DAILY_REFILL = 200;
  static REFILL_AMOUNT = 50;

  get questEnergyRefillAmountToday() {
    return this.game.character.questEnergyRefillAmountToday;
  }

  get questEnergy() {
    return this.game.character.questEnergy;
  }

  get maxQuestEnergy() {
    return this.game.character.maxQuestEnergy;
  }

  get currentQuest() {
    return this.game.currentQuest;
  }

  get quests() {
    return this.game.quests;
  }

  get unusedResources() {
    return this.game.character.unusedResources;
  }

  get usedResources() {
    return this.game.character.usedResources;
  }

  async handle(): Promise<void> {
    await this.handleBuyEnergy();

    await this.handleCurrentQuest();
    await this.handleStartQuest();
  }

  async handleBuyEnergy(): Promise<void> {
    if (this.questEnergyRefillAmountToday < QuestModule.MAX_DAILY_REFILL && this.questEnergy + QuestModule.REFILL_AMOUNT < this.maxQuestEnergy) {
      await this.request.buyQuestEnergy();
    }
  }

  async handleCurrentQuest(): Promise<void> {
    if (!this.currentQuest || this.currentQuest.tsComplete.isAfter(moment())) {
      return;
    }

    const currentQuestUpdate = await this.request.checkForQuestComplete();
    if (currentQuestUpdate) {
      this.currentQuest.update(currentQuestUpdate);
    }

    if (!this.currentQuest || this.currentQuest.status !== questStatus.FINISHED) {
      return;
    }

    await this.request.claimQuestRewards();
  }

  async handleStartQuest(): Promise<void> {
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

  async doQuest(currentQuest: Quest) {
    const messageArr = [];
    messageArr.push('Starting a new quest:');
    messageArr.push(`- ${currentQuest.xpPerEnergy} xp/energy`);
    messageArr.push(`- ${currentQuest.energyCost} energy`);

    messageArr.push(...currentQuest.rewards.nonStandardAttributes.map(nonStandardAttribute => `- with a ${nonStandardAttribute}`));

    if (currentQuest.rewards.dungeonKey) {
      this.log.warn(`Got a new dungeonKey in ${currentQuest.energyCost} minutes`);
    }

    this.log.debug(messageArr.join('\n'));

    const quest = await this.request.startQuest(currentQuest.id);

    currentQuest.update(quest);
  }

  async doUseResources(currentQuest: Quest) {
    if (this.unusedResources[resource.QUEST_REDUCTION] > 0 && (!this.usedResources || this.usedResources[resource.QUEST_REDUCTION] < 4) && currentQuest.energyCost > 8) {
      const savedSeconds = await this.request.useResource(resource.QUEST_REDUCTION);

      this.log.info(`Quest reduction resource used: ${savedSeconds} seconds saved`);
    }
  }
}
