import { Transform } from 'class-transformer';

import { Goal } from './goal/goal';

import { objectOfObjectsToArrayOfModels } from '../utils/typeConversions';

export class Constants {
  tolerance_small: number;

  tolerance_medium: number;

  tolerance_large: number;

  time_per_level_base: number;

  time_per_level_scale: number;

  time_per_level_level_scale: number;

  time_per_level_level_exp: number;

  xp_per_time: number;

  coins_per_time_base: number;

  coins_per_time_scale: number;

  coins_per_time_level_scale: number;

  coins_per_time_level_exp: number;

  time_per_premium_currency: number;

  battle_hp_scale: number;

  battle_damage_tolerance: number;

  battle_critical_probability_min: number;

  battle_critical_probability_base: number;

  battle_critical_probability_max: number;

  battle_critical_probability_exp_low: number;

  battle_critical_probability_exp_high: number;

  battle_critical_factor: number;

  battle_dodge_probability_min: number;

  battle_dodge_probability_base: number;

  battle_dodge_probability_max: number;

  battle_dodge_probability_exp_low: number;

  battle_dodge_probability_exp_high: number;

  battle_dodge_probability_max_ratio: number;

  battle_max_rounds: number;

  duel_opponent_list_max_results: number;

  duel_opponent_list_level_tolerance: number;

  duel_opponent_list_stats_tolerance_min: number;

  duel_opponent_list_stats_tolerance_max: number;

  duel_reward_premium_currency_chance: number;

  duel_reward_premium_currency_chance_hard: number;

  duel_reward_premium_currency_reward1: number;

  duel_reward_premium_currency_reward1_chance: number;

  duel_reward_premium_currency_reward2: number;

  duel_reward_premium_currency_reward2_chance: number;

  duel_reward_premium_currency_reward3: number;

  duel_reward_premium_currency_reward3_chance: number;

  duel_reward_premium_currency_reward4: number;

  duel_reward_premium_currency_reward4_chance: number;

  duel_reward_item_drop_chance: number;

  duel_reward_item_drop_chance_hard: number;

  duel_attack_limit: number;

  duel_stamina_cost: number;

  duel_stamina_reset_premium_amount: number;

  duel_stamina_refresh_amount_per_minute_first_duel: number;

  duel_stamina_refresh_amount_per_minute: number;

  duel_single_attack_premium_amount: number;

  duel_max_missed_duels: number;

  duel_enemies_refresh_premium_amount: number;

  quest_max_stage: number;

  quest_level_full_duration: number;

  quest_max_refill_amount_per_day: number;

  quest_duration_short: number;

  quest_duration_medium: number;

  quest_duration_long: number;

  quest_duration_tolerance: number;

  quest_instant_finish_range1_premium_amount: number;

  quest_instant_finish_range2_premium_amount: number;

  quest_instant_finish_range3_premium_amount: number;

  quest_instant_finish_range4_premium_amount: number;

  quest_instant_finish_range1_duration: number;

  quest_instant_finish_range2_duration: number;

  quest_instant_finish_range3_duration: number;

  quest_reward_balanced_end_level: number;

  quest_reward_probability_xp_heavy: number;

  quest_reward_probability_coin_heavy: number;

  quest_reward_probability_item: number;

  quest_reward_xp_adjust_end_level: number;

  quest_reward_xp_adjust_start_percentage: number;

  quest_reward_xp_scale_balanced: number;

  quest_reward_xp_scale_xp_heavy: number;

  quest_reward_xp_scale_coin_heavy: number;

  quest_reward_xp_scale_item: number;

  quest_reward_coin_scale_balanced: number;

  quest_reward_coin_scale_xp_heavy: number;

  quest_reward_coin_scale_coin_heavy: number;

  quest_reward_coin_scale_item: number;

  quest_reward_premium_currency_chance_short: number;

  quest_reward_premium_currency_chance_medium: number;

  quest_reward_premium_currency_chance_long: number;

  quest_reward_premium_currency_reward1: number;

  quest_reward_premium_currency_reward1_chance: number;

  quest_reward_premium_currency_reward2: number;

  quest_reward_premium_currency_reward2_chance: number;

  quest_reward_premium_currency_reward3: number;

  quest_reward_premium_currency_reward3_chance: number;

  quest_reward_premium_currency_reward4: number;

  quest_reward_premium_currency_reward4_chance: number;

  quest_energy_refill_premium_amount: number;

  quest_energy_refill_premium_amount_increase_adult: number;

