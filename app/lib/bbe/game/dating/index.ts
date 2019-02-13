import Game from '..';
import Request from '../../request';

export default class Dating {
  constructor(private game: Game, private request: Request) {}

  get currentStep() {
    return this.game.datingStep[this.game.datingStep.length - 1];
  }

  async claimReward() {
    await this.request.claimDatingStepReward(this.currentStep.datingIndex, this.currentStep.stepIndex);
  }

  async startNewStep() {
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
