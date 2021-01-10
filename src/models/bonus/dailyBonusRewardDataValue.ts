import { Transform } from 'class-transformer';
import { stringToInt } from '../../utils/typeConversions';
import { DailyBonusRewardType } from '../../types/dailyBonusRewardType';

export class DailyBonusRewardDataValue {
  @Transform(stringToInt)
  value: number;

  reward_type: DailyBonusRewardType;

  reward_value: number;

  reward_identifier: string;
}
