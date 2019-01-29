import * as moment from 'moment';

import DataObject from '../utils/dataObject';

export type currentGoalRaw = {
  name: string,
  value: number,
  date: string,
};

export default class CurrentGoal extends DataObject<currentGoalRaw> {
  name: string;
  value: number;
  date: moment.Moment;
}
