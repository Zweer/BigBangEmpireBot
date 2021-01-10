import log from '../libs/log';
import request from '../libs/request';

import { AbstractModule } from './abstract.module';

export class StoryModule extends AbstractModule {
  async iteration() {
    await this.checkFinishedQuest();
    await this.checkCompletedQuest();
    await this.startNewQuest();
  }

  private async checkFinishedQuest() {
    const finishedQuest = this.game.quests.find(((quest) => quest.isFinished()));

    if (finishedQuest) {
      await this.claimQuestRewards();
    }
  }

  private async checkCompletedQuest() {
    const quest = await request.checkForQuestComplete();

    if (quest?.isFinished()) {
      await this.claimQuestRewards();
    }
  }

  private async claimQuestRewards() {
    log.info('Claiming a finished quest');
    await request.claimQuestRewards();
  }

  private async startNewQuest() {
    if (this.game.questWithMinimumEnergy) {
      await request.startQuest(this.game.questWithMinimumEnergy.id);
    }
  }
}
