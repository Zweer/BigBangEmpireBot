import Reward from '../reward';

import DataObject from '../utils/dataObject';

export type duelRaw = {
  id: number;
  ts_creation: number;
  battle_id: number;
  character_a_id: number;
  character_b_id: number;
  character_a_status: number;
  character_b_status: number;
  character_a_rewards: string;
  character_b_rewards: string;
};

export default class Duel extends DataObject<duelRaw> {
  id: number;
  tsCreation: number;
  battleId: number;
  characterAId: number;
  characterBId: number;
  characterAStatus: number;
  characterBStatus: number;
  characterARewards: Reward;
  characterBRewards: Reward;

  setCharacterARewards(characterARewards: string) {
    if (characterARewards) {
      this.characterARewards = new Reward(characterARewards);
    }
  }

  setCharacterBRewards(characterBRewards: string) {
    if (characterBRewards) {
      this.characterBRewards = new Reward(characterBRewards);
    }
  }
}