  quest_energy_refill_amount: number;

  quest_energy_refill1_cost_factor: number;

  quest_energy_refill2_cost_factor: number;

  quest_energy_refill3_cost_factor: number;

  quest_energy_refill4_cost_factor: number;

  quest_energy_refill_premium_amount_discount_1: number;

  quest_energy_refill_premium_amount_discount_2: number;

  quest_energy_refill_premium_amount_discount_3: number;

  quest_energy_refill_discount_1_max_level: number;

  quest_energy_refill_discount_2_max_level: number;

  quest_energy_refill_discount_3_max_level: number;

  quest_refresh_single_stage_premium_currency_amount: number;

  quest_refresh_all_stages_reduction_factor: number;

  quest_reward_slotmachine_jetons_chance: number;

  quest_reward_slotmachine_jetons_amount: string;

  duel_reward_slotmachine_jetons_chance: number;

  duel_reward_slotmachine_jetons_amount: string;

  fight_quest_npc_stat_percentage_min_easy: number;

  fight_quest_npc_stat_percentage_max_easy: number;

  fight_quest_npc_stat_percentage_min_medium: number;

  fight_quest_npc_stat_percentage_max_medium: number;

  fight_quest_npc_stat_percentage_min_hard: number;

  fight_quest_npc_stat_percentage_max_hard: number;

  fight_quest_reward_coin_scale_easy: number;

  fight_quest_reward_coin_scale_medium: number;

  fight_quest_reward_coin_scale_hard: number;

  fight_quest_reward_xp_scale_easy: number;

  fight_quest_reward_xp_scale_medium: number;

  fight_quest_reward_xp_scale_hard: number;

  fight_quest_reward_lost_xp: number;

  fight_quest_reward_lost_coin: number;

  quest_stat_base_easy: number;

  quest_stat_base_medium: number;

  quest_stat_base_hard: number;

  quest_stat_factor_increase: number;

  quest_stat_multiplier_1: number;

  quest_stat_multiplier_2: number;

  stat_quest_reward_lost_xp: number;

  stat_quest_reward_lost_coin: number;

  item_buy_price_premium_common: number;

  item_buy_price_premium_rare: number;

  item_buy_price_premium_epic: number;

  item_buy_price_base: number;

  item_buy_price_adjust_end_level: number;

  item_buy_price_adjust_start_percentage: number;

  item_buy_price_scale_common: number;

  item_buy_price_scale_rare: number;

  item_buy_price_scale_epic: number;

  item_sell_price_percentage: number;

  item_sell_price_premium_factor: number;

  item_quality_chance_rare: number;

  item_quality_chance_epic: number;

  item_stats_per_level: number;

  item_level_diff_common_min: number;

  item_level_diff_common_max: number;

  item_level_diff_rare_min: number;

  item_level_diff_rare_max: number;

  item_level_diff_epic_min: number;

  item_level_diff_epic_max: number;

  item_level_character_level_min_percentage: number;

  item_level_plus_premium_min: number;

  item_level_plus_premium_max: number;

  item_stat_boost_min_common: number;

  item_stat_boost_min_rare: number;

  item_stat_boost_min_epic: number;

  item_stat_boost_min_percentage: number;

  item_weapon_damage_factor: number;

  item_missile_damage_factor: number;

  item_missile_min_required_level: number;

  item_premium_chance_percentage_common: number;

  item_premium_chance_percentage_rare: number;

  item_premium_chance_percentage_epic: number;

  shop_refresh_waiting_time_premium_amount: number;

  shop_max_premium_items: number;

  shop_max_rare_items: number;

  shop_max_epic_items: number;

  item_shop_min_level: number;

  work_effectiveness_max: number;

  work_effectiveness_min: number;

  work_duration_min: number;

  work_duration_max: number;

  work_step_duration: number;

  work_effectiveness: number;

  work_duration_base: number;

  leaderboard_max_result: number;

  leaderboard_cache: number;

  leaderboard_global_refresh_minutes: number;

  pvp_honor_win_exp_better: number;

  pvp_honor_win_exp_worse: number;

  pvp_honor_lose_amount: number;

  pvp_honor_lose_max: number;

  pvp_waiting_time: number;

  pvp_effectiveness_lost: number;

  pvp_effectiveness_won: number;

  max_level: number;

  level_up_stat_points: number;

  stage_level_up_premium_amount: number;

  booster_small_costs_time: number;

  booster_medium_costs_time: number;

