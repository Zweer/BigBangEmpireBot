import { mapValues } from 'lodash';

import DataObject from '../utils/dataObject';

export type goalRaw = {
  active: boolean,
  category: number,
  display_as_time: boolean,
  goal_type: number,
  hidden: boolean,
  index: number,
  lookup_column: string,
  mechanic_type: number,
  required_goal: string,
  required_level: number,
  statistics: boolean,
  story_goal_category: number,
  values: { [key: string]: goalValue },
};

export type goalValue = {
  value: number,
  estimated_level: number,
  reward_factor: number,
  reward_identifier: string,
  reward_title: number,
  reward_type: number,
  story_goal: boolean,
  text: string,
};

export class GoalValue extends DataObject<goalValue> {
  value: number;
  estimatedLevel: number;
  rewardFactor: number;
  rewardIdentifier: string;
  rewardTitle: string;
  rewardType: number;
  storyGoal: boolean;
  text: string;
}

export default class Goal extends DataObject<goalRaw> {
  active: boolean;
  category: number;
  displayAsTime: boolean;
  goalType: number;
  hidden: boolean;
  index: number;
  lookupColumn: string;
  mechanicType: number;
  requiredGoal: string;
  requiredLevel: number;
  statistics: boolean;
  storyGoalCategory: number;
  values: { [key: string]: GoalValue };

  setValues(goalValues: { [key: string]: goalValue }) {
    this.values = mapValues(goalValues, (goalValue: goalValue) => new GoalValue(goalValue));
  }
}
