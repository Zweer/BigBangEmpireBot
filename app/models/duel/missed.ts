import * as numeral from 'numeral';

import Opponent from './opponent';

import AbstractDuel, { abstractDuelRaw } from '../abstracts/duel';

import request from '../../lib/request';

export type missedDuelRaw = abstractDuelRaw & {
  winner: string;
  unread: boolean;
  opponent_id: number;
};

export default class MissedDuel extends AbstractDuel<missedDuelRaw> {
  winner: string;
  unread: boolean;
  opponentId: number;
  opponent: Opponent;

  constructor(missedDuel: missedDuelRaw, opponents: Opponent[]) {
    super(missedDuel);

    this.opponent = opponents.find(o => o.id === this.opponentId);
  }

  get won(): boolean {
    return this.winner === 'b';
  }

  toString(): string {
    return `Missed duel: ${this.won ? 'won' : 'lost'}\n- ${this.opponent.name}\n- ${numeral(this.characterBRewards.honor).format('+0')} honor`;
  }

  static async getMissedDuelsNew(): Promise<MissedDuel[]> {
    return request.getMissedDuelsNew();
  }

  static async claimMissedDuelsRewards(): Promise<void> {
    return request.claimMissedDuelsRewards();
  }
}