  booster_large_costs_premium_currency: number;

  booster_costs_coins_step: number;

  booster_sense_costs_premium_currency_amount: number;

  booster_sense_duration: number;

  character_name_length_min: number;

  character_name_length_max: number;

  brawn_min: number;

  brain_min: number;

  awareness_min: number;

  toughness_min: number;

  brawn_trained_min: number;

  brain_trained_min: number;

  awareness_trained_min: number;

  toughness_trained_min: number;

  cost_stat_base: number;

  cost_stat_scale: number;

  cost_stat_base_scale: number;

  cost_stat_base_exp: number;

  init_game_currency: number;

  init_premium_currency: number;

  init_honor: number;

  init_base_stat_value: number;

  stat_fast_skill_value: number;

  init_quest_energy: number;

  init_quest_energy_friend_invite_platform: number;

  init_max_quest_energy: number;

  init_duel_stamina: number;

  init_max_duel_stamina: number;

  init_max_free_shop_refreshes: number;

  tutorial_finished_premium_currency: number;

  account_reactivated_premium_currency: number;

  account_marketing_opt_in_premium_currency: number;

  inventory_bag2_unlock_level: number;

  inventory_bag3_unlock_level: number;

  botdetection_usage_min_count: number;

  botdetection_skip_percentage: number;

  botdetection_tempban_duration: number;

  character_show_head_item_min_level: number;

  unlock_hide_chest_premium_amount: number;

  unlock_hide_belt_premium_amount: number;

  unlock_hide_legs_premium_amount: number;

  unlock_hide_boots_premium_amount: number;

  message_min_level: number;

  message_load_value: number;

  goal_reward_game_currency_time: number;

  goal_reward_game_currency_percentage_base: number;

  goal_reward_game_currency_exp: number;

  goal_reward_premium_currency_base: number;

  goal_reward_stat_points_base: number;

  goal_reward_xp_percentage_base: number;

  goal_reward_item_min_plus_level_base: number;

  goal_reward_item_min_plus_level_rare: number;

  goal_reward_item_min_plus_level_epic: number;

  goal_reward_energy_base: number;

  guild_name_length_min: number;

  guild_name_length_max: number;

  guild_creation_cost_game_currency: number;

  init_stat_guild_capacity: number;

  init_stat_character_base_stats_boost: number;

  init_stat_quest_xp_reward_boost: number;

  init_stat_quest_game_currency_reward_boost: number;

  init_guild_honor: number;

  init_guild_missiles: number;

  guild_chat_init_fetch_count: number;

  max_stat_guild_capacity: number;

  max_stat_character_base_stats_boost: number;

  max_stat_quest_xp_reward_boost: number;

  max_stat_quest_game_currency_reward_boost: number;

  guild_percentage_total_base: number;

  guild_battle_reward_premium_currency_chance: number;

  guild_battle_reward_premium_currency_amount: number;

  guild_battle_preparation_time: number;

  guild_battle_defender_stamina_reduction: number;

  guild_battle_reward_item_chance: number;

  guild_battle_reward_coin_efficiency: number;

  guild_battle_missile_max_usage: number;

  guild_battle_missile_damage_factor: number;

  guild_battle_missile_damage_percentage: number;

  guild_battle_waiting_time: number;

  guild_battle_max_guild_results: number;

  guild_battle_min_honor_win: number;

  guild_artifact_slot3_unlock_percentage: number;

  guild_artifact_slot4_unlock_percentage: number;

  guild_artifact_slot5_unlock_percentage: number;

  guild_artifact_duel_stamina_cost_step: number;

  guild_missile_premium_currency_amount: number;

  guild_rename_premium_currency_amount: number;

  guild_search_limit: number;

  guild_donation_min_level: number;

  guild_leader_vote_min_active_days: number;

  guild_leader_vote_duration: number;

  guild_auto_joins_premium_currency_amount_package1: number;

  guild_auto_joins_amount_package1: number;

  guild_auto_joins_premium_currency_amount_package2: number;

  guild_auto_joins_amount_package2: number;

  guild_auto_joins_premium_currency_amount_package3: number;

  guild_auto_joins_amount_package3: number;

  guild_join_cooldown: number;

  video_advertisment_max_views_quest: number;

  video_advertisment_bonus_quest: number;

  video_advertisment_max_views_convention_show: number;

  video_advertisment_bonus_convention_show: number;

  video_advertisment_max_views_dungeon_cooldown: number;

