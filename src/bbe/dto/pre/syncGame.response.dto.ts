import { bonusInfo, ingameNotifications, specialOffers } from '../types';

export interface SyncGameResponseDto {
  user: {
    premium_currency: number; // 50,
    id: number; // 11836
  };
  character: {
    unused_resources: string; // "{\"2\":1}",
    used_resources: string; // "",
    unread_mass_system_messages: number; // 0,
    stat_total_stamina: number; // 10,
    stat_total_strength: number; // 10,
    stat_total_critical_rating: number; // 10,
    stat_total_dodge_rating: number; // 10,
    active_quest_booster_id: string; // "",
    active_stats_booster_id: string; // "",
    active_work_booster_id: string; // "",
    ts_active_sense_boost_expires: number; // 0,
    ts_active_multitasking_boost_expires: number; // 0,
    quest_energy: number; // 100,
    max_quest_energy: number; // 100,
    duel_stamina: number; // 100,
    max_duel_stamina: number; // 100,
    ts_last_duel_stamina_change: number; // 1587890669,
    duel_stamina_cost: number; // 20,
    active_convention_show_id: number; // 0,
    active_dungeon_quest_id: number; // 0,
    active_dungeon_id: number; // 0,
    guild_id: number; // 0,
    guild_rank: number; // 0,
    finished_guild_battle_attack_id: number; // 0,
    finished_guild_battle_defense_id: number; // 0,
    guild_donated_game_currency: number; // 0,
    guild_donated_premium_currency: number; // 0,
    guild_competition_points_gathered: number; // 0,
    pending_guild_competition_tournament_rewards: number; // 0,
    pending_solo_guild_competition_tournament_rewards: number; // 0,
    convention_id: number; // 0,
    convention_show_count: number; // 0,
    pending_tournament_rewards: number; // 0,
    ts_last_shop_refresh: number; // 0,
    movie_energy: number; // 100,
    max_movie_energy: number; // 30,
    ts_last_movie_energy_change: number; // 0,
    movie_id: number; // 0,
    selectable_movies_count: number; // 0,
    pending_movie_tournament_rewards: number; // 0,
    event_quest_id: number; // 0,
    slotmachine_spin_count: number; // 0,
    new_user_voucher_ids: string; // "[]",
    user_story_activated: boolean; // false,
    id: number; // 11830
  },
  missed_duels: number; // 0,
  streams_info: {
    [name: string]: {
      [id: string]: {
        id: number; // 11830
        type: string; // 'm'
        unread: number; // 0
      };
    };
  },
  convention_character_data: [],
  ingame_notifications: ingameNotifications,
  special_offers: specialOffers,
  bonus_info: bonusInfo,
  sync_states: {
    server: number; // 453,
    user11836: number; // 1,
    character11830: number; // 1
  },
  sync_timestamp: 1587895925,
}
