package com.playata.application.data.constants
{
   import com.playata.framework.data.constants.Constants;
   
   public class CConstant
   {
       
      
      public function CConstant()
      {
         super();
      }
      
      public static function get tolerance_small() : Number
      {
         return Constants.current.getNumber("tolerance_small");
      }
      
      public static function get tolerance_medium() : Number
      {
         return Constants.current.getNumber("tolerance_medium");
      }
      
      public static function get tolerance_large() : Number
      {
         return Constants.current.getNumber("tolerance_large");
      }
      
      public static function get time_per_level_base() : int
      {
         return Constants.current.getInt("time_per_level_base");
      }
      
      public static function get time_per_level_scale() : Number
      {
         return Constants.current.getNumber("time_per_level_scale");
      }
      
      public static function get time_per_level_level_scale() : Number
      {
         return Constants.current.getNumber("time_per_level_level_scale");
      }
      
      public static function get time_per_level_level_exp() : Number
      {
         return Constants.current.getNumber("time_per_level_level_exp");
      }
      
      public static function get xp_per_time() : Number
      {
         return Constants.current.getNumber("xp_per_time");
      }
      
      public static function get coins_per_time_base() : Number
      {
         return Constants.current.getNumber("coins_per_time_base");
      }
      
      public static function get coins_per_time_scale() : Number
      {
         return Constants.current.getNumber("coins_per_time_scale");
      }
      
      public static function get coins_per_time_level_scale() : Number
      {
         return Constants.current.getNumber("coins_per_time_level_scale");
      }
      
      public static function get coins_per_time_level_exp() : Number
      {
         return Constants.current.getNumber("coins_per_time_level_exp");
      }
      
      public static function get time_per_premium_currency() : int
      {
         return Constants.current.getInt("time_per_premium_currency");
      }
      
      public static function get battle_hp_scale() : Number
      {
         return Constants.current.getNumber("battle_hp_scale");
      }
      
      public static function get battle_damage_tolerance() : Number
      {
         return Constants.current.getNumber("battle_damage_tolerance");
      }
      
      public static function get battle_critical_probability_min() : Number
      {
         return Constants.current.getNumber("battle_critical_probability_min");
      }
      
      public static function get battle_critical_probability_base() : Number
      {
         return Constants.current.getNumber("battle_critical_probability_base");
      }
      
      public static function get battle_critical_probability_max() : Number
      {
         return Constants.current.getNumber("battle_critical_probability_max");
      }
      
      public static function get battle_critical_probability_exp_low() : Number
      {
         return Constants.current.getNumber("battle_critical_probability_exp_low");
      }
      
      public static function get battle_critical_probability_exp_high() : Number
      {
         return Constants.current.getNumber("battle_critical_probability_exp_high");
      }
      
      public static function get battle_critical_factor() : Number
      {
         return Constants.current.getNumber("battle_critical_factor");
      }
      
      public static function get battle_dodge_probability_min() : Number
      {
         return Constants.current.getNumber("battle_dodge_probability_min");
      }
      
      public static function get battle_dodge_probability_base() : Number
      {
         return Constants.current.getNumber("battle_dodge_probability_base");
      }
      
      public static function get battle_dodge_probability_max() : Number
      {
         return Constants.current.getNumber("battle_dodge_probability_max");
      }
      
      public static function get battle_dodge_probability_exp_low() : Number
      {
         return Constants.current.getNumber("battle_dodge_probability_exp_low");
      }
      
      public static function get battle_dodge_probability_exp_high() : Number
      {
         return Constants.current.getNumber("battle_dodge_probability_exp_high");
      }
      
      public static function get battle_dodge_probability_max_ratio() : Number
      {
         return Constants.current.getNumber("battle_dodge_probability_max_ratio");
      }
      
      public static function get battle_max_rounds() : int
      {
         return Constants.current.getInt("battle_max_rounds");
      }
      
      public static function get duel_opponent_list_max_results() : int
      {
         return Constants.current.getInt("duel_opponent_list_max_results");
      }
      
      public static function get duel_opponent_list_level_tolerance() : Number
      {
         return Constants.current.getNumber("duel_opponent_list_level_tolerance");
      }
      
      public static function get duel_opponent_list_stats_tolerance_min() : Number
      {
         return Constants.current.getNumber("duel_opponent_list_stats_tolerance_min");
      }
      
      public static function get duel_opponent_list_stats_tolerance_max() : Number
      {
         return Constants.current.getNumber("duel_opponent_list_stats_tolerance_max");
      }
      
      public static function get duel_reward_premium_currency_chance() : Number
      {
         return Constants.current.getNumber("duel_reward_premium_currency_chance");
      }
      
      public static function get duel_reward_premium_currency_chance_hard() : Number
      {
         return Constants.current.getNumber("duel_reward_premium_currency_chance_hard");
      }
      
      public static function get duel_reward_premium_currency_reward1() : int
      {
         return Constants.current.getInt("duel_reward_premium_currency_reward1");
      }
      
      public static function get duel_reward_premium_currency_reward1_chance() : Number
      {
         return Constants.current.getNumber("duel_reward_premium_currency_reward1_chance");
      }
      
      public static function get duel_reward_premium_currency_reward2() : int
      {
         return Constants.current.getInt("duel_reward_premium_currency_reward2");
      }
      
      public static function get duel_reward_premium_currency_reward2_chance() : Number
      {
         return Constants.current.getNumber("duel_reward_premium_currency_reward2_chance");
      }
      
      public static function get duel_reward_premium_currency_reward3() : int
      {
         return Constants.current.getInt("duel_reward_premium_currency_reward3");
      }
      
      public static function get duel_reward_premium_currency_reward3_chance() : Number
      {
         return Constants.current.getNumber("duel_reward_premium_currency_reward3_chance");
      }
      
      public static function get duel_reward_premium_currency_reward4() : int
      {
         return Constants.current.getInt("duel_reward_premium_currency_reward4");
      }
      
      public static function get duel_reward_premium_currency_reward4_chance() : Number
      {
         return Constants.current.getNumber("duel_reward_premium_currency_reward4_chance");
      }
      
      public static function get duel_reward_item_drop_chance() : Number
      {
         return Constants.current.getNumber("duel_reward_item_drop_chance");
      }
      
      public static function get duel_reward_item_drop_chance_hard() : Number
      {
         return Constants.current.getNumber("duel_reward_item_drop_chance_hard");
      }
      
      public static function get duel_attack_limit() : int
      {
         return Constants.current.getInt("duel_attack_limit");
      }
      
      public static function get duel_stamina_cost() : int
      {
         return Constants.current.getInt("duel_stamina_cost");
      }
      
      public static function get duel_stamina_reset_premium_amount() : int
      {
         return Constants.current.getInt("duel_stamina_reset_premium_amount");
      }
      
      public static function get duel_stamina_refresh_amount_per_minute_first_duel() : Number
      {
         return Constants.current.getNumber("duel_stamina_refresh_amount_per_minute_first_duel");
      }
      
      public static function get duel_stamina_refresh_amount_per_minute() : Number
      {
         return Constants.current.getNumber("duel_stamina_refresh_amount_per_minute");
      }
      
      public static function get duel_single_attack_premium_amount() : int
      {
         return Constants.current.getInt("duel_single_attack_premium_amount");
      }
      
      public static function get duel_max_missed_duels() : int
      {
         return Constants.current.getInt("duel_max_missed_duels");
      }
      
      public static function get duel_enemies_refresh_premium_amount() : int
      {
         return Constants.current.getInt("duel_enemies_refresh_premium_amount");
      }
      
      public static function get quest_max_stage() : int
      {
         return Constants.current.getInt("quest_max_stage");
      }
      
      public static function get quest_level_full_duration() : int
      {
         return Constants.current.getInt("quest_level_full_duration");
      }
      
      public static function get quest_max_refill_amount_per_day() : int
      {
         return Constants.current.getInt("quest_max_refill_amount_per_day");
      }
      
      public static function get quest_duration_short() : int
      {
         return Constants.current.getInt("quest_duration_short");
      }
      
      public static function get quest_duration_medium() : int
      {
         return Constants.current.getInt("quest_duration_medium");
      }
      
      public static function get quest_duration_long() : int
      {
         return Constants.current.getInt("quest_duration_long");
      }
      
      public static function get quest_duration_tolerance() : Number
      {
         return Constants.current.getNumber("quest_duration_tolerance");
      }
      
      public static function get quest_instant_finish_range1_premium_amount() : int
      {
         return Constants.current.getInt("quest_instant_finish_range1_premium_amount");
      }
      
      public static function get quest_instant_finish_range2_premium_amount() : int
      {
         return Constants.current.getInt("quest_instant_finish_range2_premium_amount");
      }
      
      public static function get quest_instant_finish_range3_premium_amount() : int
      {
         return Constants.current.getInt("quest_instant_finish_range3_premium_amount");
      }
      
      public static function get quest_instant_finish_range4_premium_amount() : int
      {
         return Constants.current.getInt("quest_instant_finish_range4_premium_amount");
      }
      
      public static function get quest_instant_finish_range1_duration() : Number
      {
         return Constants.current.getNumber("quest_instant_finish_range1_duration");
      }
      
      public static function get quest_instant_finish_range2_duration() : Number
      {
         return Constants.current.getNumber("quest_instant_finish_range2_duration");
      }
      
      public static function get quest_instant_finish_range3_duration() : Number
      {
         return Constants.current.getNumber("quest_instant_finish_range3_duration");
      }
      
      public static function get quest_reward_balanced_end_level() : int
      {
         return Constants.current.getInt("quest_reward_balanced_end_level");
      }
      
      public static function get quest_reward_probability_xp_heavy() : Number
      {
         return Constants.current.getNumber("quest_reward_probability_xp_heavy");
      }
      
      public static function get quest_reward_probability_coin_heavy() : Number
      {
         return Constants.current.getNumber("quest_reward_probability_coin_heavy");
      }
      
      public static function get quest_reward_probability_item() : Number
      {
         return Constants.current.getNumber("quest_reward_probability_item");
      }
      
      public static function get quest_reward_xp_adjust_end_level() : int
      {
         return Constants.current.getInt("quest_reward_xp_adjust_end_level");
      }
      
      public static function get quest_reward_xp_adjust_start_percentage() : Number
      {
         return Constants.current.getNumber("quest_reward_xp_adjust_start_percentage");
      }
      
      public static function get quest_reward_xp_scale_balanced() : Number
      {
         return Constants.current.getNumber("quest_reward_xp_scale_balanced");
      }
      
      public static function get quest_reward_xp_scale_xp_heavy() : Number
      {
         return Constants.current.getNumber("quest_reward_xp_scale_xp_heavy");
      }
      
      public static function get quest_reward_xp_scale_coin_heavy() : Number
      {
         return Constants.current.getNumber("quest_reward_xp_scale_coin_heavy");
      }
      
      public static function get quest_reward_xp_scale_item() : Number
      {
         return Constants.current.getNumber("quest_reward_xp_scale_item");
      }
      
      public static function get quest_reward_coin_scale_balanced() : Number
      {
         return Constants.current.getNumber("quest_reward_coin_scale_balanced");
      }
      
      public static function get quest_reward_coin_scale_xp_heavy() : Number
      {
         return Constants.current.getNumber("quest_reward_coin_scale_xp_heavy");
      }
      
      public static function get quest_reward_coin_scale_coin_heavy() : Number
      {
         return Constants.current.getNumber("quest_reward_coin_scale_coin_heavy");
      }
      
      public static function get quest_reward_coin_scale_item() : Number
      {
         return Constants.current.getNumber("quest_reward_coin_scale_item");
      }
      
      public static function get quest_reward_premium_currency_chance_short() : Number
      {
         return Constants.current.getNumber("quest_reward_premium_currency_chance_short");
      }
      
      public static function get quest_reward_premium_currency_chance_medium() : Number
      {
         return Constants.current.getNumber("quest_reward_premium_currency_chance_medium");
      }
      
      public static function get quest_reward_premium_currency_chance_long() : Number
      {
         return Constants.current.getNumber("quest_reward_premium_currency_chance_long");
      }
      
      public static function get quest_reward_premium_currency_reward1() : int
      {
         return Constants.current.getInt("quest_reward_premium_currency_reward1");
      }
      
      public static function get quest_reward_premium_currency_reward1_chance() : Number
      {
         return Constants.current.getNumber("quest_reward_premium_currency_reward1_chance");
      }
      
      public static function get quest_reward_premium_currency_reward2() : int
      {
         return Constants.current.getInt("quest_reward_premium_currency_reward2");
      }
      
      public static function get quest_reward_premium_currency_reward2_chance() : Number
      {
         return Constants.current.getNumber("quest_reward_premium_currency_reward2_chance");
      }
      
      public static function get quest_reward_premium_currency_reward3() : int
      {
         return Constants.current.getInt("quest_reward_premium_currency_reward3");
      }
      
      public static function get quest_reward_premium_currency_reward3_chance() : Number
      {
         return Constants.current.getNumber("quest_reward_premium_currency_reward3_chance");
      }
      
      public static function get quest_reward_premium_currency_reward4() : int
      {
         return Constants.current.getInt("quest_reward_premium_currency_reward4");
      }
      
      public static function get quest_reward_premium_currency_reward4_chance() : Number
      {
         return Constants.current.getNumber("quest_reward_premium_currency_reward4_chance");
      }
      
      public static function get quest_energy_refill_premium_amount() : int
      {
         return Constants.current.getInt("quest_energy_refill_premium_amount");
      }
      
      public static function get quest_energy_refill_premium_amount_increase_adult() : int
      {
         return Constants.current.getInt("quest_energy_refill_premium_amount_increase_adult");
      }
      
      public static function get quest_energy_refill_amount() : int
      {
         return Constants.current.getInt("quest_energy_refill_amount");
      }
      
      public static function get quest_energy_refill1_cost_factor() : int
      {
         return Constants.current.getInt("quest_energy_refill1_cost_factor");
      }
      
      public static function get quest_energy_refill2_cost_factor() : int
      {
         return Constants.current.getInt("quest_energy_refill2_cost_factor");
      }
      
      public static function get quest_energy_refill3_cost_factor() : int
      {
         return Constants.current.getInt("quest_energy_refill3_cost_factor");
      }
      
      public static function get quest_energy_refill4_cost_factor() : int
      {
         return Constants.current.getInt("quest_energy_refill4_cost_factor");
      }
      
      public static function get quest_energy_refill_premium_amount_discount_1() : Number
      {
         return Constants.current.getNumber("quest_energy_refill_premium_amount_discount_1");
      }
      
      public static function get quest_energy_refill_premium_amount_discount_2() : Number
      {
         return Constants.current.getNumber("quest_energy_refill_premium_amount_discount_2");
      }
      
      public static function get quest_energy_refill_premium_amount_discount_3() : Number
      {
         return Constants.current.getNumber("quest_energy_refill_premium_amount_discount_3");
      }
      
      public static function get quest_energy_refill_discount_1_max_level() : int
      {
         return Constants.current.getInt("quest_energy_refill_discount_1_max_level");
      }
      
      public static function get quest_energy_refill_discount_2_max_level() : int
      {
         return Constants.current.getInt("quest_energy_refill_discount_2_max_level");
      }
      
      public static function get quest_energy_refill_discount_3_max_level() : int
      {
         return Constants.current.getInt("quest_energy_refill_discount_3_max_level");
      }
      
      public static function get quest_refresh_single_stage_premium_currency_amount() : int
      {
         return Constants.current.getInt("quest_refresh_single_stage_premium_currency_amount");
      }
      
      public static function get quest_refresh_all_stages_reduction_factor() : Number
      {
         return Constants.current.getNumber("quest_refresh_all_stages_reduction_factor");
      }
      
      public static function get quest_reward_slotmachine_jetons_chance() : Number
      {
         return Constants.current.getNumber("quest_reward_slotmachine_jetons_chance");
      }
      
      public static function get quest_reward_slotmachine_jetons_amount() : String
      {
         return Constants.current.getString("quest_reward_slotmachine_jetons_amount");
      }
      
      public static function get duel_reward_slotmachine_jetons_chance() : Number
      {
         return Constants.current.getNumber("duel_reward_slotmachine_jetons_chance");
      }
      
      public static function get duel_reward_slotmachine_jetons_amount() : String
      {
         return Constants.current.getString("duel_reward_slotmachine_jetons_amount");
      }
      
      public static function get fight_quest_npc_stat_percentage_min_easy() : Number
      {
         return Constants.current.getNumber("fight_quest_npc_stat_percentage_min_easy");
      }
      
      public static function get fight_quest_npc_stat_percentage_max_easy() : Number
      {
         return Constants.current.getNumber("fight_quest_npc_stat_percentage_max_easy");
      }
      
      public static function get fight_quest_npc_stat_percentage_min_medium() : Number
      {
         return Constants.current.getNumber("fight_quest_npc_stat_percentage_min_medium");
      }
      
      public static function get fight_quest_npc_stat_percentage_max_medium() : Number
      {
         return Constants.current.getNumber("fight_quest_npc_stat_percentage_max_medium");
      }
      
      public static function get fight_quest_npc_stat_percentage_min_hard() : Number
      {
         return Constants.current.getNumber("fight_quest_npc_stat_percentage_min_hard");
      }
      
      public static function get fight_quest_npc_stat_percentage_max_hard() : Number
      {
         return Constants.current.getNumber("fight_quest_npc_stat_percentage_max_hard");
      }
      
      public static function get fight_quest_reward_coin_scale_easy() : Number
      {
         return Constants.current.getNumber("fight_quest_reward_coin_scale_easy");
      }
      
      public static function get fight_quest_reward_coin_scale_medium() : Number
      {
         return Constants.current.getNumber("fight_quest_reward_coin_scale_medium");
      }
      
      public static function get fight_quest_reward_coin_scale_hard() : Number
      {
         return Constants.current.getNumber("fight_quest_reward_coin_scale_hard");
      }
      
      public static function get fight_quest_reward_xp_scale_easy() : Number
      {
         return Constants.current.getNumber("fight_quest_reward_xp_scale_easy");
      }
      
      public static function get fight_quest_reward_xp_scale_medium() : Number
      {
         return Constants.current.getNumber("fight_quest_reward_xp_scale_medium");
      }
      
      public static function get fight_quest_reward_xp_scale_hard() : Number
      {
         return Constants.current.getNumber("fight_quest_reward_xp_scale_hard");
      }
      
      public static function get fight_quest_reward_lost_xp() : Number
      {
         return Constants.current.getNumber("fight_quest_reward_lost_xp");
      }
      
      public static function get fight_quest_reward_lost_coin() : Number
      {
         return Constants.current.getNumber("fight_quest_reward_lost_coin");
      }
      
      public static function get quest_stat_base_easy() : Number
      {
         return Constants.current.getNumber("quest_stat_base_easy");
      }
      
      public static function get quest_stat_base_medium() : Number
      {
         return Constants.current.getNumber("quest_stat_base_medium");
      }
      
      public static function get quest_stat_base_hard() : Number
      {
         return Constants.current.getNumber("quest_stat_base_hard");
      }
      
      public static function get quest_stat_factor_increase() : Number
      {
         return Constants.current.getNumber("quest_stat_factor_increase");
      }
      
      public static function get quest_stat_multiplier_1() : Number
      {
         return Constants.current.getNumber("quest_stat_multiplier_1");
      }
      
      public static function get quest_stat_multiplier_2() : Number
      {
         return Constants.current.getNumber("quest_stat_multiplier_2");
      }
      
      public static function get stat_quest_reward_lost_xp() : Number
      {
         return Constants.current.getNumber("stat_quest_reward_lost_xp");
      }
      
      public static function get stat_quest_reward_lost_coin() : Number
      {
         return Constants.current.getNumber("stat_quest_reward_lost_coin");
      }
      
      public static function get item_buy_price_premium_common() : int
      {
         return Constants.current.getInt("item_buy_price_premium_common");
      }
      
      public static function get item_buy_price_premium_rare() : int
      {
         return Constants.current.getInt("item_buy_price_premium_rare");
      }
      
      public static function get item_buy_price_premium_epic() : int
      {
         return Constants.current.getInt("item_buy_price_premium_epic");
      }
      
      public static function get item_buy_price_base() : int
      {
         return Constants.current.getInt("item_buy_price_base");
      }
      
      public static function get item_buy_price_adjust_end_level() : int
      {
         return Constants.current.getInt("item_buy_price_adjust_end_level");
      }
      
      public static function get item_buy_price_adjust_start_percentage() : Number
      {
         return Constants.current.getNumber("item_buy_price_adjust_start_percentage");
      }
      
      public static function get item_buy_price_scale_common() : Number
      {
         return Constants.current.getNumber("item_buy_price_scale_common");
      }
      
      public static function get item_buy_price_scale_rare() : Number
      {
         return Constants.current.getNumber("item_buy_price_scale_rare");
      }
      
      public static function get item_buy_price_scale_epic() : Number
      {
         return Constants.current.getNumber("item_buy_price_scale_epic");
      }
      
      public static function get item_sell_price_percentage() : Number
      {
         return Constants.current.getNumber("item_sell_price_percentage");
      }
      
      public static function get item_sell_price_premium_factor() : Number
      {
         return Constants.current.getNumber("item_sell_price_premium_factor");
      }
      
      public static function get item_quality_chance_rare() : Number
      {
         return Constants.current.getNumber("item_quality_chance_rare");
      }
      
      public static function get item_quality_chance_epic() : Number
      {
         return Constants.current.getNumber("item_quality_chance_epic");
      }
      
      public static function get item_stats_per_level() : int
      {
         return Constants.current.getInt("item_stats_per_level");
      }
      
      public static function get item_level_diff_common_min() : int
      {
         return Constants.current.getInt("item_level_diff_common_min");
      }
      
      public static function get item_level_diff_common_max() : int
      {
         return Constants.current.getInt("item_level_diff_common_max");
      }
      
      public static function get item_level_diff_rare_min() : int
      {
         return Constants.current.getInt("item_level_diff_rare_min");
      }
      
      public static function get item_level_diff_rare_max() : int
      {
         return Constants.current.getInt("item_level_diff_rare_max");
      }
      
      public static function get item_level_diff_epic_min() : int
      {
         return Constants.current.getInt("item_level_diff_epic_min");
      }
      
      public static function get item_level_diff_epic_max() : int
      {
         return Constants.current.getInt("item_level_diff_epic_max");
      }
      
      public static function get item_level_character_level_min_percentage() : Number
      {
         return Constants.current.getNumber("item_level_character_level_min_percentage");
      }
      
      public static function get item_level_plus_premium_min() : int
      {
         return Constants.current.getInt("item_level_plus_premium_min");
      }
      
      public static function get item_level_plus_premium_max() : int
      {
         return Constants.current.getInt("item_level_plus_premium_max");
      }
      
      public static function get item_stat_boost_min_common() : int
      {
         return Constants.current.getInt("item_stat_boost_min_common");
      }
      
      public static function get item_stat_boost_min_rare() : int
      {
         return Constants.current.getInt("item_stat_boost_min_rare");
      }
      
      public static function get item_stat_boost_min_epic() : int
      {
         return Constants.current.getInt("item_stat_boost_min_epic");
      }
      
      public static function get item_stat_boost_min_percentage() : Number
      {
         return Constants.current.getNumber("item_stat_boost_min_percentage");
      }
      
      public static function get item_weapon_damage_factor() : Number
      {
         return Constants.current.getNumber("item_weapon_damage_factor");
      }
      
      public static function get item_missile_damage_factor() : Number
      {
         return Constants.current.getNumber("item_missile_damage_factor");
      }
      
      public static function get item_missile_min_required_level() : int
      {
         return Constants.current.getInt("item_missile_min_required_level");
      }
      
      public static function get item_premium_chance_percentage_common() : Number
      {
         return Constants.current.getNumber("item_premium_chance_percentage_common");
      }
      
      public static function get item_premium_chance_percentage_rare() : Number
      {
         return Constants.current.getNumber("item_premium_chance_percentage_rare");
      }
      
      public static function get item_premium_chance_percentage_epic() : Number
      {
         return Constants.current.getNumber("item_premium_chance_percentage_epic");
      }
      
      public static function get shop_refresh_waiting_time_premium_amount() : int
      {
         return Constants.current.getInt("shop_refresh_waiting_time_premium_amount");
      }
      
      public static function get shop_max_premium_items() : int
      {
         return Constants.current.getInt("shop_max_premium_items");
      }
      
      public static function get shop_max_rare_items() : int
      {
         return Constants.current.getInt("shop_max_rare_items");
      }
      
      public static function get shop_max_epic_items() : int
      {
         return Constants.current.getInt("shop_max_epic_items");
      }
      
      public static function get item_shop_min_level() : int
      {
         return Constants.current.getInt("item_shop_min_level");
      }
      
      public static function get work_effectiveness_max() : Number
      {
         return Constants.current.getNumber("work_effectiveness_max");
      }
      
      public static function get work_effectiveness_min() : Number
      {
         return Constants.current.getNumber("work_effectiveness_min");
      }
      
      public static function get work_duration_min() : int
      {
         return Constants.current.getInt("work_duration_min");
      }
      
      public static function get work_duration_max() : int
      {
         return Constants.current.getInt("work_duration_max");
      }
      
      public static function get work_step_duration() : int
      {
         return Constants.current.getInt("work_step_duration");
      }
      
      public static function get work_effectiveness() : Number
      {
         return Constants.current.getNumber("work_effectiveness");
      }
      
      public static function get work_duration_base() : int
      {
         return Constants.current.getInt("work_duration_base");
      }
      
      public static function get leaderboard_max_result() : int
      {
         return Constants.current.getInt("leaderboard_max_result");
      }
      
      public static function get leaderboard_cache() : int
      {
         return Constants.current.getInt("leaderboard_cache");
      }
      
      public static function get leaderboard_global_refresh_minutes() : int
      {
         return Constants.current.getInt("leaderboard_global_refresh_minutes");
      }
      
      public static function get pvp_honor_win_exp_better() : int
      {
         return Constants.current.getInt("pvp_honor_win_exp_better");
      }
      
      public static function get pvp_honor_win_exp_worse() : int
      {
         return Constants.current.getInt("pvp_honor_win_exp_worse");
      }
      
      public static function get pvp_honor_lose_amount() : Number
      {
         return Constants.current.getNumber("pvp_honor_lose_amount");
      }
      
      public static function get pvp_honor_lose_max() : Number
      {
         return Constants.current.getNumber("pvp_honor_lose_max");
      }
      
      public static function get pvp_waiting_time() : int
      {
         return Constants.current.getInt("pvp_waiting_time");
      }
      
      public static function get pvp_effectiveness_lost() : Number
      {
         return Constants.current.getNumber("pvp_effectiveness_lost");
      }
      
      public static function get pvp_effectiveness_won() : Number
      {
         return Constants.current.getNumber("pvp_effectiveness_won");
      }
      
      public static function get max_level() : int
      {
         return Constants.current.getInt("max_level");
      }
      
      public static function get level_up_stat_points() : int
      {
         return Constants.current.getInt("level_up_stat_points");
      }
      
      public static function get stage_level_up_premium_amount() : int
      {
         return Constants.current.getInt("stage_level_up_premium_amount");
      }
      
      public static function get booster_small_costs_time() : int
      {
         return Constants.current.getInt("booster_small_costs_time");
      }
      
      public static function get booster_medium_costs_time() : int
      {
         return Constants.current.getInt("booster_medium_costs_time");
      }
      
      public static function get booster_large_costs_premium_currency() : int
      {
         return Constants.current.getInt("booster_large_costs_premium_currency");
      }
      
      public static function get booster_costs_coins_step() : int
      {
         return Constants.current.getInt("booster_costs_coins_step");
      }
      
      public static function get booster_sense_costs_premium_currency_amount() : int
      {
         return Constants.current.getInt("booster_sense_costs_premium_currency_amount");
      }
      
      public static function get booster_sense_duration() : int
      {
         return Constants.current.getInt("booster_sense_duration");
      }
      
      public static function get character_name_length_min() : int
      {
         return Constants.current.getInt("character_name_length_min");
      }
      
      public static function get character_name_length_max() : int
      {
         return Constants.current.getInt("character_name_length_max");
      }
      
      public static function get brawn_min() : int
      {
         return Constants.current.getInt("brawn_min");
      }
      
      public static function get brain_min() : int
      {
         return Constants.current.getInt("brain_min");
      }
      
      public static function get awareness_min() : int
      {
         return Constants.current.getInt("awareness_min");
      }
      
      public static function get toughness_min() : int
      {
         return Constants.current.getInt("toughness_min");
      }
      
      public static function get brawn_trained_min() : int
      {
         return Constants.current.getInt("brawn_trained_min");
      }
      
      public static function get brain_trained_min() : int
      {
         return Constants.current.getInt("brain_trained_min");
      }
      
      public static function get awareness_trained_min() : int
      {
         return Constants.current.getInt("awareness_trained_min");
      }
      
      public static function get toughness_trained_min() : int
      {
         return Constants.current.getInt("toughness_trained_min");
      }
      
      public static function get cost_stat_base() : int
      {
         return Constants.current.getInt("cost_stat_base");
      }
      
      public static function get cost_stat_scale() : Number
      {
         return Constants.current.getNumber("cost_stat_scale");
      }
      
      public static function get cost_stat_base_scale() : Number
      {
         return Constants.current.getNumber("cost_stat_base_scale");
      }
      
      public static function get cost_stat_base_exp() : Number
      {
         return Constants.current.getNumber("cost_stat_base_exp");
      }
      
      public static function get init_game_currency() : int
      {
         return Constants.current.getInt("init_game_currency");
      }
      
      public static function get init_premium_currency() : int
      {
         return Constants.current.getInt("init_premium_currency");
      }
      
      public static function get init_honor() : int
      {
         return Constants.current.getInt("init_honor");
      }
      
      public static function get init_base_stat_value() : int
      {
         return Constants.current.getInt("init_base_stat_value");
      }
      
      public static function get stat_fast_skill_value() : int
      {
         return Constants.current.getInt("stat_fast_skill_value");
      }
      
      public static function get init_quest_energy() : int
      {
         return Constants.current.getInt("init_quest_energy");
      }
      
      public static function get init_quest_energy_friend_invite_platform() : int
      {
         return Constants.current.getInt("init_quest_energy_friend_invite_platform");
      }
      
      public static function get init_max_quest_energy() : int
      {
         return Constants.current.getInt("init_max_quest_energy");
      }
      
      public static function get init_duel_stamina() : int
      {
         return Constants.current.getInt("init_duel_stamina");
      }
      
      public static function get init_max_duel_stamina() : int
      {
         return Constants.current.getInt("init_max_duel_stamina");
      }
      
      public static function get init_max_free_shop_refreshes() : int
      {
         return Constants.current.getInt("init_max_free_shop_refreshes");
      }
      
      public static function get tutorial_finished_premium_currency() : int
      {
         return Constants.current.getInt("tutorial_finished_premium_currency");
      }
      
      public static function get account_reactivated_premium_currency() : int
      {
         return Constants.current.getInt("account_reactivated_premium_currency");
      }
      
      public static function get account_marketing_opt_in_premium_currency() : int
      {
         return Constants.current.getInt("account_marketing_opt_in_premium_currency");
      }
      
      public static function get inventory_bag2_unlock_level() : int
      {
         return Constants.current.getInt("inventory_bag2_unlock_level");
      }
      
      public static function get inventory_bag3_unlock_level() : int
      {
         return Constants.current.getInt("inventory_bag3_unlock_level");
      }
      
      public static function get botdetection_usage_min_count() : int
      {
         return Constants.current.getInt("botdetection_usage_min_count");
      }
      
      public static function get botdetection_skip_percentage() : Number
      {
         return Constants.current.getNumber("botdetection_skip_percentage");
      }
      
      public static function get botdetection_tempban_duration() : int
      {
         return Constants.current.getInt("botdetection_tempban_duration");
      }
      
      public static function get character_show_head_item_min_level() : int
      {
         return Constants.current.getInt("character_show_head_item_min_level");
      }
      
      public static function get unlock_hide_chest_premium_amount() : int
      {
         return Constants.current.getInt("unlock_hide_chest_premium_amount");
      }
      
      public static function get unlock_hide_belt_premium_amount() : int
      {
         return Constants.current.getInt("unlock_hide_belt_premium_amount");
      }
      
      public static function get unlock_hide_legs_premium_amount() : int
      {
         return Constants.current.getInt("unlock_hide_legs_premium_amount");
      }
      
      public static function get unlock_hide_boots_premium_amount() : int
      {
         return Constants.current.getInt("unlock_hide_boots_premium_amount");
      }
      
      public static function get message_min_level() : int
      {
         return Constants.current.getInt("message_min_level");
      }
      
      public static function get message_load_value() : int
      {
         return Constants.current.getInt("message_load_value");
      }
      
      public static function get goal_reward_game_currency_time() : int
      {
         return Constants.current.getInt("goal_reward_game_currency_time");
      }
      
      public static function get goal_reward_game_currency_percentage_base() : Number
      {
         return Constants.current.getNumber("goal_reward_game_currency_percentage_base");
      }
      
      public static function get goal_reward_game_currency_exp() : Number
      {
         return Constants.current.getNumber("goal_reward_game_currency_exp");
      }
      
      public static function get goal_reward_premium_currency_base() : int
      {
         return Constants.current.getInt("goal_reward_premium_currency_base");
      }
      
      public static function get goal_reward_stat_points_base() : int
      {
         return Constants.current.getInt("goal_reward_stat_points_base");
      }
      
      public static function get goal_reward_xp_percentage_base() : Number
      {
         return Constants.current.getNumber("goal_reward_xp_percentage_base");
      }
      
      public static function get goal_reward_item_min_plus_level_base() : int
      {
         return Constants.current.getInt("goal_reward_item_min_plus_level_base");
      }
      
      public static function get goal_reward_item_min_plus_level_rare() : int
      {
         return Constants.current.getInt("goal_reward_item_min_plus_level_rare");
      }
      
      public static function get goal_reward_item_min_plus_level_epic() : int
      {
         return Constants.current.getInt("goal_reward_item_min_plus_level_epic");
      }
      
      public static function get goal_reward_energy_base() : int
      {
         return Constants.current.getInt("goal_reward_energy_base");
      }
      
      public static function get guild_name_length_min() : int
      {
         return Constants.current.getInt("guild_name_length_min");
      }
      
      public static function get guild_name_length_max() : int
      {
         return Constants.current.getInt("guild_name_length_max");
      }
      
      public static function get guild_creation_cost_game_currency() : int
      {
         return Constants.current.getInt("guild_creation_cost_game_currency");
      }
      
      public static function get init_stat_guild_capacity() : int
      {
         return Constants.current.getInt("init_stat_guild_capacity");
      }
      
      public static function get init_stat_character_base_stats_boost() : int
      {
         return Constants.current.getInt("init_stat_character_base_stats_boost");
      }
      
      public static function get init_stat_quest_xp_reward_boost() : int
      {
         return Constants.current.getInt("init_stat_quest_xp_reward_boost");
      }
      
      public static function get init_stat_quest_game_currency_reward_boost() : int
      {
         return Constants.current.getInt("init_stat_quest_game_currency_reward_boost");
      }
      
      public static function get init_guild_honor() : int
      {
         return Constants.current.getInt("init_guild_honor");
      }
      
      public static function get init_guild_missiles() : int
      {
         return Constants.current.getInt("init_guild_missiles");
      }
      
      public static function get guild_chat_init_fetch_count() : int
      {
         return Constants.current.getInt("guild_chat_init_fetch_count");
      }
      
      public static function get max_stat_guild_capacity() : int
      {
         return Constants.current.getInt("max_stat_guild_capacity");
      }
      
      public static function get max_stat_character_base_stats_boost() : int
      {
         return Constants.current.getInt("max_stat_character_base_stats_boost");
      }
      
      public static function get max_stat_quest_xp_reward_boost() : int
      {
         return Constants.current.getInt("max_stat_quest_xp_reward_boost");
      }
      
      public static function get max_stat_quest_game_currency_reward_boost() : int
      {
         return Constants.current.getInt("max_stat_quest_game_currency_reward_boost");
      }
      
      public static function get guild_percentage_total_base() : int
      {
         return Constants.current.getInt("guild_percentage_total_base");
      }
      
      public static function get guild_battle_reward_premium_currency_chance() : Number
      {
         return Constants.current.getNumber("guild_battle_reward_premium_currency_chance");
      }
      
      public static function get guild_battle_reward_premium_currency_amount() : int
      {
         return Constants.current.getInt("guild_battle_reward_premium_currency_amount");
      }
      
      public static function get guild_battle_preparation_time() : int
      {
         return Constants.current.getInt("guild_battle_preparation_time");
      }
      
      public static function get guild_battle_defender_stamina_reduction() : Number
      {
         return Constants.current.getNumber("guild_battle_defender_stamina_reduction");
      }
      
      public static function get guild_battle_reward_item_chance() : Number
      {
         return Constants.current.getNumber("guild_battle_reward_item_chance");
      }
      
      public static function get guild_battle_reward_coin_efficiency() : int
      {
         return Constants.current.getInt("guild_battle_reward_coin_efficiency");
      }
      
      public static function get guild_battle_missile_max_usage() : int
      {
         return Constants.current.getInt("guild_battle_missile_max_usage");
      }
      
      public static function get guild_battle_missile_damage_factor() : Number
      {
         return Constants.current.getNumber("guild_battle_missile_damage_factor");
      }
      
      public static function get guild_battle_missile_damage_percentage() : Number
      {
         return Constants.current.getNumber("guild_battle_missile_damage_percentage");
      }
      
      public static function get guild_battle_waiting_time() : int
      {
         return Constants.current.getInt("guild_battle_waiting_time");
      }
      
      public static function get guild_battle_max_guild_results() : int
      {
         return Constants.current.getInt("guild_battle_max_guild_results");
      }
      
      public static function get guild_battle_min_honor_win() : int
      {
         return Constants.current.getInt("guild_battle_min_honor_win");
      }
      
      public static function get guild_artifact_slot3_unlock_percentage() : Number
      {
         return Constants.current.getNumber("guild_artifact_slot3_unlock_percentage");
      }
      
      public static function get guild_artifact_slot4_unlock_percentage() : Number
      {
         return Constants.current.getNumber("guild_artifact_slot4_unlock_percentage");
      }
      
      public static function get guild_artifact_slot5_unlock_percentage() : Number
      {
         return Constants.current.getNumber("guild_artifact_slot5_unlock_percentage");
      }
      
      public static function get guild_artifact_duel_stamina_cost_step() : int
      {
         return Constants.current.getInt("guild_artifact_duel_stamina_cost_step");
      }
      
      public static function get guild_missile_premium_currency_amount() : int
      {
         return Constants.current.getInt("guild_missile_premium_currency_amount");
      }
      
      public static function get guild_rename_premium_currency_amount() : int
      {
         return Constants.current.getInt("guild_rename_premium_currency_amount");
      }
      
      public static function get guild_search_limit() : int
      {
         return Constants.current.getInt("guild_search_limit");
      }
      
      public static function get guild_donation_min_level() : int
      {
         return Constants.current.getInt("guild_donation_min_level");
      }
      
      public static function get guild_leader_vote_min_active_days() : int
      {
         return Constants.current.getInt("guild_leader_vote_min_active_days");
      }
      
      public static function get guild_leader_vote_duration() : int
      {
         return Constants.current.getInt("guild_leader_vote_duration");
      }
      
      public static function get guild_auto_joins_premium_currency_amount_package1() : int
      {
         return Constants.current.getInt("guild_auto_joins_premium_currency_amount_package1");
      }
      
      public static function get guild_auto_joins_amount_package1() : int
      {
         return Constants.current.getInt("guild_auto_joins_amount_package1");
      }
      
      public static function get guild_auto_joins_premium_currency_amount_package2() : int
      {
         return Constants.current.getInt("guild_auto_joins_premium_currency_amount_package2");
      }
      
      public static function get guild_auto_joins_amount_package2() : int
      {
         return Constants.current.getInt("guild_auto_joins_amount_package2");
      }
      
      public static function get guild_auto_joins_premium_currency_amount_package3() : int
      {
         return Constants.current.getInt("guild_auto_joins_premium_currency_amount_package3");
      }
      
      public static function get guild_auto_joins_amount_package3() : int
      {
         return Constants.current.getInt("guild_auto_joins_amount_package3");
      }
      
      public static function get guild_join_cooldown() : int
      {
         return Constants.current.getInt("guild_join_cooldown");
      }
      
      public static function get video_advertisment_max_views_quest() : int
      {
         return Constants.current.getInt("video_advertisment_max_views_quest");
      }
      
      public static function get video_advertisment_bonus_quest() : Number
      {
         return Constants.current.getNumber("video_advertisment_bonus_quest");
      }
      
      public static function get video_advertisment_max_views_convention_show() : int
      {
         return Constants.current.getInt("video_advertisment_max_views_convention_show");
      }
      
      public static function get video_advertisment_bonus_convention_show() : Number
      {
         return Constants.current.getNumber("video_advertisment_bonus_convention_show");
      }
      
      public static function get video_advertisment_max_views_dungeon_cooldown() : int
      {
         return Constants.current.getInt("video_advertisment_max_views_dungeon_cooldown");
      }
      
      public static function get video_advertisment_bonus_dungeon_cooldown() : Number
      {
         return Constants.current.getNumber("video_advertisment_bonus_dungeon_cooldown");
      }
      
      public static function get video_advertisment_blocked_time() : int
      {
         return Constants.current.getInt("video_advertisment_blocked_time");
      }
      
      public static function get sewing_machine_req_level() : int
      {
         return Constants.current.getInt("sewing_machine_req_level");
      }
      
      public static function get sewing_machine_common_game_currency_factor() : Number
      {
         return Constants.current.getNumber("sewing_machine_common_game_currency_factor");
      }
      
      public static function get sewing_machine_rare_premium_currency_amount() : int
      {
         return Constants.current.getInt("sewing_machine_rare_premium_currency_amount");
      }
      
      public static function get sewing_machine_epic_premium_currency_amount() : int
      {
         return Constants.current.getInt("sewing_machine_epic_premium_currency_amount");
      }
      
      public static function get sewing_machine_effect_item_premium_currency_amount() : int
      {
         return Constants.current.getInt("sewing_machine_effect_item_premium_currency_amount");
      }
      
      public static function get washing_machine_req_level() : int
      {
         return Constants.current.getInt("washing_machine_req_level");
      }
      
      public static function get washing_machine_premium_currency_amount() : int
      {
         return Constants.current.getInt("washing_machine_premium_currency_amount");
      }
      
      public static function get daily_login_bonus_reward_game_currency_base() : int
      {
         return Constants.current.getInt("daily_login_bonus_reward_game_currency_base");
      }
      
      public static function get daily_login_bonus_reward_xp_base() : int
      {
         return Constants.current.getInt("daily_login_bonus_reward_xp_base");
      }
      
      public static function get daily_login_bonus_reward_premium_currency_base() : int
      {
         return Constants.current.getInt("daily_login_bonus_reward_premium_currency_base");
      }
      
      public static function get daily_login_bonus_reward_fixed_days() : int
      {
         return Constants.current.getInt("daily_login_bonus_reward_fixed_days");
      }
      
      public static function get daily_login_bonus_reward_day1_reward_type1() : int
      {
         return Constants.current.getInt("daily_login_bonus_reward_day1_reward_type1");
      }
      
      public static function get daily_login_bonus_reward_day1_reward_type2() : int
      {
         return Constants.current.getInt("daily_login_bonus_reward_day1_reward_type2");
      }
      
      public static function get daily_login_bonus_reward_day1_reward_type1_factor() : Number
      {
         return Constants.current.getNumber("daily_login_bonus_reward_day1_reward_type1_factor");
      }
      
      public static function get daily_login_bonus_reward_day1_reward_type2_factor() : Number
      {
         return Constants.current.getNumber("daily_login_bonus_reward_day1_reward_type2_factor");
      }
      
      public static function get daily_login_bonus_reward_day2_reward_type1() : int
      {
         return Constants.current.getInt("daily_login_bonus_reward_day2_reward_type1");
      }
      
      public static function get daily_login_bonus_reward_day2_reward_type2() : int
      {
         return Constants.current.getInt("daily_login_bonus_reward_day2_reward_type2");
      }
      
      public static function get daily_login_bonus_reward_day2_reward_type1_factor() : Number
      {
         return Constants.current.getNumber("daily_login_bonus_reward_day2_reward_type1_factor");
      }
      
      public static function get daily_login_bonus_reward_day2_reward_type2_factor() : Number
      {
         return Constants.current.getNumber("daily_login_bonus_reward_day2_reward_type2_factor");
      }
      
      public static function get daily_login_bonus_reward_day3_reward_type1() : int
      {
         return Constants.current.getInt("daily_login_bonus_reward_day3_reward_type1");
      }
      
      public static function get daily_login_bonus_reward_day3_reward_type2() : int
      {
         return Constants.current.getInt("daily_login_bonus_reward_day3_reward_type2");
      }
      
      public static function get daily_login_bonus_reward_day3_reward_type1_factor() : Number
      {
         return Constants.current.getNumber("daily_login_bonus_reward_day3_reward_type1_factor");
      }
      
      public static function get daily_login_bonus_reward_day3_reward_type2_factor() : Number
      {
         return Constants.current.getNumber("daily_login_bonus_reward_day3_reward_type2_factor");
      }
      
      public static function get daily_login_bonus_reward_day4_reward_type1() : int
      {
         return Constants.current.getInt("daily_login_bonus_reward_day4_reward_type1");
      }
      
      public static function get daily_login_bonus_reward_day4_reward_type2() : int
      {
         return Constants.current.getInt("daily_login_bonus_reward_day4_reward_type2");
      }
      
      public static function get daily_login_bonus_reward_day4_reward_type1_factor() : Number
      {
         return Constants.current.getNumber("daily_login_bonus_reward_day4_reward_type1_factor");
      }
      
      public static function get daily_login_bonus_reward_day4_reward_type2_factor() : Number
      {
         return Constants.current.getNumber("daily_login_bonus_reward_day4_reward_type2_factor");
      }
      
      public static function get daily_login_bonus_reward_day5_reward_type1() : int
      {
         return Constants.current.getInt("daily_login_bonus_reward_day5_reward_type1");
      }
      
      public static function get daily_login_bonus_reward_day5_reward_type2() : int
      {
         return Constants.current.getInt("daily_login_bonus_reward_day5_reward_type2");
      }
      
      public static function get daily_login_bonus_reward_day5_reward_type1_factor() : Number
      {
         return Constants.current.getNumber("daily_login_bonus_reward_day5_reward_type1_factor");
      }
      
      public static function get daily_login_bonus_reward_day5_reward_type2_factor() : Number
      {
         return Constants.current.getNumber("daily_login_bonus_reward_day5_reward_type2_factor");
      }
      
      public static function get daily_login_bonus_reward_pool_size() : int
      {
         return Constants.current.getInt("daily_login_bonus_reward_pool_size");
      }
      
      public static function get daily_login_bonus_reward_pool1_reward_type1() : int
      {
         return Constants.current.getInt("daily_login_bonus_reward_pool1_reward_type1");
      }
      
      public static function get daily_login_bonus_reward_pool1_reward_type2() : int
      {
         return Constants.current.getInt("daily_login_bonus_reward_pool1_reward_type2");
      }
      
      public static function get daily_login_bonus_reward_pool1_reward_type1_factor() : Number
      {
         return Constants.current.getNumber("daily_login_bonus_reward_pool1_reward_type1_factor");
      }
      
      public static function get daily_login_bonus_reward_pool1_reward_type2_factor() : Number
      {
         return Constants.current.getNumber("daily_login_bonus_reward_pool1_reward_type2_factor");
      }
      
      public static function get daily_login_bonus_reward_pool2_reward_type1() : int
      {
         return Constants.current.getInt("daily_login_bonus_reward_pool2_reward_type1");
      }
      
      public static function get daily_login_bonus_reward_pool2_reward_type2() : int
      {
         return Constants.current.getInt("daily_login_bonus_reward_pool2_reward_type2");
      }
      
      public static function get daily_login_bonus_reward_pool2_reward_type1_factor() : Number
      {
         return Constants.current.getNumber("daily_login_bonus_reward_pool2_reward_type1_factor");
      }
      
      public static function get daily_login_bonus_reward_pool2_reward_type2_factor() : Number
      {
         return Constants.current.getNumber("daily_login_bonus_reward_pool2_reward_type2_factor");
      }
      
      public static function get daily_login_bonus_reward_pool3_reward_type1() : int
      {
         return Constants.current.getInt("daily_login_bonus_reward_pool3_reward_type1");
      }
      
      public static function get daily_login_bonus_reward_pool3_reward_type2() : int
      {
         return Constants.current.getInt("daily_login_bonus_reward_pool3_reward_type2");
      }
      
      public static function get daily_login_bonus_reward_pool3_reward_type1_factor() : Number
      {
         return Constants.current.getNumber("daily_login_bonus_reward_pool3_reward_type1_factor");
      }
      
      public static function get daily_login_bonus_reward_pool3_reward_type2_factor() : Number
      {
         return Constants.current.getNumber("daily_login_bonus_reward_pool3_reward_type2_factor");
      }
      
      public static function get daily_login_bonus_reward_pool4_reward_type1() : int
      {
         return Constants.current.getInt("daily_login_bonus_reward_pool4_reward_type1");
      }
      
      public static function get daily_login_bonus_reward_pool4_reward_type2() : int
      {
         return Constants.current.getInt("daily_login_bonus_reward_pool4_reward_type2");
      }
      
      public static function get daily_login_bonus_reward_pool4_reward_type1_factor() : Number
      {
         return Constants.current.getNumber("daily_login_bonus_reward_pool4_reward_type1_factor");
      }
      
      public static function get daily_login_bonus_reward_pool4_reward_type2_factor() : Number
      {
         return Constants.current.getNumber("daily_login_bonus_reward_pool4_reward_type2_factor");
      }
      
      public static function get daily_login_bonus_reward_pool5_reward_type1() : int
      {
         return Constants.current.getInt("daily_login_bonus_reward_pool5_reward_type1");
      }
      
      public static function get daily_login_bonus_reward_pool5_reward_type2() : int
      {
         return Constants.current.getInt("daily_login_bonus_reward_pool5_reward_type2");
      }
      
      public static function get daily_login_bonus_reward_pool5_reward_type1_factor() : Number
      {
         return Constants.current.getNumber("daily_login_bonus_reward_pool5_reward_type1_factor");
      }
      
      public static function get daily_login_bonus_reward_pool5_reward_type2_factor() : Number
      {
         return Constants.current.getNumber("daily_login_bonus_reward_pool5_reward_type2_factor");
      }
      
      public static function get daily_login_bonus_reward_pool6_reward_type1() : int
      {
         return Constants.current.getInt("daily_login_bonus_reward_pool6_reward_type1");
      }
      
      public static function get daily_login_bonus_reward_pool6_reward_type2() : int
      {
         return Constants.current.getInt("daily_login_bonus_reward_pool6_reward_type2");
      }
      
      public static function get daily_login_bonus_reward_pool6_reward_type1_factor() : Number
      {
         return Constants.current.getNumber("daily_login_bonus_reward_pool6_reward_type1_factor");
      }
      
      public static function get daily_login_bonus_reward_pool6_reward_type2_factor() : Number
      {
         return Constants.current.getNumber("daily_login_bonus_reward_pool6_reward_type2_factor");
      }
      
      public static function get daily_login_bonus_reward_pool7_reward_type1() : int
      {
         return Constants.current.getInt("daily_login_bonus_reward_pool7_reward_type1");
      }
      
      public static function get daily_login_bonus_reward_pool7_reward_type2() : int
      {
         return Constants.current.getInt("daily_login_bonus_reward_pool7_reward_type2");
      }
      
      public static function get daily_login_bonus_reward_pool7_reward_type1_factor() : Number
      {
         return Constants.current.getNumber("daily_login_bonus_reward_pool7_reward_type1_factor");
      }
      
      public static function get daily_login_bonus_reward_pool7_reward_type2_factor() : Number
      {
         return Constants.current.getNumber("daily_login_bonus_reward_pool7_reward_type2_factor");
      }
      
      public static function get daily_login_bonus_reward_pool8_reward_type1() : int
      {
         return Constants.current.getInt("daily_login_bonus_reward_pool8_reward_type1");
      }
      
      public static function get daily_login_bonus_reward_pool8_reward_type2() : int
      {
         return Constants.current.getInt("daily_login_bonus_reward_pool8_reward_type2");
      }
      
      public static function get daily_login_bonus_reward_pool8_reward_type1_factor() : Number
      {
         return Constants.current.getNumber("daily_login_bonus_reward_pool8_reward_type1_factor");
      }
      
      public static function get daily_login_bonus_reward_pool8_reward_type2_factor() : Number
      {
         return Constants.current.getNumber("daily_login_bonus_reward_pool8_reward_type2_factor");
      }
      
      public static function get daily_login_bonus_reward_pool9_reward_type1() : int
      {
         return Constants.current.getInt("daily_login_bonus_reward_pool9_reward_type1");
      }
      
      public static function get daily_login_bonus_reward_pool9_reward_type2() : int
      {
         return Constants.current.getInt("daily_login_bonus_reward_pool9_reward_type2");
      }
      
      public static function get daily_login_bonus_reward_pool9_reward_type1_factor() : Number
      {
         return Constants.current.getNumber("daily_login_bonus_reward_pool9_reward_type1_factor");
      }
      
      public static function get daily_login_bonus_reward_pool9_reward_type2_factor() : Number
      {
         return Constants.current.getNumber("daily_login_bonus_reward_pool9_reward_type2_factor");
      }
      
      public static function get daily_login_bonus_reward_pool10_reward_type1() : int
      {
         return Constants.current.getInt("daily_login_bonus_reward_pool10_reward_type1");
      }
      
      public static function get daily_login_bonus_reward_pool10_reward_type2() : int
      {
         return Constants.current.getInt("daily_login_bonus_reward_pool10_reward_type2");
      }
      
      public static function get daily_login_bonus_reward_pool10_reward_type1_factor() : Number
      {
         return Constants.current.getNumber("daily_login_bonus_reward_pool10_reward_type1_factor");
      }
      
      public static function get daily_login_bonus_reward_pool10_reward_type2_factor() : Number
      {
         return Constants.current.getNumber("daily_login_bonus_reward_pool10_reward_type2_factor");
      }
      
      public static function get avg_stats_min_level() : int
      {
         return Constants.current.getInt("avg_stats_min_level");
      }
      
      public static function get avg_stats_max_level() : int
      {
         return Constants.current.getInt("avg_stats_max_level");
      }
      
      public static function get avg_stats_min_level_amount() : Number
      {
         return Constants.current.getNumber("avg_stats_min_level_amount");
      }
      
      public static function get avg_stats_max_level_amount() : Number
      {
         return Constants.current.getNumber("avg_stats_max_level_amount");
      }
      
      public static function get tournament_end_weekday() : String
      {
         return Constants.current.getString("tournament_end_weekday");
      }
      
      public static function get tournament_end_hour() : int
      {
         return Constants.current.getInt("tournament_end_hour");
      }
      
      public static function get friend_invite_reward_level() : int
      {
         return Constants.current.getInt("friend_invite_reward_level");
      }
      
      public static function get friend_invite_reward_premium_currency_amount() : int
      {
         return Constants.current.getInt("friend_invite_reward_premium_currency_amount");
      }
      
      public static function get friend_invite_inactive_limit() : int
      {
         return Constants.current.getInt("friend_invite_inactive_limit");
      }
      
      public static function get friend_invite_reward_energy_amount() : int
      {
         return Constants.current.getInt("friend_invite_reward_energy_amount");
      }
      
      public static function get friend_invite_reward_energy_base_amount() : int
      {
         return Constants.current.getInt("friend_invite_reward_energy_base_amount");
      }
      
      public static function get resource_quest_usage_amount() : int
      {
         return Constants.current.getInt("resource_quest_usage_amount");
      }
      
      public static function get resource_quest_usage_limit() : int
      {
         return Constants.current.getInt("resource_quest_usage_limit");
      }
      
      public static function get resource_quest_reduction() : int
      {
         return Constants.current.getInt("resource_quest_reduction");
      }
      
      public static function get resource_quest_max_stock() : int
      {
         return Constants.current.getInt("resource_quest_max_stock");
      }
      
      public static function get resource_quest_usage_limit_upgraded() : int
      {
         return Constants.current.getInt("resource_quest_usage_limit_upgraded");
      }
      
      public static function get resource_quest_max_stock_upgraded() : int
      {
         return Constants.current.getInt("resource_quest_max_stock_upgraded");
      }
      
      public static function get resource_free_slotmachine_spin_usage_amount() : int
      {
         return Constants.current.getInt("resource_free_slotmachine_spin_usage_amount");
      }
      
      public static function get resource_slotmachine_jeton_usage_amount() : int
      {
         return Constants.current.getInt("resource_slotmachine_jeton_usage_amount");
      }
      
      public static function get bank_upgrade1_premium_amount() : int
      {
         return Constants.current.getInt("bank_upgrade1_premium_amount");
      }
      
      public static function get bank_upgrade2_premium_amount() : int
      {
         return Constants.current.getInt("bank_upgrade2_premium_amount");
      }
      
      public static function get bank_upgrade3_premium_amount() : int
      {
         return Constants.current.getInt("bank_upgrade3_premium_amount");
      }
      
      public static function get bank_upgrade4_premium_amount() : int
      {
         return Constants.current.getInt("bank_upgrade4_premium_amount");
      }
      
      public static function get bank_upgrade5_premium_amount() : int
      {
         return Constants.current.getInt("bank_upgrade5_premium_amount");
      }
      
      public static function get bank_upgrade6_premium_amount() : int
      {
         return Constants.current.getInt("bank_upgrade6_premium_amount");
      }
      
      public static function get bank_upgrade7_premium_amount() : int
      {
         return Constants.current.getInt("bank_upgrade7_premium_amount");
      }
      
      public static function get bank_upgrade8_premium_amount() : int
      {
         return Constants.current.getInt("bank_upgrade8_premium_amount");
      }
      
      public static function get bank_upgrade9_premium_amount() : int
      {
         return Constants.current.getInt("bank_upgrade9_premium_amount");
      }
      
      public static function get bank_upgrade10_premium_amount() : int
      {
         return Constants.current.getInt("bank_upgrade10_premium_amount");
      }
      
      public static function get bank_upgrade11_premium_amount() : int
      {
         return Constants.current.getInt("bank_upgrade11_premium_amount");
      }
      
      public static function get bank_upgrade12_premium_amount() : int
      {
         return Constants.current.getInt("bank_upgrade12_premium_amount");
      }
      
      public static function get bank_upgrade13_premium_amount() : int
      {
         return Constants.current.getInt("bank_upgrade13_premium_amount");
      }
      
      public static function get bank_upgrade14_premium_amount() : int
      {
         return Constants.current.getInt("bank_upgrade14_premium_amount");
      }
      
      public static function get bank_upgrade15_premium_amount() : int
      {
         return Constants.current.getInt("bank_upgrade15_premium_amount");
      }
      
      public static function get bank_upgrade16_premium_amount() : int
      {
         return Constants.current.getInt("bank_upgrade16_premium_amount");
      }
      
      public static function get bank_upgrade17_premium_amount() : int
      {
         return Constants.current.getInt("bank_upgrade17_premium_amount");
      }
      
      public static function get bank_upgrade18_premium_amount() : int
      {
         return Constants.current.getInt("bank_upgrade18_premium_amount");
      }
      
      public static function get bank_upgrade19_premium_amount() : int
      {
         return Constants.current.getInt("bank_upgrade19_premium_amount");
      }
      
      public static function get bank_upgrade20_premium_amount() : int
      {
         return Constants.current.getInt("bank_upgrade20_premium_amount");
      }
      
      public static function get movie_title_amount_first_word() : int
      {
         return Constants.current.getInt("movie_title_amount_first_word");
      }
      
      public static function get movie_title_amount_second_word() : int
      {
         return Constants.current.getInt("movie_title_amount_second_word");
      }
      
      public static function get movie_title_amount_third_word() : int
      {
         return Constants.current.getInt("movie_title_amount_third_word");
      }
      
      public static function get movie_title_customize_premium_cost() : int
      {
         return Constants.current.getInt("movie_title_customize_premium_cost");
      }
      
      public static function get movie_title_customize_max_length() : int
      {
         return Constants.current.getInt("movie_title_customize_max_length");
      }
      
      public static function get movie_title_customize_min_length() : int
      {
         return Constants.current.getInt("movie_title_customize_min_length");
      }
      
      public static function get movie_min_level() : int
      {
         return Constants.current.getInt("movie_min_level");
      }
      
      public static function get movie_title_refresh_premium_cost() : int
      {
         return Constants.current.getInt("movie_title_refresh_premium_cost");
      }
      
      public static function get movie_chance_event_setting() : Number
      {
         return Constants.current.getNumber("movie_chance_event_setting");
      }
      
      public static function get init_max_movie_energy() : int
      {
         return Constants.current.getInt("init_max_movie_energy");
      }
      
      public static function get movie_refresh_offers_cost() : int
      {
         return Constants.current.getInt("movie_refresh_offers_cost");
      }
      
      public static function get movie_energy_cost() : int
      {
         return Constants.current.getInt("movie_energy_cost");
      }
      
      public static function get movie_energy_refill_amount() : int
      {
         return Constants.current.getInt("movie_energy_refill_amount");
      }
      
      public static function get movie_energy_refresh_amount_per_minute() : Number
      {
         return Constants.current.getNumber("movie_energy_refresh_amount_per_minute");
      }
      
      public static function get movie_quest_energy_cost_min() : int
      {
         return Constants.current.getInt("movie_quest_energy_cost_min");
      }
      
      public static function get movie_quest_energy_cost_max() : int
      {
         return Constants.current.getInt("movie_quest_energy_cost_max");
      }
      
      public static function get movie_quest_reward_game_currency_time() : int
      {
         return Constants.current.getInt("movie_quest_reward_game_currency_time");
      }
      
      public static function get movie_quest_reward_xp_time() : int
      {
         return Constants.current.getInt("movie_quest_reward_xp_time");
      }
      
      public static function get movie_quest_reward_progress_scale_attribute_easy() : Number
      {
         return Constants.current.getNumber("movie_quest_reward_progress_scale_attribute_easy");
      }
      
      public static function get movie_quest_reward_progress_scale_attribute_medium() : Number
      {
         return Constants.current.getNumber("movie_quest_reward_progress_scale_attribute_medium");
      }
      
      public static function get movie_quest_reward_progress_scale_attribute_hard() : Number
      {
         return Constants.current.getNumber("movie_quest_reward_progress_scale_attribute_hard");
      }
      
      public static function get movie_quest_reward_coin_scale_attribute_easy() : Number
      {
         return Constants.current.getNumber("movie_quest_reward_coin_scale_attribute_easy");
      }
      
      public static function get movie_quest_reward_coin_scale_attribute_medium() : Number
      {
         return Constants.current.getNumber("movie_quest_reward_coin_scale_attribute_medium");
      }
      
      public static function get movie_quest_reward_coin_scale_attribute_hard() : Number
      {
         return Constants.current.getNumber("movie_quest_reward_coin_scale_attribute_hard");
      }
      
      public static function get movie_quest_reward_xp_scale_attribute_easy() : Number
      {
         return Constants.current.getNumber("movie_quest_reward_xp_scale_attribute_easy");
      }
      
      public static function get movie_quest_reward_xp_scale_attribute_medium() : Number
      {
         return Constants.current.getNumber("movie_quest_reward_xp_scale_attribute_medium");
      }
      
      public static function get movie_quest_reward_xp_scale_attribute_hard() : Number
      {
         return Constants.current.getNumber("movie_quest_reward_xp_scale_attribute_hard");
      }
      
      public static function get movie_quest_reward_progress_scale_fight_easy() : Number
      {
         return Constants.current.getNumber("movie_quest_reward_progress_scale_fight_easy");
      }
      
      public static function get movie_quest_reward_progress_scale_fight_medium() : Number
      {
         return Constants.current.getNumber("movie_quest_reward_progress_scale_fight_medium");
      }
      
      public static function get movie_quest_reward_progress_scale_fight_hard() : Number
      {
         return Constants.current.getNumber("movie_quest_reward_progress_scale_fight_hard");
      }
      
      public static function get movie_quest_reward_coin_scale_fight_easy() : Number
      {
         return Constants.current.getNumber("movie_quest_reward_coin_scale_fight_easy");
      }
      
      public static function get movie_quest_reward_coin_scale_fight_medium() : Number
      {
         return Constants.current.getNumber("movie_quest_reward_coin_scale_fight_medium");
      }
      
      public static function get movie_quest_reward_coin_scale_fight_hard() : Number
      {
         return Constants.current.getNumber("movie_quest_reward_coin_scale_fight_hard");
      }
      
      public static function get movie_quest_reward_xp_scale_fight_easy() : Number
      {
         return Constants.current.getNumber("movie_quest_reward_xp_scale_fight_easy");
      }
      
      public static function get movie_quest_reward_xp_scale_fight_medium() : Number
      {
         return Constants.current.getNumber("movie_quest_reward_xp_scale_fight_medium");
      }
      
      public static function get movie_quest_reward_xp_scale_fight_hard() : Number
      {
         return Constants.current.getNumber("movie_quest_reward_xp_scale_fight_hard");
      }
      
      public static function get movie_quest_reward_progress_scale_instant() : Number
      {
         return Constants.current.getNumber("movie_quest_reward_progress_scale_instant");
      }
      
      public static function get movie_quest_reward_coin_scale_instant() : Number
      {
         return Constants.current.getNumber("movie_quest_reward_coin_scale_instant");
      }
      
      public static function get movie_quest_reward_xp_scale_instant() : Number
      {
         return Constants.current.getNumber("movie_quest_reward_xp_scale_instant");
      }
      
      public static function get movie_quest_reward_lost_xp() : Number
      {
         return Constants.current.getNumber("movie_quest_reward_lost_xp");
      }
      
      public static function get movie_quest_reward_lost_coin() : Number
      {
         return Constants.current.getNumber("movie_quest_reward_lost_coin");
      }
      
      public static function get movie_quest_reward_lost_progress() : Number
      {
         return Constants.current.getNumber("movie_quest_reward_lost_progress");
      }
      
      public static function get movie_quest_pool_size() : int
      {
         return Constants.current.getInt("movie_quest_pool_size");
      }
      
      public static function get movie_star_reward_game_currency_time() : int
      {
         return Constants.current.getInt("movie_star_reward_game_currency_time");
      }
      
      public static function get movie_star_reward_xp_time() : int
      {
         return Constants.current.getInt("movie_star_reward_xp_time");
      }
      
      public static function get movie_star_reward_full_reward_time() : int
      {
         return Constants.current.getInt("movie_star_reward_full_reward_time");
      }
      
      public static function get movie_star_reward_base_multiplier() : Number
      {
         return Constants.current.getNumber("movie_star_reward_base_multiplier");
      }
      
      public static function get movie_cooldown() : int
      {
         return Constants.current.getInt("movie_cooldown");
      }
      
      public static function get movie_daily_limit() : int
      {
         return Constants.current.getInt("movie_daily_limit");
      }
      
      public static function get movie_skip_cooldown_cost() : int
      {
         return Constants.current.getInt("movie_skip_cooldown_cost");
      }
      
      public static function get movie_skip_cooldown_cost_discount() : int
      {
         return Constants.current.getInt("movie_skip_cooldown_cost_discount");
      }
      
      public static function get movie_extend_time_refill_cost_factor() : int
      {
         return Constants.current.getInt("movie_extend_time_refill_cost_factor");
      }
      
      public static function get movie_extend_time_premium_amount() : int
      {
         return Constants.current.getInt("movie_extend_time_premium_amount");
      }
      
      public static function get movie_extend_time_discount_1_max_level() : int
      {
         return Constants.current.getInt("movie_extend_time_discount_1_max_level");
      }
      
      public static function get movie_extend_time_discount_2_max_level() : int
      {
         return Constants.current.getInt("movie_extend_time_discount_2_max_level");
      }
      
      public static function get movie_extend_time_discount_3_max_level() : int
      {
         return Constants.current.getInt("movie_extend_time_discount_3_max_level");
      }
      
      public static function get movie_extend_time_premium_amount_discount_1() : Number
      {
         return Constants.current.getNumber("movie_extend_time_premium_amount_discount_1");
      }
      
      public static function get movie_extend_time_premium_amount_discount_2() : Number
      {
         return Constants.current.getNumber("movie_extend_time_premium_amount_discount_2");
      }
      
      public static function get movie_extend_time_premium_amount_discount_3() : Number
      {
         return Constants.current.getNumber("movie_extend_time_premium_amount_discount_3");
      }
      
      public static function get movie_extend_time_amount() : int
      {
         return Constants.current.getInt("movie_extend_time_amount");
      }
      
      public static function get item_level_range1_start() : int
      {
         return Constants.current.getInt("item_level_range1_start");
      }
      
      public static function get item_level_range1_end() : int
      {
         return Constants.current.getInt("item_level_range1_end");
      }
      
      public static function get item_level_range2_start() : int
      {
         return Constants.current.getInt("item_level_range2_start");
      }
      
      public static function get item_level_range2_end() : int
      {
         return Constants.current.getInt("item_level_range2_end");
      }
      
      public static function get item_level_range3_start() : int
      {
         return Constants.current.getInt("item_level_range3_start");
      }
      
      public static function get item_level_range3_end() : int
      {
         return Constants.current.getInt("item_level_range3_end");
      }
      
      public static function get item_level_range1_steps() : int
      {
         return Constants.current.getInt("item_level_range1_steps");
      }
      
      public static function get item_level_range2_steps() : int
      {
         return Constants.current.getInt("item_level_range2_steps");
      }
      
      public static function get item_level_range3_steps() : int
      {
         return Constants.current.getInt("item_level_range3_steps");
      }
      
      public static function get movie_vote_min_level() : int
      {
         return Constants.current.getInt("movie_vote_min_level");
      }
      
      public static function get movie_vote_refresh_premium_amount() : int
      {
         return Constants.current.getInt("movie_vote_refresh_premium_amount");
      }
      
      public static function get movie_vote_reward_rank_1_statpoints() : int
      {
         return Constants.current.getInt("movie_vote_reward_rank_1_statpoints");
      }
      
      public static function get movie_vote_reward_rank_1_xp() : int
      {
         return Constants.current.getInt("movie_vote_reward_rank_1_xp");
      }
      
      public static function get movie_vote_reward_rank_1_premium() : int
      {
         return Constants.current.getInt("movie_vote_reward_rank_1_premium");
      }
      
      public static function get movie_vote_reward_rank_2_statpoints() : int
      {
         return Constants.current.getInt("movie_vote_reward_rank_2_statpoints");
      }
      
      public static function get movie_vote_reward_rank_2_xp() : int
      {
         return Constants.current.getInt("movie_vote_reward_rank_2_xp");
      }
      
      public static function get movie_vote_reward_rank_2_premium() : int
      {
         return Constants.current.getInt("movie_vote_reward_rank_2_premium");
      }
      
      public static function get movie_vote_reward_rank_3_statpoints() : int
      {
         return Constants.current.getInt("movie_vote_reward_rank_3_statpoints");
      }
      
      public static function get movie_vote_reward_rank_3_xp() : int
      {
         return Constants.current.getInt("movie_vote_reward_rank_3_xp");
      }
      
      public static function get movie_vote_reward_rank_3_premium() : int
      {
         return Constants.current.getInt("movie_vote_reward_rank_3_premium");
      }
      
      public static function get movie_vote_reward_rank_10_statpoints() : int
      {
         return Constants.current.getInt("movie_vote_reward_rank_10_statpoints");
      }
      
      public static function get movie_vote_reward_rank_10_xp() : int
      {
         return Constants.current.getInt("movie_vote_reward_rank_10_xp");
      }
      
      public static function get movie_vote_reward_rank_10_premium() : int
      {
         return Constants.current.getInt("movie_vote_reward_rank_10_premium");
      }
      
      public static function get movie_vote_reward_rank_100_statpoints() : int
      {
         return Constants.current.getInt("movie_vote_reward_rank_100_statpoints");
      }
      
      public static function get movie_vote_reward_rank_100_xp() : int
      {
         return Constants.current.getInt("movie_vote_reward_rank_100_xp");
      }
      
      public static function get movie_vote_reward_rank_100_premium() : int
      {
         return Constants.current.getInt("movie_vote_reward_rank_100_premium");
      }
      
      public static function get movie_vote_reward_rank_250_statpoints() : int
      {
         return Constants.current.getInt("movie_vote_reward_rank_250_statpoints");
      }
      
      public static function get movie_vote_reward_rank_250_xp() : int
      {
         return Constants.current.getInt("movie_vote_reward_rank_250_xp");
      }
      
      public static function get movie_vote_reward_rank_250_premium() : int
      {
         return Constants.current.getInt("movie_vote_reward_rank_250_premium");
      }
      
      public static function get movie_vote_reward_rank_500_statpoints() : int
      {
         return Constants.current.getInt("movie_vote_reward_rank_500_statpoints");
      }
      
      public static function get movie_vote_reward_rank_500_xp() : int
      {
         return Constants.current.getInt("movie_vote_reward_rank_500_xp");
      }
      
      public static function get movie_vote_reward_rank_500_premium() : int
      {
         return Constants.current.getInt("movie_vote_reward_rank_500_premium");
      }
      
      public static function get movie_vote_voting_reward_1_xp_chance() : int
      {
         return Constants.current.getInt("movie_vote_voting_reward_1_xp_chance");
      }
      
      public static function get movie_vote_voting_reward_1_coin_chance() : int
      {
         return Constants.current.getInt("movie_vote_voting_reward_1_coin_chance");
      }
      
      public static function get movie_vote_voting_reward_1_min_xp_chance() : int
      {
         return Constants.current.getInt("movie_vote_voting_reward_1_min_xp_chance");
      }
      
      public static function get movie_vote_voting_reward_1_min_coins_chance() : int
      {
         return Constants.current.getInt("movie_vote_voting_reward_1_min_coins_chance");
      }
      
      public static function get movie_vote_voting_reward_1_premium_chance() : int
      {
         return Constants.current.getInt("movie_vote_voting_reward_1_premium_chance");
      }
      
      public static function get movie_vote_voting_reward_1_stat_chance() : int
      {
         return Constants.current.getInt("movie_vote_voting_reward_1_stat_chance");
      }
      
      public static function get movie_vote_voting_reward_1_epic_item_chance() : int
      {
         return Constants.current.getInt("movie_vote_voting_reward_1_epic_item_chance");
      }
      
      public static function get movie_vote_voting_reward_epic_item_bonus_level() : int
      {
         return Constants.current.getInt("movie_vote_voting_reward_epic_item_bonus_level");
      }
      
      public static function get movie_tournament_end_weekday() : String
      {
         return Constants.current.getString("movie_tournament_end_weekday");
      }
      
      public static function get movie_vote_reward_rank_1_title() : String
      {
         return Constants.current.getString("movie_vote_reward_rank_1_title");
      }
      
      public static function get convention_reward_item_top_pool_size() : int
      {
         return Constants.current.getInt("convention_reward_item_top_pool_size");
      }
      
      public static function get convention_reward_epic_item_min_shows() : int
      {
         return Constants.current.getInt("convention_reward_epic_item_min_shows");
      }
      
      public static function get convention_reward_epic_item_item_bonus() : int
      {
         return Constants.current.getInt("convention_reward_epic_item_item_bonus");
      }
      
      public static function get convention_reward_rare_item_min_shows() : int
      {
         return Constants.current.getInt("convention_reward_rare_item_min_shows");
      }
      
      public static function get convention_reward_rare_item_item_bonus() : int
      {
         return Constants.current.getInt("convention_reward_rare_item_item_bonus");
      }
      
      public static function get convention_reward_common_item_item_bonus() : int
      {
         return Constants.current.getInt("convention_reward_common_item_item_bonus");
      }
      
      public static function get convention_reward_coin_duration() : int
      {
         return Constants.current.getInt("convention_reward_coin_duration");
      }
      
      public static function get convention_reward_coin_base() : Number
      {
         return Constants.current.getNumber("convention_reward_coin_base");
      }
      
      public static function get convention_reward_coin_falloff() : Number
      {
         return Constants.current.getNumber("convention_reward_coin_falloff");
      }
      
      public static function get convention_reward_coin_factor_failed() : Number
      {
         return Constants.current.getNumber("convention_reward_coin_factor_failed");
      }
      
      public static function get convention_reward_xp_duration() : int
      {
         return Constants.current.getInt("convention_reward_xp_duration");
      }
      
      public static function get convention_reward_xp_falloff() : Number
      {
         return Constants.current.getNumber("convention_reward_xp_falloff");
      }
      
      public static function get convention_reward_xp_factor_failed() : Number
      {
         return Constants.current.getNumber("convention_reward_xp_factor_failed");
      }
      
      public static function get convention_fans_base() : Number
      {
         return Constants.current.getNumber("convention_fans_base");
      }
      
      public static function get convention_fans_multiplier() : Number
      {
         return Constants.current.getNumber("convention_fans_multiplier");
      }
      
      public static function get convention_fans_tolerance() : Number
      {
         return Constants.current.getNumber("convention_fans_tolerance");
      }
      
      public static function get convention_fans_factor_base() : Number
      {
         return Constants.current.getNumber("convention_fans_factor_base");
      }
      
      public static function get convention_fans_factor_exp() : Number
      {
         return Constants.current.getNumber("convention_fans_factor_exp");
      }
      
      public static function get convention_fans_minimum() : int
      {
         return Constants.current.getInt("convention_fans_minimum");
      }
      
      public static function get convention_fans_minimum_percentage() : Number
      {
         return Constants.current.getNumber("convention_fans_minimum_percentage");
      }
      
      public static function get convention_instant_finish_premium_amount() : int
      {
         return Constants.current.getInt("convention_instant_finish_premium_amount");
      }
      
      public static function get convention_min_dau_count() : Number
      {
         return Constants.current.getNumber("convention_min_dau_count");
      }
      
      public static function get convention_max_correction_factor() : Number
      {
         return Constants.current.getNumber("convention_max_correction_factor");
      }
      
      public static function get convention_average_shows_per_dau_per_hour() : Number
      {
         return Constants.current.getNumber("convention_average_shows_per_dau_per_hour");
      }
      
      public static function get convention_min_avg_fans_per_convention_show() : int
      {
         return Constants.current.getInt("convention_min_avg_fans_per_convention_show");
      }
      
      public static function get convention_show_duration() : int
      {
         return Constants.current.getInt("convention_show_duration");
      }
      
      public static function get convention_perfect_ratio() : Number
      {
         return Constants.current.getNumber("convention_perfect_ratio");
      }
      
      public static function get convention_reward_additional_min_shows() : int
      {
         return Constants.current.getInt("convention_reward_additional_min_shows");
      }
      
      public static function get convention_show_multi_attend_premium_amount() : int
      {
         return Constants.current.getInt("convention_show_multi_attend_premium_amount");
      }
      
      public static function get convention_show_multi_attend_iterations() : int
      {
         return Constants.current.getInt("convention_show_multi_attend_iterations");
      }
      
      public static function get payer_promotion_premium_currency_amount() : int
      {
         return Constants.current.getInt("payer_promotion_premium_currency_amount");
      }
      
      public static function get dungeon_quest_cooldown_win_premium_amount() : int
      {
         return Constants.current.getInt("dungeon_quest_cooldown_win_premium_amount");
      }
      
      public static function get dungeon_quest_cooldown_lost_premium_amount() : int
      {
         return Constants.current.getInt("dungeon_quest_cooldown_lost_premium_amount");
      }
      
      public static function get dungeon_level_unlock_premium_currency_cost() : int
      {
         return Constants.current.getInt("dungeon_level_unlock_premium_currency_cost");
      }
      
      public static function get dungeon_quest_reward_premium_currency_reward() : int
      {
         return Constants.current.getInt("dungeon_quest_reward_premium_currency_reward");
      }
      
      public static function get dungeon_quest_reward_premium_currency_chance() : Number
      {
         return Constants.current.getNumber("dungeon_quest_reward_premium_currency_chance");
      }
      
      public static function get dungeon_quest_reward_max_level_offset() : int
      {
         return Constants.current.getInt("dungeon_quest_reward_max_level_offset");
      }
      
      public static function get dungeon_quest_reward_coin_duration() : int
      {
         return Constants.current.getInt("dungeon_quest_reward_coin_duration");
      }
      
      public static function get dungeon_quest_reward_xp_duration() : int
      {
         return Constants.current.getInt("dungeon_quest_reward_xp_duration");
      }
      
      public static function get dungeon_quest_cooldown_win() : int
      {
         return Constants.current.getInt("dungeon_quest_cooldown_win");
      }
      
      public static function get dungeon_quest_cooldown_lost() : int
      {
         return Constants.current.getInt("dungeon_quest_cooldown_lost");
      }
      
      public static function get dungeon_quest_reward_min_item_level_percentage() : Number
      {
         return Constants.current.getNumber("dungeon_quest_reward_min_item_level_percentage");
      }
      
      public static function get dungeon_quest_npc_stat_percentage_min() : Number
      {
         return Constants.current.getNumber("dungeon_quest_npc_stat_percentage_min");
      }
      
      public static function get dungeon_quest_npc_stat_percentage_max() : Number
      {
         return Constants.current.getNumber("dungeon_quest_npc_stat_percentage_max");
      }
      
      public static function get dungeon_quest_npc_recalculate_percentage() : Number
      {
         return Constants.current.getNumber("dungeon_quest_npc_recalculate_percentage");
      }
      
      public static function get dungeon_quest_npc_stat_level_multi_commons() : Number
      {
         return Constants.current.getNumber("dungeon_quest_npc_stat_level_multi_commons");
      }
      
      public static function get dungeon_quest_npc_stat_level_multi_rares() : Number
      {
         return Constants.current.getNumber("dungeon_quest_npc_stat_level_multi_rares");
      }
      
      public static function get dungeon_quest_npc_stat_level_multi_epics() : Number
      {
         return Constants.current.getNumber("dungeon_quest_npc_stat_level_multi_epics");
      }
      
      public static function get dungeon_quest_npc_stat_level_decrease() : Number
      {
         return Constants.current.getNumber("dungeon_quest_npc_stat_level_decrease");
      }
      
      public static function get dungeon_quest_npc_stat_level_multi_total() : Number
      {
         return Constants.current.getNumber("dungeon_quest_npc_stat_level_multi_total");
      }
      
      public static function get dungeon_extend_time_amount() : int
      {
         return Constants.current.getInt("dungeon_extend_time_amount");
      }
      
      public static function get dungeon_extend_time_premium_amount() : int
      {
         return Constants.current.getInt("dungeon_extend_time_premium_amount");
      }
      
      public static function get dungeon_quest_key_chance() : int
      {
         return Constants.current.getInt("dungeon_quest_key_chance");
      }
      
      public static function get dungeon_boss_reward_stat_point_reward() : int
      {
         return Constants.current.getInt("dungeon_boss_reward_stat_point_reward");
      }
      
      public static function get dungeon_min_level() : int
      {
         return Constants.current.getInt("dungeon_min_level");
      }
      
      public static function get customize_item_req_level() : int
      {
         return Constants.current.getInt("customize_item_req_level");
      }
      
      public static function get customize_item_premium_currency_amount() : int
      {
         return Constants.current.getInt("customize_item_premium_currency_amount");
      }
      
      public static function get customize_item_amount_skills_generated() : int
      {
         return Constants.current.getInt("customize_item_amount_skills_generated");
      }
      
      public static function get dungeon_key_duration() : int
      {
         return Constants.current.getInt("dungeon_key_duration");
      }
      
      public static function get story_dungeon_attack_cooldown() : int
      {
         return Constants.current.getInt("story_dungeon_attack_cooldown");
      }
      
      public static function get story_dungeon_attack_premium_currency() : int
      {
         return Constants.current.getInt("story_dungeon_attack_premium_currency");
      }
      
      public static function get item_pattern_reward_energy_base() : int
      {
         return Constants.current.getInt("item_pattern_reward_energy_base");
      }
      
      public static function get item_pattern_reward_stat_points_base() : int
      {
         return Constants.current.getInt("item_pattern_reward_stat_points_base");
      }
      
      public static function get item_pattern_reward_item_min_plus_level_base() : int
      {
         return Constants.current.getInt("item_pattern_reward_item_min_plus_level_base");
      }
      
      public static function get event_quest_objective_reward_game_currency_time() : int
      {
         return Constants.current.getInt("event_quest_objective_reward_game_currency_time");
      }
      
      public static function get event_quest_objective_reward_game_currency_percentage_base() : Number
      {
         return Constants.current.getNumber("event_quest_objective_reward_game_currency_percentage_base");
      }
      
      public static function get event_quest_objective_reward_game_currency_exp() : Number
      {
         return Constants.current.getNumber("event_quest_objective_reward_game_currency_exp");
      }
      
      public static function get event_quest_objective_reward_premium_currency_base() : int
      {
         return Constants.current.getInt("event_quest_objective_reward_premium_currency_base");
      }
      
      public static function get event_quest_objective_reward_stat_points_base() : int
      {
         return Constants.current.getInt("event_quest_objective_reward_stat_points_base");
      }
      
      public static function get event_quest_objective_reward_xp_percentage_base() : Number
      {
         return Constants.current.getNumber("event_quest_objective_reward_xp_percentage_base");
      }
      
      public static function get event_quest_objective_reward_item_min_plus_level_base() : int
      {
         return Constants.current.getInt("event_quest_objective_reward_item_min_plus_level_base");
      }
      
      public static function get event_quest_objective_reward_item_min_plus_level_rare() : int
      {
         return Constants.current.getInt("event_quest_objective_reward_item_min_plus_level_rare");
      }
      
      public static function get event_quest_objective_reward_item_min_plus_level_epic() : int
      {
         return Constants.current.getInt("event_quest_objective_reward_item_min_plus_level_epic");
      }
      
      public static function get event_quest_objective_instant_finish_amount() : int
      {
         return Constants.current.getInt("event_quest_objective_instant_finish_amount");
      }
      
      public static function get event_quest_min_level() : int
      {
         return Constants.current.getInt("event_quest_min_level");
      }
      
      public static function get event_quest_reward_game_currency_time() : int
      {
         return Constants.current.getInt("event_quest_reward_game_currency_time");
      }
      
      public static function get event_quest_reward_xp_time() : int
      {
         return Constants.current.getInt("event_quest_reward_xp_time");
      }
      
      public static function get event_quest_reward_unfinished_game_currency_time() : int
      {
         return Constants.current.getInt("event_quest_reward_unfinished_game_currency_time");
      }
      
      public static function get event_quest_reward_unfinished_xp_time() : int
      {
         return Constants.current.getInt("event_quest_reward_unfinished_xp_time");
      }
      
      public static function get event_quest_reward_unfinished_item_plus_level() : int
      {
         return Constants.current.getInt("event_quest_reward_unfinished_item_plus_level");
      }
      
      public static function get warforged_unlock_level() : int
      {
         return Constants.current.getInt("warforged_unlock_level");
      }
      
      public static function get warforged_effect_min_level() : int
      {
         return Constants.current.getInt("warforged_effect_min_level");
      }
      
      public static function get maximum_energy_storage_amount_upgraded() : int
      {
         return Constants.current.getInt("maximum_energy_storage_amount_upgraded");
      }
      
      public static function get maximum_energy_storage_amount() : int
      {
         return Constants.current.getInt("maximum_energy_storage_amount");
      }
      
      public static function get storage_unlock_level() : int
      {
         return Constants.current.getInt("storage_unlock_level");
      }
      
      public static function get energy_storage_cost_50() : int
      {
         return Constants.current.getInt("energy_storage_cost_50");
      }
      
      public static function get energy_storage_cost_100() : int
      {
         return Constants.current.getInt("energy_storage_cost_100");
      }
      
      public static function get guild_competition_min_score() : int
      {
         return Constants.current.getInt("guild_competition_min_score");
      }
      
      public static function get guild_competition_min_rank_reward() : int
      {
         return Constants.current.getInt("guild_competition_min_rank_reward");
      }
      
      public static function get guild_competition_reward_xp() : int
      {
         return Constants.current.getInt("guild_competition_reward_xp");
      }
      
      public static function get guild_competition_reward_stat_points() : int
      {
         return Constants.current.getInt("guild_competition_reward_stat_points");
      }
      
      public static function get guild_competition_reward_guild_premium_curremcy() : int
      {
         return Constants.current.getInt("guild_competition_reward_guild_premium_curremcy");
      }
      
      public static function get new_guild_competition_rewards_start() : String
      {
         return Constants.current.getString("new_guild_competition_rewards_start");
      }
      
      public static function get new_guild_competition_reward_xp() : int
      {
         return Constants.current.getInt("new_guild_competition_reward_xp");
      }
      
      public static function get new_guild_competition_reward_stat_points() : int
      {
         return Constants.current.getInt("new_guild_competition_reward_stat_points");
      }
      
      public static function get new_guild_competition_reward_guild_premium_curremcy() : int
      {
         return Constants.current.getInt("new_guild_competition_reward_guild_premium_curremcy");
      }
      
      public static function get guild_competition_first_place_item_templates() : String
      {
         return Constants.current.getString("guild_competition_first_place_item_templates");
      }
      
      public static function get guild_competition_first_place_item_plus_level() : int
      {
         return Constants.current.getInt("guild_competition_first_place_item_plus_level");
      }
      
      public static function get solo_guild_competition_reward_stat_points_top_3() : int
      {
         return Constants.current.getInt("solo_guild_competition_reward_stat_points_top_3");
      }
      
      public static function get solo_guild_competition_reward_stat_points_top_10() : int
      {
         return Constants.current.getInt("solo_guild_competition_reward_stat_points_top_10");
      }
      
      public static function get solo_guild_competition_reward_stat_points_top_20() : int
      {
         return Constants.current.getInt("solo_guild_competition_reward_stat_points_top_20");
      }
      
      public static function get solo_guild_competition_reward_stat_points_top_30() : int
      {
         return Constants.current.getInt("solo_guild_competition_reward_stat_points_top_30");
      }
      
      public static function get solo_guild_competition_reward_stat_points_top_40() : int
      {
         return Constants.current.getInt("solo_guild_competition_reward_stat_points_top_40");
      }
      
      public static function get solo_guild_competition_reward_stat_points_top_50() : int
      {
         return Constants.current.getInt("solo_guild_competition_reward_stat_points_top_50");
      }
      
      public static function get solo_guild_competition_reward_stat_points_top_100() : int
      {
         return Constants.current.getInt("solo_guild_competition_reward_stat_points_top_100");
      }
      
      public static function get solo_guild_competition_reward_stat_points_top_150() : int
      {
         return Constants.current.getInt("solo_guild_competition_reward_stat_points_top_150");
      }
      
      public static function get solo_guild_competition_reward_stat_points_top_200() : int
      {
         return Constants.current.getInt("solo_guild_competition_reward_stat_points_top_200");
      }
      
      public static function get solo_guild_competition_reward_stat_points_top_300() : int
      {
         return Constants.current.getInt("solo_guild_competition_reward_stat_points_top_300");
      }
      
      public static function get slotmachine_premium_currency_amount() : int
      {
         return Constants.current.getInt("slotmachine_premium_currency_amount");
      }
      
      public static function get slotmachine_max_available_free_spins() : int
      {
         return Constants.current.getInt("slotmachine_max_available_free_spins");
      }
      
      public static function get slotmachine_max_available_jetons() : int
      {
         return Constants.current.getInt("slotmachine_max_available_jetons");
      }
      
      public static function get slotmachine_min_level() : int
      {
         return Constants.current.getInt("slotmachine_min_level");
      }
      
      public static function get slotmachine_coin_reward_base_time() : int
      {
         return Constants.current.getInt("slotmachine_coin_reward_base_time");
      }
      
      public static function get slotmachine_xp_reward_base_time() : int
      {
         return Constants.current.getInt("slotmachine_xp_reward_base_time");
      }
      
      public static function get slotmachine_max_daily_spins() : int
      {
         return Constants.current.getInt("slotmachine_max_daily_spins");
      }
      
      public static function get slotmachine_teaser_min_level() : int
      {
         return Constants.current.getInt("slotmachine_teaser_min_level");
      }
      
      public static function get slotmachine_event_start() : String
      {
         return Constants.current.getString("slotmachine_event_start");
      }
      
      public static function get slotmachine_event_end() : String
      {
         return Constants.current.getString("slotmachine_event_end");
      }
      
      public static function get dating_attack_cooldown() : int
      {
         return Constants.current.getInt("dating_attack_cooldown");
      }
      
      public static function get dating_attack_premium_currency() : int
      {
         return Constants.current.getInt("dating_attack_premium_currency");
      }
      
      public static function get dating_upgrade_storage_premium_currency() : int
      {
         return Constants.current.getInt("dating_upgrade_storage_premium_currency");
      }
      
      public static function get dating_base_storage() : int
      {
         return Constants.current.getInt("dating_base_storage");
      }
      
      public static function get dating_storage_upgrade() : int
      {
         return Constants.current.getInt("dating_storage_upgrade");
      }
      
      public static function get dating_unlock_level() : int
      {
         return Constants.current.getInt("dating_unlock_level");
      }
      
      public static function get user_voucher_code_prefix() : String
      {
         return Constants.current.getString("user_voucher_code_prefix");
      }
      
      public static function get reward_user_voucher_duration() : int
      {
         return Constants.current.getInt("reward_user_voucher_duration");
      }
      
      public static function get herobook_min_level() : int
      {
         return Constants.current.getInt("herobook_min_level");
      }
      
      public static function get herobook_teaser_min_level() : int
      {
         return Constants.current.getInt("herobook_teaser_min_level");
      }
      
      public static function get herobook_daily_objective_instant_finish_amount() : int
      {
         return Constants.current.getInt("herobook_daily_objective_instant_finish_amount");
      }
      
      public static function get herobook_weekly_objective_instant_finish_amount() : int
      {
         return Constants.current.getInt("herobook_weekly_objective_instant_finish_amount");
      }
      
      public static function get herobook_objective_reward_game_currency_time() : int
      {
         return Constants.current.getInt("herobook_objective_reward_game_currency_time");
      }
      
      public static function get herobook_objective_reward_xp_time() : int
      {
         return Constants.current.getInt("herobook_objective_reward_xp_time");
      }
      
      public static function get herobook_daily_objectives() : int
      {
         return Constants.current.getInt("herobook_daily_objectives");
      }
      
      public static function get herobook_weekly_objectives() : int
      {
         return Constants.current.getInt("herobook_weekly_objectives");
      }
      
      public static function get herobook_objective_renew_amount() : int
      {
         return Constants.current.getInt("herobook_objective_renew_amount");
      }
      
      public static function get release_guild_artifact_cost() : int
      {
         return Constants.current.getInt("release_guild_artifact_cost");
      }
      
      public static function get release_guild_artifact_cooldown() : int
      {
         return Constants.current.getInt("release_guild_artifact_cooldown");
      }
      
      public static function get fan_foto_cost() : int
      {
         return Constants.current.getInt("fan_foto_cost");
      }
      
      public static function get fan_foto_25_increase() : int
      {
         return Constants.current.getInt("fan_foto_25_increase");
      }
      
      public static function get fan_foto_100_increase() : int
      {
         return Constants.current.getInt("fan_foto_100_increase");
      }
      
      public static function get fan_foto_max_cost() : int
      {
         return Constants.current.getInt("fan_foto_max_cost");
      }
      
      public static function get fan_foto_max_tags() : int
      {
         return Constants.current.getInt("fan_foto_max_tags");
      }
      
      public static function get fan_foto_start_tags() : int
      {
         return Constants.current.getInt("fan_foto_start_tags");
      }
      
      public static function get fan_foto_tag_3_cost() : int
      {
         return Constants.current.getInt("fan_foto_tag_3_cost");
      }
      
      public static function get fan_foto_tag_4_cost() : int
      {
         return Constants.current.getInt("fan_foto_tag_4_cost");
      }
      
      public static function get fan_foto_remove_tag_cost() : int
      {
         return Constants.current.getInt("fan_foto_remove_tag_cost");
      }
      
      public static function get fan_foto_remove_all_tags_cost() : int
      {
         return Constants.current.getInt("fan_foto_remove_all_tags_cost");
      }
      
      public static function get fan_foto_resource_cost() : int
      {
         return Constants.current.getInt("fan_foto_resource_cost");
      }
      
      public static function get fan_foto_min_resource_per_quest() : int
      {
         return Constants.current.getInt("fan_foto_min_resource_per_quest");
      }
      
      public static function get fan_foto_max_resource_per_quest_min() : Number
      {
         return Constants.current.getNumber("fan_foto_max_resource_per_quest_min");
      }
      
      public static function get guild_booster_cost_game_currency_per_improvement() : int
      {
         return Constants.current.getInt("guild_booster_cost_game_currency_per_improvement");
      }
      
      public static function get guild_booster_cost_premium_currency() : int
      {
         return Constants.current.getInt("guild_booster_cost_premium_currency");
      }
      
      public static function get guild_booster_first_warning() : int
      {
         return Constants.current.getInt("guild_booster_first_warning");
      }
      
      public static function get guild_booster_second_warning() : int
      {
         return Constants.current.getInt("guild_booster_second_warning");
      }
      
      public static function get booster_multitasking_unlock_level() : int
      {
         return Constants.current.getInt("booster_multitasking_unlock_level");
      }
      
      public static function get multitasking_rent_premium_amount() : int
      {
         return Constants.current.getInt("multitasking_rent_premium_amount");
      }
      
      public static function get multitasking_rent_time_amount() : int
      {
         return Constants.current.getInt("multitasking_rent_time_amount");
      }
      
      public static function get max_simultane_marriages() : int
      {
         return Constants.current.getInt("max_simultane_marriages");
      }
      
      public static function get marriage_ring_item_template() : String
      {
         return Constants.current.getString("marriage_ring_item_template");
      }
      
      public static function get marriage_ring_item_plus_level() : int
      {
         return Constants.current.getInt("marriage_ring_item_plus_level");
      }
      
      public static function get max_outfits() : int
      {
         return Constants.current.getInt("max_outfits");
      }
      
      public static function get outfit_unlock_cost() : int
      {
         return Constants.current.getInt("outfit_unlock_cost");
      }
      
      public static function get outfit_min_level() : int
      {
         return Constants.current.getInt("outfit_min_level");
      }
      
      public static function get optical_change_unlock_level() : int
      {
         return Constants.current.getInt("optical_change_unlock_level");
      }
      
      public static function get optical_changes_reward_stat_points_base() : int
      {
         return Constants.current.getInt("optical_changes_reward_stat_points_base");
      }
      
      public static function get optical_changes_reward_energy_base() : int
      {
         return Constants.current.getInt("optical_changes_reward_energy_base");
      }
      
      public static function get optical_change_chest_price_small() : int
      {
         return Constants.current.getInt("optical_change_chest_price_small");
      }
      
      public static function get optical_change_chest_amount_small() : int
      {
         return Constants.current.getInt("optical_change_chest_amount_small");
      }
      
      public static function get optical_change_chest_price_big() : int
      {
         return Constants.current.getInt("optical_change_chest_price_big");
      }
      
      public static function get optical_change_chest_amount_big() : int
      {
         return Constants.current.getInt("optical_change_chest_amount_big");
      }
      
      public static function get user_story_unlock_level() : int
      {
         return Constants.current.getInt("user_story_unlock_level");
      }
      
      public static function get user_story_creation_cost() : int
      {
         return Constants.current.getInt("user_story_creation_cost");
      }
      
      public static function get user_story_hall_of_fame_limit() : int
      {
         return Constants.current.getInt("user_story_hall_of_fame_limit");
      }
      
      public static function get user_story_hall_of_fame_reward() : int
      {
         return Constants.current.getInt("user_story_hall_of_fame_reward");
      }
      
      public static function get user_story_min_title_char_count() : int
      {
         return Constants.current.getInt("user_story_min_title_char_count");
      }
      
      public static function get user_story_max_title_char_count() : int
      {
         return Constants.current.getInt("user_story_max_title_char_count");
      }
      
      public static function get user_story_min_briefing_char_count() : int
      {
         return Constants.current.getInt("user_story_min_briefing_char_count");
      }
      
      public static function get user_story_max_briefing_char_count() : int
      {
         return Constants.current.getInt("user_story_max_briefing_char_count");
      }
      
      public static function get user_story_min_outro_char_count() : int
      {
         return Constants.current.getInt("user_story_min_outro_char_count");
      }
      
      public static function get user_story_max_outro_char_count() : int
      {
         return Constants.current.getInt("user_story_max_outro_char_count");
      }
      
      public static function get streaming_refresh_offers_cost() : int
      {
         return Constants.current.getInt("streaming_refresh_offers_cost");
      }
      
      public static function get kobil_max_activation_time() : int
      {
         return Constants.current.getInt("kobil_max_activation_time");
      }
   }
}
