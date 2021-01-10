import { Transform } from 'class-transformer';

import { Reward } from './reward';

import { stringToModel } from '../../utils/typeConversions';

export class Quest {
  id: number; // 3954435,

  character_id: number; // 14424,

  identifier: string; // 'quest_stage1_time1_f',

  type: number; // 1,

  isTimeQuest(): boolean { return this.type === 1; }

  isFightQuest(): boolean { return this.type === 2; }

  isStatQuest(): boolean { return this.type === 3; }

  isUserStoryQuest(): boolean { return this.type === 4; }

  stat: number; // 0,

  stage: number; // 1,

  level: number; // 1,

  status: number; // 4,

  isStarted(): boolean { return this.status === 2; }

  isFinished(): boolean { return this.status === 4; }

  duration_type: number; // 1,

  duration_raw: number; // 60,

  duration: number; // 60,

  ts_complete: number; // 1609772197,

  energy_cost: number; // 1,

  fight_difficulty: number; // 0,

  fight_npc_identifier: string; // '',

  fight_battle_id: number; // 0,

  won: boolean; // true,

  @Transform(stringToModel(Reward))
  rewards: Reward; // '{"coins":5,"xp":226,"honor":0,"premium":0,"statPoints":0,"item":0}'

  static sort(a: Quest, b: Quest): number {
    return b.rewards.premium !== a.rewards.premium ? b.rewards.premium - a.rewards.premium : b.value - a.value;
  }

  get xpPerEnergy(): number {
    return Math.round((this.rewards.xp / this.energy_cost) * 100) / 100;
  }

  get value(): number {
    return this.xpPerEnergy + this.rewards.nonStandardAttributes.length * 100000;
  }
}
