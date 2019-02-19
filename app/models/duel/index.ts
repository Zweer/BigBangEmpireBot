import * as numeral from 'numeral';

import Reward from '../story/reward';

import AbstractDuel, { abstractDuelRaw } from '../abstracts/duel';

import log from '../../lib/log';

export type duelRaw = abstractDuelRaw & {
  battle_id: number;
  character_a_id: number;
  character_b_id: number;
  character_a_status: number;
  character_b_status: number;
  character_a_rewards: string;
};

export default class Duel extends AbstractDuel<duelRaw> {
  battleId: number;
  characterAId: number;
  characterBId: number;
  characterAStatus: number;
  characterBStatus: number;
  characterARewards: Reward;

  setCharacterARewards(characterARewards: string) {
    if (characterARewards) {
      this.characterARewards = new Reward(characterARewards);
    }
  }

  toString() {
    const addendum = [''];

    if (this.characterARewards.premium) {
      addendum.push(`- ${this.characterARewards.premium} gems`);
    }

    if (this.characterARewards.item) {
      addendum.push(`- ${this.characterARewards.item} item`);
    }

    return `You ${this.characterARewards.honor > 0 ? 'won' : 'lost'} the duel!\n- ${numeral(this.characterARewards.honor).format('+0')} honor${addendum.join('\n')}`;
  }
}
