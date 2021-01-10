import log from '../libs/log';
import request from '../libs/request';

import { AbstractModule } from './abstract.module';

export class StoryModule extends AbstractModule {
  async iteration() {
    await this.checkCompletedQuest();
    await this.startNewQuest();
  }

  private async checkCompletedQuest() {
    if (!this.game.activeQuest) {
      return;
    }

    if (this.game.activeQuest.ts_complete.diffNow().milliseconds > 0) {
      return;
    }

    const quest = await request.checkForQuestComplete();

    if (quest?.isFinished()) {
      log.info('Claiming a finished quest');
      await request.claimQuestRewards();
    }
  }

  private async startNewQuest() {
    if (!this.game.activeQuest && this.game.questWithMinimumEnergy) {
      const quest = this.game.questWithMinimumEnergy;

      const info = [''];
      info.push(`- ${quest.xpPerEnergy} xp/energy`);
      info.push(`- ${quest.energy_cost} energy`);
      info.push(...quest.rewards.nonStandardAttributes.map((nonStandardAttribute) => `- with a ${nonStandardAttribute}`));
      log.info(`Starting a new quest:${info.join('\n')}`);

      if (quest.rewards.premium) {
        log.warn(`Got ${quest.rewards.premium} diamonds in ${quest.energy_cost} minutes`);
      }

      if (quest.rewards.dungeon_key) {
        log.warn(`Got a dungeon key diamonds in ${quest.energy_cost} minutes`);
      }

      Object.assign(quest, await request.startQuest(this.game.questWithMinimumEnergy.id));
    }
  }
}
