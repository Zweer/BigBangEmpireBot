import { ConfigEnvironmentResponseDto } from './config.environment.response.dto';
import { ResponseDataDto } from '../response.data.dto';
import { locales } from '../types';

type genders = 'm' | 'f';
type characterAppearancesNumeric = 'skin_color' | 'skin_color_change_required_level' | 'skin_color_change_cost_coins' | 'skin_color_change_cost_premium' | 'hair_type' | 'hair_type_style' | 'hair_type_change_required_level' | 'hair_type_change_cost_coins' | 'hair_type_change_cost_premium' | 'hair_color' | 'hair_color_change_required_level' | 'hair_color_change_cost_coins' | 'hair_color_change_cost_premium' | 'head_type' | 'head_type_change_required_level' | 'head_type_change_cost_coins' | 'head_type_change_cost_premium' | 'eyes_type' | 'eyes_type_style' | 'eyes_type_change_required_level' | 'eyes_type_change_cost_coins' | 'eyes_type_change_cost_premium' | 'eyebrows_type' | 'eyebrows_type_style' | 'eyebrows_type_change_required_level' | 'eyebrows_type_change_cost_coins' | 'eyebrows_type_change_cost_premium' | 'eyebrows_color' | 'eyebrows_color_change_required_level' | 'eyebrows_color_change_cost_coins' | 'eyebrows_color_change_cost_premium' | 'nose_type' | 'nose_type_style' | 'nose_type_change_required_level' | 'nose_type_change_cost_coins' | 'nose_type_change_cost_premium' | 'mouth_type' | 'mouth_type_style' | 'mouth_type_change_required_level' | 'mouth_type_change_cost_coins' | 'mouth_type_change_cost_premium' | 'facial_hair_type' | 'facial_hair_type_style' | 'facial_hair_type_change_required_level' | 'facial_hair_type_change_cost_coins' | 'facial_hair_type_change_cost_premium' | 'facial_hair_color' | 'facial_hair_color_change_required_level' | 'facial_hair_color_change_cost_coins' | 'facial_hair_color_change_cost_premium' | 'decoration_type' | 'decoration_type_style' | 'decoration_type_change_required_level' | 'decoration_type_change_cost_coins' | 'decoration_type_change_cost_premium' | 'photo_rect_type' | 'photo_rect_type_change_required_level' | 'photo_rect_type_change_cost_coins' | 'photo_rect_type_change_cost_premium' | 'photo_border_type' | 'photo_border_type_change_required_level' | 'photo_border_type_change_cost_coins' | 'photo_border_type_change_cost_premium' | 'photo_background_type' | 'photo_background_type_change_required_level' | 'photo_background_type_change_cost_coins' | 'photo_background_type_change_cost_premium' | 'photo_filter_type' | 'photo_filter_type_change_required_level' | 'photo_filter_type_change_cost_coins' | 'photo_filter_type_change_cost_premium' | 'photo_icon_type' | 'photo_icon_type_change_required_level' | 'photo_icon_type_change_cost_coins' | 'photo_icon_type_change_cost_premium' | 'photo_sexuality_type' | 'photo_sexuality_type_change_required_level' | 'photo_sexuality_type_change_cost_coins' | 'photo_sexuality_type_change_cost_premium' | 'tattoo_arm_left' | 'tattoo_arm_left_change_required_level' | 'tattoo_arm_left_change_cost_coins' | 'tattoo_arm_left_change_cost_premium' | 'tattoo_arm_right' | 'tattoo_arm_right_change_required_level' | 'tattoo_arm_right_change_cost_coins' | 'tattoo_arm_right_change_cost_premium' | 'tattoo_body' | 'tattoo_body_change_required_level' | 'tattoo_body_change_cost_coins' | 'tattoo_body_change_cost_premium' | 'tattoo_leg_left' | 'tattoo_leg_left_change_required_level' | 'tattoo_leg_left_change_cost_coins' | 'tattoo_leg_left_change_cost_premium' | 'tattoo_leg_right' | 'tattoo_leg_right_change_required_level' | 'tattoo_leg_right_change_cost_coins' | 'tattoo_leg_right_change_cost_premium' | 'bra_type' | 'bra_type_change_required_level' | 'bra_type_change_cost_coins' | 'bra_type_change_cost_premium' | 'panties_type' | 'panties_type_change_required_level' | 'panties_type_change_cost_coins' | 'panties_type_change_cost_premium' | 'genitals_type' | 'genitals_type_change_required_level' | 'genitals_type_change_cost_coins' | 'genitals_type_change_cost_premium' | 'genitals_hair_type' | 'genitals_hair_type_change_required_level' | 'genitals_hair_type_change_cost_coins' | 'genitals_hair_type_change_cost_premium' | 'genitals_hair_color' | 'genitals_hair_color_change_required_level' | 'genitals_hair_color_change_cost_coins' | 'genitals_hair_color_change_cost_premium';
type characterAppearancesBoolean = 'hair_back' | 'hair_middle';
type definedCharacterAppearances = 'appearance_hair_type' | 'appearance_head_type' | 'appearance_eyes_type' | 'appearance_eyebrows_type' | 'appearance_nose_type' | 'appearance_mouth_type' | 'appearance_facial_hair_type';

