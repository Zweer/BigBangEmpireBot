import Opponent from './opponent';

import AbstractDuel, { abstractDuelRaw } from '../abstracts/duel';

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

  get won() {
    return this.winner === 'b';
  }
}
