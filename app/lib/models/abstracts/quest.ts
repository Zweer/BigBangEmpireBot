import * as moment from 'moment';

import Reward from '../reward';

import { difficulty, stat } from '../types/common';

import DataObject from '../utils/dataObject';

export type abstractQuestRaw = {
  id: number;
  character_id: number;
  identifier: string;
  type: number;
  stat: number;
  status: number;
  ts_complete: number;
  energy_cost: number;
  fight_difficulty: number;
  fight_npc_identifier: string;
  fight_battle_id: number;
  won: boolean;
  rewards: string;
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

export default class AbstractQuest<T extends abstractQuestRaw> extends DataObject<T> {
  id: number;
  characterId: number;
  identifier: string;
  type: questType;
  stat: stat;
  status: questStatus;
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
}
