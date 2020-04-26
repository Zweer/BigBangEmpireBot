package com.playata.application.ui.elements.stats
{
   import com.playata.application.data.GameUtil;
   import com.playata.application.data.character.Character;
   import com.playata.application.data.constants.CConstant;
   import com.playata.application.data.user.User;
   import com.playata.application.messaging.Message;
   import com.playata.application.messaging.MessageRouter;
   import com.playata.application.ui.ViewManager;
   import com.playata.application.ui.elements.generic.button.UiPlusButton;
   import com.playata.application.ui.elements.generic.textfield.UiTextTooltip;
   import com.playata.framework.application.Environment;
   import com.playata.framework.application.request.ActionRequestResponse;
   import com.playata.framework.core.TypedObject;
   import com.playata.framework.core.collection.IntMap;
   import com.playata.framework.core.util.NumberUtil;
   import com.playata.framework.display.DisplayObjectFactory;
   import com.playata.framework.display.IDisplayObject;
   import com.playata.framework.display.IQuad;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.elements.stats.SymbolStatBarFillGeneric;
   import visuals.ui.elements.stats.SymbolStatBarGeneric;
   
   public class UiStatBar
   {
      
      public static const INIT_BAR_WIDTH:int = 1;
      
      public static const MAX_BAR_WIDTH:int = 76;
      
      private static const COLOR_A_MAX:int = 50;
      
      private static const COLOR_B_MAX:int = 100;
      
      private static const COLOR_C_MAX:int = 200;
      
      private static const COLOR_D_MAX:int = 400;
      
      private static const COLOR_E_MAX:int = 600;
      
      private static const COLOR_F_MAX:int = 1000;
      
      private static const COLOR_G_MAX:int = 2000;
      
      private static const COLOR_H_MAX:int = 5000;
      
      private static const COLOR_I_MAX:int = 8000;
      
      private static const COLOR_J_MAX:int = 12000;
      
      private static const COLOR_K_MAX:int = 16000;
      
      private static const COLOR_L_MAX:int = 20000;
      
      private static const COLOR_M_MAX:int = 24000;
      
      private static const COLOR_N_MAX:int = 30000;
      
      private static const COLOR_O_MAX:int = 36000;
      
      private static const COLOR_P_MAX:int = 42000;
      
      private static const COLOR_Q_MAX:int = 48000;
      
      private static const COLOR_R_MAX:int = 54000;
      
      private static const COLOR_S_MAX:int = 60000;
      
      private static const COLOR_T_MAX:int = 70000;
      
      private static const COLOR_U_MAX:int = 80000;
      
      private static var STEPS:IntMap = new IntMap();
      
      private static var STEP_KEYS:Vector.<int> = null;
       
      
      private var _content:SymbolStatBarGeneric = null;
      
      private var _btnIncrease:UiPlusButton = null;
      
      private var _statType:int = 0;
      
      private var _currentBoughtValue:int = 0;
      
      private var _currentValue:int = 0;
      
      private var _tooltip:UiTextTooltip = null;
      
      private var _lastAction:int = 0;
      
      private var _enableIncrease:Boolean = true;
      
      private var _enableHighlight:Boolean = true;
      
      private var _fastSkillEnabled:Boolean = false;
      
      public function UiStatBar(param1:SymbolStatBarGeneric, param2:int, param3:Boolean = true)
      {
         super();
         _content = param1;
         _statType = param2;
         _enableHighlight = param3;
         var _loc4_:IQuad = DisplayObjectFactory.createQuadFromSettings({
            "x":0,
            "y":0,
            "width":_content.fillBase.width,
            "height":_content.fillBase.height
         });
         _content.fillBase.addChild(_loc4_);
         _content.fillBase.mask = _loc4_;
         _tooltip = new UiTextTooltip(_content.tooltipLayer,getStatTooltip(_statType,null));
         _btnIncrease = new UiPlusButton(_content.btnIncrease,"",onClickIncrease);
         if(_enableHighlight)
         {
            MessageRouter.addListener("UiStatBarMessage.notifyHighlight",handleMessages);
            MessageRouter.addListener("UiStatBarMessage.notifyUnhighlight",handleMessages);
         }
         _content.iconStamina.visible = param2 == 1;
         _content.iconStrength.visible = param2 == 2;
         _content.iconCriticalHitRating.visible = param2 == 3;
         _content.iconDodgeRating.visible = param2 == 4;
      }
      
      public static function setStatFill(param1:int, param2:SymbolStatBarFillGeneric, param3:Number) : void
      {
         var _loc7_:* = null;
         var _loc9_:* = null;
         var _loc8_:* = 0;
         var _loc6_:* = 0;
         var _loc5_:* = 0;
         var _loc12_:int = 0;
         var _loc11_:* = stepKeys;
         for each(var _loc4_ in stepKeys)
         {
            _loc7_ = param2.getChildByName(steps.getData(_loc4_));
            _loc7_.visible = false;
         }
         var _loc10_:IDisplayObject = null;
         var _loc14_:int = 0;
         var _loc13_:* = stepKeys;
         for each(_loc4_ in stepKeys)
         {
            _loc10_ = param2.getChildByName(steps.getData(_loc4_));
            if(_loc9_ == null && param1 <= _loc4_)
            {
               _loc8_ = int(param1 - _loc5_);
               _loc9_ = _loc10_;
               _loc6_ = int(_loc4_ - _loc5_);
               break;
            }
            _loc5_ = _loc4_;
         }
         if(_loc9_ == null)
         {
            _loc9_ = param2.getChildByName(steps.getData(stepKeys[stepKeys.length - 1]));
            _loc8_ = _loc5_;
            _loc6_ = _loc5_;
         }
         _loc9_.visible = true;
         param2.mask.width = 1 + Math.round(_loc8_ / _loc6_ * param3);
      }
      
      public static function getStatTooltip(param1:int, param2:Character, param3:Character = null) : String
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         if(param2 != null)
         {
            if(param2 == User.current.character)
            {
               _loc4_ = getLowValue(3,param2);
               _loc5_ = getLowValue(4,param2);
               if(param3 != null)
               {
                  _loc4_ = param3.statTotalCriticalRating;
                  _loc5_ = param3.statTotalDodgeRating;
               }
               switch(int(param1) - 1)
               {
                  case 0:
                     return LocText.current.text("general/toughness_tooltip",LocText.current.formatHugeNumber(param2.statBaseStamina),LocText.current.formatHugeNumber(param2.itemStamina),LocText.current.formatHugeNumber(param2.boosterStamina),LocText.current.formatHugeNumber(param2.guildBoosterStamina),LocText.current.formatHugeNumber(param2.statTotalStamina),GameUtil.getHitPointsString(GameUtil.getHitPoints(param2.statTotalStamina)),LocText.current.formatHugeNumber(param2.battleSkillStamina));
                  case 1:
                     return LocText.current.text("general/brawn_tooltip",LocText.current.formatHugeNumber(param2.statBaseStrength),LocText.current.formatHugeNumber(param2.itemStrength),LocText.current.formatHugeNumber(param2.boosterStrength),LocText.current.formatHugeNumber(param2.guildBoosterStrength),LocText.current.formatHugeNumber(param2.statTotalStrength),LocText.current.formatHugeNumber(param2.statWeaponDamage),LocText.current.formatHugeNumber(param2.missilesDamage),LocText.current.formatHugeNumber(GameUtil.getDamage(param2.statWeaponDamage,param2.missilesDamage,param2.statTotalStrength)),LocText.current.formatHugeNumber(param2.battleSkillStrength));
                  case 2:
                     return LocText.current.text("general/brain_tooltip",LocText.current.formatHugeNumber(param2.statBaseCriticalRating),LocText.current.formatHugeNumber(param2.itemCriticalRating),LocText.current.formatHugeNumber(param2.boosterCriticalRating),LocText.current.formatHugeNumber(param2.guildBoosterCriticalRating),LocText.current.formatHugeNumber(param2.statTotalCriticalRating),NumberUtil.roundDecimal(GameUtil.getCriticalHitPercentage(param2.statTotalCriticalRating,_loc4_) * 100,2).toString().replace(".",LocText.current.text("base/numbers/comma_separator")),LocText.current.formatHugeNumber(_loc4_),LocText.current.formatHugeNumber(param2.battleSkillCriticalRating));
                  case 3:
                     return LocText.current.text("general/awareness_tooltip",LocText.current.formatHugeNumber(param2.statBaseDodgeRating),LocText.current.formatHugeNumber(param2.itemDodgeRating),LocText.current.formatHugeNumber(param2.boosterDodgeRating),LocText.current.formatHugeNumber(param2.guildBoosterDodgeRating),LocText.current.formatHugeNumber(param2.statTotalDodgeRating),NumberUtil.roundDecimal(GameUtil.getDodgePercentage(param2.statTotalDodgeRating,_loc5_) * 100,2).toString().replace(".",LocText.current.text("base/numbers/comma_separator")),LocText.current.formatHugeNumber(_loc5_),LocText.current.formatHugeNumber(param2.battleSkillDodgeRating));
               }
            }
            else
            {
               switch(int(param1) - 1)
               {
                  case 0:
                     return LocText.current.text("general/toughness_duel_enemy_tooltip",param2.name,GameUtil.getHitPointsString(GameUtil.getHitPoints(param2.statTotalStamina)));
                  case 1:
                     return LocText.current.text("general/brawn_duel_enemy_tooltip",param2.name,LocText.current.formatHugeNumber(GameUtil.getDamage(param2.statWeaponDamage,param2.missilesDamage,param2.statTotalStrength)));
                  case 2:
                     return LocText.current.text("general/brain_duel_enemy_tooltip",param2.name,NumberUtil.roundDecimal(GameUtil.getCriticalHitPercentage(param2.statTotalCriticalRating,User.current.character.statTotalCriticalRating) * 100,2).toString().replace(".",LocText.current.text("base/numbers/comma_separator")));
                  case 3:
                     return LocText.current.text("general/awareness_duel_enemy_tooltip",param2.name,NumberUtil.roundDecimal(GameUtil.getDodgePercentage(param2.statTotalDodgeRating,User.current.character.statTotalDodgeRating) * 100,2).toString().replace(".",LocText.current.text("base/numbers/comma_separator")));
               }
            }
         }
         return "";
      }
      
      public static function getRawStatTooltip(param1:int, param2:Character, param3:int, param4:int, param5:int, param6:int) : String
      {
         var _loc7_:int = 0;
         var _loc17_:int = 0;
         var _loc12_:int = 0;
         var _loc15_:int = 0;
         var _loc9_:int = 0;
         var _loc16_:int = 0;
         var _loc13_:int = 0;
         var _loc8_:int = 0;
         var _loc14_:int = 0;
         var _loc10_:int = 0;
         var _loc11_:String = "";
         if(param2 != null)
         {
            if(param2 == User.current.character)
            {
               _loc7_ = param2.statBaseStamina;
               _loc17_ = param2.statBaseStrength;
               _loc12_ = param2.statBaseCriticalRating;
               _loc15_ = param2.statBaseDodgeRating;
               param2.statBaseStamina = param3;
               param2.statBaseStrength = param4;
               param2.statBaseCriticalRating = param5;
               param2.statBaseDodgeRating = param6;
               _loc9_ = param2.statTotalStamina;
               _loc16_ = param2.statTotalStrength;
               _loc13_ = param2.statTotalCriticalRating;
               _loc8_ = param2.statTotalDodgeRating;
               param2.statTotalStamina = param2.statBaseStamina + param2.itemStamina + param2.boosterStamina + param2.guildBoosterStamina;
               param2.statTotalStrength = param2.statBaseStrength + param2.itemStrength + param2.boosterStrength + param2.guildBoosterStrength;
               param2.statTotalCriticalRating = param2.statBaseCriticalRating + param2.itemCriticalRating + param2.boosterCriticalRating + param2.guildBoosterCriticalRating;
               param2.statTotalDodgeRating = param2.statBaseDodgeRating + param2.itemDodgeRating + param2.boosterDodgeRating + param2.guildBoosterDodgeRating;
               _loc14_ = getLowValue(3,param2);
               _loc10_ = getLowValue(4,param2);
               switch(int(param1) - 1)
               {
                  case 0:
                     _loc11_ = LocText.current.text("general/toughness_tooltip",LocText.current.formatHugeNumber(param2.statBaseStamina),LocText.current.formatHugeNumber(param2.itemStamina),LocText.current.formatHugeNumber(param2.boosterStamina),LocText.current.formatHugeNumber(param2.guildBoosterStamina),LocText.current.formatHugeNumber(param2.statTotalStamina),GameUtil.getHitPointsString(GameUtil.getHitPoints(param2.statTotalStamina)),LocText.current.formatHugeNumber(param2.battleSkillStamina));
                     break;
                  case 1:
                     _loc11_ = LocText.current.text("general/brawn_tooltip",LocText.current.formatHugeNumber(param2.statBaseStrength),LocText.current.formatHugeNumber(param2.itemStrength),LocText.current.formatHugeNumber(param2.boosterStrength),LocText.current.formatHugeNumber(param2.guildBoosterStrength),LocText.current.formatHugeNumber(param2.statTotalStrength),LocText.current.formatHugeNumber(param2.statWeaponDamage),LocText.current.formatHugeNumber(param2.missilesDamage),LocText.current.formatHugeNumber(GameUtil.getDamage(param2.statWeaponDamage,param2.missilesDamage,param2.statTotalStrength)),LocText.current.formatHugeNumber(param2.battleSkillStrength));
                     break;
                  case 2:
                     _loc11_ = LocText.current.text("general/brain_tooltip",LocText.current.formatHugeNumber(param2.statBaseCriticalRating),LocText.current.formatHugeNumber(param2.itemCriticalRating),LocText.current.formatHugeNumber(param2.boosterCriticalRating),LocText.current.formatHugeNumber(param2.guildBoosterCriticalRating),LocText.current.formatHugeNumber(param2.statTotalCriticalRating),NumberUtil.roundDecimal(GameUtil.getCriticalHitPercentage(param2.statTotalCriticalRating,_loc14_) * 100,2).toString().replace(".",LocText.current.text("base/numbers/comma_separator")),LocText.current.formatHugeNumber(_loc14_),LocText.current.formatHugeNumber(param2.battleSkillCriticalRating));
                     break;
                  case 3:
                     _loc11_ = LocText.current.text("general/awareness_tooltip",LocText.current.formatHugeNumber(param2.statBaseDodgeRating),LocText.current.formatHugeNumber(param2.itemDodgeRating),LocText.current.formatHugeNumber(param2.boosterDodgeRating),LocText.current.formatHugeNumber(param2.guildBoosterDodgeRating),LocText.current.formatHugeNumber(param2.statTotalDodgeRating),NumberUtil.roundDecimal(GameUtil.getDodgePercentage(param2.statTotalDodgeRating,_loc10_) * 100,2).toString().replace(".",LocText.current.text("base/numbers/comma_separator")),LocText.current.formatHugeNumber(_loc10_),LocText.current.formatHugeNumber(param2.battleSkillDodgeRating));
               }
               param2.statBaseStamina = _loc7_;
               param2.statBaseStrength = _loc17_;
               param2.statBaseCriticalRating = _loc12_;
               param2.statBaseDodgeRating = _loc15_;
               param2.statTotalStamina = _loc9_;
               param2.statTotalStrength = _loc16_;
               param2.statTotalCriticalRating = _loc13_;
               param2.statTotalDodgeRating = _loc8_;
            }
         }
         return _loc11_;
      }
      
      public static function getStatDuelTooltip(param1:int, param2:TypedObject, param3:TypedObject, param4:String, param5:Boolean) : String
      {
         if(param2 != null && param3 != null)
         {
            if(param5)
            {
               switch(int(param1) - 1)
               {
                  case 0:
                     return LocText.current.text("general/toughness_duel_enemy_tooltip",param4,GameUtil.getHitPointsString(GameUtil.getHitPoints(param3.getInt("stamina"))));
                  case 1:
                     return LocText.current.text("general/brawn_duel_enemy_tooltip",param4,LocText.current.formatHugeNumber(param3.getInt("damage_bonus")));
                  case 2:
                     return LocText.current.text("general/brain_duel_enemy_tooltip",param4,NumberUtil.roundDecimal(GameUtil.getCriticalHitPercentage(param3.getInt("criticalrating"),param2.getInt("criticalrating")) * 100,2).toString().replace(".",LocText.current.text("base/numbers/comma_separator")));
                  case 3:
                     return LocText.current.text("general/awareness_duel_enemy_tooltip",param4,NumberUtil.roundDecimal(GameUtil.getDodgePercentage(param3.getInt("dodgerating"),param2.getInt("dodgerating")) * 100,2).toString().replace(".",LocText.current.text("base/numbers/comma_separator")));
               }
            }
            else
            {
               switch(int(param1) - 1)
               {
                  case 0:
                     return LocText.current.text("general/toughness_duel_player_tooltip",GameUtil.getHitPointsString(GameUtil.getHitPoints(param2.getInt("stamina"))));
                  case 1:
                     return LocText.current.text("general/brawn_duel_player_tooltip",LocText.current.formatHugeNumber(param2.getInt("damage_bonus")));
                  case 2:
                     return LocText.current.text("general/brain_duel_player_tooltip",param4,NumberUtil.roundDecimal(GameUtil.getCriticalHitPercentage(param2.getInt("criticalrating"),param3.getInt("criticalrating")) * 100,2).toString().replace(".",LocText.current.text("base/numbers/comma_separator")));
                  case 3:
                     return LocText.current.text("general/awareness_duel_player_tooltip",param4,NumberUtil.roundDecimal(GameUtil.getDodgePercentage(param2.getInt("dodgerating"),param3.getInt("dodgerating")) * 100,2).toString().replace(".",LocText.current.text("base/numbers/comma_separator")));
               }
            }
         }
         return "";
      }
      
      public static function getStatGuildBattleTooltip(param1:int, param2:TypedObject, param3:TypedObject, param4:String, param5:String) : String
      {
         var _loc6_:int = param2.getInt("stamina");
         switch(int(param1) - 1)
         {
            case 0:
               return LocText.current.text("general/toughness_guild_battle_player_tooltip",param4,GameUtil.getHitPointsString(GameUtil.getHitPoints(_loc6_)));
            case 1:
               return LocText.current.text("general/brawn_guild_battle_player_tooltip",param4,LocText.current.formatHugeNumber(param2.getInt("damage_bonus")));
            case 2:
               return LocText.current.text("general/brain_guild_battle_player_tooltip",param4,NumberUtil.roundDecimal(GameUtil.getCriticalHitPercentage(param2.getInt("criticalrating"),param3.getInt("criticalrating")) * 100,2).toString().replace(".",LocText.current.text("base/numbers/comma_separator")),param5);
            case 3:
               return LocText.current.text("general/awareness_guild_battle_player_tooltip",param4,NumberUtil.roundDecimal(GameUtil.getDodgePercentage(param2.getInt("dodgerating"),param3.getInt("dodgerating")) * 100,2).toString().replace(".",LocText.current.text("base/numbers/comma_separator")),param5);
         }
      }
      
      public static function getLowValue(param1:int, param2:Character) : int
      {
         if(param2 == null)
         {
            return 0;
         }
         var _loc3_:int = 0;
         switch(int(param1) - 1)
         {
            case 0:
               _loc3_ = param2.statTotalStamina;
               break;
            case 1:
               _loc3_ = param2.statTotalStrength;
               break;
            case 2:
               _loc3_ = param2.statTotalCriticalRating;
               break;
            case 3:
               _loc3_ = param2.statTotalDodgeRating;
         }
         if(_loc3_ <= 50)
         {
            return 10;
         }
         if(_loc3_ <= 100)
         {
            return 50;
         }
         if(_loc3_ <= 200)
         {
            return 100;
         }
         if(_loc3_ <= 400)
         {
            return 200;
         }
         if(_loc3_ <= 600)
         {
            return 400;
         }
         if(_loc3_ <= 1000)
         {
            return 600;
         }
         if(_loc3_ <= 2000)
         {
            return 1000;
         }
         if(_loc3_ <= 5000)
         {
            return 2000;
         }
         if(_loc3_ <= 8000)
         {
            return 5000;
         }
         if(_loc3_ <= 12000)
         {
            return 8000;
         }
         if(_loc3_ <= 16000)
         {
            return 12000;
         }
         if(_loc3_ <= 20000)
         {
            return 16000;
         }
         if(_loc3_ <= 24000)
         {
            return 20000;
         }
         if(_loc3_ <= 30000)
         {
            return 24000;
         }
         if(_loc3_ <= 36000)
         {
            return 30000;
         }
         if(_loc3_ <= 42000)
         {
            return 36000;
         }
         if(_loc3_ <= 48000)
         {
            return 42000;
         }
         if(_loc3_ <= 54000)
         {
            return 48000;
         }
         if(_loc3_ <= 60000)
         {
            return 54000;
         }
         if(_loc3_ <= 70000)
         {
            return 60000;
         }
         if(_loc3_ <= 80000)
         {
            return 70000;
         }
         return 80000;
      }
      
      public static function get steps() : IntMap
      {
         initSteps();
         return STEPS;
      }
      
      public static function get stepKeys() : Vector.<int>
      {
         initSteps();
         return STEP_KEYS;
      }
      
      private static function initSteps() : void
      {
         if(STEP_KEYS != null)
         {
            return;
         }
         STEPS.setData(50,"colorA");
         STEPS.setData(100,"colorB");
         STEPS.setData(200,"colorC");
         STEPS.setData(400,"colorD");
         STEPS.setData(600,"colorE");
         STEPS.setData(1000,"colorF");
         STEPS.setData(2000,"colorG");
         STEPS.setData(5000,"colorH");
         STEPS.setData(8000,"colorI");
         STEPS.setData(12000,"colorJ");
         STEPS.setData(16000,"colorK");
         STEPS.setData(20000,"colorL");
         STEPS.setData(24000,"colorM");
         STEPS.setData(30000,"colorN");
         STEPS.setData(36000,"colorO");
         STEPS.setData(42000,"colorP");
         STEPS.setData(48000,"colorQ");
         STEPS.setData(54000,"colorR");
         STEPS.setData(60000,"colorS");
         STEPS.setData(70000,"colorT");
         STEPS.setData(80000,"colorU");
         STEP_KEYS = STEPS.keys;
         STEP_KEYS.sort(16);
      }
      
      public function refreshCompareValue(param1:int, param2:int, param3:Boolean = false) : void
      {
         var _loc4_:* = 0;
         var _loc5_:* = 0;
         var _loc7_:* = null;
         var _loc6_:int = param1 - param2;
         if(_loc6_ == 0)
         {
            _content.txtFreeStats.text = "";
            _content.txtFreeStats.visible = false;
            if(param3)
            {
               this.value = param1;
            }
         }
         else
         {
            _loc4_ = uint(!!param3?14155776:59396);
            _loc5_ = uint(!!param3?59396:14155776);
            if(param3)
            {
               _content.txtFreeStats.text = "";
               _content.txtFreeStats.visible = false;
               this.value = param1;
               _loc7_ = LocText.current.formatHugeNumber(param1);
               _loc7_ = _loc7_ + (" " + LocText.current.formatHugeNumber(_loc6_,true));
               _content.txtStatValue.text = _loc7_;
               _content.txtStatValue.textColor = _loc6_ > 0?_loc4_:uint(_loc5_);
               _content.txtStatValue.fontSize = 12;
            }
            else
            {
               _content.txtFreeStats.text = LocText.current.formatHugeNumber(_loc6_,true);
               _content.txtFreeStats.textColor = _loc6_ > 0?_loc4_:uint(_loc5_);
               _content.txtFreeStats.visible = true;
            }
         }
      }
      
      public function dispose() : void
      {
         _btnIncrease.dispose();
         _btnIncrease = null;
         _tooltip.dispose();
         _tooltip = null;
         if(_content != null)
         {
            _content = null;
         }
         if(_enableHighlight)
         {
            MessageRouter.removeAllListeners(handleMessages);
         }
      }
      
      public function stopAnimations() : void
      {
         if(_btnIncrease)
         {
            _btnIncrease.idle();
         }
      }
      
      public function enableIncrease(param1:Boolean) : void
      {
         if(Environment.info.isTouchScreen)
         {
            param1 = false;
         }
         _enableIncrease = param1;
         _content.txtFreeStats.text = "";
         _content.txtFreeStats.visible = false;
         _btnIncrease.visible = _enableIncrease;
      }
      
      public function set pointsAvailable(param1:int) : void
      {
         var _loc2_:int = 0;
         if(!_enableIncrease)
         {
            return;
         }
         _content.txtFreeStats.text = param1.toString();
         _content.txtFreeStats.textColor = 16777215;
         _content.txtFreeStats.visible = true;
         if(param1 > 0)
         {
            _btnIncrease.glow();
            _loc2_ = !!_fastSkillEnabled?CConstant.stat_fast_skill_value:1;
            switch(int(_statType) - 1)
            {
               case 0:
                  _btnIncrease.tooltip = LocText.current.text("screen/character_overview/toughness_upgrade_free",_loc2_);
                  break;
               case 1:
                  _btnIncrease.tooltip = LocText.current.text("screen/character_overview/brawn_upgrade_free",_loc2_);
                  break;
               case 2:
                  _btnIncrease.tooltip = LocText.current.text("screen/character_overview/brain_upgrade_free",_loc2_);
                  break;
               case 3:
                  _btnIncrease.tooltip = LocText.current.text("screen/character_overview/awareness_upgrade_free",_loc2_);
            }
         }
         else
         {
            _content.txtFreeStats.text = "";
            _content.txtFreeStats.visible = false;
            _btnIncrease.idle();
            if(!User.current.character.hasTutorialFlag("tutorial_finished"))
            {
               enableIncrease(false);
            }
         }
      }
      
      public function set boughtValue(param1:int) : void
      {
         var _loc3_:int = 0;
         if(!_enableIncrease || _content.txtFreeStats.text != "")
         {
            return;
         }
         _currentBoughtValue = param1;
         var _loc2_:int = !!_fastSkillEnabled?CConstant.stat_fast_skill_value:1;
         var _loc4_:int = 0;
         _loc3_ = _currentBoughtValue;
         while(_loc3_ < _currentBoughtValue + _loc2_)
         {
            _loc4_ = _loc4_ + GameUtil.calcNeededGameCurrency(_loc3_);
            _loc3_++;
         }
         switch(int(_statType) - 1)
         {
            case 0:
               _btnIncrease.tooltip = LocText.current.text("screen/character_overview/toughness_upgrade_buy",_loc2_,GameUtil.getGameCurrencyString(_loc4_));
               break;
            case 1:
               _btnIncrease.tooltip = LocText.current.text("screen/character_overview/brawn_upgrade_buy",_loc2_,GameUtil.getGameCurrencyString(_loc4_));
               break;
            case 2:
               _btnIncrease.tooltip = LocText.current.text("screen/character_overview/brain_upgrade_buy",_loc2_,GameUtil.getGameCurrencyString(_loc4_));
               break;
            case 3:
               _btnIncrease.tooltip = LocText.current.text("screen/character_overview/awareness_upgrade_buy",_loc2_,GameUtil.getGameCurrencyString(_loc4_));
         }
      }
      
      public function set value(param1:int) : void
      {
         _currentValue = param1;
         _content.txtStatValue.text = LocText.current.formatHugeNumber(param1);
         _content.txtStatValue.textColor = 16777215;
         _content.txtStatValue.fontSize = 14;
         setStatFill(param1,_content.fillBase,76);
      }
      
      public function refreshTooltip(param1:Character, param2:Character = null) : void
      {
         _tooltip.text = getStatTooltip(_statType,param1,param2);
      }
      
      public function refreshDuelTooltip(param1:TypedObject, param2:TypedObject, param3:String, param4:Boolean) : void
      {
         _tooltip.text = getStatDuelTooltip(_statType,param1,param2,param3,param4);
      }
      
      public function refreshGuildBattleTooltip(param1:TypedObject, param2:TypedObject, param3:String, param4:String) : void
      {
         _tooltip.text = getStatGuildBattleTooltip(_statType,param1,param2,param3,param4);
      }
      
      public function highlight(param1:int, param2:int, param3:Boolean) : void
      {
         if(param1 == 0 && param2 == 0)
         {
            unhighlight();
            return;
         }
         if(param3 == false)
         {
            _content.txtStatValue.text = LocText.current.formatHugeNumber(_currentValue - param2 + param1);
            _content.txtStatValue.textColor = 16777215;
            _content.txtStatValue.fontSize = 14;
         }
         var _loc11_:int = _currentValue - param2;
         var _loc5_:int = _currentValue - param2 + param1;
         var _loc4_:* = _loc5_ < _currentValue;
         var _loc9_:* = null;
         var _loc7_:* = null;
         var _loc13_:int = 0;
         var _loc8_:int = 0;
         var _loc6_:* = 0;
         var _loc12_:IDisplayObject = null;
         var _loc15_:int = 0;
         var _loc14_:* = stepKeys;
         for each(var _loc10_ in stepKeys)
         {
            _loc12_ = _content.fillBase.getChildByName(steps.getData(_loc10_));
            _loc12_.visible = false;
         }
         var _loc17_:int = 0;
         var _loc16_:* = stepKeys;
         for each(_loc10_ in stepKeys)
         {
            _loc12_ = _content.fillBase.getChildByName(steps.getData(_loc10_));
            if(_loc9_ == null && _loc11_ <= _loc10_)
            {
               _loc13_ = _loc11_ - _loc6_;
               _loc8_ = _loc10_ - _loc6_;
               _loc9_ = _loc12_;
            }
            if(_loc7_ == null && _loc5_ <= _loc10_)
            {
               _loc8_ = _loc10_ - _loc6_;
               _loc7_ = _loc12_;
               break;
            }
            _loc6_ = _loc10_;
         }
         if(_loc9_ == null || _loc7_ == null)
         {
            _loc12_ = _content.fillBase.getChildByName(steps.getData(stepKeys[stepKeys.length - 1]));
            _loc12_.visible = true;
            return;
         }
         _loc12_.visible = true;
         if(_loc9_ == _loc7_)
         {
            if(_loc4_)
            {
               _content.fillBase.mask.width = 1 + Math.round(_loc13_ / _loc8_ * 76);
            }
            else
            {
               _content.fillBase.mask.width = 1 + Math.round((_loc5_ - _loc6_) / _loc8_ * 76);
            }
         }
         else
         {
            _content.fillBase.mask.width = 1 + Math.round((_loc5_ - _loc6_) / _loc8_ * 76);
         }
         if(!_enableIncrease)
         {
            _content.txtFreeStats.text = "";
            _content.txtFreeStats.visible = false;
         }
      }
      
      public function unhighlight() : void
      {
         value = _currentValue;
         if(!_enableIncrease)
         {
            _content.txtFreeStats.text = "";
            _content.txtFreeStats.visible = false;
         }
      }
      
      private function onClickIncrease(param1:InteractionEvent) : void
      {
         if(_content.txtFreeStats.text != "")
         {
            _lastAction = 2;
         }
         else
         {
            _lastAction = 1;
         }
         var _loc2_:int = !!_fastSkillEnabled?CConstant.stat_fast_skill_value:1;
         Environment.application.sendActionRequest("improveCharacterStat",{
            "stat_type":_statType,
            "skill_value":_loc2_
         },handleRequests);
      }
      
      private function handleRequests(param1:ActionRequestResponse) : void
      {
         var _loc2_:* = param1.action;
         if("improveCharacterStat" !== _loc2_)
         {
            throw new Error("Unsupported request action \'" + param1.action + "\'!");
         }
         if(param1.error == "")
         {
            if(_lastAction == 1)
            {
               Environment.audio.playFX("character_upgrade_stat.mp3");
               Environment.audio.playFX("item_buy.mp3");
            }
            else if(_lastAction == 2)
            {
               Environment.audio.playFX("character_upgrade_stat.mp3");
            }
            Environment.application.updateData(param1.data);
         }
         else if(param1.error == "errRemoveGameCurrencyNotEnough")
         {
            ViewManager.instance.showNotEnoughGameCurrencyDialog(GameUtil.calcNeededGameCurrency(_currentBoughtValue));
         }
         else
         {
            Environment.reportError(param1.error,param1.request);
         }
         _lastAction = 0;
      }
      
      private function handleMessages(param1:Message) : void
      {
         var _loc2_:* = param1.type;
         switch(_loc2_)
         {
            case "UiStatBarMessage.notifyHighlight":
               switch(int(_statType) - 1)
               {
                  case 0:
                     highlight(param1.data.stamina,param1.data.minus_stamina,param1.data.equipped);
                     break;
                  case 1:
                     highlight(param1.data.strength,param1.data.minus_strength,param1.data.equipped);
                     break;
                  case 2:
                     highlight(param1.data.critical_rating,param1.data.minus_critical_rating,param1.data.equipped);
                     break;
                  case 3:
                     highlight(param1.data.dodge_rating,param1.data.minus_dodge_rating,param1.data.equipped);
               }
               break;
            case "UiStatBarMessage.notifyUnhighlight":
               unhighlight();
               break;
            default:
               throw new Error("Encountered unknown message type! type=" + param1.type);
         }
      }
      
      public function set fastSkillEnabled(param1:Boolean) : void
      {
         _fastSkillEnabled = param1;
      }
   }
}
