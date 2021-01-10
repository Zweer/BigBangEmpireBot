import { OpponentDto } from '../../dtos/duel/opponent.dto';
import { Game } from '../game';

export class Opponent implements OpponentDto {
  id: number;

  name: string;

  title: string;

  level: number;

  honor: number;

  gender: string;

  has_missile: boolean;

  stat_total_stamina: number;

  stat_total_strength: number;

  stat_total_critical_rating: number;

  stat_total_dodge_rating: number;

  avatar_image: string;

  online_status: number;

  total_stats: number;

  battle_data: string;

  static getDuelOpponent(opponents: Opponent[], game: Game): Opponent {
    const sortedOpponents = opponents
      .filter((opponent) => !opponent.name.startsWith('deleted_') && !opponent.name.includes('___'))
      // .filter((opponent) => !game.character.hasGuild() || !game.character.guild...)
      .sort((a, b) => b.honor - a.honor);

    return sortedOpponents.find((opponent) => opponent.total_stats < game.character.stat_total) || sortedOpponents[0];
  }
}
