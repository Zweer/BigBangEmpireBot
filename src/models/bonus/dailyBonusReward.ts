import { Transform } from 'class-transformer';

import { stringToModel } from '../../utils/typeConversions';

import { Reward } from '../story/reward';

export class DailyBonusReward {
  id: number;

  character_id: number;

  ts_creation: number;

  status: number;

  type: number;

  value: number;

  @Transform(stringToModel(Reward))
  rewards: Reward;
}
