import { DateTime } from 'luxon';
import { Transform } from 'class-transformer';

import { datetimeToDateTime } from '../../utils/typeConversions';

export class CollectedGoal {
  identifier: string;

  value: number;

  @Transform(datetimeToDateTime)
  date: DateTime;
}
