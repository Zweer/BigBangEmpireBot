import { Transform } from 'class-transformer';

import { Reward } from '../story/reward';
import { stringToModel } from '../../utils/typeConversions';
import { Opponent } from './opponent';

export class Duel {
  id: number;

  ts_creation: number;

  battle_id: number;

  character_a_id: number;

  character_b_id: number;

  character_a_status: number;

  character_b_status: number;

  @Transform(stringToModel(Reward))
  character_a_rewards: Reward;

  @Transform(stringToModel(Reward))
  character_b_rewards: Reward;

  opponent: Opponent;

  toString(): string {
    const addendum: string[] = [''];

    if (this.character_a_rewards.premium) {
      addendum.push(`- ${this.character_a_rewards.premium} gems`);
    }

    if (this.character_a_rewards.item) {
      addendum.push(`- ${this.character_a_rewards.item} item`);
    }

    return `You ${this.character_a_rewards.honor > 0 ? 'won' : 'lost'} the duel against ${this.opponent.name}!
    - ${this.character_b_rewards.honor > 0 ? '+' : ''}${this.character_b_rewards.honor} honor${addendum.join('\n')}`;
  }
}