export interface ConfigGameResponseDto extends ResponseDataDto {
  constants: {
    tolerance_small: number; // 0.05
    tolerance_medium: number; // 0.1
    tolerance_large: number; // 0.15
    time_per_level_base: number; // 60
    time_per_level_scale: number; // 6
    time_per_level_level_scale: number; // 4.5
    time_per_level_level_exp: number; // 2
    xp_per_time: number; // 1.5
    coins_per_time_base: number; // 0.02
    coins_per_time_scale: number; // 0.01
    coins_per_time_level_scale: number; // 0.35
    coins_per_time_level_exp: number; // 1.55
    time_per_premium_currency: number; // 300
    battle_hp_scale: number; // 10
    battle_damage_tolerance: number; // 0.3
    battle_critical_probability_min: number; // 0.01
    battle_critical_probability_base: number; // 0.02
    battle_critical_probability_max: number; // 1
    battle_critical_probability_exp_low: number; // 20
    battle_critical_probability_exp_high: number; // 1.225
    battle_critical_factor: number; // 2.2
    battle_dodge_probability_min: number; // 0.01
    battle_dodge_probability_base: number; // 0.1
    battle_dodge_probability_max: number; // 0.6
    battle_dodge_probability_exp_low: number; // 5
    battle_dodge_probability_exp_high: number; // 1.65
    battle_dodge_probability_max_ratio: number; // 1.5
    battle_max_rounds: number; // 80
    duel_opponent_list_max_results: number; // 10
    duel_opponent_list_level_tolerance: number; // 0.1
    duel_opponent_list_stats_tolerance_min: number; // 0.25
    duel_opponent_list_stats_tolerance_max: number; // 0.15
    duel_reward_premium_currency_chance: number; // 0.03
    duel_reward_premium_currency_chance_hard: number; // 0.06
    duel_reward_premium_currency_reward1: number; // 10
    duel_reward_premium_currency_reward1_chance: number; // 0.0612
    duel_reward_premium_currency_reward2: number; // 5
    duel_reward_premium_currency_reward2_chance: number; // 0.1225
    duel_reward_premium_currency_reward3: number; // 3
    duel_reward_premium_currency_reward3_chance: number; // 0.205
    duel_reward_premium_currency_reward4: number; // 1
    duel_reward_premium_currency_reward4_chance: number; // 0.6113
    duel_reward_item_drop_chance: number; // 0.15
    duel_reward_item_drop_chance_hard: number; // 0.25
    duel_attack_limit: number; // 3
    duel_stamina_cost: number; // 20
    duel_stamina_reset_premium_amount: number; // 80
    duel_stamina_refresh_amount_per_minute_first_duel: number; // 2
    duel_stamina_refresh_amount_per_minute: number; // 0.333334
    duel_single_attack_premium_amount: number; // 20
    duel_max_missed_duels: number; // 99
    duel_enemies_refresh_premium_amount: number; // 5
    quest_max_stage: number; // 9
    quest_level_full_duration: number; // 10
    quest_max_refill_amount_per_day: number; // 200
    quest_duration_short: number; // 300
    quest_duration_medium: number; // 600
    quest_duration_long: number; // 1200
    quest_duration_tolerance: number; // 0.2
    quest_instant_finish_range1_premium_amount: number; // 10
    quest_instant_finish_range2_premium_amount: number; // 20
    quest_instant_finish_range3_premium_amount: number; // 30
    quest_instant_finish_range4_premium_amount: number; // 40
    quest_instant_finish_range1_duration: number; // 7.5
    quest_instant_finish_range2_duration: number; // 12.5
    quest_instant_finish_range3_duration: number; // 17.5
    quest_reward_balanced_end_level: number; // 4
    quest_reward_probability_xp_heavy: number; // 0.2
    quest_reward_probability_coin_heavy: number; // 0.2
    quest_reward_probability_item: number; // 0.1
    quest_reward_xp_adjust_end_level: number; // 4
    quest_reward_xp_adjust_start_percentage: number; // 2
    quest_reward_xp_scale_balanced: number; // 1
    quest_reward_xp_scale_xp_heavy: number; // 1.4
    quest_reward_xp_scale_coin_heavy: number; // 0.6
    quest_reward_xp_scale_item: number; // 0.2
    quest_reward_coin_scale_balanced: number; // 1
    quest_reward_coin_scale_xp_heavy: number; // 0.2
    quest_reward_coin_scale_coin_heavy: number; // 1.8
    quest_reward_coin_scale_item: number; // 0.2
    quest_reward_premium_currency_chance_short: number; // 0.03
    quest_reward_premium_currency_chance_medium: number; // 0.05
    quest_reward_premium_currency_chance_long: number; // 0.07
    quest_reward_premium_currency_reward1: number; // 10
    quest_reward_premium_currency_reward1_chance: number; // 0.0612
    quest_reward_premium_currency_reward2: number; // 5
    quest_reward_premium_currency_reward2_chance: number; // 0.1225
    quest_reward_premium_currency_reward3: number; // 3
    quest_reward_premium_currency_reward3_chance: number; // 0.205
    quest_reward_premium_currency_reward4: number; // 1
    quest_reward_premium_currency_reward4_chance: number; // 0.6113
    quest_energy_refill_premium_amount: number; // 20
    quest_energy_refill_premium_amount_increase_adult: number; // 5
    quest_energy_refill_amount: number; // 50
    quest_energy_refill1_cost_factor: number; // 1800
    quest_energy_refill2_cost_factor: number; // 6300
    quest_energy_refill3_cost_factor: number; // 10800
    quest_energy_refill4_cost_factor: number; // 15300
    quest_energy_refill_premium_amount_discount_1: number; // 0.25
    quest_energy_refill_premium_amount_discount_2: number; // 0.5
    quest_energy_refill_premium_amount_discount_3: number; // 0.75
    quest_energy_refill_discount_1_max_level: number; // 19
    quest_energy_refill_discount_2_max_level: number; // 29
    quest_energy_refill_discount_3_max_level: number; // 39
    quest_refresh_single_stage_premium_currency_amount: number; // 20
    quest_refresh_all_stages_reduction_factor: number; // 5
    quest_reward_slotmachine_jetons_chance: number; // 0.07
    quest_reward_slotmachine_jetons_amount: string; // '3;4;5;6;7'
    duel_reward_slotmachine_jetons_chance: number; // 0.25
    duel_reward_slotmachine_jetons_amount: string; // '3;4;5;5'
    fight_quest_npc_stat_percentage_min_easy: number; // 0.89
    fight_quest_npc_stat_percentage_max_easy: number; // 0.94
    fight_quest_npc_stat_percentage_min_medium: number; // 0.93
    fight_quest_npc_stat_percentage_max_medium: number; // 0.96
    fight_quest_npc_stat_percentage_min_hard: number; // 0.97
    fight_quest_npc_stat_percentage_max_hard: number; // 0.985
    fight_quest_reward_coin_scale_easy: number; // 1.07
    fight_quest_reward_coin_scale_medium: number; // 1.35
    fight_quest_reward_coin_scale_hard: number; // 2
    fight_quest_reward_xp_scale_easy: number; // 1.07
    fight_quest_reward_xp_scale_medium: number; // 1.35
    fight_quest_reward_xp_scale_hard: number; // 2
    fight_quest_reward_lost_xp: number; // 0.1
    fight_quest_reward_lost_coin: number; // 0.1
    quest_stat_base_easy: number; // 90
    quest_stat_base_medium: number; // 80
    quest_stat_base_hard: number; // 70
    quest_stat_factor_increase: number; // 15
    quest_stat_multiplier_1: number; // 0.17
    quest_stat_multiplier_2: number; // 43
    stat_quest_reward_lost_xp: number; // 0.1
    stat_quest_reward_lost_coin: number; // 0.1
    item_buy_price_premium_common: number; // 9
    item_buy_price_premium_rare: number; // 49
    item_buy_price_premium_epic: number; // 99
    item_buy_price_base: number; // 1200
    item_buy_price_adjust_end_level: number; // 10
    item_buy_price_adjust_start_percentage: number; // 0.3
    item_buy_price_scale_common: number; // 1
    item_buy_price_scale_rare: number; // 1.5
    item_buy_price_scale_epic: number; // 2
    item_sell_price_percentage: number; // 0.5
    item_sell_price_premium_factor: number; // 1.25
    item_quality_chance_rare: number; // 0.05
    item_quality_chance_epic: number; // 0.01
    item_stats_per_level: number; // 3
    item_level_diff_common_min: number; // -4,
    item_level_diff_common_max: number; // 0
    item_level_diff_rare_min: number; // 2
    item_level_diff_rare_max: number; // 3
    item_level_diff_epic_min: number; // 4
    item_level_diff_epic_max: number; // 5
    item_level_character_level_min_percentage: number; // 0.7
    item_level_plus_premium_min: number; // 3
    item_level_plus_premium_max: number; // 4
    item_stat_boost_min_common: number; // 0
    item_stat_boost_min_rare: number; // 0
    item_stat_boost_min_epic: number; // 0
    item_stat_boost_min_percentage: number; // 0.1
    item_weapon_damage_factor: number; // 2.7
    item_missile_damage_factor: number; // 3.9
    item_missile_min_required_level: number; // 10
    item_premium_chance_percentage_common: number; // 0.15
    item_premium_chance_percentage_rare: number; // 0.5
    item_premium_chance_percentage_epic: number; // 0.5
    shop_refresh_waiting_time_premium_amount: number; // 10
    shop_max_premium_items: number; // 3
    shop_max_rare_items: number; // 1
    shop_max_epic_items: number; // 1
    item_shop_min_level: number; // 25
    work_effectiveness_max: number; // 0.1
    work_effectiveness_min: number; // 0.0501
    work_duration_min: number; // 3600
    work_duration_max: number; // 86400
    work_step_duration: number; // 300
    work_effectiveness: number; // 0.1
    work_duration_base: number; // 28800
    leaderboard_max_result: number; // 12
    leaderboard_cache: number; // 102
    leaderboard_global_refresh_minutes: number; // 15
    pvp_honor_win_exp_better: number; // 3
    pvp_honor_win_exp_worse: number; // 3
    pvp_honor_lose_amount: number; // 0.75
    pvp_honor_lose_max: number; // 0.05
    pvp_waiting_time: number; // 600
    pvp_effectiveness_lost: number; // 0.05
    pvp_effectiveness_won: number; // 0.3
    max_level: number; // 900
    level_up_stat_points: number; // 2
    stage_level_up_premium_amount: number; // 50
    booster_small_costs_time: number; // 206
    booster_medium_costs_time: number; // 2057
    booster_large_costs_premium_currency: number; // 99
    booster_costs_coins_step: number; // 5
    booster_sense_costs_premium_currency_amount: number; // 19
    booster_sense_duration: number; // 3600
    character_name_length_min: number; // 3
    character_name_length_max: number; // 25
    brawn_min: number; // 10
    brain_min: number; // 10
    awareness_min: number; // 10
    toughness_min: number; // 10
    brawn_trained_min: number; // 5
    brain_trained_min: number; // 5
    awareness_trained_min: number; // 5
    toughness_trained_min: number; // 5
    cost_stat_base: number; // 5
    cost_stat_scale: number; // 0.12
    cost_stat_base_scale: number; // 0.85
    cost_stat_base_exp: number; // 2.15
    init_game_currency: number; // 20
    init_premium_currency: number; // 50
    init_honor: number; // 100
    init_base_stat_value: number; // 10
    stat_fast_skill_value: number; // 10
    init_quest_energy: number; // 100
    init_quest_energy_friend_invite_platform: number; // 5
    init_max_quest_energy: number; // 100
    init_duel_stamina: number; // 100
    init_max_duel_stamina: number; // 100
    init_max_free_shop_refreshes: number; // 1
    tutorial_finished_premium_currency: number; // 50
    account_reactivated_premium_currency: number; // 300
    account_marketing_opt_in_premium_currency: number; // 100
    inventory_bag2_unlock_level: number; // 20
    inventory_bag3_unlock_level: number; // 40
    botdetection_usage_min_count: number; // 15
    botdetection_skip_percentage: number; // 0.2
    botdetection_tempban_duration: number; // 24
    character_show_head_item_min_level: number; // 20
    unlock_hide_chest_premium_amount: number; // 899
    unlock_hide_belt_premium_amount: number; // 499
    unlock_hide_legs_premium_amount: number; // 499
    unlock_hide_boots_premium_amount: number; // 99
    message_min_level: number; // 2
    message_load_value: number; // 50
    goal_reward_game_currency_time: number; // 600
    goal_reward_game_currency_percentage_base: number; // 1
    goal_reward_game_currency_exp: number; // 1.9
    goal_reward_premium_currency_base: number; // 10
    goal_reward_stat_points_base: number; // 1
    goal_reward_xp_percentage_base: number; // 0.25
    goal_reward_item_min_plus_level_base: number; // 1
    goal_reward_item_min_plus_level_rare: number; // 5
    goal_reward_item_min_plus_level_epic: number; // 10
    goal_reward_energy_base: number; // 1
    guild_name_length_min: number; // 3
    guild_name_length_max: number; // 25
    guild_creation_cost_game_currency: number; // 500
    init_stat_guild_capacity: number; // 10
    init_stat_character_base_stats_boost: number; // 1
    init_stat_quest_xp_reward_boost: number; // 1
    init_stat_quest_game_currency_reward_boost: number; // 1
    init_guild_honor: number; // 1000
    init_guild_missiles: number; // 15
    guild_chat_init_fetch_count: number; // 30
    max_stat_guild_capacity: number; // 30
    max_stat_character_base_stats_boost: number; // 50
    max_stat_quest_xp_reward_boost: number; // 50
    max_stat_quest_game_currency_reward_boost: number; // 50
    guild_percentage_total_base: number; // 180
    guild_battle_reward_premium_currency_chance: number; // 0
    guild_battle_reward_premium_currency_amount: number; // 50
    guild_battle_preparation_time: number; // 9
    guild_battle_defender_stamina_reduction: number; // 0.5
    guild_battle_reward_item_chance: number; // 0.2
    guild_battle_reward_coin_efficiency: number; // 1800
    guild_battle_missile_max_usage: number; // 5
    guild_battle_missile_damage_factor: number; // 3
    guild_battle_missile_damage_percentage: number; // 0.2
    guild_battle_waiting_time: number; // 1800
    guild_battle_max_guild_results: number; // 300
    guild_battle_min_honor_win: number; // 100
    guild_artifact_slot3_unlock_percentage: number; // 0.3
    guild_artifact_slot4_unlock_percentage: number; // 0.5
    guild_artifact_slot5_unlock_percentage: number; // 1
    guild_artifact_duel_stamina_cost_step: number; // 2
    guild_missile_premium_currency_amount: number; // 30
    guild_rename_premium_currency_amount: number; // 1000
    guild_search_limit: number; // 100
    guild_donation_min_level: number; // 10
    guild_leader_vote_min_active_days: number; // 21
    guild_leader_vote_duration: number; // 24
    guild_auto_joins_premium_currency_amount_package1: number; // 150
    guild_auto_joins_amount_package1: number; // 5
    guild_auto_joins_premium_currency_amount_package2: number; // 375
    guild_auto_joins_amount_package2: number; // 25
    guild_auto_joins_premium_currency_amount_package3: number; // 990
    guild_auto_joins_amount_package3: number; // 100
    guild_join_cooldown: number; // 3600
    video_advertisment_max_views_quest: number; // 1
    video_advertisment_bonus_quest: number; // 0.5
    video_advertisment_max_views_convention_show: number; // 1
    video_advertisment_bonus_convention_show: number; // 0.5
    video_advertisment_max_views_dungeon_cooldown: number; // 1
    video_advertisment_bonus_dungeon_cooldown: number; // 0.5
    video_advertisment_blocked_time: number; // 1800
    sewing_machine_req_level: number; // 25
    sewing_machine_common_game_currency_factor: number; // 1
    sewing_machine_rare_premium_currency_amount: number; // 10
    sewing_machine_epic_premium_currency_amount: number; // 20
    sewing_machine_effect_item_premium_currency_amount: number; // 49
    washing_machine_req_level: number; // 50
    washing_machine_premium_currency_amount: number; // 10
    daily_login_bonus_reward_game_currency_base: number; // 600
    daily_login_bonus_reward_xp_base: number; // 600
    daily_login_bonus_reward_premium_currency_base: number; // 1
    daily_login_bonus_reward_fixed_days: number; // 5
    daily_login_bonus_reward_day1_reward_type1: number; // 1
    daily_login_bonus_reward_day1_reward_type2: number; // 0
    daily_login_bonus_reward_day1_reward_type1_factor: number; // 1
    daily_login_bonus_reward_day1_reward_type2_factor: number; // 0
    daily_login_bonus_reward_day2_reward_type1: number; // 2
    daily_login_bonus_reward_day2_reward_type2: number; // 0
    daily_login_bonus_reward_day2_reward_type1_factor: number; // 1
    daily_login_bonus_reward_day2_reward_type2_factor: number; // 0
    daily_login_bonus_reward_day3_reward_type1: number; // 1
    daily_login_bonus_reward_day3_reward_type2: number; // 2
    daily_login_bonus_reward_day3_reward_type1_factor: number; // 2
    daily_login_bonus_reward_day3_reward_type2_factor: number; // 1
    daily_login_bonus_reward_day4_reward_type1: number; // 2
    daily_login_bonus_reward_day4_reward_type2: number; // 1
    daily_login_bonus_reward_day4_reward_type1_factor: number; // 2
    daily_login_bonus_reward_day4_reward_type2_factor: number; // 1
    daily_login_bonus_reward_day5_reward_type1: number; // 3
    daily_login_bonus_reward_day5_reward_type2: number; // 0
    daily_login_bonus_reward_day5_reward_type1_factor: number; // 30
    daily_login_bonus_reward_day5_reward_type2_factor: number; // 0
    daily_login_bonus_reward_pool_size: number; // 10
    daily_login_bonus_reward_pool1_reward_type1: number; // 2
    daily_login_bonus_reward_pool1_reward_type2: number; // 1
    daily_login_bonus_reward_pool1_reward_type1_factor: number; // 2
    daily_login_bonus_reward_pool1_reward_type2_factor: number; // 2
    daily_login_bonus_reward_pool2_reward_type1: number; // 3
    daily_login_bonus_reward_pool2_reward_type2: number; // 1
    daily_login_bonus_reward_pool2_reward_type1_factor: number; // 10
    daily_login_bonus_reward_pool2_reward_type2_factor: number; // 2
    daily_login_bonus_reward_pool3_reward_type1: number; // 3
    daily_login_bonus_reward_pool3_reward_type2: number; // 2
    daily_login_bonus_reward_pool3_reward_type1_factor: number; // 10
    daily_login_bonus_reward_pool3_reward_type2_factor: number; // 2
    daily_login_bonus_reward_pool4_reward_type1: number; // 3
    daily_login_bonus_reward_pool4_reward_type2: number; // 0
    daily_login_bonus_reward_pool4_reward_type1_factor: number; // 30
    daily_login_bonus_reward_pool4_reward_type2_factor: number; // 0
    daily_login_bonus_reward_pool5_reward_type1: number; // 2
    daily_login_bonus_reward_pool5_reward_type2: number; // 1
    daily_login_bonus_reward_pool5_reward_type1_factor: number; // 2
    daily_login_bonus_reward_pool5_reward_type2_factor: number; // 2
    daily_login_bonus_reward_pool6_reward_type1: number; // 2
    daily_login_bonus_reward_pool6_reward_type2: number; // 1
    daily_login_bonus_reward_pool6_reward_type1_factor: number; // 1
    daily_login_bonus_reward_pool6_reward_type2_factor: number; // 1
    daily_login_bonus_reward_pool7_reward_type1: number; // 2
    daily_login_bonus_reward_pool7_reward_type2: number; // 1
    daily_login_bonus_reward_pool7_reward_type1_factor: number; // 1
    daily_login_bonus_reward_pool7_reward_type2_factor: number; // 1
    daily_login_bonus_reward_pool8_reward_type1: number; // 2
    daily_login_bonus_reward_pool8_reward_type2: number; // 1
    daily_login_bonus_reward_pool8_reward_type1_factor: number; // 2
    daily_login_bonus_reward_pool8_reward_type2_factor: number; // 2
    daily_login_bonus_reward_pool9_reward_type1: number; // 2
    daily_login_bonus_reward_pool9_reward_type2: number; // 1
    daily_login_bonus_reward_pool9_reward_type1_factor: number; // 1
    daily_login_bonus_reward_pool9_reward_type2_factor: number; // 2
    daily_login_bonus_reward_pool10_reward_type1: number; // 2
    daily_login_bonus_reward_pool10_reward_type2: number; // 1
    daily_login_bonus_reward_pool10_reward_type1_factor: number; // 2
    daily_login_bonus_reward_pool10_reward_type2_factor: number; // 2
    avg_stats_min_level: number; // 25
    avg_stats_max_level: number; // 400
    avg_stats_min_level_amount: number; // 36
    avg_stats_max_level_amount: number; // 62.669
    tournament_end_weekday: string; // 'Sunday'
    tournament_end_hour: number; // 21
    friend_invite_reward_level: number; // 30
    friend_invite_reward_premium_currency_amount: number; // 100
    friend_invite_inactive_limit: number; // 3
    friend_invite_reward_energy_amount: number; // 2
    friend_invite_reward_energy_base_amount: number; // 50
    resource_quest_usage_amount: number; // 1
    resource_quest_usage_limit: number; // 4
    resource_quest_reduction: number; // 50
    resource_quest_max_stock: number; // 8
    resource_quest_usage_limit_upgraded: number; // 8
    resource_quest_max_stock_upgraded: number; // 16
    resource_free_slotmachine_spin_usage_amount: number; // 1
    resource_slotmachine_jeton_usage_amount: number; // 10
    bank_upgrade1_premium_amount: number; // 250
    bank_upgrade2_premium_amount: number; // 500
    bank_upgrade3_premium_amount: number; // 500
    bank_upgrade4_premium_amount: number; // 500
    bank_upgrade5_premium_amount: number; // 500
    bank_upgrade6_premium_amount: number; // 500
    bank_upgrade7_premium_amount: number; // 500
    bank_upgrade8_premium_amount: number; // 500
    bank_upgrade9_premium_amount: number; // 500
    bank_upgrade10_premium_amount: number; // 500
    bank_upgrade11_premium_amount: number; // 500
    bank_upgrade12_premium_amount: number; // 500
    bank_upgrade13_premium_amount: number; // 500
    bank_upgrade14_premium_amount: number; // 500
    bank_upgrade15_premium_amount: number; // 500
    bank_upgrade16_premium_amount: number; // 500
    bank_upgrade17_premium_amount: number; // 500
    bank_upgrade18_premium_amount: number; // 500
    bank_upgrade19_premium_amount: number; // 500
    bank_upgrade20_premium_amount: number; // 500
    movie_title_amount_first_word: number; // 10
    movie_title_amount_second_word: number; // 10
    movie_title_amount_third_word: number; // 10
    movie_title_customize_premium_cost: number; // 19
    movie_title_customize_max_length: number; // 50
    movie_title_customize_min_length: number; // 1
    movie_min_level: number; // 8
    movie_title_refresh_premium_cost: number; // 2
    movie_chance_event_setting: number; // 0.6
    init_max_movie_energy: number; // 30
    movie_refresh_offers_cost: number; // 9
    movie_energy_cost: number; // 5
    movie_energy_refill_amount: number; // 15
    movie_energy_refresh_amount_per_minute: number; // 1
    movie_quest_energy_cost_min: number; // 3
    movie_quest_energy_cost_max: number; // 9
    movie_quest_reward_game_currency_time: number; // 300
    movie_quest_reward_xp_time: number; // 300
    movie_quest_reward_progress_scale_attribute_easy: number; // 1.2
    movie_quest_reward_progress_scale_attribute_medium: number; // 1.4
    movie_quest_reward_progress_scale_attribute_hard: number; // 1.6
    movie_quest_reward_coin_scale_attribute_easy: number; // 1.2
    movie_quest_reward_coin_scale_attribute_medium: number; // 1.4
    movie_quest_reward_coin_scale_attribute_hard: number; // 1.6
    movie_quest_reward_xp_scale_attribute_easy: number; // 1.2
    movie_quest_reward_xp_scale_attribute_medium: number; // 1.4
    movie_quest_reward_xp_scale_attribute_hard: number; // 1.6
    movie_quest_reward_progress_scale_fight_easy: number; // 1.1
    movie_quest_reward_progress_scale_fight_medium: number; // 1.2
    movie_quest_reward_progress_scale_fight_hard: number; // 1.3
    movie_quest_reward_coin_scale_fight_easy: number; // 1.1
    movie_quest_reward_coin_scale_fight_medium: number; // 1.2
    movie_quest_reward_coin_scale_fight_hard: number; // 1.3
    movie_quest_reward_xp_scale_fight_easy: number; // 1.1
    movie_quest_reward_xp_scale_fight_medium: number; // 1.2
    movie_quest_reward_xp_scale_fight_hard: number; // 1.3
    movie_quest_reward_progress_scale_instant: number; // 0.9
    movie_quest_reward_coin_scale_instant: number; // 0.5
    movie_quest_reward_xp_scale_instant: number; // 0.5
    movie_quest_reward_lost_xp: number; // 0.5
    movie_quest_reward_lost_coin: number; // 0.5
    movie_quest_reward_lost_progress: number; // 0.5
    movie_quest_pool_size: number; // 3
    movie_star_reward_game_currency_time: number; // 1200
    movie_star_reward_xp_time: number; // 1200
    movie_star_reward_full_reward_time: number; // 6000
    movie_star_reward_base_multiplier: number; // 0.5
    movie_cooldown: number; // 3600
    movie_daily_limit: number; // 3
    movie_skip_cooldown_cost: number; // 19
    movie_skip_cooldown_cost_discount: number; // 5
    movie_extend_time_refill_cost_factor: number; // 9000
    movie_extend_time_premium_amount: number; // 20
    movie_extend_time_discount_1_max_level: number; // 19
    movie_extend_time_discount_2_max_level: number; // 29
    movie_extend_time_discount_3_max_level: number; // 39
    movie_extend_time_premium_amount_discount_1: number; // 0.25
    movie_extend_time_premium_amount_discount_2: number; // 0.5
    movie_extend_time_premium_amount_discount_3: number; // 0.75
    movie_extend_time_amount: number; // 1800
    item_level_range1_start: number; // 2
    item_level_range1_end: number; // 249
    item_level_range2_start: number; // 250
    item_level_range2_end: number; // 299
    item_level_range3_start: number; // 300
    item_level_range3_end: number; // 400
    item_level_range1_steps: number; // 2
    item_level_range2_steps: number; // 4
    item_level_range3_steps: number; // 5
    movie_vote_min_level: number; // 15
    movie_vote_refresh_premium_amount: number; // 5
    movie_vote_reward_rank_1_statpoints: number; // 25
    movie_vote_reward_rank_1_xp: number; // 5000
    movie_vote_reward_rank_1_premium: number; // 100
    movie_vote_reward_rank_2_statpoints: number; // 20
    movie_vote_reward_rank_2_xp: number; // 4000
    movie_vote_reward_rank_2_premium: number; // 75
    movie_vote_reward_rank_3_statpoints: number; // 15
    movie_vote_reward_rank_3_xp: number; // 3000
    movie_vote_reward_rank_3_premium: number; // 50
    movie_vote_reward_rank_10_statpoints: number; // 10
    movie_vote_reward_rank_10_xp: number; // 2000
    movie_vote_reward_rank_10_premium: number; // 25
    movie_vote_reward_rank_100_statpoints: number; // 2
    movie_vote_reward_rank_100_xp: number; // 1000
    movie_vote_reward_rank_100_premium: number; // 5
    movie_vote_reward_rank_250_statpoints: number; // 1
    movie_vote_reward_rank_250_xp: number; // 1000
    movie_vote_reward_rank_250_premium: number; // 1
    movie_vote_reward_rank_500_statpoints: number; // 1
    movie_vote_reward_rank_500_xp: number; // 1000
    movie_vote_reward_rank_500_premium: number; // 0
    movie_vote_voting_reward_1_xp_chance: number; // 0
    movie_vote_voting_reward_1_coin_chance: number; // 0
    movie_vote_voting_reward_1_min_xp_chance: number; // 40
    movie_vote_voting_reward_1_min_coins_chance: number; // 55
    movie_vote_voting_reward_1_premium_chance: number; // 1
    movie_vote_voting_reward_1_stat_chance: number; // 3
    movie_vote_voting_reward_1_epic_item_chance: number; // 1
    movie_vote_voting_reward_epic_item_bonus_level: number; // 9
    movie_vote_chance_time: number; // 20
    movie_vote_chance_fight: number; // 5
    movie_vote_chance_stat: number; // 10
    movie_vote_chance_short: number; // 0
    movie_vote_chance_medium: number; // 5
    movie_vote_chance_long: number; // 10
    movie_tournament_end_weekday: string; // 'Monday'
    movie_vote_reward_rank_1_title: string; // 'title_superstar'
    convention_reward_item_top_pool_size: number; // 10
    convention_reward_epic_item_min_shows: number; // 20
    convention_reward_epic_item_item_bonus: number; // 6
    convention_reward_rare_item_min_shows: number; // 10
    convention_reward_rare_item_item_bonus: number; // 4
    convention_reward_common_item_item_bonus: number; // 1
    convention_reward_coin_duration: number; // 300
    convention_reward_coin_base: number; // 1
    convention_reward_coin_falloff: number; // 0.97
    convention_reward_coin_factor_failed: number; // 0.5
    convention_reward_xp_duration: number; // 420
    convention_reward_xp_falloff: number; // 0.4
    convention_reward_xp_factor_failed: number; // 0.5
    convention_fans_base: number; // 0.94
    convention_fans_multiplier: number; // 0.04
    convention_fans_tolerance: number; // 0.2
    convention_fans_factor_base: number; // 100000
    convention_fans_factor_exp: number; // 5
    convention_fans_minimum: number; // 10
    convention_fans_minimum_percentage: number; // 20
    convention_instant_finish_premium_amount: number; // 15
    convention_min_dau_count: number; // 100
    convention_max_correction_factor: number; // 1.2
    convention_average_shows_per_dau_per_hour: number; // 3
    convention_min_avg_fans_per_convention_show: number; // 10
    convention_show_duration: number; // 300
    convention_perfect_ratio: number; // 1.5
    convention_reward_additional_min_shows: number; // 5
    convention_show_multi_attend_premium_amount: number; // 1
    convention_show_multi_attend_iterations: number; // 3
    payer_promotion_premium_currency_amount: number; // 300
    dungeon_quest_cooldown_win_premium_amount: number; // 0
    dungeon_quest_cooldown_lost_premium_amount: number; // 19
    dungeon_level_unlock_premium_currency_cost: number; // 39
    dungeon_quest_reward_premium_currency_reward: number; // 1
    dungeon_quest_reward_premium_currency_chance: number; // 0.015
    dungeon_quest_reward_max_level_offset: number; // 3
    dungeon_quest_reward_coin_duration: number; // 600
    dungeon_quest_reward_xp_duration: number; // 600
    dungeon_quest_cooldown_win: number; // 0
    dungeon_quest_cooldown_lost: number; // 300
    dungeon_quest_reward_min_item_level_percentage: number; // 0.8
    dungeon_quest_npc_stat_percentage_min: number; // 1
    dungeon_quest_npc_stat_percentage_max: number; // 1.05
    dungeon_quest_npc_recalculate_percentage: number; // 0.8
    dungeon_quest_npc_stat_level_multi_commons: number; // 2
    dungeon_quest_npc_stat_level_multi_rares: number; // 3
    dungeon_quest_npc_stat_level_multi_epics: number; // 4
    dungeon_quest_npc_stat_level_decrease: number; // 22
    dungeon_quest_npc_stat_level_multi_total: number; // 0.5
    dungeon_quest_key_chance_guild_competition: number; // 20
    dungeon_extend_time_amount: number; // 300
    dungeon_extend_time_premium_amount: number; // 99
    dungeon_quest_key_chance: number; // 5
    dungeon_boss_reward_stat_point_reward: number; // 1
    dungeon_min_level: number; // 10
    customize_item_req_level: number; // 25
    customize_item_premium_currency_amount: number; // 19
    customize_item_amount_skills_generated: number; // 3
    dungeon_key_duration: number; // 86400
    story_dungeon_attack_cooldown: number; // 3600
    story_dungeon_attack_premium_currency: number; // 19
    story_dungeon_repeat_chance: number; // 0.015
    item_pattern_reward_energy_base: number; // 1
    item_pattern_reward_stat_points_base: number; // 1
    item_pattern_reward_item_min_plus_level_base: number; // 1
    event_quest_objective_reward_game_currency_time: number; // 600
    event_quest_objective_reward_game_currency_percentage_base: number; // 1
    event_quest_objective_reward_game_currency_exp: number; // 1.9
    event_quest_objective_reward_premium_currency_base: number; // 10
    event_quest_objective_reward_stat_points_base: number; // 10
    event_quest_objective_reward_xp_percentage_base: number; // 0.2
    event_quest_objective_reward_item_min_plus_level_base: number; // 1
    event_quest_objective_reward_item_min_plus_level_rare: number; // 5
    event_quest_objective_reward_item_min_plus_level_epic: number; // 10
    event_quest_objective_instant_finish_amount: number; // 289
    event_quest_min_level: number; // 2
    event_quest_reward_game_currency_time: number; // 3600
    event_quest_reward_xp_time: number; // 3600
    event_quest_reward_unfinished_game_currency_time: number; // 600
    event_quest_reward_unfinished_xp_time: number; // 600
    event_quest_reward_unfinished_item_plus_level: number; // 0
    warforged_unlock_level: number; // 100
    warforged_effect_min_level: number; // 15
    maximum_energy_storage_amount_upgraded: number; // 100
    maximum_energy_storage_amount: number; // 50
    storage_unlock_level: number; // 10
    energy_storage_cost_50: number; // 20
    energy_storage_cost_100: number; // 40
    guild_competition_min_score: number; // 100
    guild_competition_min_rank_reward: number; // 100
    guild_competition_reward_xp: number; // 5000
    guild_competition_reward_stat_points: number; // 25
    guild_competition_reward_guild_premium_curremcy: number; // 300
    new_guild_competition_rewards_start: string; // '2016/12/08 00:00:00'
    new_guild_competition_reward_xp: number; // 6779
    new_guild_competition_reward_stat_points: number; // 24
    new_guild_competition_reward_guild_premium_curremcy: number; // 290
    guild_competition_first_place_item_templates: string; // 'guild_competition_head;guild_competition_chest;guild_competition_belt;guild_competition_legs;guild_competition_boots'
    guild_competition_first_place_item_plus_level: number; // 16
    solo_guild_competition_reward_stat_points_top_3: number; // 10
    solo_guild_competition_reward_stat_points_top_10: number; // 9
    solo_guild_competition_reward_stat_points_top_20: number; // 8
    solo_guild_competition_reward_stat_points_top_30: number; // 7
    solo_guild_competition_reward_stat_points_top_40: number; // 6
    solo_guild_competition_reward_stat_points_top_50: number; // 5
    solo_guild_competition_reward_stat_points_top_100: number; // 4
    solo_guild_competition_reward_stat_points_top_150: number; // 3
    solo_guild_competition_reward_stat_points_top_200: number; // 2
    solo_guild_competition_reward_stat_points_top_300: number; // 1
    solo_guild_competition_unlock: string; // '2018-11-22'
    slotmachine_premium_currency_amount: number; // 9
    slotmachine_max_available_free_spins: number; // 1
    slotmachine_max_available_jetons: number; // 65535
    slotmachine_min_level: number; // 15
    slotmachine_coin_reward_base_time: number; // 180
    slotmachine_xp_reward_base_time: number; // 180
    slotmachine_max_daily_spins: number; // 30
    slotmachine_teaser_min_level: number; // 5
    slotmachine_event_start: string; // '2016-04-15 00:00:00'
    slotmachine_event_end: string; // '2016-04-17 23:59:59'
    dating_attack_cooldown: number; // 3600
    dating_attack_premium_currency: number; // 19
    dating_upgrade_storage_premium_currency: number; // 19
    dating_base_storage: number; // 8
    dating_storage_upgrade: number; // 4
    dating_unlock_level: number; // 2
    dating_repeat_chance: number; // 0.01
    user_voucher_code_prefix: string; // 'UX_'
    reward_user_voucher_duration: number; // 172800
    herobook_min_level: number; // 40
    herobook_teaser_min_level: number; // 31
    herobook_daily_objective_instant_finish_amount: number; // 89
    herobook_weekly_objective_instant_finish_amount: number; // 179
    herobook_objective_reward_game_currency_time: number; // 1200
    herobook_objective_reward_xp_time: number; // 1200
    herobook_daily_objectives: number; // 3
    herobook_weekly_objectives: number; // 2
    herobook_objective_renew_amount: number; // 9
    release_guild_artifact_cost: number; // 399
    release_guild_artifact_cooldown: number; // 604800
    fan_foto_cost: number; // 10
    fan_foto_25_increase: number; // 2
    fan_foto_100_increase: number; // 3
    fan_foto_max_cost: number; // 299
    fan_foto_max_tags: number; // 4
    fan_foto_start_tags: number; // 2
    fan_foto_tag_3_cost: number; // 199
    fan_foto_tag_4_cost: number; // 399
    fan_foto_remove_tag_cost: number; // 49
    fan_foto_remove_all_tags_cost: number; // 89
    fan_foto_resource_cost: number; // 1
    fan_foto_min_resource_per_quest: number; // 1
    fan_foto_max_resource_per_quest_min: number; // 0.5
    guild_booster_cost_game_currency_per_improvement: number; // 30000
    guild_booster_cost_premium_currency: number; // 499
    guild_booster_first_warning: number; // 259200
    guild_booster_second_warning: number; // 86400
    booster_multitasking_unlock_level: number; // 21
    multitasking_rent_premium_amount: number; // 99
    multitasking_rent_time_amount: number; // 604800
    max_simultane_marriages: number; // 10
    marriage_ring_item_template: string; // 'ring_wedding_ring'
    marriage_ring_item_plus_level: number; // 12
    max_outfits: number; // 9
    outfit_unlock_cost: number; // 389
    outfit_min_level: number; // 65
    optical_change_unlock_level: number; // 8
    optical_change_chest_chance_common: number; // 70
    optical_change_chest_chance_rare: number; // 25
    optical_change_chest_chance_epic: number; // 5
    optical_changes_reward_item_min_plus_level_base: number; // 1
    optical_changes_reward_stat_points_base: number; // 1
    optical_changes_reward_energy_base: number; // 1
    optical_change_chest_price_small: number; // 69
    optical_change_chest_amount_small: number; // 1
    optical_change_chest_price_big: number; // 690
    optical_change_chest_amount_big: number; // 10
    optical_change_creation_resource_amount: number; // 200
    optical_change_resource_drop_change: number; // 0.05
    optical_change_resource_1_drop_change: number; // 0.16
    optical_change_resource_2_drop_change: number; // 0.16
    optical_change_resource_3_drop_change: number; // 0.16
    optical_change_resource_4_drop_change: number; // 0.17
    optical_change_resource_5_drop_change: number; // 0.2
    optical_change_resource_10_drop_change: number; // 0.15
    optical_change_chest_item_plus_level: number; // 9
    optical_change_chest_special_item_plus_level_common: number; // 3
    optical_change_chest_special_item_plus_level_rare: number; // 6
    optical_change_chest_special_item_plus_level_epic: number; // 12
    server_system_message_max_count: number; // 3
    private_system_message_max_recent_stream_count: number; // 10
    private_system_message_load_more_stream_count: number; // 10
    private_conversation_max_members: number; // 30
    private_conversation_max_recent_stream_count: number; // 10
    private_conversation_load_more_stream_count: number; // 10
    private_conversation_max_recent_message_count: number; // 10
    private_conversation_load_more_message_count: number; // 10
    movie_vote_chance_user_story: number; // 20
    user_story_unlock_level: number; // 45
    user_story_creation_cost: number; // 9
    user_story_hall_of_fame_limit: number; // 25
    user_story_hall_of_fame_reward: number; // 20
    user_story_hall_of_fame_reward_duration: number; // 63072000
    user_story_end_weekday: string; // 'Monday'
    user_story_min_title_char_count: number; // 5
    user_story_max_title_char_count: number; // 20
    user_story_min_briefing_char_count: number; // 20
    user_story_max_briefing_char_count: number; // 460
    user_story_min_outro_char_count: number; // 20
    user_story_max_outro_char_count: number; // 680
    user_story_end_run_hour: string; // '00'
    streaming_refresh_offers_cost: number; // 9
    streaming_duration_min: number; // 1
    streaming_duration_max: number; // 18
    battle_skills: {
      [id: string]: { // '1'
        identifier: string; // "stun",
        value1: number; // 0.2,
        value2: number; // null,
        value3: number; // null,
        rolled_value: string; // "value1",
        type: number; // 1,
        charges: number; // 1,
        slots: {
          [slot: string]: {
            min: number; // 0.03,
            max: number; // 0.15
          }
        }
      };
    };
    boosters: {
      [name: string]: {
        type: number; // 1,
        amount: number; // 10,
        duration: number; // 172800,
        premium_item: boolean; // false
      };
    };
    character_appearances: {
      [gender in genders]: {
        [property in characterAppearancesNumeric]: number[];
      } & {
        [propertyBoolean in characterAppearancesBoolean]: boolean[];
      };
    };
    convention_rewards: {
      max_pool_percentage: number; // 0.1,
      reward1_type: number; // 1,
      reward1_value: number; // 30,
      reward2_type: number; // 0,
      reward2_value: number; // 0
    }[];
    custom_stages: {
      [name: string]: {
        stage: number; // 100,
        min_level: number; // 15,
        locales: string[]; // ['all']
      };
    };
    dating: {
      [id: string]: { // '1'
        identifier: string; // "Session1_The_Waitress",
        stage: number; // 1,
        min_level: number; // 4,
        steps: {
          [step: string]: { // '1'
            gendered_image: boolean; // false,
            usk16_image: boolean; // true,
            usk16_gendered_image: boolean; // false,
            unlock_points_needed: number; // 1,
            type: number; // 15,
            reference: string; // "session1_1_pictures",
            stat_type: number; // 0,
            stat_value: number; // 0,
            reward_stat_points: number; // 3,
            reward_item_identifier_m: string; // "boots_shiny_r",
            reward_item_identifier_f: string; // "boots_heelsgallant_r",
            reward_item_level_offset: number; // 3,
            skip_price: number; // 9,
            unlock_points_needed_repeat: number; // 60,
            reward_stat_points_repeat: number; // 3,
            reward_item_identifier_m_repeat: string; // "random_epic",
            reward_item_identifier_f_repeat: string; // "random_epic",
            reward_item_level_offset_repeat: number; // 9,
            skip_price_repeat: number; // 99
          };
        };
      };
    };
    dating_items: {
      [name: string]: { // 'session1_1_pictures'
        dating_index: number; // 1,
        step_index: number; // 1,
        reward_type: number; // 1,
        reward_chance: number; // 1,
        reward_reference: string; // "*stage1",
        reward_chance_repeat: number; // 0.2
      };
    };
    defined_character_appearances: {
      [gender in genders]: {
        [appearance in definedCharacterAppearances]: number[];
      };
    };
    dungeon_quest_templates: {
      [name: string]: { // burning_bernie_1_fight1
        level: number; // 1,
        type: number; // 1,
        stat: number; // 0,
        stat_difficulty: number; // 0,
        npc_identifier_m: string; // "double_m",
        npc_identifier_f: string; // "double_f",
        npc_items_commons: number; // 9,
        npc_items_rares: number; // 0,
        npc_items_epics: number; // 0,
        difficulty_multiplier: number; // 0.84,
        reward_multiplier: number; // 0.6,
        reward_item_identifier: string; // "random_common",
        reward_item_level_offset: number; // 0,
        is_boss: boolean; // false,
        index: number; // 0
      };
    };
    dungeon_templates: {
      [name: string]: { // burning_bernie
        duration: number;
        unlock_premium_amount: number;
        levels: {
          [level: string]: { // '1'
            min_fans: number;
            unlock_npc_identifier: string;
            reward_item_identifier: string;
            reward_item_level_offset: number;
          };
        };
      };
    };
    emoticons: {
      [name: string]: {
        codes: string[];
      };
    };
    event_items: {
      [name: string]: {
        event_quests: string;
        reward_type: number;
        reward_chance: number;
        reward_reference: string;
      };
    };
    event_quests: {
      [name: string]: {
        start_date: string; // "2012-01-01",
        end_date: string; // "2012-01-02",
        reward1_type: number; // 3,
        reward1_factor: number; // 10,
        reward1_flag: string; // "",
        reward2_type: number; // 2,
        reward2_factor: number; // 5,
        reward2_flag: string; // "",
        reward_item1: string; // "rio_2016_olympics_head",
        reward_item2: string; // "rio_2016_olympics_chest",
        reward_item3: string; // "random_epic",
        reward_item1_level_plus: number; // 12,
        reward_item2_level_plus: number; // 12,
        reward_item3_level_plus: number; // 12,
        reward_title: string; // "title_rio_2016_olympics_2",
        objectives: {
          [name: string]: {
            index: number; // 1,
            type: number; // 15,
            reference: string; // "",
            value: number; // 5,
            reward_type: number; // 4,
            reward_factor: number; // 0.4,
            reward_reference: string; // ""
          };
        };
      };
    };
    goals: {
      [name: string]: {
        index: number; // 21,
        active: boolean; // true,
        goal_type: number; // 1,
        mechanic_type: number; // 1,
        lookup_column: string; // "level_reached",
        category: number; // 1,
        story_goal_category: number; // 2,
        required_goal: string; // "",
        required_level: number; // 0,
        statistics: boolean; // false,
        hidden: boolean; // false,
        display_as_time: boolean; // false,
        values: {
          [value: string]: {
            story_goal: boolean; // true,
            reward_type: number; // 1,
            reward_factor: number; // 1,
            reward_identifier: string; // "",
            reward_title: string; // null,
            estimated_level: number; // 3,
            text: string; // "text1"
          };
        };
      };
    };
    guild_arena_backgrounds: {
      [id: string]: { // '1'
        index: number; // 1,
        asset_identifier: string; // "default",
        game_currency_cost: number; // 0,
        premium_currency_cost: number; // 0
      };
    };
    guild_artifacts: {
      [id: string]: { // '1'
        asset_identifier: string; // "kneeling_metal",
        type: number; // 1,
        value: number; // 20,
        attribute_reduction: number; // 0.07
      };
    };
    guild_background_layers: {
      type: string; // "room",
      value: number; // 0,
      asset_identifier: string; // "room1",
      is_default: boolean; // true,
      cost_premium_currency: number; // 0,
      game_currency_cost: number; // 100000
    }[];
    guild_battle_attack_cost: {
      [id: string]: {
        game_currency_cost: number;
      };
    };
    guild_boosters: {
      [name: string]: {
        type: number; // 1,
        amount: number; // 10,
        duration: number; // 604800,
        premium_item: boolean; // true
      };
    };
    guild_competitions: {
      [name: string]: {
        objectives: {
          objective_identifier: string; // "collectMoviePoints",
          type: number; // 1,
          reference: string; // "",
          multiplier: number; // 1
        }[];
      };
    };
    guild_competition_items: {
      [name: string]: {
        guild_competition: string; // "default_guild_competition_collect_item_1",
        reward_type: number; // 1,
        reward_chance: number; // 0.15,
        reward_reference: string; // ""
      };
    };
    guild_emblem_backgrounds: {
      [id: string]: {
        index: number; // 1,
        asset_identifier: string; // "square",
        game_currency_cost: number; // 0,
        premium_currency_cost: number; // 0
      };
    };
    guild_emblem_colors: string[];
    guild_emblem_icons: {
      [id: string]: {
        index: number; // 1,
        asset_identifier: string; // "circle",
        game_currency_cost: number; // 0,
        premium_currency_cost: number; // 0
      };
    };
    guild_stat_character_base_stats_boost_costs: {
      [id: string]: {
        game_currency_cost: number; // 0,
        premium_currency_cost: number; // 0
      };
    };
    guild_stat_guild_capacity_costs: {
      [id: string]: {
        game_currency_cost: number; // 0,
        premium_currency_cost: number; // 0
      };
    };
    guild_stat_quest_game_currency_reward_boost_costs: {
      [id: string]: {
        game_currency_cost: number; // 0,
        premium_currency_cost: number; // 0
      };
    };
    guild_stat_quest_xp_reward_boost_costs: {
      [id: string]: {
        game_currency_cost: number; // 0,
        premium_currency_cost: number; // 0
      };
    };
    herobook_daily_rewards: {
      type: number; // 2,
      chance: number; // 2500,
      scaling: number; // 1,
      amount: number; // 0,
      reward_factor: number; // 2,
      item_bonus_level: number; // 0
    }[];
    herobook_items: {
      [name: string]: {
        reward_type: number; // 1,
        reward_chance: number; // 0.2,
        reward_reference: string; // ""
      };
    };
    herobook_objectives: {
      [name: string]: {
        min_level: number; // 1,
        scaling: number; // 1,
        daily: number; // 10,
        weekly: number; // 50,
        variance: number; // 25,
        type: number; // 16,
        reference: string; // "",
        character_identifier_m: string; // "statquest_won_1",
        character_identifier_f: string; // "statquest_won_1"
      };
    };
    herobook_objective_types: {
      [id: string]: {
        chance: number;
      };
    };
    herobook_weekly_rewards: {
      type: number; // 2,
      chance: number; // 1943,
      scaling: number; // 1,
      amount: number; // 0,
      reward_factor: number; // 3,
      item_bonus_level: number; // 0
    }[];
    hints: {
      [name: string]: {
        required_level: number; // 2,
        max_level: number; // 0
      };
    };
    item_effects: {
      [name: string]: {
        back_animation: boolean; // false,
        spine: string; // "item_sparkle"
      };
    };
    item_levels: {
      [id: string]: { // '1'
        xp: number;
      };
    };
    item_pattern: {
      [name: string]: {
        active: boolean; // true,
        lookup_column: string; // "camouflage",
        ts_availability_start: string; // "",
        ts_availability_end: string; // "",
        values: {
          [id: string]: {
            reward_type: number; // 1,
            reward_factor: number; // 8,
            reward_identifier: string; // "",
            reward_title: string; // "title_itempattern_camouflage"
          };
        };
        sources: {
          [name: string]: string[];
        };
      };
    };
    item_rewards: {
      [name: string]: {
        chance: number; // 5,
        identifiers: string; // "belt_duel_set_1"
      }[];
    };
    item_set_templates: [];
    item_templates: {
      [name: string]: {
        type: number; // 3,
        gender: string; // "b",
        quality: number; // 1,
        required_level: number; // 1,
        display_options: number; // 0,
        sew_price: number; // 0,
        item_set_identifier: null,
        item_pattern: string; // "disco",
        is_event: boolean; // false,
        effect_chance: number; // 0,
        effects: string; // null,
        asset_bundle_id: number; // 1
      };
    };
    levels: {
      [id: string]: {
        xp: number;
      };
    };
    message: {
      [name: string]: {
        device_notification: boolean;
        html: boolean;
      };
    };
    movie_cover_settings: {
      [name: string]: number[];
    };
    movie_durations: {
      duration: number; // 1800,
      chance: number; // 18,
      energy: number; // 500,
      required_level: number; // 0
    }[];
    movie_quest_templates: {
      [name: string]: {
        type: number; // 1,
        stat: number; // 0,
        settings: null | string[];
        npc_identifier_m: string; // null,
        npc_identifier_f: string; // null
      };
    };
    movie_ratings: {
      stars: number; // 1,
      needed_progress: number; // 10,
      reward_factor: number; // 0.1,
      fans_factor: number; // 0.33,
      special_factor: number; // 0.1
    }[];
    movie_settings: {
      [name: string]: {
        stat: number;
        required_guild_level: number;
        special_factor: number;
        reward_factor: number;
        layers: string[];
        ts_availability_start: string;
        ts_availability_end: string;
      };
    };
    movie_special_rewards: {
      type: number;
      chance: number;
      needed_stars: number;
      item: string;
      factor: number;
      setting: string;
    }[];
    optical_changes: {
      [id: string]: {
        identifier: string; // "window_beach",
        type: number; // 1,
        rarity: number; // 3,
        default: boolean; // false,
        effect: string; // null,
        ts_availability_start: string; // "",
        ts_availability_end: string; // "",
        event: string; // ""
      };
    };
    optical_change_categories: {
      [id: string]: {
        category: number; // 1,
        values: {
          [value: string]: { // '5'
            reward_type: number; // 1,
            reward_factor: number; // 10,
            reward_identifier: string; // ""
          };
        };
      };
    };
    optical_change_effects: {
      [effect: string]: { // "snow_right"
        back_animation: boolean,
        spine: string; // "oc_snow_anim"
      };
    };
    profanity: {
      [word: string]: {
        warn_only: boolean;
      };
    };
    quest_templates: {
      [name: string]: { // quest_stage1_time1_f
        stat: number; // 0,
        effect: string; // null,
        visible_on_map: boolean; // false,
        unlock_after_story_dungeon_index: number; // 0
      };
    };
    slotmachine: {
      [id: string]: { // 'var001'
        chance: number; // 0,
        symbol1: number; // 1,
        symbol2: number; // 1,
        symbol3: number; // 1,
        reward_type: number; // 1,
        reward_factor: number; // 10,
        quality: number; // 3,
        reward_identifier: string; // "",
        reward_identifier_18: string; // "",
        min_level: number; // 0,
        max_level: number; // 0
      };
    };
    story_dungeons: {
      [id: string]: {
        identifier: string; // "storydungeon1",
        stage: number; // 1,
        min_level: number; // 25,
        unlock_points_needed: number; // 20,
        unlock_point_chance: number; // 40,
        unlock_quests: string; // "",
        unlock_quest_chance: number; // 0,
        npc_identifier_m: string; // "npc_sd1_carlo",
        npc_identifier_f: string; // "npc_sd1_carlo",
        npc_level: number; // 35,
        npc_stat_stamina: number; // 385,
        npc_stat_strength: number; // 343,
        npc_stat_critical_rating: number; // 471,
        npc_stat_dodge_rating: number; // 514,
        npc_stat_weapon_damage: number; // 175,
        npc_battle_effects: number; // "17",
        reward_item_identifier_m: string; // "head_milkman_m",
        reward_item_identifier_f: string; // "head_milkman_f",
        reward_item_level_offset: number; // 15,
        stat_point_reward: number; // 10,
        skip_price: number; // 199,
        min_level_repeat: number; // 51,
        unlock_points_needed_repeat: number; // 50,
        unlock_point_chance_repeat: number; // 33,
        unlock_quest_chance_repeat: number; // 0,
        reward_item_level_offset_repeat: number; // 9,
        stat_point_reward_repeat: number; // 5,
        skip_price_repeat: number; // 99
      };
    };
    streaming_actors: {
      [id: string]: {
        identifier: string; // "sarah",
        animations: {
          [id: string]: {
            sort_index: number; // 1,
            relative_chance: number; // 1,
            unlock_type: number; // 1,
            unlock_value: number; // 1,
            premium_unlock_value: number; // null,
            reward_type: number; // 1,
            reward_multiplier: number; // 1,
            reward_identifier: string; // "",
            item_bonus_level: number; // 0
          };
        };
      };
    };
    streaming_room_unlocks: {
      [num: string]: {
        streaming_resource: number; // 0,
        premium_currency: number; // 0,
      };
    };
    streaming_settings: {
      [num: string]: {
        identifier: string; // "farm",
        relative_chance: number; // 6,
        unlock_type: number; // 1,
        unlock_value: number; // 1,
        duration_multiplier: number; // 1,
        reward_multiplier: number; // 1,
        warforge_source: number; // 10
      };
    };
    titles: {
      [name: string]: {
        index: number;
        source: number;
        price_factor: number;
        price_premium: number;
      };
    };
    tournament_rewards: [],
    warforged_infos: {
      [num: string]: { // '1' -> '15'
        maximum: number; // 64
        plus0: number; // 48
        plus5: number; // 60
        plus10: number; // 63
        plus15: number; // 64
        plus20: number; // 64
      };
    };
  };
  extendedConfig: ConfigEnvironmentResponseDto;
  leaderboard_server_selection_data: { [locale in locales]: { server_ids: string[] } };
}
