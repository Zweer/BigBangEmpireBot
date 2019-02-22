import { findLastKey } from 'lodash';
import * as moment from 'moment';

import request from '../../lib/request';
import log from '../../lib/log';

import DataObject from '../utils/dataObject';

import constants from '../constants';

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

  static async buyBestBooster(type: number, premium: boolean = false) {
    const boosterId = findLastKey(constants.boosters, b => b.type === type && b.premiumItem === premium);

    log.info(`Buying booster ${boosterId}`);

    await this.buyBooster(boosterId);
  }

  static async buyBooster(id: string): Promise<void> {
    return request.buyBooster(id);
  }
}
