import * as moment from 'moment';

import DataObject from './utils/dataObject';

export type boosterRaw = {
  type: boosterType;
  amount: number;
  duration: number;
  premium_item: boolean;
};

export enum boosterType {
  QUEST = 1,
  STATS,
  WORK,
}

export default class Booster extends DataObject<boosterRaw> {
  type: boosterType;
  amount: number;
  duration: moment.Duration;
  premiumItem: boolean;

  setDuration(duration: number) {
    this.duration = moment.duration(duration, 'seconds');
  }
}
