import AbstractModule from '.';

export default class DatingModule extends AbstractModule {
  get currentStep() {
    return this.game.datingStep[this.game.datingStep.length - 1];
  }

  private async claimReward() {
    await this.request.claimDatingStepReward(this.currentStep.datingIndex, this.currentStep.stepIndex);
  }

  private async startNewStep() {
    await this.request.startNewDatingStep(this.currentStep.datingIndex, this.currentStep.stepIndex + 1);
  }

  async handle() {
    if (this.currentStep.isFinished) {
      await this.claimReward();
    }

    if (this.currentStep.isRewardProcessed) {
      await this.startNewStep();
    }
  }
}
