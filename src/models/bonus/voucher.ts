import { Transform } from 'class-transformer';

import { Reward } from '../story/reward';

import { stringToModel } from '../../utils/typeConversions';

export class Voucher {
  id: number;

  code: string;

  @Transform(stringToModel(Reward))
  rewards: Reward;

  ts_end: number;
}
