import Reward from '../story/reward';

import DataObject from '../utils/dataObject';

export type datingStepRaw = {
  id: number;
  character_id: number;
  repeat: boolean;
  dating_index: number;
  step_index: number;
  status: datingStepStatus;
  points_collected: number;
  ts_last_attack: number;
  rewards: string;
};

export enum datingStepStatus {
  UNKNOWN = 0,
  CREATURED = 1,
  STARTED = 2,
  FINISHED = 3,
  REWARDS_PROCESSED = 4,
}

export default class DatingStep extends DataObject<datingStepRaw> {
  id: number;
  characterId: number;
  repeat: boolean;
  datingIndex: number;
  stepIndex: number;
  status: datingStepStatus;
  pointsCollected: number;
  tsLastAttack: number;
  rewards: Reward;

  setRewards(rewardStr: string) {
    this.rewards = new Reward(rewardStr);
  }

  get isFinished() {
    return this.status === datingStepStatus.FINISHED;
  }

  get isRewardProcessed() {
    return this.status === datingStepStatus.REWARDS_PROCESSED;
  }

  get isReadyForBattle() {
    return this.stepIndex === 5;
  }
}
