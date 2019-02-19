import * as moment from 'moment';

import Reward from './reward';

import DataObject from './utils/dataObject';

export type storyDungeonRaw = {
  id: number;
  character_id: number;
  story_dungeon_index: number;
  status: storyDungeonStatus;
  repeat: boolean;
  points_collected: number;
  ts_complete: number;
  ts_last_attack: number;
  battle_ids: string;
  rewards: string;
};

export enum storyDungeonStatus {
  UNKNOWN,
  STARTED,
  FINISHED,
  REWARDS_PROCESSED,
}

export default class StoryDungeon extends DataObject<storyDungeonRaw> {
  id: number;
  characterId: number;
  storyDungeonIndex: storyDungeonStatus;
  status: number;
  repeat: boolean;
  pointsCollected: number;
  tsComplete: moment.Moment;
  tsLastAttack: moment.Moment;
  battleIds: number[];
  rewards: Reward;

  setTsComplete(tsComplete: number) {
    this.tsComplete = moment(tsComplete, 'X');
  }

  setTsLastAttack(tsLastAttack: number) {
    this.tsLastAttack = moment(tsLastAttack, 'X');
  }

  setBattleIds(battleIds: string) {
    if (battleIds) {
      this.battleIds = JSON.parse(battleIds);
    }
  }

  setRewards(rewards: string) {
    this.rewards = new Reward(rewards);
  }

  get isFinished() {
    return this.status === storyDungeonStatus.FINISHED;
  }
}
