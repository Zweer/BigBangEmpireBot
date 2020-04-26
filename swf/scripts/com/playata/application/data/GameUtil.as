package com.playata.application.data
{
   import com.playata.application.AppEnvironment;
   import com.playata.application.data.battle.BattleEffect;
   import com.playata.application.data.character.AppearanceSettings;
   import com.playata.application.data.character.Character;
   import com.playata.application.data.constants.CBattleSkill;
   import com.playata.application.data.constants.CConstant;
   import com.playata.application.data.constants.CConventionReward;
   import com.playata.application.data.constants.CCustomStage;
   import com.playata.application.data.constants.CDungeonQuestTemplate;
   import com.playata.application.data.constants.CDungeonTemplate;
   import com.playata.application.data.constants.CDungeonTemplateLevel;
   import com.playata.application.data.constants.CGuildBattleAttackCost;
   import com.playata.application.data.constants.CHint;
   import com.playata.application.data.constants.CItemTemplate;
   import com.playata.application.data.constants.CLevel;
   import com.playata.application.data.movie.MovieCoverSettings;
   import com.playata.application.data.outfit.Outfit;
   import com.playata.application.platform.ServerInfo;
   import com.playata.framework.application.Environment;
   import com.playata.framework.core.TypedObject;
   import com.playata.framework.core.util.NumberUtil;
   import com.playata.framework.core.util.TimeUtil;
   import com.playata.framework.localization.LocText;
   
   public class GameUtil
   {
       
      
      public function GameUtil()
      {
         super();
         throw new Error("This class only provides static functions and must not be initialized directly.");
      }
      
      public static function questXpReward(param1:int, param2:int, param3:int, param4:Number = 1, param5:Number = 0) : int
      {
         if(param2 == 1)
         {
            return CLevel.fromId(2).xp;
         }
         var _loc6_:* = 0;
         var _loc9_:Number = CConstant.xp_per_time;
         switch(int(param3) - 1)
         {
            case 0:
               _loc6_ = Number(CConstant.quest_reward_xp_scale_balanced);
               break;
            case 1:
               _loc6_ = Number(CConstant.quest_reward_xp_scale_xp_heavy);
               break;
            case 2:
               _loc6_ = Number(CConstant.quest_reward_xp_scale_coin_heavy);
               break;
            case 3:
               _loc6_ = Number(CConstant.quest_reward_xp_scale_item);
         }
         var _loc8_:Number = param1 * _loc9_ * _loc6_ * param4;
         var _loc10_:Number = CConstant.quest_reward_xp_adjust_end_level;
         var _loc7_:Number = CConstant.quest_reward_xp_adjust_start_percentage;
         if(param2 < _loc10_)
         {
            if(param2 == 2)
            {
               _loc8_ = _loc8_ * (param2 * _loc7_);
            }
            else
            {
               _loc8_ = _loc8_ * (_loc7_ - param2 / _loc10_ * (_loc7_ - 1));
            }
         }
         return Math.round(_loc8_ * (1 + param5));
      }
      
      public static function getWorkGameCurrencyReward(param1:int, param2:Number, param3:Number, param4:Number = 0) : int
      {
         var _loc8_:Number = CConstant.work_effectiveness_max;
         var _loc9_:Number = CConstant.work_effectiveness_min;
         var _loc5_:Number = CConstant.work_duration_min;
         var _loc6_:Number = CConstant.work_duration_max;
         var _loc7_:Number = param3 * (_loc8_ - (param3 - _loc5_) / (_loc6_ - _loc5_) * (_loc8_ - _loc9_)) * gameCurrencyPerTime(param1) * (1 + param2);
         return Math.round(_loc7_ * (1 + param4));
      }
      
      public static function getWorkGameCurrencyRewardNew(param1:int, param2:Number, param3:Number, param4:Number = 0) : int
      {
         var _loc6_:Number = CConstant.work_effectiveness;
         var _loc5_:Number = param3 * _loc6_ * gameCurrencyPerTime(param1) * (1 + param2);
         return Math.round(_loc5_ * (1 + param4));
      }
      
      public static function gameCurrencyPerTime(param1:int) : Number
      {
         var _loc6_:Number = CConstant.coins_per_time_base;
         var _loc3_:Number = CConstant.coins_per_time_scale;
         var _loc4_:Number = CConstant.coins_per_time_level_scale;
         var _loc5_:Number = CConstant.coins_per_time_level_exp;
         var _loc2_:Number = _loc6_ + _loc3_ * Math.pow(_loc4_ * param1,_loc5_);
         return NumberUtil.roundDecimal(_loc2_,3);
      }
      
      public static function calcNeededGameCurrency(param1:int) : int
      {
         var _loc5_:Number = CConstant.cost_stat_base;
         var _loc3_:Number = CConstant.cost_stat_scale;
         var _loc6_:Number = CConstant.cost_stat_base_scale;
         var _loc4_:Number = CConstant.cost_stat_base_exp;
         var _loc2_:int = Math.round(_loc5_ + _loc3_ * Math.pow(_loc6_ * param1,_loc4_));
         return _loc2_;
      }
      
      public static function boosterCost(param1:int, param2:Boolean) : int
      {
         var _loc7_:int = Math.ceil((param1 + 1) / 10);
         var _loc3_:* = 0;
         if(param2)
         {
            _loc3_ = Number(CConstant.booster_small_costs_time);
         }
         else
         {
            _loc3_ = Number(CConstant.booster_medium_costs_time);
         }
         var _loc8_:Number = CConstant.booster_costs_coins_step;
         var _loc5_:Number = CConstant.coins_per_time_base;
         var _loc9_:Number = CConstant.coins_per_time_scale;
         var _loc10_:Number = CConstant.coins_per_time_level_scale;
         var _loc6_:Number = CConstant.coins_per_time_level_exp;
         var _loc4_:Number = Math.ceil((_loc5_ + _loc9_ * Math.pow(_loc10_ * (_loc7_ * 10 - 9),_loc6_)) * _loc3_ / _loc8_) * _loc8_;
         return Math.round(_loc4_);
      }
      
      public static function getHitPoints(param1:int) : int
      {
         var _loc2_:Number = CConstant.battle_hp_scale;
         var _loc3_:Number = _loc2_ * param1;
         return Math.round(_loc3_);
      }
      
      public static function getHitPointsString(param1:int) : String
      {
         return LocText.current.text("general/hitpoints",param1);
      }
      
      public static function getCriticalHitPercentage(param1:int, param2:int) : Number
      {
         var _loc8_:Number = CConstant.battle_critical_probability_min;
         var _loc6_:Number = CConstant.battle_critical_probability_base;
         var _loc3_:Number = CConstant.battle_critical_probability_max;
         var _loc4_:Number = CConstant.battle_critical_probability_exp_low;
         var _loc5_:Number = CConstant.battle_critical_probability_exp_high;
         var _loc9_:Number = param1 / param2;
         var _loc7_:* = 0;
         if(_loc9_ <= 1)
         {
            _loc7_ = Number(Math.pow(_loc9_,_loc4_) * (_loc6_ - _loc8_) + _loc8_);
         }
         else
         {
            _loc7_ = Number((1 - Math.pow(1 / _loc9_,_loc5_)) * (_loc3_ - _loc6_) + _loc6_);
         }
         return NumberUtil.roundDecimal(_loc7_,3);
      }
      
      public static function getDodgePercentage(param1:int, param2:int) : Number
      {
         var _loc5_:Number = CConstant.battle_dodge_probability_min;
         var _loc6_:Number = CConstant.battle_dodge_probability_base;
         var _loc4_:Number = CConstant.battle_dodge_probability_max;
         var _loc7_:Number = CConstant.battle_dodge_probability_exp_low;
         var _loc8_:Number = CConstant.battle_dodge_probability_exp_high;
         var _loc9_:Number = param1 / param2;
         var _loc3_:* = 0;
         if(_loc9_ <= 1)
         {
            _loc3_ = Number(Math.pow(_loc9_,_loc7_) * (_loc6_ - _loc5_) + _loc5_);
         }
         else
         {
            _loc3_ = Number((1 - Math.pow(1 / _loc9_,_loc8_)) * (_loc4_ - _loc6_) + _loc6_);
         }
         return NumberUtil.roundDecimal(_loc3_,3);
      }
      
      public static function getDamage(param1:int, param2:int, param3:int) : int
      {
         var _loc4_:Number = param1 + param2 + param3;
         return Math.round(_loc4_);
      }
      
      public static function getHonorString(param1:int, param2:Boolean = true) : String
      {
         if(param2 && param1 > 0)
         {
            return "+" + LocText.current.text("general/reward/honor_name",param1);
         }
         return LocText.current.text("general/reward/honor_name",param1);
      }
      
      public static function getArtifactString(param1:int) : String
      {
         return LocText.current.text("general/reward/artifact_name",param1);
      }
      
      public static function getXpString(param1:int) : String
      {
         return LocText.current.text("general/reward/xp_name",LocText.current.formatHugeNumber(param1));
      }
      
      public static function getStatPointString(param1:int) : String
      {
         return LocText.current.text("general/reward/stat_point_name",param1);
      }
      
      public static function getGameCurrencyString(param1:int) : String
      {
         return LocText.current.text("general/reward/coins_name",param1);
      }
      
      public static function getPremiumCurrencyString(param1:int) : String
      {
         return LocText.current.text("general/reward/premium_currency_name",param1);
      }
      
      public static function getGuildPremiumCurrencyString(param1:int) : String
      {
         return LocText.current.text("general/reward/guild_premium_currency_name",param1);
      }
      
      public static function getEnergyString(param1:int) : String
      {
         return LocText.current.text("general/energy_name",param1);
      }
      
      public static function getMovieEnergyString(param1:int) : String
      {
         return LocText.current.text("general/movie_energy",LocText.current.formatHugeNumber(param1));
      }
      
      public static function getMovieProgressString(param1:int) : String
      {
         return LocText.current.text("general/movie_progress",LocText.current.formatHugeNumber(param1));
      }
      
      public static function getLevelString(param1:int) : String
      {
         return LocText.current.text("general/level",param1);
      }
      
      public static function getItemCountString(param1:int) : String
      {
         return LocText.current.text("general/item",param1);
      }
      
      public static function getGuildMissileString(param1:int) : String
      {
         return LocText.current.text("general/guild/missile",param1);
      }
      
      public static function getGuildAutoJoinsString(param1:int) : String
      {
         return LocText.current.text("general/guild/auto_joins",param1);
      }
      
      public static function getGuildMemberCountString(param1:int) : String
      {
         return LocText.current.text("general/guild/member",param1);
      }
      
      public static function getGuildBattleCountString(param1:int) : String
      {
         return LocText.current.text("general/guild/battle",param1);
      }
      
      public static function getSlotmachineJetonCountString(param1:int) : String
      {
         return LocText.current.text("general/slot_machine/jetons",param1,CConstant.resource_slotmachine_jeton_usage_amount);
      }
      
      public static function getOpticalChangeResourceString(param1:int) : String
      {
         return LocText.current.text("general/optical_change_resource_name",param1);
      }
      
      public static function getFanFotoResourceString(param1:int) : String
      {
         return LocText.current.text("general/fan_foto_resource_name",param1);
      }
      
      public static function getStreamingResourceString(param1:int) : String
      {
         return LocText.current.text("general/streaming_resource_name",LocText.current.formatHugeNumber(param1));
      }
      
      public static function getQuestInstantFinishCost(param1:int) : int
      {
         if(param1 < CConstant.quest_instant_finish_range1_duration * 60)
         {
            return CConstant.quest_instant_finish_range1_premium_amount;
         }
         if(param1 < CConstant.quest_instant_finish_range2_duration * 60)
         {
            return CConstant.quest_instant_finish_range2_premium_amount;
         }
         if(param1 < CConstant.quest_instant_finish_range3_duration * 60)
         {
            return CConstant.quest_instant_finish_range3_premium_amount;
         }
         return CConstant.quest_instant_finish_range4_premium_amount;
      }
      
      public static function duelHonorWinReward(param1:int, param2:int) : int
      {
         var _loc5_:Number = CConstant.pvp_honor_win_exp_better;
         var _loc3_:Number = CConstant.pvp_honor_win_exp_worse;
         var _loc4_:* = 0;
         if(param1 > param2)
         {
            _loc4_ = Number(1 - Math.pow(param2 / param1,_loc3_));
         }
         else
         {
            _loc4_ = Number(-1 * (1 - Math.pow(param1 / param2,_loc5_)));
         }
         _loc4_ = Number(100 - _loc4_ * 100);
         return Math.round(_loc4_);
      }
      
      public static function duelHonorLostReward(param1:int, param2:int) : int
      {
         if(param1 == 0)
         {
            return 0;
         }
         var _loc4_:Number = CConstant.pvp_honor_lose_amount;
         var _loc6_:Number = CConstant.pvp_honor_lose_max;
         var _loc5_:Number = duelHonorWinReward(param1,param2);
         var _loc7_:* = 0;
         if(_loc4_ * _loc5_ < _loc6_ * param2)
         {
            _loc7_ = Number(_loc4_ * _loc5_);
         }
         else
         {
            _loc7_ = Number(_loc6_ * param2);
         }
         var _loc3_:int = Math.round(_loc7_);
         _loc3_ = _loc3_ * -1;
         return _loc3_;
      }
      
      public static function duelGameCurrencyWinReward(param1:int) : int
      {
         var _loc3_:Number = CConstant.pvp_waiting_time;
         var _loc2_:Number = CConstant.pvp_effectiveness_won;
         var _loc4_:Number = _loc3_ * gameCurrencyPerTime(param1) * _loc2_;
         return Math.round(_loc4_);
      }
      
      public static function gameCurrencyCostEnergyRefill(param1:int, param2:int) : int
      {
         var _loc4_:int = param2 / CConstant.quest_energy_refill_amount;
         var _loc3_:int = 0;
         switch(int(_loc4_))
         {
            case 0:
               _loc3_ = CConstant.quest_energy_refill1_cost_factor;
               break;
            case 1:
               _loc3_ = CConstant.quest_energy_refill2_cost_factor;
               break;
            case 2:
               _loc3_ = CConstant.quest_energy_refill3_cost_factor;
               break;
            case 3:
               _loc3_ = CConstant.quest_energy_refill4_cost_factor;
         }
         var _loc5_:Number = _loc3_ * gameCurrencyPerTime(param1);
         return Math.round(_loc5_);
      }
      
      public static function premiumCostEnergyRefill(param1:int) : int
      {
         var _loc2_:* = 1;
         if(param1 <= CConstant.quest_energy_refill_discount_1_max_level)
         {
            _loc2_ = Number(CConstant.quest_energy_refill_premium_amount_discount_1);
         }
         else if(param1 <= CConstant.quest_energy_refill_discount_2_max_level)
         {
            _loc2_ = Number(CConstant.quest_energy_refill_premium_amount_discount_2);
         }
         else if(param1 <= CConstant.quest_energy_refill_discount_3_max_level)
         {
            _loc2_ = Number(CConstant.quest_energy_refill_premium_amount_discount_3);
         }
         var _loc3_:int = Math.round(CConstant.quest_energy_refill_premium_amount * _loc2_);
         return _loc3_;
      }
      
      public static function getEnergyRefillDiscountMaxLevel(param1:int) : int
      {
         if(param1 <= CConstant.quest_energy_refill_discount_1_max_level)
         {
            return CConstant.quest_energy_refill_discount_1_max_level + 1;
         }
         if(param1 <= CConstant.quest_energy_refill_discount_2_max_level)
         {
            return CConstant.quest_energy_refill_discount_2_max_level + 1;
         }
         if(param1 <= CConstant.quest_energy_refill_discount_3_max_level)
         {
            return CConstant.quest_energy_refill_discount_3_max_level + 1;
         }
         return 0;
      }
      
      public static function getGoalRewardAmount(param1:int, param2:Number, param3:int) : int
      {
         var _loc11_:Number = NaN;
         var _loc10_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc8_:int = 0;
         var _loc7_:int = 0;
         var _loc9_:int = 0;
         var _loc6_:Number = NaN;
         var _loc4_:* = 0;
         switch(int(param1) - 1)
         {
            case 0:
               _loc11_ = gameCurrencyPerTime(param3);
               _loc10_ = CConstant.goal_reward_game_currency_time;
               _loc5_ = CConstant.goal_reward_game_currency_percentage_base;
               _loc5_ = _loc5_ * param2;
               _loc11_ = Math.round(_loc11_ * _loc5_ * _loc10_);
               _loc11_ = _loc11_ + Math.pow(param3,CConstant.goal_reward_game_currency_exp);
               return Math.round(_loc11_);
            case 1:
               _loc4_ = Number(CConstant.goal_reward_premium_currency_base);
               _loc4_ = Number(_loc4_ * param2);
               return Math.round(_loc4_);
            case 2:
               _loc4_ = Number(CConstant.goal_reward_stat_points_base);
               _loc4_ = Number(_loc4_ * param2);
               return Math.round(_loc4_);
            case 3:
               if(param3 >= CConstant.max_level)
               {
                  return 0;
               }
               _loc8_ = CLevel.fromId(param3).xp;
               _loc7_ = CLevel.fromId(param3 + 1).xp;
               _loc9_ = _loc7_ - _loc8_;
               _loc6_ = CConstant.goal_reward_xp_percentage_base;
               _loc6_ = _loc6_ * param2;
               return Math.round(_loc9_ * _loc6_);
            case 4:
               return 0;
            case 5:
            case 6:
               _loc4_ = Number(CConstant.goal_reward_energy_base);
               _loc4_ = Number(_loc4_ * param2);
               return Math.round(_loc4_);
         }
      }
      
      public static function getItemPatternRewardAmount(param1:int, param2:Number) : int
      {
         var _loc3_:int = 0;
         switch(int(param1) - 1)
         {
            case 0:
               _loc3_ = CConstant.item_pattern_reward_stat_points_base;
               _loc3_ = _loc3_ * Math.round(param2);
               return _loc3_;
            case 1:
               return 0;
            case 2:
               _loc3_ = CConstant.item_pattern_reward_energy_base;
               _loc3_ = _loc3_ * Math.round(param2);
               return _loc3_;
         }
      }
      
      public static function guildBattleCost(param1:Number) : int
      {
         var _loc2_:int = CGuildBattleAttackCost.fromId(Math.floor(param1)).gameCurrencyCost;
         return _loc2_;
      }
      
      public static function guildBattleHonorWinReward(param1:int, param2:int) : int
      {
         return duelHonorWinReward(param1,param2) * 10;
      }
      
      public static function guildBattleHonorLostReward(param1:int, param2:int) : int
      {
         return duelHonorLostReward(param1,param2) * 10;
      }
      
      public static function roundDuration(param1:int) : int
      {
         if(param1 < 60)
         {
            return 60;
         }
         var _loc3_:int = 60;
         var _loc2_:int = param1 % _loc3_;
         if(_loc2_ == 0)
         {
            return param1;
         }
         if(_loc2_ < _loc3_ / 2)
         {
            return param1 - _loc2_;
         }
         return param1 - _loc2_ + _loc3_;
      }
      
      public static function getConventionShowInstantFinishCost(param1:int) : int
      {
         return CConstant.convention_instant_finish_premium_amount * param1;
      }
      
      public static function getHint(param1:int) : String
      {
         var _loc4_:* = null;
         var _loc2_:Vector.<String> = new Vector.<String>();
         var _loc6_:int = 0;
         var _loc5_:* = CHint.ids;
         for each(var _loc3_ in CHint.ids)
         {
            _loc4_ = CHint.fromId(_loc3_);
            if(_loc4_.requiredLevel <= param1 && (_loc4_.maxLevel >= param1 || _loc4_.maxLevel == 0))
            {
               _loc2_.push(_loc3_);
            }
         }
         _loc2_.sort(shuffleVector);
         return LocText.current.text("hint/" + _loc2_.pop() + "/text");
      }
      
      private static function shuffleVector(param1:Object, param2:Object) : int
      {
         return Math.floor(Math.random() * 3 - 1);
      }
      
      public static function matchesRef(param1:String, param2:String, param3:String) : Boolean
      {
         return param1.indexOf(param2) === 0 && param1.charAt(param1.length - 4) === "-" && param1.charAt(param1.length - 3) === param3;
      }
      
      public static function itemPatternSewPrice(param1:int, param2:int, param3:int) : int
      {
         var _loc4_:Number = NaN;
         if(param1 == 1)
         {
            _loc4_ = param2 * CConstant.sewing_machine_common_game_currency_factor;
            return Math.round(_loc4_);
         }
         var _loc5_:* = param3;
         if(_loc5_ == 0)
         {
            switch(int(param1) - 2)
            {
               case 0:
                  _loc5_ = int(CConstant.sewing_machine_rare_premium_currency_amount);
                  break;
               case 1:
                  _loc5_ = int(CConstant.sewing_machine_epic_premium_currency_amount);
            }
         }
         return _loc5_;
      }
      
      public static function getQuestRefreshCost(param1:Boolean, param2:int) : int
      {
         var _loc4_:int = CConstant.quest_refresh_single_stage_premium_currency_amount;
         var _loc3_:Number = CConstant.quest_refresh_all_stages_reduction_factor;
         if(!param1)
         {
            return _loc4_;
         }
         return Math.round(_loc4_ + param2 * _loc3_);
      }
      
      public static function getStatString(param1:int, param2:int) : String
      {
         switch(int(param1) - 1)
         {
            case 0:
               return LocText.current.formatHugeNumber(param2) + " " + getStatName(param1);
            case 1:
               return LocText.current.formatHugeNumber(param2) + " " + getStatName(param1);
            case 2:
               return LocText.current.formatHugeNumber(param2) + " " + getStatName(param1);
            case 3:
               return LocText.current.formatHugeNumber(param2) + " " + getStatName(param1);
            case 4:
               return LocText.current.formatHugeNumber(param2) + " " + getStatName(param1);
            case 5:
               return LocText.current.formatHugeNumber(param2) + " " + getStatName(param1);
         }
      }
      
      public static function getStatName(param1:int) : String
      {
         switch(int(param1) - 1)
         {
            case 0:
               return LocText.current.text("general/stat_stamina");
            case 1:
               return LocText.current.text("general/stat_strength");
            case 2:
               return LocText.current.text("general/stat_critical_rating");
            case 3:
               return LocText.current.text("general/stat_dodge_rating");
            case 4:
               return LocText.current.text("general/stat_weapon_damage");
            case 5:
               return LocText.current.text("general/stat_missile_damage");
         }
      }
      
      public static function questGameCurrencyReward(param1:int, param2:int, param3:int, param4:Number = 1, param5:Number = 0) : int
      {
         if(param2 == 1)
         {
            return 5;
         }
         var _loc6_:* = 0;
         switch(int(param3) - 1)
         {
            case 0:
               _loc6_ = Number(CConstant.quest_reward_coin_scale_balanced);
               break;
            case 1:
               _loc6_ = Number(CConstant.quest_reward_coin_scale_xp_heavy);
               break;
            case 2:
               _loc6_ = Number(CConstant.quest_reward_coin_scale_coin_heavy);
               break;
            case 3:
               _loc6_ = Number(CConstant.quest_reward_coin_scale_item);
         }
         var _loc7_:Number = param1 * gameCurrencyPerTime(param2) * _loc6_ * param4;
         return Math.round(_loc7_ * (1 + param5));
      }
      
      public static function getCustomBannerRewardAmount(param1:String, param2:Object, param3:int) : int
      {
         var _loc4_:* = param1;
         if("game_currency" !== _loc4_)
         {
            return 0;
         }
         return questGameCurrencyReward(param2 as int,param3,1,1,0);
      }
      
      public static function getCustomBannerRewardString(param1:String, param2:Object, param3:int) : String
      {
         var _loc4_:* = param1;
         if("game_currency" !== _loc4_)
         {
            return null;
         }
         return LocText.current.text("custom_banner/game_currency_reward",LocText.current.formatHugeNumber(getCustomBannerRewardAmount(param1,param2,param3)));
      }
      
      public static function doesItemNeedGenderSuffix(param1:String) : Boolean
      {
         var _loc2_:CItemTemplate = CItemTemplate.fromId(param1);
         if(!_loc2_)
         {
            return false;
         }
         var _loc3_:String = _loc2_.gender;
         if(_loc3_ == "u")
         {
            return false;
         }
         return true;
      }
      
      public static function compressAvatarImageSettings(param1:AppearanceSettings, param2:Vector.<String>) : String
      {
         var _loc9_:int = 0;
         var _loc14_:* = null;
         var _loc4_:String = param1.gender;
         var _loc5_:String = "g:" + _loc4_ + ";";
         var _loc12_:* = 0;
         var _loc3_:Array = ["hair_type","hair_color","eyebrows_type","facial_hair_type","decoration_type"];
         _loc9_ = 0;
         while(_loc9_ < _loc3_.length)
         {
            _loc12_ = _loc12_ | param1.getInt(_loc3_[_loc9_]) << _loc9_ * 6;
            _loc9_++;
         }
         _loc5_ = _loc5_ + ("b:" + _loc12_ + ";");
         _loc12_ = 0;
         var _loc8_:Array = ["eyebrows_color","facial_hair_color"];
         _loc9_ = 0;
         while(_loc9_ < _loc8_.length)
         {
            _loc12_ = _loc12_ | param1.getInt(_loc8_[_loc9_]) << _loc9_ * 6;
            _loc9_++;
         }
         _loc5_ = _loc5_ + ("b2:" + _loc12_ + ";");
         _loc12_ = 0;
         var _loc11_:Array = ["skin_color","head_type","eyes_type","nose_type","mouth_type"];
         _loc9_ = 0;
         while(_loc9_ < _loc11_.length)
         {
            _loc12_ = _loc12_ | param1.getInt(_loc11_[_loc9_]) << _loc9_ * 6;
            _loc9_++;
         }
         _loc5_ = _loc5_ + ("s:" + _loc12_ + ";");
         _loc12_ = 0;
         var _loc13_:Array = ["tattoo_arm_left","tattoo_arm_right","tattoo_body","tattoo_leg_left","tattoo_leg_right"];
         _loc9_ = 0;
         while(_loc9_ < _loc13_.length)
         {
            _loc12_ = _loc12_ | param1.getInt(_loc13_[_loc9_]) << _loc9_ * 6;
            _loc9_++;
         }
         _loc5_ = _loc5_ + ("tt:" + _loc12_ + ";");
         _loc12_ = 0;
         var _loc6_:Array = ["bra_type","panties_type","genitals_type","genitals_hair_type","genitals_hair_color"];
         _loc9_ = 0;
         while(_loc9_ < _loc6_.length)
         {
            _loc12_ = _loc12_ | param1.getInt(_loc6_[_loc9_]) << _loc9_ * 6;
            _loc9_++;
         }
         _loc5_ = _loc5_ + ("uw:" + _loc12_ + ";");
         _loc12_ = 0;
         var _loc15_:Array = ["photo_rect_type","photo_border_type","photo_background_type","photo_filter_type","photo_icon_type"];
         _loc9_ = 0;
         while(_loc9_ < _loc15_.length)
         {
            _loc12_ = _loc12_ | param1.getInt(_loc15_[_loc9_]) << _loc9_ * 6;
            _loc9_++;
         }
         _loc5_ = _loc5_ + ("p:" + _loc12_ + ";");
         _loc12_ = 0;
         var _loc7_:Array = ["photo_sexuality_type"];
         _loc9_ = 0;
         while(_loc9_ < _loc7_.length)
         {
            _loc12_ = _loc12_ | param1.getInt(_loc7_[_loc9_]) << _loc9_ * 6;
            _loc9_++;
         }
         _loc5_ = _loc5_ + ("p2:" + _loc12_ + ";");
         var _loc17_:int = 0;
         var _loc16_:* = param2;
         for each(var _loc10_ in param2)
         {
            if(!(_loc10_ == "head" && !param1.show_head_item))
            {
               if(_loc10_ == "chest" && !param1.show_chest_item)
               {
                  if(_loc4_ == "f" && param1.hasData(_loc10_,true))
                  {
                     _loc5_ = _loc5_ + (getAppearanceShortForm("bra_quality") + ":" + CItemTemplate.fromId(param1.getString(_loc10_)).quality + ";");
                  }
               }
               else if(!(_loc10_ == "belt" && !param1.show_belt_item))
               {
                  if(!(_loc10_ == "legs" && !param1.show_legs_item))
                  {
                     if(!(_loc10_ == "boots" && !param1.show_boots_item))
                     {
                        if(param1[_loc10_] != null)
                        {
                           _loc14_ = getAppearanceShortForm(_loc10_);
                           _loc5_ = _loc5_ + (_loc14_ + ":" + param1[_loc10_] + ";");
                        }
                     }
                  }
               }
            }
         }
         return _loc5_;
      }
      
      public static function compressMovieCoverSettings(param1:MovieCoverSettings, param2:Array) : String
      {
         var _loc9_:int = 0;
         var _loc14_:* = null;
         var _loc4_:String = param1.gender;
         var _loc5_:String = "g:" + _loc4_ + ";";
         _loc5_ = _loc5_ + ("t:" + param1.title + ";");
         var _loc12_:* = 0;
         var _loc3_:Array = ["hair_type","hair_color","eyebrows_type","facial_hair_type","decoration_type"];
         _loc9_ = 0;
         while(_loc9_ < _loc3_.length)
         {
            _loc12_ = _loc12_ | param1.getInt(_loc3_[_loc9_]) << _loc9_ * 6;
            _loc9_++;
         }
         _loc5_ = _loc5_ + ("b:" + _loc12_ + ";");
         _loc12_ = 0;
         var _loc8_:Array = ["eyebrows_color","facial_hair_color"];
         _loc9_ = 0;
         while(_loc9_ < _loc8_.length)
         {
            _loc12_ = _loc12_ | param1.getInt(_loc8_[_loc9_]) << _loc9_ * 6;
            _loc9_++;
         }
         _loc5_ = _loc5_ + ("b2:" + _loc12_ + ";");
         _loc12_ = 0;
         var _loc11_:Array = ["skin_color","head_type","eyes_type","nose_type","mouth_type"];
         _loc9_ = 0;
         while(_loc9_ < _loc11_.length)
         {
            _loc12_ = _loc12_ | param1.getInt(_loc11_[_loc9_]) << _loc9_ * 6;
            _loc9_++;
         }
         _loc5_ = _loc5_ + ("s:" + _loc12_ + ";");
         _loc12_ = 0;
         var _loc13_:Array = ["tattoo_arm_left","tattoo_arm_right","tattoo_body","tattoo_leg_left","tattoo_leg_right"];
         _loc9_ = 0;
         while(_loc9_ < _loc13_.length)
         {
            _loc12_ = _loc12_ | param1.getInt(_loc13_[_loc9_]) << _loc9_ * 6;
            _loc9_++;
         }
         _loc5_ = _loc5_ + ("tt:" + _loc12_ + ";");
         _loc12_ = 0;
         var _loc6_:Array = ["bra_type","panties_type","genitals_type","genitals_hair_type","genitals_hair_color"];
         _loc9_ = 0;
         while(_loc9_ < _loc6_.length)
         {
            _loc12_ = _loc12_ | param1.getInt(_loc6_[_loc9_]) << _loc9_ * 6;
            _loc9_++;
         }
         _loc5_ = _loc5_ + ("uw:" + _loc12_ + ";");
         _loc12_ = 0;
         var _loc15_:Array = ["cover_rect_type","cover_border_type","cover_background_type","cover_layout_type","cover_actor_type"];
         _loc9_ = 0;
         while(_loc9_ < _loc15_.length)
         {
            _loc12_ = _loc12_ | param1.getInt(_loc15_[_loc9_]) << _loc9_ * 6;
            _loc9_++;
         }
         _loc5_ = _loc5_ + ("c:" + _loc12_ + ";");
         _loc12_ = 0;
         var _loc7_:Array = ["cover_filter_type","cover_layout_new_type","cover_font_type"];
         _loc9_ = 0;
         while(_loc9_ < _loc7_.length)
         {
            _loc12_ = _loc12_ | param1.getInt(_loc7_[_loc9_]) << _loc9_ * 6;
            _loc9_++;
         }
         _loc5_ = _loc5_ + ("c2:" + _loc12_ + ";");
         var _loc17_:int = 0;
         var _loc16_:* = param2;
         for each(var _loc10_ in param2)
         {
            if(!(_loc10_ == "head" && !param1.show_head_item))
            {
               if(_loc10_ == "chest" && !param1.show_chest_item)
               {
                  if(_loc4_ == "f" && param1.hasData(_loc10_,true))
                  {
                     _loc5_ = _loc5_ + (getAppearanceShortForm("bra_quality") + ":" + CItemTemplate.fromId(param1.getString(_loc10_)).quality + ";");
                  }
               }
               else if(!(_loc10_ == "belt" && !param1.show_belt_item))
               {
                  if(!(_loc10_ == "legs" && !param1.show_legs_item))
                  {
                     if(!(_loc10_ == "boots" && !param1.show_boots_item))
                     {
                        if(param1.hasData(_loc10_,true))
                        {
                           _loc14_ = getAppearanceShortForm(_loc10_);
                           _loc5_ = _loc5_ + (_loc14_ + ":" + param1.getData(_loc10_) + ";");
                        }
                     }
                  }
               }
            }
         }
         _loc5_ = _loc5_ + ("hba:" + AppEnvironment.appPlatform.isHideBraAllowed + ";");
         _loc5_ = _loc5_ + ("hpa:" + AppEnvironment.appPlatform.isHidePantiesAllowed + ";");
         return _loc5_;
      }
      
      private static function getAppearanceShortForm(param1:String) : String
      {
         var _loc2_:* = param1;
         switch(_loc2_)
         {
            case "head":
               return "ih";
            case "chest":
               return "ic";
            case "legs":
               return "il";
            case "belt":
               return "ib";
            case "boots":
               return "ibo";
            case "bra_quality":
               return "bq";
            default:
               return "";
         }
      }
      
      public static function getMovieExtendTimeGameCurrengy(param1:int) : int
      {
         var _loc2_:int = CConstant.movie_extend_time_refill_cost_factor;
         var _loc3_:Number = _loc2_ * gameCurrencyPerTime(param1);
         return Math.round(_loc3_);
      }
      
      public static function getMovieExtendTimePremiumCurrengy(param1:int) : int
      {
         var _loc2_:* = 1;
         if(param1 <= CConstant.movie_extend_time_discount_1_max_level)
         {
            _loc2_ = Number(CConstant.movie_extend_time_premium_amount_discount_1);
         }
         else if(param1 <= CConstant.movie_extend_time_discount_2_max_level)
         {
            _loc2_ = Number(CConstant.movie_extend_time_premium_amount_discount_2);
         }
         else if(param1 <= CConstant.movie_extend_time_discount_3_max_level)
         {
            _loc2_ = Number(CConstant.movie_extend_time_premium_amount_discount_3);
         }
         var _loc3_:int = Math.round(CConstant.movie_extend_time_premium_amount * _loc2_);
         return _loc3_;
      }
      
      public static function getMovieExtendTimeDiscountMaxLevel(param1:int) : int
      {
         if(param1 <= CConstant.quest_energy_refill_discount_1_max_level)
         {
            return CConstant.quest_energy_refill_discount_1_max_level + 1;
         }
         if(param1 <= CConstant.quest_energy_refill_discount_2_max_level)
         {
            return CConstant.quest_energy_refill_discount_2_max_level + 1;
         }
         if(param1 <= CConstant.quest_energy_refill_discount_3_max_level)
         {
            return CConstant.quest_energy_refill_discount_3_max_level + 1;
         }
         return 0;
      }
      
      public static function getSenseBoosterDurationString(param1:int = -1) : String
      {
         if(param1 == -1)
         {
            param1 = CConstant.booster_sense_duration;
         }
         if(Environment.info.defaultLocale == "pl_PL")
         {
            return TimeUtil.secondsToString(param1);
         }
         return TimeUtil.getHourString(param1 / 3600);
      }
      
      public static function getDungeonUnlockFansCount(param1:String) : int
      {
         var _loc2_:CDungeonTemplate = CDungeonTemplate.fromId(param1);
         var _loc3_:CDungeonTemplateLevel = _loc2_.getLevel(1);
         return _loc3_.minFans;
      }
      
      public static function getDungeonPreviewImageUrl(param1:String) : String
      {
         return ServerInfo.assetURL("dungeons/" + param1 + "_preview","png");
      }
      
      public static function numMissionsInDungeon(param1:String) : int
      {
         var _loc2_:int = 0;
         var _loc5_:int = 0;
         var _loc4_:* = CDungeonQuestTemplate.ids;
         for each(var _loc3_ in CDungeonQuestTemplate.ids)
         {
            if(_loc3_.indexOf(param1) == 0)
            {
               _loc2_++;
            }
         }
         return _loc2_;
      }
      
      public static function getBattleSkillIconIdentifierFromBattleEffect(param1:int) : String
      {
         var _loc2_:int = BattleEffect.getBattleSkillId(param1);
         return CBattleSkill.fromId(_loc2_).identifier;
      }
      
      public static function calculateStatQuestWinChance(param1:Character, param2:int, param3:int, param4:Number = 0) : int
      {
         var _loc5_:* = null;
         var _loc11_:Array = [CConstant.quest_stat_base_easy,CConstant.quest_stat_base_medium,CConstant.quest_stat_base_hard];
         var _loc10_:Number = _loc11_[param3 - 1];
         var _loc12_:Number = CConstant.quest_stat_factor_increase;
         var _loc15_:int = 0;
         switch(int(param2) - 1)
         {
            case 0:
               _loc15_ = 2;
               break;
            case 1:
               _loc15_ = 3;
               break;
            case 2:
               _loc15_ = 4;
               break;
            case 3:
               _loc15_ = 5;
         }
         var _loc14_:Outfit = param1.outfits.getOutfitWithSetting(_loc15_);
         var _loc6_:Array = [];
         if(_loc14_)
         {
            _loc5_ = param1.outfits.getCharacterStatsWithOutfit(param1,_loc14_);
            _loc6_[1] = _loc5_.getInt("stat_total_stamina");
            _loc6_[2] = _loc5_.getInt("stat_total_strength");
            _loc6_[3] = _loc5_.getInt("stat_total_critical_rating");
            _loc6_[4] = _loc5_.getInt("stat_total_dodge_rating");
         }
         else
         {
            _loc6_[1] = param1.statTotalStamina;
            _loc6_[2] = param1.statTotalStrength;
            _loc6_[3] = param1.statTotalCriticalRating;
            _loc6_[4] = param1.statTotalDodgeRating;
         }
         var _loc8_:int = Math.round(CConstant.quest_stat_multiplier_1 * Math.pow(param1.level,2) + CConstant.quest_stat_multiplier_2 * param1.level);
         var _loc9_:int = Math.round(_loc8_ / 4);
         var _loc13_:int = _loc6_[param2];
         var _loc7_:Number = _loc10_ + _loc13_ / _loc9_ * _loc12_;
         if(param4 > 0)
         {
            _loc7_ = _loc7_ - 10 * param4;
         }
         return Math.round(_loc7_ * 10);
      }
      
      public static function calculateNeededSatForStatQuest(param1:Character, param2:int, param3:int, param4:Number = 0) : int
      {
         var _loc8_:Array = [CConstant.quest_stat_base_easy,CConstant.quest_stat_base_medium,CConstant.quest_stat_base_hard];
         var _loc7_:Number = _loc8_[param3 - 1];
         var _loc5_:int = Math.round(CConstant.quest_stat_multiplier_1 * Math.pow(param1.level,2) + CConstant.quest_stat_multiplier_2 * param1.level);
         var _loc6_:int = Math.round(_loc5_ / 4);
         if(param4 > 0)
         {
            return Math.ceil(_loc6_ / 0.15 * (100 - _loc7_ + 10 * param4) / 100);
         }
         return Math.ceil(_loc6_ / 0.15 * (100 - _loc7_) / 100);
      }
      
      public static function getCharacterStages(param1:Character) : Vector.<int>
      {
         var _loc3_:int = 0;
         var _loc2_:Vector.<int> = new Vector.<int>(0);
         _loc3_ = 1;
         while(_loc3_ <= param1.maxQuestStage)
         {
            _loc2_.push(_loc3_);
            _loc3_++;
         }
         _loc2_ = _loc2_.concat(getCustomStages(param1.level));
         return _loc2_;
      }
      
      public static function getCustomStages(param1:int = -1) : Vector.<int>
      {
         var _loc5_:* = null;
         var _loc3_:Vector.<int> = new Vector.<int>(0);
         var _loc4_:String = Environment.info.defaultLocale;
         var _loc7_:int = 0;
         var _loc6_:* = CCustomStage.ids;
         for each(var _loc2_ in CCustomStage.ids)
         {
            _loc5_ = CCustomStage.fromId(_loc2_);
            if((_loc5_.locales.indexOf("all") != -1 || _loc5_.locales.indexOf(_loc4_) != -1) && (param1 == -1 || param1 >= _loc5_.minLevel))
            {
               _loc3_.push(_loc5_.stage);
            }
         }
         return _loc3_;
      }
      
      public static function isCustomStageUnlocked(param1:Character, param2:int) : Boolean
      {
         var _loc5_:* = null;
         var _loc4_:String = Environment.info.defaultLocale;
         var _loc7_:int = 0;
         var _loc6_:* = CCustomStage.ids;
         for each(var _loc3_ in CCustomStage.ids)
         {
            _loc5_ = CCustomStage.fromId(_loc3_);
            if(!(_loc5_.locales.indexOf("all") == -1 && _loc5_.locales.indexOf(_loc4_) == -1))
            {
               if(_loc5_.stage == param2)
               {
                  return param1.level >= _loc5_.minLevel;
               }
            }
         }
         return false;
      }
      
      public static function getHighestConventionRewardValue(param1:int) : int
      {
         var _loc3_:* = null;
         var _loc5_:int = 0;
         var _loc2_:* = 0;
         var _loc7_:int = 0;
         var _loc6_:* = CConventionReward.ids;
         for each(var _loc4_ in CConventionReward.ids)
         {
            _loc3_ = CConventionReward.fromId(_loc4_);
            _loc5_ = 0;
            if(!(int(param1) - 1))
            {
               _loc5_ = _loc3_.reward1Value;
            }
            if(_loc5_ > _loc2_)
            {
               _loc2_ = _loc5_;
            }
         }
         return _loc2_;
      }
      
      public static function getQuestStageUnlockLevel(param1:int) : int
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         if(param1 > CConstant.quest_max_stage)
         {
            _loc3_ = Environment.info.defaultLocale;
            var _loc6_:int = 0;
            var _loc5_:* = CCustomStage.ids;
            for each(var _loc2_ in CCustomStage.ids)
            {
               _loc4_ = CCustomStage.fromId(_loc2_);
               if(!(_loc4_.locales.indexOf("all") == -1 && _loc4_.locales.indexOf(_loc3_) == -1))
               {
                  if(_loc4_.stage == param1)
                  {
                     return _loc4_.minLevel;
                  }
               }
            }
         }
         if(param1 == 2)
         {
            return 10;
         }
         if(param1 == 3)
         {
            return 30;
         }
         if(param1 == 4)
         {
            return 70;
         }
         if(param1 == 5)
         {
            return 110;
         }
         if(param1 == 6)
         {
            return 150;
         }
         if(param1 == 7)
         {
            return 200;
         }
         if(param1 == 8)
         {
            return 250;
         }
         if(param1 == 9)
         {
            return 300;
         }
         return 1;
      }
      
      public static function getEventQuestObjectiveRewardAmount(param1:int, param2:Number, param3:int) : int
      {
         var _loc10_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc11_:Number = NaN;
         var _loc6_:int = 0;
         var _loc5_:int = 0;
         var _loc7_:int = 0;
         var _loc9_:Number = NaN;
         var _loc4_:int = 0;
         switch(int(param1) - 1)
         {
            case 0:
               _loc10_ = gameCurrencyPerTime(param3);
               _loc8_ = CConstant.event_quest_objective_reward_game_currency_time;
               _loc11_ = CConstant.event_quest_objective_reward_game_currency_percentage_base;
               _loc11_ = _loc11_ * param2;
               _loc10_ = Math.round(_loc10_ * _loc11_ * _loc8_);
               _loc10_ = _loc10_ + Math.pow(param3,CConstant.event_quest_objective_reward_game_currency_exp);
               return Math.round(_loc10_);
            case 1:
               _loc4_ = CConstant.event_quest_objective_reward_premium_currency_base;
               _loc4_ = _loc4_ * Math.round(param2);
               return _loc4_;
            case 2:
               _loc4_ = CConstant.event_quest_objective_reward_stat_points_base;
               _loc4_ = _loc4_ * Math.round(param2);
               return _loc4_;
            case 3:
               if(param3 >= CConstant.max_level)
               {
                  return 0;
               }
               _loc6_ = CLevel.fromId(param3).xp;
               _loc5_ = CLevel.fromId(param3 + 1).xp;
               _loc7_ = _loc5_ - _loc6_;
               _loc9_ = CConstant.event_quest_objective_reward_xp_percentage_base;
               _loc9_ = _loc9_ * param2;
               return Math.round(_loc7_ * _loc9_);
         }
      }
      
      public static function getOpticalChangeRewardAmount(param1:int, param2:Number) : int
      {
         var _loc3_:int = 0;
         switch(int(param1) - 1)
         {
            case 0:
               _loc3_ = CConstant.optical_changes_reward_stat_points_base;
               _loc3_ = _loc3_ * Math.round(param2);
               return _loc3_;
            case 1:
               return 0;
            case 2:
               _loc3_ = CConstant.optical_changes_reward_energy_base;
               _loc3_ = _loc3_ * Math.round(param2);
               return _loc3_;
         }
      }
   }
}
