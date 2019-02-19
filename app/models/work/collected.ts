import * as moment from 'moment';

import request from '../../lib/request';

import character from '../character';

import DataObject from '../utils/dataObject';

export type collectedWorkRaw = {
  duration: number;
  game_currency_reward: number;
  offer: string;
};

export default class CollectedWork extends DataObject<collectedWorkRaw> {
  duration: number;
  gameCurrencyReward: number;
  offer: string;

  private static WORK_DELAY = [3, 'hours'];

  static get needToCollect() {
    const threeHoursAgo = moment().subtract(...CollectedWork.WORK_DELAY);

    return character.tsLastWorkCollection.isBefore(threeHoursAgo);
  }

  static async collectWork(): Promise<CollectedWork> {
    return request.collectWork();
  }

  toString() {
    return `Collected work: ${this.gameCurrencyReward} coins (${this.offer})`;
  }
}
