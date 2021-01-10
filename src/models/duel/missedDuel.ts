import { Transform } from 'class-transformer';
import { Reward } from '../story/reward';
import { Opponent } from './opponent';
import { stringToModel } from '../../utils/typeConversions';

export class MissedDuel {
  id: number;

  ts_creation: number;

  winner: string;

  isWon(): boolean { return this.winner === 'b'; }

  @Transform(stringToModel(Reward))
  character_b_rewards: Reward;

  opponent_id: number;

  unread: boolean;

  opponent: Opponent;

  findOpponent(opponents: Opponent[]) {
    this.opponent = opponents.find((opponent) => opponent.id === this.opponent_id);
  }

  toString(): string {
    const addendum: string[] = [''];

    if (this.character_b_rewards.premium) {
      addendum.push(`- ${this.character_b_rewards.premium} gems`);
    }

    if (this.character_b_rewards.item) {
      addendum.push(`- ${this.character_b_rewards.item} item`);
    }
    return `Missed duel: ${this.isWon() ? 'won' : 'lost'} against ${this.opponent.name}
    - ${this.character_b_rewards.honor > 0 ? '+' : ''}${this.character_b_rewards.honor} honor${addendum.join('\n')}`;
  }
}
