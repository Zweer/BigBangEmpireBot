import log from '../libs/log';
import request from '../libs/request';

import { AbstractModule } from './abstract.module';

export class StoryModule extends AbstractModule {
  async iteration() {
    await this.checkFinishedQuest();
    await this.startNewQuest();
  }

  private async checkFinishedQuest() {
    const finishedQuest = this.game.quests.find(((quest) => quest.isFinished()));

    if (finishedQuest) {
      log.info('Claiming a finished quest');
      await request.claimQuestRewards();
    }
  }

  private async startNewQuest() {
    if (this.game.questWithMinimumEnergy) {

    }
  }
}
