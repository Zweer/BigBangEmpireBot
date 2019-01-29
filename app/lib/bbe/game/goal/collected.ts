import * as moment from 'moment';

import DataObject from '../utils/dataObject';

export type collectedGoalRaw = {
  name: string,
  value: number,
  date: string,
};

export default class CollectedGoal extends DataObject<collectedGoalRaw> {
  name: string;
  value: number;
  date: moment.Moment;

  setDate(date: string) {
    this.date = moment(date);
  }
}