  video_advertisment_bonus_dungeon_cooldown: number;

  video_advertisment_blocked_time: number;

  sewing_machine_req_level: number;

  sewing_machine_common_game_currency_factor: number;

  sewing_machine_rare_premium_currency_amount: number;

  sewing_machine_epic_premium_currency_amount: number;

  sewing_machine_effect_item_premium_currency_amount: number;

  washing_machine_req_level: number;

  washing_machine_premium_currency_amount: number;

  daily_login_bonus_reward_game_currency_base: number;

  daily_login_bonus_reward_xp_base: number;

  daily_login_bonus_reward_premium_currency_base: number;

  daily_login_bonus_reward_fixed_days: number;

  daily_login_bonus_reward_day1_reward_type1: number;

  daily_login_bonus_reward_day1_reward_type2: number;

  daily_login_bonus_reward_day1_reward_type1_factor: number;

  daily_login_bonus_reward_day1_reward_type2_factor: number;

  daily_login_bonus_reward_day2_reward_type1: number;

  daily_login_bonus_reward_day2_reward_type2: number;

  daily_login_bonus_reward_day2_reward_type1_factor: number;

  daily_login_bonus_reward_day2_reward_type2_factor: number;

  daily_login_bonus_reward_day3_reward_type1: number;

  daily_login_bonus_reward_day3_reward_type2: number;

  daily_login_bonus_reward_day3_reward_type1_factor: number;

  daily_login_bonus_reward_day3_reward_type2_factor: number;

  daily_login_bonus_reward_day4_reward_type1: number;

  daily_login_bonus_reward_day4_reward_type2: number;

  daily_login_bonus_reward_day4_reward_type1_factor: number;

  daily_login_bonus_reward_day4_reward_type2_factor: number;

  daily_login_bonus_reward_day5_reward_type1: number;

  daily_login_bonus_reward_day5_reward_type2: number;

  daily_login_bonus_reward_day5_reward_type1_factor: number;

  daily_login_bonus_reward_day5_reward_type2_factor: number;

  daily_login_bonus_reward_pool_size: number;

  daily_login_bonus_reward_pool1_reward_type1: number;

  daily_login_bonus_reward_pool1_reward_type2: number;

  daily_login_bonus_reward_pool1_reward_type1_factor: number;

  daily_login_bonus_reward_pool1_reward_type2_factor: number;

  daily_login_bonus_reward_pool2_reward_type1: number;

  daily_login_bonus_reward_pool2_reward_type2: number;

  daily_login_bonus_reward_pool2_reward_type1_factor: number;

  daily_login_bonus_reward_pool2_reward_type2_factor: number;

  daily_login_bonus_reward_pool3_reward_type1: number;

  daily_login_bonus_reward_pool3_reward_type2: number;

  daily_login_bonus_reward_pool3_reward_type1_factor: number;

  daily_login_bonus_reward_pool3_reward_type2_factor: number;

  daily_login_bonus_reward_pool4_reward_type1: number;

  daily_login_bonus_reward_pool4_reward_type2: number;

  daily_login_bonus_reward_pool4_reward_type1_factor: number;

  daily_login_bonus_reward_pool4_reward_type2_factor: number;

  daily_login_bonus_reward_pool5_reward_type1: number;

  daily_login_bonus_reward_pool5_reward_type2: number;

  daily_login_bonus_reward_pool5_reward_type1_factor: number;

  daily_login_bonus_reward_pool5_reward_type2_factor: number;

  daily_login_bonus_reward_pool6_reward_type1: number;

  daily_login_bonus_reward_pool6_reward_type2: number;

  daily_login_bonus_reward_pool6_reward_type1_factor: number;

  daily_login_bonus_reward_pool6_reward_type2_factor: number;

  daily_login_bonus_reward_pool7_reward_type1: number;

  daily_login_bonus_reward_pool7_reward_type2: number;

  daily_login_bonus_reward_pool7_reward_type1_factor: number;

  daily_login_bonus_reward_pool7_reward_type2_factor: number;

  daily_login_bonus_reward_pool8_reward_type1: number;

  daily_login_bonus_reward_pool8_reward_type2: number;

  daily_login_bonus_reward_pool8_reward_type1_factor: number;

  daily_login_bonus_reward_pool8_reward_type2_factor: number;

  daily_login_bonus_reward_pool9_reward_type1: number;

  daily_login_bonus_reward_pool9_reward_type2: number;

