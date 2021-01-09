import { Transform } from 'class-transformer';

import { stringToInt } from '../../utils/typeConversions';

export class GoalValue {
  @Transform(stringToInt)
  value: number;

  story_goal: boolean;

  reward_type: number;

  reward_factor: number;

  reward_identifier: string;

  reward_title: string;

  estimated_level: number;

  text: string;
}
