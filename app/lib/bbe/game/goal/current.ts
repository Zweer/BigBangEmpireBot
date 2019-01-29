import DataObject from '../utils/dataObject';

export type currentGoalRaw = {
  name: string,
  value: number,
  current_value: number,
};

export default class CurrentGoal extends DataObject<currentGoalRaw> {
  name: string;
  value: number;
  currentValue: number;

  get isCompleted() {
    return this.value !== 0 && this.value === this.currentValue;
  }
}
