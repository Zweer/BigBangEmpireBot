import DataObject from '../utils/dataObject';

export type goal = {
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
  values: goalValue[],
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

export default class Goal extends DataObject<goal> {

}
