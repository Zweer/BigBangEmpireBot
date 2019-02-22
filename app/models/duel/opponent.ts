import DataObject from '../utils/dataObject';

import log from '../../lib/log';
import request from '../../lib/request';
import game from '../game';

export type opponentRaw = {
  id: number;
  name: string;
  title: string;
  level: number;
  honor: number;
  gender: string;
  stat_total_stamina: number;
  stat_total_strength: number;
  stat_total_critical_rating: number;
  stat_total_dodge_rating: number;
  avatar_image: string;
  online_status: number;
  total_stats: number;
  battle_data: string;
};

export default class Opponent extends DataObject<opponentRaw> {
  id: number;
  name: string;
  title: string;
  level: number;
  honor: number;
  gender: string;
  statTotalStamina: number;
  statTotalStrength: number;
  statTotalCriticalRating: number;
  statTotalDodgeRating: number;
  avatarImage: string;
  onlineStatus: number;
  totalStats: number;
  battleData: string;

  async duel() {
    log.verbose(`Starting duel with ${this.name}`);

    const { duel } = await request.startDuel(this);

    const addendum = [''];

    if (duel.characterARewards.premium) {
      addendum.push(`- ${duel.characterARewards.premium} gems`);
    }

    if (duel.characterARewards.item) {
      addendum.push(`- ${duel.characterARewards.item} item`);
    }

    log.verbose(`${duel}`);

    await request.checkForDuelComplete();
    await request.claimDuelRewards();
  }

  static async getDuelOpponents(): Promise<Opponent[]> {
    return request.getDuelOpponents();
  }

  static async getDuelOpponent(): Promise<Opponent> {
    const opponents = await Opponent.getDuelOpponents();

    const sortedOpponents = opponents
      .filter(o => !o.name.startsWith('deleted_'))
      .filter(o => !!o)
      .sort((a, b) => b.honor - a.honor);

    return sortedOpponents.find(o => o.totalStats < game.character.statTotal) || sortedOpponents.pop();
  }
}
