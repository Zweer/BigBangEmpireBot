import DataObject from '../utils/dataObject';

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
}