  daily_login_bonus_reward_pool9_reward_type1_factor: number;

  daily_login_bonus_reward_pool9_reward_type2_factor: number;

  daily_login_bonus_reward_pool10_reward_type1: number;

  daily_login_bonus_reward_pool10_reward_type2: number;

  daily_login_bonus_reward_pool10_reward_type1_factor: number;

  daily_login_bonus_reward_pool10_reward_type2_factor: number;

  avg_stats_min_level: number;

  avg_stats_max_level: number;

  avg_stats_min_level_amount: number;

  avg_stats_max_level_amount: number;

  tournament_end_weekday: string;

  tournament_end_hour: number;

  friend_invite_reward_level: number;

  friend_invite_reward_premium_currency_amount: number;

  friend_invite_inactive_limit: number;

  friend_invite_reward_energy_amount: number;

  friend_invite_reward_energy_base_amount: number;

  resource_quest_usage_amount: number;

  resource_quest_usage_limit: number;

  resource_quest_reduction: number;

  resource_quest_max_stock: number;

  resource_quest_usage_limit_upgraded: number;

  resource_quest_max_stock_upgraded: number;

  resource_free_slotmachine_spin_usage_amount: number;

  resource_slotmachine_jeton_usage_amount: number;

  bank_upgrade1_premium_amount: number;

  bank_upgrade2_premium_amount: number;

  bank_upgrade3_premium_amount: number;

  bank_upgrade4_premium_amount: number;

  bank_upgrade5_premium_amount: number;

  bank_upgrade6_premium_amount: number;

  bank_upgrade7_premium_amount: number;

  bank_upgrade8_premium_amount: number;

  bank_upgrade9_premium_amount: number;

  bank_upgrade10_premium_amount: number;

  bank_upgrade11_premium_amount: number;

  bank_upgrade12_premium_amount: number;

  bank_upgrade13_premium_amount: number;

  bank_upgrade14_premium_amount: number;

  bank_upgrade15_premium_amount: number;

  bank_upgrade16_premium_amount: number;

  bank_upgrade17_premium_amount: number;

  bank_upgrade18_premium_amount: number;

  bank_upgrade19_premium_amount: number;

  bank_upgrade20_premium_amount: number;

  movie_title_amount_first_word: number;

  movie_title_amount_second_word: number;

  movie_title_amount_third_word: number;

  movie_title_customize_premium_cost: number;

  movie_title_customize_max_length: number;

  movie_title_customize_min_length: number;

  movie_min_level: number;

  movie_title_refresh_premium_cost: number;

  movie_chance_event_setting: number;

  init_max_movie_energy: number;

  movie_refresh_offers_cost: number;

  movie_energy_cost: number;

  movie_energy_refill_amount: number;

  movie_energy_refresh_amount_per_minute: number;

  movie_quest_energy_cost_min: number;

  movie_quest_energy_cost_max: number;

  movie_quest_reward_game_currency_time: number;

  movie_quest_reward_xp_time: number;

  movie_quest_reward_progress_scale_attribute_easy: number;

  movie_quest_reward_progress_scale_attribute_medium: number;

  movie_quest_reward_progress_scale_attribute_hard: number;

  movie_quest_reward_coin_scale_attribute_easy: number;

  movie_quest_reward_coin_scale_attribute_medium: number;

  movie_quest_reward_coin_scale_attribute_hard: number;

  movie_quest_reward_xp_scale_attribute_easy: number;

  movie_quest_reward_xp_scale_attribute_medium: number;

  movie_quest_reward_xp_scale_attribute_hard: number;

  movie_quest_reward_progress_scale_fight_easy: number;

  movie_quest_reward_progress_scale_fight_medium: number;

  movie_quest_reward_progress_scale_fight_hard: number;

  movie_quest_reward_coin_scale_fight_easy: number;

  movie_quest_reward_coin_scale_fight_medium: number;

  movie_quest_reward_coin_scale_fight_hard: number;

  movie_quest_reward_xp_scale_fight_easy: number;

  movie_quest_reward_xp_scale_fight_medium: number;

  movie_quest_reward_xp_scale_fight_hard: number;

  movie_quest_reward_progress_scale_instant: number;

  movie_quest_reward_coin_scale_instant: number;

  movie_quest_reward_xp_scale_instant: number;

  movie_quest_reward_lost_xp: number;

  movie_quest_reward_lost_coin: number;

  movie_quest_reward_lost_progress: number;

  movie_quest_pool_size: number;

