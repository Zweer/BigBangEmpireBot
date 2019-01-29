package com.playata.application.ui.elements.goal
{
   import com.playata.application.data.character.Character;
   import com.playata.application.data.goal.GoalFilter;
   import com.playata.application.data.goal.GoalValue;
   import com.playata.application.data.user.User;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.application.ui.elements.generic.checkbox.UiCheckBox;
   import com.playata.application.ui.elements.generic.textfield.UiTextTooltip;
   import com.playata.framework.application.Environment;
   import com.playata.framework.core.Runtime;
   import com.playata.framework.display.ui.controls.ITextInput;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.elements.goal.SymbolGoalFilterGeneric;
   
   public class UiGoalFilter
   {
      
      public static var _filterLocked:Boolean = false;
      
      private static var _filterText:String = "";
      
      private static var _showGameCurrencyGoals:Boolean = true;
      
      private static var _showPremiumGoals:Boolean = true;
      
      private static var _showStatGoals:Boolean = true;
      
      private static var _showItemGoals:Boolean = true;
      
      private static var _showXPGoals:Boolean = true;
      
      private static var _showEnergyGoals:Boolean = true;
      
      private static var _showBoosterGoals:Boolean = true;
      
      private static var _showTitleGoals:Boolean = true;
       
      
      private var _content:SymbolGoalFilterGeneric = null;
      
      private var _ckbOnlyUnlocked:UiCheckBox;
      
      private var _callback:Function = null;
      
      private var _ckbShowGameCurrency:UiCheckBox = null;
      
      private var _ckbShowPremium:UiCheckBox = null;
      
      private var _ckbShowStat:UiCheckBox = null;
      
      private var _ckbShowItem:UiCheckBox = null;
      
      private var _ckbShowXP:UiCheckBox = null;
      
      private var _ckbShowEnergy:UiCheckBox = null;
      
      private var _ckbShowBooster:UiCheckBox = null;
      
      private var _ckbShowTitle:UiCheckBox = null;
      
      private var _tooltipSearch:UiTextTooltip = null;
      
      private var _btnSaveSettings:UiButton = null;
      
      public function UiGoalFilter(param1:SymbolGoalFilterGeneric, param2:Function)
      {
         super();
         _content = param1;
         _content.visible = false;
         _callback = param2;
         getSavedSettings();
         _content.txtOnlyUnlocked.text = LocText.current.text("dialog/goals/only_unlocked");
         _content.txtOnlyUnlocked.autoFontSize = true;
         _content.txtShowCoinGoals.text = LocText.current.text("dialog/goals/show_coin_goals");
         _content.txtShowCoinGoals.autoFontSize = true;
         _content.txtShowPremiumGoal.text = LocText.current.text("dialog/goals/show_premium_goals");
         _content.txtShowPremiumGoal.autoFontSize = true;
         _content.txtShowStatGoal.text = LocText.current.text("dialog/goals/show_stat_goals");
         _content.txtShowStatGoal.autoFontSize = true;
         _content.txtShowXPGoal.text = LocText.current.text("dialog/goals/show_xp_goals");
         _content.txtShowXPGoal.autoFontSize = true;
         _content.txtShowItemGoal.text = LocText.current.text("dialog/goals/show_item_goals");
         _content.txtShowItemGoal.autoFontSize = true;
         _content.txtShowEnergyGoal.text = LocText.current.text("dialog/goals/show_quest_energy_goals");
         _content.txtShowEnergyGoal.autoFontSize = true;
         _content.txtShowBoosterGoal.text = LocText.current.text("dialog/goals/show_booster_goals");
         _content.txtShowBoosterGoal.autoFontSize = true;
         _content.txtShowTitleGoal.text = LocText.current.text("dialog/goals/show_title_goals");
         _content.txtShowTitleGoal.autoFontSize = true;
         _ckbOnlyUnlocked = new UiCheckBox(_content.ckbOnlyUnlocked,_filterLocked,"",onCheckedChangedOnlyUnlocked,null,_content.txtOnlyUnlocked);
         _ckbShowGameCurrency = new UiCheckBox(_content.ckbShowCoinGoals,_showGameCurrencyGoals,"",onCheckedChangedShowCoinGoals,null,_content.txtShowCoinGoals);
         _ckbShowPremium = new UiCheckBox(_content.ckbShowPremiumGoal,_showPremiumGoals,"",onCheckedChangedShowPremiumGoals,null,_content.txtShowPremiumGoal);
         _ckbShowStat = new UiCheckBox(_content.ckbShowStatGoal,_showStatGoals,"",onCheckedChangedShowStatGoals,null,_content.txtShowStatGoal);
         _ckbShowXP = new UiCheckBox(_content.ckbShowXPGoal,_showXPGoals,"",onCheckedChangedShowXPGoals,null,_content.txtShowXPGoal);
         _ckbShowItem = new UiCheckBox(_content.ckbShowItemGoal,_showItemGoals,"",onCheckedChangedShowItemGoals,null,_content.txtShowItemGoal);
         _ckbShowEnergy = new UiCheckBox(_content.ckbShowEnergyGoal,_showEnergyGoals,"",onCheckedChangedShowEnergyGoals,null,_content.txtShowEnergyGoal);
         _ckbShowBooster = new UiCheckBox(_content.ckbShowBoosterGoal,_showBoosterGoals,"",onCheckedChangedShowBoosterGoals,null,_content.txtShowBoosterGoal);
         _ckbShowTitle = new UiCheckBox(_content.ckbShowTitleGoal,_showTitleGoals,"",onCheckedChangedShowTitleGoals,null,_content.txtShowTitleGoal);
         _tooltipSearch = new UiTextTooltip(_content.inputSearch,LocText.current.text("dialog/goals/button_search_tooltip"));
         if(_filterText != "")
         {
            _content.inputSearch.text = _filterText;
         }
         else
         {
            _content.inputSearch.text = LocText.current.text("dialog/goals/search_text");
         }
         _content.inputSearch.onClick.add(handleSearchClick);
         _content.inputSearch.onChange.add(handleTextChanged);
         _btnSaveSettings = new UiButton(_content.btnSaveSettings,LocText.current.text("dialog/goals_filter/button_save"),updateSavedSettings);
         updateSaveButton();
      }
      
      public static function isAllowed(param1:GoalValue, param2:Character) : Boolean
      {
         var _loc3_:Boolean = true;
         switch(int(param1.rewardType) - 1)
         {
            case 0:
               _loc3_ = _showGameCurrencyGoals;
               break;
            case 1:
               _loc3_ = _showPremiumGoals;
               break;
            case 2:
               _loc3_ = _showStatGoals;
               break;
            case 3:
               _loc3_ = _showXPGoals;
               break;
            case 4:
               _loc3_ = _showItemGoals;
               break;
            case 5:
               _loc3_ = _showEnergyGoals;
               break;
            case 6:
               _loc3_ = _showBoosterGoals;
         }
         if(param1.hasTitleReward)
         {
            _loc3_ = _showTitleGoals;
         }
         if(!_loc3_)
         {
            return _loc3_;
         }
         if(_filterText != "" && _filterText != LocText.current.text("dialog/goals/search_text"))
         {
            if(param1.title.toLowerCase().indexOf(_filterText) >= 0 || param1.shortDescription(param2).toLowerCase().indexOf(_filterText) >= 0 || param1.longDescription(param2).toLowerCase().indexOf(_filterText) >= 0)
            {
               return true;
            }
            if(Environment.info.isTestMode)
            {
               return param1.goal.identifier.indexOf(_filterText) >= 0;
            }
            return false;
         }
         return true;
      }
      
      public static function get isFilterActive() : Boolean
      {
         return !_showGameCurrencyGoals || !_showPremiumGoals || !_showStatGoals || !_showXPGoals || !_showItemGoals || !_showEnergyGoals || !_showBoosterGoals || !_showTitleGoals || _filterLocked;
      }
      
      public function dispose() : void
      {
         _btnSaveSettings.dispose();
         _btnSaveSettings = null;
         _ckbOnlyUnlocked.dispose();
         _ckbOnlyUnlocked = null;
         _ckbShowGameCurrency.dispose();
         _ckbShowGameCurrency = null;
         _ckbShowPremium.dispose();
         _ckbShowPremium = null;
         _ckbShowStat.dispose();
         _ckbShowStat = null;
         _ckbShowXP.dispose();
         _ckbShowXP = null;
         _ckbShowItem.dispose();
         _ckbShowItem = null;
         _ckbShowTitle.dispose();
         _ckbShowTitle = null;
         _tooltipSearch.dispose();
         _tooltipSearch = null;
         _callback = null;
         _content = null;
         _filterText = "";
         _filterLocked = false;
         _showGameCurrencyGoals = true;
         _showPremiumGoals = true;
         _showStatGoals = true;
         _showItemGoals = true;
         _showXPGoals = true;
         _showEnergyGoals = true;
         _showBoosterGoals = true;
         _showTitleGoals = true;
      }
      
      private function getSavedSettings() : void
      {
         var _loc1_:GoalFilter = User.current.goalFilter;
         if(_loc1_)
         {
            _filterLocked = _loc1_.filterLocked;
            _showGameCurrencyGoals = _loc1_.showGameCurrencyGoals;
            _showPremiumGoals = _loc1_.showPremiumGoals;
            _showStatGoals = _loc1_.showStatGoals;
            _showXPGoals = _loc1_.showXPGoals;
            _showItemGoals = _loc1_.showItemGoals;
            _showEnergyGoals = _loc1_.showEnergyGoals;
            _showBoosterGoals = _loc1_.showBoosterGoals;
            _showTitleGoals = _loc1_.showTitleGoals;
         }
         else
         {
            _filterLocked = User.current.showOnlyUnlockedGoals;
         }
      }
      
      private function updateSavedSettings(param1:InteractionEvent) : void
      {
         var _loc2_:* = null;
         if(!_showGameCurrencyGoals && !_showPremiumGoals && !_showStatGoals && !_showXPGoals && !_showItemGoals && !_showEnergyGoals && !_showBoosterGoals && !_showTitleGoals && _filterLocked)
         {
            _loc2_ = {
               "fl":false,
               "scg":true,
               "spg":true,
               "ssg":true,
               "sxg":true,
               "sig":true,
               "seg":true,
               "sbg":true,
               "stg":true
            };
         }
         else
         {
            _loc2_ = {
               "fl":_filterLocked,
               "scg":_showGameCurrencyGoals,
               "spg":_showPremiumGoals,
               "ssg":_showStatGoals,
               "sxg":_showXPGoals,
               "sig":_showItemGoals,
               "seg":_showEnergyGoals,
               "sbg":_showBoosterGoals,
               "stg":_showTitleGoals
            };
         }
         User.current.setSettingValue("goal_filter_settings",_loc2_);
         updateSaveButton();
      }
      
      public function toggle() : void
      {
         _content.visible = !_content.visible;
         if(_content.inputSearch.text == "")
         {
            _content.inputSearch.text = LocText.current.text("dialog/goals/search_text");
         }
      }
      
      public function hide() : void
      {
         _content.visible = false;
         if(_content.inputSearch.text == "")
         {
            _content.inputSearch.text = LocText.current.text("dialog/goals/search_text");
         }
      }
      
      private function handleSearchClick(param1:InteractionEvent) : void
      {
         if(_content.inputSearch.text == LocText.current.text("dialog/goals/search_text"))
         {
            _content.inputSearch.text = "";
         }
      }
      
      private function handleTextChanged(param1:ITextInput) : void
      {
         if(_content.inputSearch.text == LocText.current.text("dialog/goals/search_text"))
         {
            _content.inputSearch.text = "";
         }
         _filterText = _content.inputSearch.text.toLowerCase();
         Runtime.delayFunction(textChanged,0.5,[_filterText]);
      }
      
      private function textChanged(param1:String) : void
      {
         if(_callback != null && param1 == _filterText)
         {
            _callback();
         }
      }
      
      private function onCheckedChangedOnlyUnlocked(param1:Boolean) : void
      {
         _filterLocked = param1;
         _callback();
         updateSaveButton();
      }
      
      private function onCheckedChangedShowCoinGoals(param1:Boolean) : void
      {
         _showGameCurrencyGoals = param1;
         _callback();
         updateSaveButton();
      }
      
      private function onCheckedChangedShowPremiumGoals(param1:Boolean) : void
      {
         _showPremiumGoals = param1;
         _callback();
         updateSaveButton();
      }
      
      private function onCheckedChangedShowStatGoals(param1:Boolean) : void
      {
         _showStatGoals = param1;
         _callback();
         updateSaveButton();
      }
      
      private function onCheckedChangedShowItemGoals(param1:Boolean) : void
      {
         _showItemGoals = param1;
         _callback();
         updateSaveButton();
      }
      
      private function onCheckedChangedShowXPGoals(param1:Boolean) : void
      {
         _showXPGoals = param1;
         _callback();
         updateSaveButton();
      }
      
      private function onCheckedChangedShowEnergyGoals(param1:Boolean) : void
      {
         _showEnergyGoals = param1;
         _callback();
         updateSaveButton();
      }
      
      private function onCheckedChangedShowBoosterGoals(param1:Boolean) : void
      {
         _showBoosterGoals = param1;
         _callback();
         updateSaveButton();
      }
      
      private function onCheckedChangedShowTitleGoals(param1:Boolean) : void
      {
         _showTitleGoals = param1;
         _callback();
         updateSaveButton();
      }
      
      private function updateSaveButton() : void
      {
         var _loc1_:GoalFilter = User.current.goalFilter;
         if(_loc1_)
         {
            _btnSaveSettings.buttonEnabled = !(_filterLocked == _loc1_.filterLocked && _showGameCurrencyGoals == _loc1_.showGameCurrencyGoals && _showPremiumGoals == _loc1_.showPremiumGoals && _showStatGoals == _loc1_.showStatGoals && _showXPGoals == _loc1_.showXPGoals && _showItemGoals == _loc1_.showItemGoals && _showEnergyGoals == _loc1_.showEnergyGoals && _showBoosterGoals == _loc1_.showBoosterGoals && _showTitleGoals == _loc1_.showTitleGoals);
         }
         else
         {
            _btnSaveSettings.buttonEnabled = isFilterActive;
         }
      }
   }
}
