import DataObject from '../utils/dataObject';

export type battleRaw = {
  id: number;
  ts_creation: number;
  profile_a_stats: string;
  profile_b_stats: string;
  winner: 'a' | 'b';
  rounds: string;
};

export default class Battle extends DataObject<battleRaw> {
  id: number;
  tsCreation: number;
  profileAStats: string;
  profileBStats: string;
  winner: 'a' | 'b';
  rounds: string;

  get won() {
    return this.winner === 'a';
  }
}
