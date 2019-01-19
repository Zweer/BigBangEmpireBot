import * as moment from 'moment';

import Reward from './reward';
import { difficulty, stat } from './common/types';

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
}

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

export default class Quest {
  readonly id: number;
  readonly characterId: number;
  readonly identifier: string;
  readonly type: questType;
  readonly stat: stat;
  readonly stage: number;
  readonly level: number;
  readonly status: questStatus;
  readonly durationType: number;
  readonly durationRaw: number;
  readonly duration: number;
  readonly completedAt: moment.Moment;
  readonly energyCost: number;
  readonly fightDifficulty: difficulty;
  readonly fightNpcIdentifier: string;
  readonly fightBattleId: number;
  readonly won: boolean;
  readonly rewards: Reward;

  constructor(quest: questRaw) {
    this.id = quest.id;
    this.characterId = quest.character_id;
    this.identifier = quest.identifier;
    this.type = quest.type;
    this.stat = quest.stat;
    this.stage = quest.stage;
    this.level = quest.level;
    this.status = quest.status;
    this.durationType = quest.duration_type;
    this.durationRaw = quest.duration_raw;
    this.duration = quest.duration;
    this.completedAt = moment(quest.ts_complete, 'X');
    this.energyCost = quest.energy_cost;
    this.fightDifficulty = quest.fight_difficulty;
    this.fightNpcIdentifier = quest.fight_npc_identifier;
    this.fightBattleId = quest.fight_battle_id;
    this.won = quest.won;
    this.rewards = new Reward(quest.rewards);
  }
}
