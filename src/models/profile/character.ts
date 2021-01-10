import { DateTime } from 'luxon';
import { Transform } from 'class-transformer';

import { secondsToDateTime, stringToModel } from '../../utils/typeConversions';
import { Stat } from '../../types/stat';

export class Character {
  id: number; // 14424,

  user_id: number; // 14431,

  name: string; // 'Zweera',

  locale: string; // 'en_US',

  gender: string; // 'f',

  sexuality: string; // 'm',

  title: string; // '',

  game_currency: number; // 20,

  xp: number; // 0,

  level: number; // 1,

  description: string; // '',

  note: string; // '',

  ts_last_action: number; // 1609780633,

  online_status: number; // 1,

  score_honor: number; // 100001,

  score_level: number; // 1000100,

  score_fans: number; // 1,

  stat_points_available: number; // 0,

  hasAvailableStatPoints(): boolean { return this.stat_points_available > 0; }

  stat_base_stamina: number; // 10,

  stat_base_strength: number; // 10,

  stat_base_critical_rating: number; // 10,

  stat_base_dodge_rating: number; // 10,

  stat_total_stamina: number; // 10,

  stat_total_strength: number; // 10,

  stat_total_critical_rating: number; // 10,

  stat_total_dodge_rating: number; // 10,

  getLeastTotalStat(): Stat {
    if (Math.min(this.stat_total_stamina, this.stat_total_strength, this.stat_total_critical_rating, this.stat_total_dodge_rating) === this.stat_total_stamina) {
      return Stat.STAMINA;
    }

    if (Math.min(this.stat_total_strength, this.stat_total_critical_rating, this.stat_total_dodge_rating) === this.stat_total_strength) {
      return Stat.STRENGTH;
    }

    if (Math.min(this.stat_total_critical_rating, this.stat_total_dodge_rating) === this.stat_total_critical_rating) {
      return Stat.CRITICAL_RATING;
    }

    return Stat.DODGE_RATING;
  }

  stat_weapon_damage: number; // 0,

  stat_total: number; // 40,

  stat_bought_stamina: number; // 0,

  stat_bought_strength: number; // 0,

  stat_bought_critical_rating: number; // 0,

  stat_bought_dodge_rating: number; // 0,

  active_quest_booster_id: string; // '',

  ts_active_quest_boost_expires: number; // 0,

  active_stats_booster_id: string; // '',

  ts_active_stats_boost_expires: number; // 0,

  active_work_booster_id: string; // '',

  ts_active_work_boost_expires: number; // 0,

  ts_active_sense_boost_expires: number; // 0,

  ts_active_multitasking_boost_expires: number; // 0,

  max_quest_stage: number; // 1,

  current_quest_stage: number; // 1,

  current_location: number; // 2,

  quest_energy: number; // 99,

  max_quest_energy: number; // 100,

  ts_last_quest_energy_refill: number; // 1609772112,

  quest_energy_refill_amount_today: number; // 0,

  active_quest_id: number; // 3954435,

  quest_pool: string; // '{"1":[3954435]}',

  honor: number; // 100,

  ts_last_duel: number; // 0,

  active_duel_id: number; // 0,

  duel_stamina: number; // 100,

  max_duel_stamina: number; // 100,

  ts_last_duel_stamina_change: number; // 1609772112,

  duel_stamina_cost: number; // 20,

  hasDuelStamina(): boolean {
    return this.duel_stamina >= this.duel_stamina_cost;
  }

  ts_last_duel_enemies_refresh: number; // 0,

  current_work_offer_id: string; // '',

  ts_last_work_collection: number; // 0,

  active_convention_show_id: number; // 0,

  ts_dungeon_key_found: number; // 0,

  active_dungeon_quest_id: number; // 0,

  ts_last_dungeon_quest: number; // 0,

  last_dungeon_quest_lost: boolean; // false,

  active_dungeon_id: number; // 0,

  ts_last_dungeon_started: number; // 0,

  appearance_skin_color: number; // 3,

  appearance_hair_type: number; // 29,

  appearance_hair_color: number; // 13,

  appearance_head_type: number; // 1,

  appearance_eyes_type: number; // 4,

  appearance_eyebrows_type: number; // 12,

  appearance_eyebrows_color: number; // 13,

  appearance_nose_type: number; // 2,

