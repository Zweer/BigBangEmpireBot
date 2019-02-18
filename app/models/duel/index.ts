import Reward from '../reward';

import AbstractDuel, { abstractDuelRaw } from '../abstracts/duel';

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
}
