package com.playata.application.ui.elements.stats
{
   import com.playata.application.data.GameUtil;
   import com.playata.application.data.battle.BattleSkill;
   import com.playata.application.data.battle.BattleSkills;
   import com.playata.application.data.character.Character;
   import com.playata.application.data.constants.CConstant;
   import com.playata.application.data.user.User;
   import com.playata.application.ui.dialogs.DialogImproveStats;
   import com.playata.application.ui.elements.battle.UiBattleSkillBattleIcon;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.framework.application.Environment;
   import com.playata.framework.core.TypedObject;
   import com.playata.framework.display.InteractiveDisplayObject;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.elements.stats.SymbolStatsGeneric;
   
   public class UiStats extends InteractiveDisplayObject
   {
       
      
      private var _content:SymbolStatsGeneric = null;
      
      private var _statBarStamina:UiStatBar = null;
      
      private var _statBarStrength:UiStatBar = null;
      
      private var _statBarCriticalRating:UiStatBar = null;
      
      private var _statBarDodgeRating:UiStatBar = null;
      
      private var _character:Character = null;
      
      private var _enemyCharacter:Character = null;
      
      private var _btnImprove:UiButton = null;
      
      private var _btnFastSkill:UiButton = null;
      
      private var _skills:Vector.<UiBattleSkillBattleIcon>;
      
      private var _enableBattleSkills:Boolean = false;
      
      private var _enableIncrease:Boolean = false;
      
      private var _fastSkillEnabled:Boolean = false;
      
      public function UiStats(param1:SymbolStatsGeneric, param2:Boolean = true, param3:Boolean = true)
      {
         _content = param1;
         super(_content);
         _enableBattleSkills = param3;
         _statBarStamina = new UiStatBar(param1.barStamina,1,param2);
         _statBarStrength = new UiStatBar(param1.barStrength,2,param2);
         _statBarCriticalRating = new UiStatBar(param1.barCriticalHitRating,3,param2);
         _statBarDodgeRating = new UiStatBar(param1.barDodgeRating,4,param2);
         _btnImprove = new UiButton(param1.btnIncrease,null,onClickImprove);
         _btnImprove.visible = Environment.info.isTouchScreen;
         _btnImprove.extendClickArea(10,10);
         _btnFastSkill = new UiButton(param1.btnFastSkill,LocText.current.text("screen/character_overview/button_fast_skill_disabled",CConstant.stat_fast_skill_value),onClickFastSkill);
         _btnFastSkill.visible = false;
         if(!param3)
         {
            param1.skillBackgrounds.visible = false;
            param1.backgroundBig.visible = false;
            param1.backgroundSmall.visible = true;
            param1.skill1.visible = false;
            param1.skill2.visible = false;
            param1.skill3.visible = false;
            param1.skill4.visible = false;
            param1.skill5.visible = false;
            param1.skill6.visible = false;
            param1.skill7.visible = false;
            param1.skill8.visible = false;
            param1.skill9.visible = false;
         }
         else
         {
            param1.skillBackgrounds.visible = true;
            param1.backgroundBig.visible = true;
            param1.backgroundSmall.visible = false;
            _skills = new Vector.<UiBattleSkillBattleIcon>(0);
            _skills.push(new UiBattleSkillBattleIcon(param1.skill1));
            _skills.push(new UiBattleSkillBattleIcon(param1.skill2));
            _skills.push(new UiBattleSkillBattleIcon(param1.skill3));
            _skills.push(new UiBattleSkillBattleIcon(param1.skill4));
            _skills.push(new UiBattleSkillBattleIcon(param1.skill5));
            _skills.push(new UiBattleSkillBattleIcon(param1.skill6));
            _skills.push(new UiBattleSkillBattleIcon(param1.skill7));
            _skills.push(new UiBattleSkillBattleIcon(param1.skill8));
            _skills.push(new UiBattleSkillBattleIcon(param1.skill9));
         }
      }
      
      public function get container() : SymbolStatsGeneric
      {
         return _content;
      }
      
      override public function dispose() : void
      {
         _statBarStamina.dispose();
         _statBarStrength.dispose();
         _statBarCriticalRating.dispose();
         _statBarDodgeRating.dispose();
         _statBarStamina = null;
         _statBarStrength = null;
         _statBarCriticalRating = null;
         _statBarDodgeRating = null;
         _btnImprove.dispose();
         _btnImprove = null;
         _btnFastSkill.dispose();
         _btnFastSkill = null;
         if(_skills)
         {
            var _loc3_:int = 0;
            var _loc2_:* = _skills;
            for each(var _loc1_ in _skills)
            {
               _loc1_.dispose();
            }
         }
         _character = null;
         _enemyCharacter = null;
      }
      
      public function stopAnimations() : void
      {
         if(_statBarStamina)
         {
            _statBarStamina.stopAnimations();
         }
         if(_statBarStrength)
         {
            _statBarStrength.stopAnimations();
         }
         if(_statBarCriticalRating)
         {
            _statBarCriticalRating.stopAnimations();
         }
         if(_statBarDodgeRating)
         {
            _statBarDodgeRating.stopAnimations();
         }
      }
      
      public function refresh(param1:Character, param2:Character = null) : void
      {
         var _loc5_:* = false;
         var _loc3_:* = undefined;
         var _loc4_:int = 0;
         _character = param1;
         _enemyCharacter = param2;
         refreshFastSkillButton();
         _statBarStamina.fastSkillEnabled = _fastSkillEnabled;
         _statBarStrength.fastSkillEnabled = _fastSkillEnabled;
         _statBarCriticalRating.fastSkillEnabled = _fastSkillEnabled;
         _statBarDodgeRating.fastSkillEnabled = _fastSkillEnabled;
         if(param1.hasData("stat_points_available"))
         {
            _statBarStamina.pointsAvailable = param1.getInt("stat_points_available");
            _statBarStrength.pointsAvailable = param1.getInt("stat_points_available");
            _statBarCriticalRating.pointsAvailable = param1.getInt("stat_points_available");
            _statBarDodgeRating.pointsAvailable = param1.getInt("stat_points_available");
         }
         else
         {
            _statBarStamina.stopAnimations();
            _statBarStrength.stopAnimations();
            _statBarCriticalRating.stopAnimations();
            _statBarDodgeRating.stopAnimations();
         }
         if(param1.hasData("stat_bought_stamina"))
         {
            _statBarStamina.boughtValue = param1.getInt("stat_bought_stamina");
            _statBarStrength.boughtValue = param1.getInt("stat_bought_strength");
            _statBarCriticalRating.boughtValue = param1.getInt("stat_bought_critical_rating");
            _statBarDodgeRating.boughtValue = param1.getInt("stat_bought_dodge_rating");
         }
         _statBarStamina.value = param1.statTotalStamina;
         _statBarStrength.value = param1.statTotalStrength;
         _statBarCriticalRating.value = param1.statTotalCriticalRating;
         _statBarDodgeRating.value = param1.statTotalDodgeRating;
         _statBarStamina.refreshTooltip(param1,param2);
         _statBarStrength.refreshTooltip(param1,param2);
         _statBarCriticalRating.refreshTooltip(param1,param2);
         _statBarDodgeRating.refreshTooltip(param1,param2);
         if(param2)
         {
            _statBarStamina.refreshCompareValue(param1.statTotalStamina,param2.statTotalStamina);
            _statBarStrength.refreshCompareValue(param1.statTotalStrength,param2.statTotalStrength);
            _statBarCriticalRating.refreshCompareValue(param1.statTotalCriticalRating,param2.statTotalCriticalRating);
            _statBarDodgeRating.refreshCompareValue(param1.statTotalDodgeRating,param2.statTotalDodgeRating);
         }
         if(_enableBattleSkills)
         {
            _loc5_ = param1 == User.current.character;
            _loc3_ = BattleSkills.instance.getSkillsFromBattleEffectData(param1.battleEffectsData);
            _loc4_ = 0;
            while(_loc4_ < 9)
            {
               if(_loc4_ < _loc3_.length)
               {
                  _skills[_loc4_].setSkill(_loc3_[_loc4_],_loc5_,!!_loc5_?null:param1.name);
               }
               else
               {
                  _skills[_loc4_].setSkill(null);
               }
               _loc4_++;
            }
         }
      }
      
      private function refreshFastSkillButton() : void
      {
         var _loc1_:* = 0;
         var _loc3_:int = 0;
         var _loc2_:int = 0;
         _btnFastSkill.visible = false;
         if(_character && _enableIncrease && !Environment.info.isTouchScreen)
         {
            if(_character.hasData("stat_points_available") && _character.getInt("stat_points_available") > 0)
            {
               if(_character.getInt("stat_points_available") >= CConstant.stat_fast_skill_value)
               {
                  _btnFastSkill.visible = true;
               }
            }
            else if(_character.hasData("stat_bought_stamina"))
            {
               _loc1_ = 0;
               _loc3_ = 0;
               _loc2_ = _character.getInt("stat_bought_stamina");
               while(_loc2_ < _character.getInt("stat_bought_stamina") + CConstant.stat_fast_skill_value)
               {
                  _loc3_ = _loc3_ + GameUtil.calcNeededGameCurrency(_loc2_);
                  _loc2_++;
               }
               if(_loc3_ > _loc1_)
               {
                  _loc1_ = _loc3_;
               }
               _loc3_ = 0;
               _loc2_ = _character.getInt("stat_bought_strength");
               while(_loc2_ < _character.getInt("stat_bought_strength") + CConstant.stat_fast_skill_value)
               {
                  _loc3_ = _loc3_ + GameUtil.calcNeededGameCurrency(_loc2_);
                  _loc2_++;
               }
               if(_loc3_ > _loc1_)
               {
                  _loc1_ = _loc3_;
               }
               _loc3_ = 0;
               _loc2_ = _character.getInt("stat_bought_critical_rating");
               while(_loc2_ < _character.getInt("stat_bought_critical_rating") + CConstant.stat_fast_skill_value)
               {
                  _loc3_ = _loc3_ + GameUtil.calcNeededGameCurrency(_loc2_);
                  _loc2_++;
               }
               if(_loc3_ > _loc1_)
               {
                  _loc1_ = _loc3_;
               }
               _loc3_ = 0;
               _loc2_ = _character.getInt("stat_bought_dodge_rating");
               while(_loc2_ < _character.getInt("stat_bought_dodge_rating") + CConstant.stat_fast_skill_value)
               {
                  _loc3_ = _loc3_ + GameUtil.calcNeededGameCurrency(_loc2_);
                  _loc2_++;
               }
               if(_loc3_ > _loc1_)
               {
                  _loc1_ = _loc3_;
               }
               _btnFastSkill.visible = _character.gameCurrency >= _loc1_;
            }
         }
         if(!_btnFastSkill.visible && _fastSkillEnabled)
         {
            onClickFastSkill(null);
         }
      }
      
      public function refreshFromBattleProfile(param1:TypedObject, param2:TypedObject, param3:String, param4:Boolean) : void
      {
         if(param4)
         {
            _statBarStamina.value = param2.getInt("stamina");
            _statBarStrength.value = param2.getInt("strength");
            _statBarCriticalRating.value = param2.getInt("criticalrating");
            _statBarDodgeRating.value = param2.getInt("dodgerating");
         }
         else
         {
            _statBarStamina.value = param1.getInt("stamina");
            _statBarStrength.value = param1.getInt("strength");
            _statBarCriticalRating.value = param1.getInt("criticalrating");
            _statBarDodgeRating.value = param1.getInt("dodgerating");
         }
         _statBarStamina.refreshDuelTooltip(param1,param2,param3,param4);
         _statBarStrength.refreshDuelTooltip(param1,param2,param3,param4);
         _statBarCriticalRating.refreshDuelTooltip(param1,param2,param3,param4);
         _statBarDodgeRating.refreshDuelTooltip(param1,param2,param3,param4);
      }
      
      public function refreshFromGuildBattleProfile(param1:TypedObject, param2:TypedObject, param3:String, param4:String) : void
      {
         _statBarStamina.value = param1.getInt("stamina");
         _statBarStrength.value = param1.getInt("strength");
         _statBarCriticalRating.value = param1.getInt("criticalrating");
         _statBarDodgeRating.value = param1.getInt("dodgerating");
         _statBarStamina.refreshGuildBattleTooltip(param1,param2,param3,param4);
         _statBarStrength.refreshGuildBattleTooltip(param1,param2,param3,param4);
         _statBarCriticalRating.refreshGuildBattleTooltip(param1,param2,param3,param4);
         _statBarDodgeRating.refreshGuildBattleTooltip(param1,param2,param3,param4);
      }
      
      public function enableIncrease(param1:Boolean) : void
      {
         _enableIncrease = param1;
         if(Environment.info.isTouchScreen)
         {
            _btnImprove.visible = param1;
         }
         _statBarStamina.enableIncrease(param1);
         _statBarStrength.enableIncrease(param1);
         _statBarCriticalRating.enableIncrease(param1);
         _statBarDodgeRating.enableIncrease(param1);
         refreshFastSkillButton();
      }
      
      private function onClickImprove(param1:InteractionEvent) : void
      {
         Environment.panelManager.showDialog(new DialogImproveStats());
      }
      
      private function onClickFastSkill(param1:InteractionEvent) : void
      {
         _fastSkillEnabled = !_fastSkillEnabled;
         if(param1 != null)
         {
            refresh(_character,_enemyCharacter);
         }
         if(_fastSkillEnabled)
         {
            _btnFastSkill.tooltip = LocText.current.text("screen/character_overview/button_fast_skill_enabled",CConstant.stat_fast_skill_value);
            _content.btnFastSkill.gotoAndStop("active");
         }
         else
         {
            _content.btnFastSkill.gotoAndStop("inactive");
            _btnFastSkill.tooltip = LocText.current.text("screen/character_overview/button_fast_skill_disabled",CConstant.stat_fast_skill_value);
         }
      }
   }
}
