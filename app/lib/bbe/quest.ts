import * as moment from 'moment';

import Reward from './reward';

import { difficulty, stat } from './types/common';

import DataObject from './utils/dataObject';

export type questRaw = {
  id: number,
  character_id: number,
  identifier: string,
  type: number,
  stat: number,
  stage: number,
  level: number,
  status: number,
  duration_type: number,
  duration_raw: number,
  duration: number,
  ts_complete: number,
  energy_cost: number,
  fight_difficulty: number,
  fight_npc_identifier: string,
  fight_battle_id: number,
  won: boolean,
  rewards: string,
};

export enum questType {
  TIME = 1,
  FIGHT,
  STAT,
}

export enum questStatus {
  UNKNOWN,
  CREATED,
  STARTED,
  ABORTED,
  FINISHED,
  REWARD_PROCESSED,
}

export default class Quest extends DataObject<questRaw> {
  id: number;
  characterId: number;
  identifier: string;
  type: questType;
  stat: stat;
  stage: number;
  level: number;
  status: questStatus;
  durationType: number;
  durationRaw: number;
  duration: number;
  tsComplete: moment.Moment;
  energyCost: number;
  fightDifficulty: difficulty;
  fightNpcIdentifier: string;
  fightBattleId: number;
  won: boolean;
  rewards: Reward;

  setTsComplete(tsComplete: number) {
    this.tsComplete = moment(tsComplete, 'X');
  }

  setRewards(rewards: string) {
    this.rewards = new Reward(rewards);
  }

  get xpPerEnergy(): number {
    return Math.round((this.rewards.xp / this.energyCost) * 100) / 100;
  }

  static sort(a: Quest, b: Quest): number {
    const deltaPremium = b.rewards.premium - a.rewards.premium;
    if (deltaPremium !== 0) {
      return deltaPremium;
    }

    const deltaNonStandardAttributes = b.rewards.nonStandardAttributes.length - a.rewards.nonStandardAttributes.length;
    if (deltaNonStandardAttributes !== 0) {
      return deltaNonStandardAttributes;
    }

    return b.xpPerEnergy - a.xpPerEnergy;
  }
}
