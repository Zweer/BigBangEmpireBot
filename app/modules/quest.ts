import log from '../lib/log';

import character, { Character } from '../models/character';
import game from '../models/game';

import AbstractModule from '.';

import Quest from '../models/story/quest';

export default class QuestModule extends AbstractModule {
  static MAX_DAILY_REFILL = 200;
  static REFILL_AMOUNT = 50;

  async handle(): Promise<void> {
    await this.handleBuyEnergy();

    await this.handleCurrentQuest();

    await this.handleStoryDungeon();

    await this.handleStartQuest();
  }

  private async handleBuyEnergy(): Promise<void> {
    if (character.needToRefillEnergy) {
      await Character.buyQuestEnergy();
    }
  }

  get hasEnergy() {
    return character.remainingEnergy >= game.minQuestEnergy;
  }

  private async handleCurrentQuest(): Promise<void> {
    if (!game.currentQuest || game.currentQuest.isOngoing) {
      return;
    }

    await game.currentQuest.checkForQuestCompleteAndUpdate();

    if (!game.currentQuest || !game.currentQuest.isFinished) {
      return;
    }

    await Quest.claimQuestRewards();
  }

  private async handleStartQuest(): Promise<void> {
    if (game.currentQuest) {
      return;
    }

    if (character.questEnergy < game.minQuestEnergy) {
      log.verbose('Energy low');
      return;
    }

    log.debug(`Current energy: ${character.questEnergy}`);

    const quest = game.quests.find(quest => quest.energyCost <= character.questEnergy);

    if (quest) {
      await quest.doQuest();
      await quest.doUseResources();
    }
  }

  private async handleStoryDungeon() {
    if (game.currentQuest || character.questEnergy < game.minQuestEnergy) {
      return;
    }

    if (!game.storyDungeon) {
      return;
    }

    // TODO: isFinished???
    if (game.storyDungeon.isMoreThanAnHourAgo) {
      log.info('Starting a story dungeon attack');

      await game.storyDungeon.startStoryDungeonBattle();
      await game.storyDungeon.claimStoryDungeonReward();
    }
  }
}
