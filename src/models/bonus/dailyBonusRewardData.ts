import { Transform } from 'class-transformer';

import { objectOfObjectsToArrayOfModels, stringToInt } from '../../utils/typeConversions';

import { DailyBonusType } from '../../types/dailyBonusType';
import { DailyBonusRewardDataValue } from './dailyBonusRewardDataValue';

export class DailyBonusRewardData {
  @Transform(stringToInt)
  type: DailyBonusType;

  @Transform(objectOfObjectsToArrayOfModels(DailyBonusRewardDataValue, 'value'))
  values: DailyBonusRewardDataValue[];
}
