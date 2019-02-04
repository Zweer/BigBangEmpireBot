import DataObject from '../utils/dataObject';

export type currentGoalRaw = {
  value: number,
  current_value: number,
};

export default class CurrentGoal extends DataObject<currentGoalRaw> {
  value: number;
  currentValue: number;
}