  movie_star_reward_game_currency_time: number;

  movie_star_reward_xp_time: number;

  movie_star_reward_full_reward_time: number;

  movie_star_reward_base_multiplier: number;

  movie_cooldown: number;

  movie_daily_limit: number;

  movie_skip_cooldown_cost: number;

  movie_skip_cooldown_cost_discount: number;

  movie_extend_time_refill_cost_factor: number;

  movie_extend_time_premium_amount: number;

  movie_extend_time_discount_1_max_level: number;

  movie_extend_time_discount_2_max_level: number;

  movie_extend_time_discount_3_max_level: number;

  movie_extend_time_premium_amount_discount_1: number;

  movie_extend_time_premium_amount_discount_2: number;

  movie_extend_time_premium_amount_discount_3: number;

  movie_extend_time_amount: number;

  item_level_range1_start: number;

  item_level_range1_end: number;

  item_level_range2_start: number;

  item_level_range2_end: number;

  item_level_range3_start: number;

  item_level_range3_end: number;

  item_level_range1_steps: number;

  item_level_range2_steps: number;

  item_level_range3_steps: number;

  movie_vote_min_level: number;

  movie_vote_refresh_premium_amount: number;

  movie_vote_reward_rank_1_statpoints: number;

  movie_vote_reward_rank_1_xp: number;

  movie_vote_reward_rank_1_premium: number;

  movie_vote_reward_rank_2_statpoints: number;

  movie_vote_reward_rank_2_xp: number;

  movie_vote_reward_rank_2_premium: number;

  movie_vote_reward_rank_3_statpoints: number;

  movie_vote_reward_rank_3_xp: number;

  movie_vote_reward_rank_3_premium: number;

  movie_vote_reward_rank_10_statpoints: number;

  movie_vote_reward_rank_10_xp: number;

  movie_vote_reward_rank_10_premium: number;

  movie_vote_reward_rank_100_statpoints: number;

  movie_vote_reward_rank_100_xp: number;

  movie_vote_reward_rank_100_premium: number;

  movie_vote_reward_rank_250_statpoints: number;

  movie_vote_reward_rank_250_xp: number;

  movie_vote_reward_rank_250_premium: number;

  movie_vote_reward_rank_500_statpoints: number;

  movie_vote_reward_rank_500_xp: number;

  movie_vote_reward_rank_500_premium: number;

  movie_vote_voting_reward_1_xp_chance: number;

  movie_vote_voting_reward_1_coin_chance: number;

  movie_vote_voting_reward_1_min_xp_chance: number;

  movie_vote_voting_reward_1_min_coins_chance: number;

  movie_vote_voting_reward_1_premium_chance: number;

  movie_vote_voting_reward_1_stat_chance: number;

  movie_vote_voting_reward_1_epic_item_chance: number;

  movie_vote_voting_reward_epic_item_bonus_level: number;

  movie_tournament_end_weekday: string;

  movie_vote_reward_rank_1_title: string;

  convention_reward_item_top_pool_size: number;

  convention_reward_epic_item_min_shows: number;

  convention_reward_epic_item_item_bonus: number;

  convention_reward_rare_item_min_shows: number;

  convention_reward_rare_item_item_bonus: number;

  convention_reward_common_item_item_bonus: number;

  convention_reward_coin_duration: number;

  convention_reward_coin_base: number;

  convention_reward_coin_falloff: number;

  convention_reward_coin_factor_failed: number;

  convention_reward_xp_duration: number;

  convention_reward_xp_falloff: number;

  convention_reward_xp_factor_failed: number;

  convention_fans_base: number;

  convention_fans_multiplier: number;

  convention_fans_tolerance: number;

  convention_fans_factor_base: number;

  convention_fans_factor_exp: number;

  convention_fans_minimum: number;

  convention_fans_minimum_percentage: number;

  convention_instant_finish_premium_amount: number;

  convention_min_dau_count: number;

  convention_max_correction_factor: number;

  convention_average_shows_per_dau_per_hour: number;

  convention_min_avg_fans_per_convention_show: number;

  convention_show_duration: number;

  convention_perfect_ratio: number;

  convention_reward_additional_min_shows: number;

  convention_show_multi_attend_premium_amount: number;

  convention_show_multi_attend_iterations: number;

  payer_promotion_premium_currency_amount: number;

  dungeon_quest_cooldown_win_premium_amount: number;

  dungeon_quest_cooldown_lost_premium_amount: number;

