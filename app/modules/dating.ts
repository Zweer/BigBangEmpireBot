import request from '../lib/request';

import constants from '../models/constants';
import game from '../models/game';

import AbstractModule from '.';

export default class DatingModule extends AbstractModule {
  get currentStep() {
    return game.datingStep[game.datingStep.length - 1];
  }

  get currentConstantStep() {
    return constants.dating[this.currentStep.datingIndex].steps[this.currentStep.stepIndex];
  }

  private async claimReward() {
    await request.claimDatingStepReward(this.currentStep.datingIndex, this.currentStep.stepIndex);
  }

  private async startNewStep() {
    await request.startNewDatingStep(this.currentStep.datingIndex, this.currentStep.stepIndex + 1);
  }

  private async doBattle() {
    await request.startDatingBattle(this.currentStep.datingIndex, this.currentStep.stepIndex);
  }

  async handle() {
    if (this.currentStep.isFinished) {
      await this.claimReward();
    } else if (this.currentStep.isRewardProcessed) {
      await this.startNewStep();
    } else if (this.currentStep.isReadyForBattle) {
      await this.doBattle();
    }
  }
}
