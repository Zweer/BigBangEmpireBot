import { Transform } from 'class-transformer';

import { GoalValue } from './goalValue';

import { objectOfObjectsToArrayOfModels } from '../../utils/typeConversions';

export class Goal {
  identifier: string;

  index: number;

  active: boolean;

  goal_type: number;

  mechanic_type: number;

  lookup_column: string;

  category: number;

  story_goal_category: number;

  required_goal: number;

  required_level: number;

  statistics: boolean;

  hidden: boolean;

  display_as_time: boolean;

  @Transform(objectOfObjectsToArrayOfModels(GoalValue, 'value'))
  values: GoalValue[];
}