  dungeon_level_unlock_premium_currency_cost: number;

  dungeon_quest_reward_premium_currency_reward: number;

  dungeon_quest_reward_premium_currency_chance: number;

  dungeon_quest_reward_max_level_offset: number;

  dungeon_quest_reward_coin_duration: number;

  dungeon_quest_reward_xp_duration: number;

  dungeon_quest_cooldown_win: number;

  dungeon_quest_cooldown_lost: number;

  dungeon_quest_reward_min_item_level_percentage: number;

  dungeon_quest_npc_stat_percentage_min: number;

  dungeon_quest_npc_stat_percentage_max: number;

  dungeon_quest_npc_recalculate_percentage: number;

  dungeon_quest_npc_stat_level_multi_commons: number;

  dungeon_quest_npc_stat_level_multi_rares: number;

  dungeon_quest_npc_stat_level_multi_epics: number;

  dungeon_quest_npc_stat_level_decrease: number;

  dungeon_quest_npc_stat_level_multi_total: number;

  dungeon_extend_time_amount: number;

  dungeon_extend_time_premium_amount: number;

  dungeon_quest_key_chance: number;

  dungeon_boss_reward_stat_point_reward: number;

  dungeon_min_level: number;

  customize_item_req_level: number;

  customize_item_premium_currency_amount: number;

  customize_item_amount_skills_generated: number;

  dungeon_key_duration: number;

  story_dungeon_attack_cooldown: number;

  story_dungeon_attack_premium_currency: number;

  item_pattern_reward_energy_base: number;

  item_pattern_reward_stat_points_base: number;

  item_pattern_reward_item_min_plus_level_base: number;

  event_quest_objective_reward_game_currency_time: number;

  event_quest_objective_reward_game_currency_percentage_base: number;

  event_quest_objective_reward_game_currency_exp: number;

  event_quest_objective_reward_premium_currency_base: number;

  event_quest_objective_reward_stat_points_base: number;

  event_quest_objective_reward_xp_percentage_base: number;

  event_quest_objective_reward_item_min_plus_level_base: number;

  event_quest_objective_reward_item_min_plus_level_rare: number;

  event_quest_objective_reward_item_min_plus_level_epic: number;

  event_quest_objective_instant_finish_amount: number;

  event_quest_min_level: number;

  event_quest_reward_game_currency_time: number;

  event_quest_reward_xp_time: number;

  event_quest_reward_unfinished_game_currency_time: number;

  event_quest_reward_unfinished_xp_time: number;

  event_quest_reward_unfinished_item_plus_level: number;

  warforged_unlock_level: number;

  warforged_effect_min_level: number;

  maximum_energy_storage_amount_upgraded: number;

  maximum_energy_storage_amount: number;

  storage_unlock_level: number;

  energy_storage_cost_50: number;

  energy_storage_cost_100: number;

  guild_competition_min_score: number;

  guild_competition_min_rank_reward: number;

  guild_competition_reward_xp: number;

  guild_competition_reward_stat_points: number;

  guild_competition_reward_guild_premium_curremcy: number;

  new_guild_competition_rewards_start: string;

  new_guild_competition_reward_xp: number;

  new_guild_competition_reward_stat_points: number;

  new_guild_competition_reward_guild_premium_curremcy: number;

  guild_competition_first_place_item_templates: string;

  guild_competition_first_place_item_plus_level: number;

  solo_guild_competition_reward_stat_points_top_3: number;

  solo_guild_competition_reward_stat_points_top_10: number;

  solo_guild_competition_reward_stat_points_top_20: number;

  solo_guild_competition_reward_stat_points_top_30: number;

  solo_guild_competition_reward_stat_points_top_40: number;

  solo_guild_competition_reward_stat_points_top_50: number;

  solo_guild_competition_reward_stat_points_top_100: number;

  solo_guild_competition_reward_stat_points_top_150: number;

  solo_guild_competition_reward_stat_points_top_200: number;

  solo_guild_competition_reward_stat_points_top_300: number;

  slotmachine_premium_currency_amount: number;

  slotmachine_max_available_free_spins: number;

  slotmachine_max_available_jetons: number;

  slotmachine_min_level: number;

  slotmachine_coin_reward_base_time: number;

  slotmachine_xp_reward_base_time: number;

  slotmachine_max_daily_spins: number;

  slotmachine_teaser_min_level: number;

  slotmachine_event_start: string;

  slotmachine_event_end: string;

  dating_attack_cooldown: number;

