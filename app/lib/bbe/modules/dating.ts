import { AbstractModuleWithConstants } from '.';

export default class DatingModule extends AbstractModuleWithConstants {
  get currentStep() {
    return this.game.datingStep[this.game.datingStep.length - 1];
  }

  get currentConstantStep() {
    return this.constants.dating[this.currentStep.datingIndex].steps[this.currentStep.stepIndex];
  }

  private async claimReward() {
    await this.request.claimDatingStepReward(this.currentStep.datingIndex, this.currentStep.stepIndex);
  }

  private async startNewStep() {
    await this.request.startNewDatingStep(this.currentStep.datingIndex, this.currentStep.stepIndex + 1);
  }

  private async doBattle() {
    await this.request.startDatingBattle(this.currentStep.datingIndex, this.currentStep.stepIndex);
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
