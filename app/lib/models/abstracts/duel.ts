import * as moment from 'moment';

import Reward from '../reward';

import DataObject from '../utils/dataObject';

export type abstractDuelRaw = {
  id: number;
  ts_creation: number;
  character_b_rewards: string;
};

export default class AbstractDuel<T extends abstractDuelRaw> extends DataObject<T> {
  id: number;
  tsCreation: moment.Moment;
  characterBRewards: Reward;

  setTsCreation(tsCreation: number) {
    this.tsCreation = moment(tsCreation);
  }

  setCharacterBRewards(characterBRewards: string) {
    if (characterBRewards) {
      this.characterBRewards = new Reward(characterBRewards);
    }
  }
}