  dating_attack_premium_currency: number;

  dating_upgrade_storage_premium_currency: number;

  dating_base_storage: number;

  dating_storage_upgrade: number;

  dating_unlock_level: number;

  user_voucher_code_prefix: string;

  reward_user_voucher_duration: number;

  herobook_min_level: number;

  herobook_teaser_min_level: number;

  herobook_daily_objective_instant_finish_amount: number;

  herobook_weekly_objective_instant_finish_amount: number;

  herobook_objective_reward_game_currency_time: number;

  herobook_objective_reward_xp_time: number;

  herobook_daily_objectives: number;

  herobook_weekly_objectives: number;

  herobook_objective_renew_amount: number;

  release_guild_artifact_cost: number;

  release_guild_artifact_cooldown: number;

  fan_foto_cost: number;

  fan_foto_25_increase: number;

  fan_foto_100_increase: number;

  fan_foto_max_cost: number;

  fan_foto_max_tags: number;

  fan_foto_start_tags: number;

  fan_foto_tag_3_cost: number;

  fan_foto_tag_4_cost: number;

  fan_foto_remove_tag_cost: number;

  fan_foto_remove_all_tags_cost: number;

  fan_foto_resource_cost: number;

  fan_foto_min_resource_per_quest: number;

  fan_foto_max_resource_per_quest_min: number;

  guild_booster_cost_game_currency_per_improvement: number;

  guild_booster_cost_premium_currency: number;

  guild_booster_first_warning: number;

  guild_booster_second_warning: number;

  booster_multitasking_unlock_level: number;

  multitasking_rent_premium_amount: number;

  multitasking_rent_time_amount: number;

  max_simultane_marriages: number;

  marriage_ring_item_template: string;

  marriage_ring_item_plus_level: number;

  max_outfits: number;

  outfit_unlock_cost: number;

  outfit_min_level: number;

  optical_change_unlock_level: number;

  optical_changes_reward_stat_points_base: number;

  optical_changes_reward_energy_base: number;

  optical_change_chest_price_small: number;

  optical_change_chest_amount_small: number;

  optical_change_chest_price_big: number;

  optical_change_chest_amount_big: number;

  user_story_unlock_level: number;

  user_story_creation_cost: number;

  user_story_hall_of_fame_limit: number;

  user_story_hall_of_fame_reward: number;

  user_story_min_title_char_count: number;

  user_story_max_title_char_count: number;

  user_story_min_briefing_char_count: number;

  user_story_max_briefing_char_count: number;

  user_story_min_outro_char_count: number;

  user_story_max_outro_char_count: number;

  streaming_refresh_offers_cost: number;

  kobil_max_activation_time: number;

  @Transform(objectOfObjectsToArrayOfModels(Goal))
  goals: Goal[];

  item_pattern: {
    [identifier: string]: {
      active: boolean;
      lookup_column: string;
      ts_availability_start: string;
      ts_availability_end: string;
      values: {
        [value: string]: {
          reward_type: number;
          reward_factor: number;
          reward_identifier: string;
          reward_title: string;
        };
      };
      sources: {
        [source: string]: string[];
      };
    };
  };

  item_templates: {
    [identifier: string]: {
      type: number;
      gender: string;
      quality: number;
      pool: number;
      required_level: number;
      charges: number;
      ts_availability_start: string;
      ts_availability_end: string;
      display_options: number;
      premium_only: boolean;
      sew_price: number;
      lang_restrictions: string;
      item_set_identifier: string;
      fixed_premium_price: number;
      non_set_identifier: string;
      item_pattern: string;
      is_event: boolean;
      effect_chance: number;
      effects: string;
      asset_bundle_id: number;
    };
  };

  optical_changes: {
    [id: number]: {
      identifier: string;
      type: number;
      rarity: number;
      default: boolean;
      effect: string;
      ts_availability_start: string;
      ts_availability_end: string;
      event: string;
    };
  };

  titles: {
    [identifier: string]: {
      identifier: string;
      index: number;
      source: number;
      price_factor: number;
      price_premium: number;
      drop_chance: number;
      min_level: number;
      ts_availability_start: string;
      ts_availability_end: string;
    };
  };

  battle_skills: {
    [id: number]: {
      identifier: string;
      value1: number;
      value2: number;
      value3: number;
      rolled_value: string;
      type: number;
      charges: number;
      slots: {
        [slot: number]: {
          min: number;
          max: number;
        };
      }
    };
  };
}
