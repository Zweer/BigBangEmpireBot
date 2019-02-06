import DataObject from '../utils/dataObject';

export type collectedWorkRaw = {
  duration: number;
  game_currency_reward: number;
  offer: string;
};

export default class CollectedWork extends DataObject<collectedWorkRaw> {
  duration: number;
  gameCurrencyReward: number;
  offer: string;
}
