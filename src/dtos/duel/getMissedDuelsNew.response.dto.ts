import { UserDto } from '../models/user.dto';
import { CharacterDto } from '../models/character.dto';

export interface GetMissedDuelsNewResponseDto {
  user: UserDto;
  character: CharacterDto;
  missed_duel_data: {
    id: number,
    ts_creation: number,
    winner: string,
    character_b_rewards: string; // '{"coins":2,"xp":0,"honor":-14,"premium":0,"statPoints":0,"item":0}',
    opponent_id: number;
    unread: boolean;
  }[];
  missed_duel_opponents: {
    id: number; // 14506,
    name: string; // 'hibaby',
    title: string; // '',
    gender: string; // 'f',
    level: number; // 4,
    stat_base_stamina: number; // 12,
    stat_base_strength: number; // 11,
    stat_base_critical_rating: number; // 12,
    stat_base_dodge_rating: number; // 11,
    stat_total_stamina: number; // 18,
    stat_total_strength: number; // 39,
    stat_total_critical_rating: number; // 28,
    stat_total_dodge_rating: number; // 24,
    stat_weapon_damage: number; // 3,
    honor: number; // 517,
    online_status: number; // 2,
    avatar_image: string; // 'g:f;b:16842846;b2:1560;s:19202628;tt:0;uw:16781377;p:235446849;p2:1;',
    battle_data: string; // '[]'
  }[];
}