  appearance_mouth_type: number; // 5,

  appearance_facial_hair_type: number; // 0,

  appearance_facial_hair_color: number; // 13,

  appearance_decoration_type: number; // 1,

  show_head_item: boolean; // true,

  show_chest_item_unlocked: boolean; // false,

  show_chest_item: boolean; // true,

  show_belt_item_unlocked: boolean; // false,

  show_belt_item: boolean; // true,

  show_legs_item_unlocked: boolean; // false,

  show_legs_item: boolean; // true,

  show_boots_item_unlocked: boolean; // false,

  show_boots_item: boolean; // true,

  appearance_photo_rect_type: number; // 2,

  appearance_photo_border_type: number; // 8,

  appearance_photo_background_type: number; // 15,

  appearance_photo_filter_type: number; // 1,

  appearance_photo_icon_type: number; // 11,

  appearance_photo_sexuality_type: number; // 1,

  appearance_tattoo_arm_left: number; // 0,

  appearance_tattoo_arm_right: number; // 0,

  appearance_tattoo_body: number; // 0,

  appearance_tattoo_leg_left: number; // 0,

  appearance_tattoo_leg_right: number; // 0,

  appearance_bra_type: number; // 1,

  appearance_panties_type: number; // 1,

  appearance_genitals_type: number; // 1,

  appearance_genitals_hair_type: number; // 0,

  appearance_genitals_hair_color: number; // 1,

  avatar_image: string; // 'g:f;b:16827229;b2:845;s:84426819;tt:0;uw:16781377;p:184873474;p2:1;',

  tutorial_flags: string; // '{"first_visit":true,"mission_shown":true}',

  storygoal: string; // '',

  guild_id: number; // 0,

  hasGuild() { return this.guild_id !== 0; }

  guild_rank: number; // 0,

  finished_guild_battle_attack_id: number; // 0,

  finished_guild_battle_defense_id: number; // 0,

  guild_donated_game_currency: number; // 0,

  guild_donated_premium_currency: number; // 0,

  guild_competition_points_gathered: number; // 0,

  pending_guild_competition_tournament_rewards: number; // 0,

  pending_solo_guild_competition_tournament_rewards: number; // 0,

  unread_mass_system_messages: number; // 0,

  friend_messages_only: boolean; // false,

  convention_id: number; // 0,

  convention_show_count: number; // 0,

  convention_show_identifier: string; // '',

  convention_show_reward: number; // 0,

  ts_last_wash_item: number; // 0,

  @Transform(secondsToDateTime)
  ts_last_daily_login_bonus: DateTime; // 0,

  daily_login_bonus_day: number; // 0,

  pending_tournament_rewards: number; // 0,

  pending_global_tournament_rewards: number; // 0,

  ts_last_shop_refresh: number; // 0,

  max_free_shop_refreshes: number; // 1,

  shop_refreshes: number; // 0,

  movie_energy: number; // 100,

  max_movie_energy: number; // 30,

  ts_last_movie_energy_change: number; // 0,

  movie_pool: string; // '',

  movie_id: number; // 0,

  movies: number; // 0,

  fans: number; // 0,

  ts_last_movie_finished: number; // 0,

  movies_started_today: number; // 0,

  movie_votes: number; // 0,

  selected_movie_id: number; // 0,

  selectable_movies_count: number; // 0,

  pending_movie_tournament_rewards: number; // 0,

  friend_data: string; // '',

  unused_resources: string; // '{"2":1}',

  used_resources: string; // '',

  battle_data: string; // '',

  ts_last_customize_item: number; // 0,

  pending_customize_item: string; // '',

  current_story_dungeon_index: number; // 0,

  active_story_dungeon_attack_id: number; // 0,

  current_repeat_story_dungeon_id: number; // 0,

  active_repeat_story_dungeon_attack_id: number; // 0,

  event_quest_id: number; // 0,

  current_energy_storage: number; // 0,

  current_slotmachine_spin: number; // 0,

  slotmachine_spin_count: number; // 0,

  ts_last_slotmachine_refill: number; // 1609772112,

  @Transform(stringToModel(Number))
  new_user_voucher_ids: number[]; // '[]',

  herobook_objectives_renewed_today: number; // 0,

  user_story_activated: boolean; // false,

  user_story_locales: string; // ''
}
