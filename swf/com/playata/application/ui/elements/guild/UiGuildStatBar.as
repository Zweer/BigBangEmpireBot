package com.playata.application.ui.elements.guild
{
   import com.playata.application.data.guild.Guild;
   import com.playata.application.ui.dialogs.DialogGuildImprove;
   import com.playata.application.ui.elements.generic.button.UiPlusButton;
   import com.playata.application.ui.elements.generic.dialog.UiInfoDialog;
   import com.playata.application.ui.elements.generic.progressbar.UiProgressBarMasked;
   import com.playata.application.ui.elements.generic.textfield.UiTextTooltip;
   import com.playata.framework.application.Environment;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.elements.guild.SymbolGuildStatBarGeneric;
   
   public class UiGuildStatBar
   {
       
      
      private var _content:SymbolGuildStatBarGeneric = null;
      
      private var _progressBar:UiProgressBarMasked = null;
      
      private var _btnIncrease:UiPlusButton = null;
      
      private var _statType:int = 0;
      
      private var _tooltip:UiTextTooltip = null;
      
      private var _value:int = 0;
      
      private var _max:int = 0;
      
      private var _guild:Guild = null;
      
      public function UiGuildStatBar(param1:SymbolGuildStatBarGeneric, param2:int, param3:int)
      {
         super();
         _content = param1;
         _statType = param2;
         _max = param3;
         _progressBar = new UiProgressBarMasked(_content.fill.width,_content.fill);
         _tooltip = new UiTextTooltip(_content.tooltipLayer,null,getStatTooltip);
         _btnIncrease = new UiPlusButton(_content.btnIncrease,LocText.current.text("screen/guild/guild_info/button_stat_increase_enabled_tooltip"),onClickIncrease);
         _btnIncrease.extendClickArea(10,10,-10,15);
         _content.iconQuarter.visible = param2 == 1;
         _content.iconEquipment.visible = param2 == 2;
         _content.iconPopularity.visible = param2 == 3;
         _content.iconMotivation.visible = param2 == 4;
         _btnIncrease.bringToTop();
      }
      
      public function refreshLocalization() : void
      {
         _btnIncrease.tooltip = LocText.current.text("screen/guild/guild_info/button_stat_increase_enabled_tooltip");
      }
      
      private function onClickIncrease(param1:InteractionEvent) : void
      {
         if(_value >= _max)
         {
            Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/guild_stat_limit_reached/title"),LocText.current.text("dialog/guild_stat_limit_reached/text"),LocText.current.text("general/button_ok")));
         }
         else
         {
            Environment.panelManager.showDialog(new DialogGuildImprove(_statType));
         }
      }
      
      public function get isFullyImproved() : Boolean
      {
         return _value >= _max;
      }
      
      public function dispose() : void
      {
         _btnIncrease.dispose();
         _btnIncrease = null;
         _tooltip.dispose();
         _tooltip = null;
         _content.dispose();
         _content = null;
         _progressBar.dispose();
         _progressBar = null;
      }
      
      public function get increaseButton() : UiPlusButton
      {
         return _btnIncrease;
      }
      
      public function set guild(param1:Guild) : void
      {
         switch(int(_statType) - 1)
         {
            case 0:
               value = param1.statGuildCapacity;
               break;
            case 1:
               value = param1.statCharacterBaseStatsBoost;
               break;
            case 2:
               value = param1.statQuestXpRewardBoost;
               break;
            case 3:
               value = param1.statQuestGameCurrencyRewardBoost;
         }
         _guild = param1;
      }
      
      public function set value(param1:int) : void
      {
         _value = param1;
         _content.txtStatValue.text = param1.toString() + "/" + _max.toString();
         _progressBar.value = param1 / _max * 100;
      }
      
      public function getStatTooltip() : String
      {
         switch(int(_statType) - 1)
         {
            case 0:
               return LocText.current.text("screen/guild/guild_info/stat_guild_capacity_tooltip",_value,_value);
            case 1:
               return LocText.current.text("screen/guild/guild_info/stat_character_base_stats_boost_tooltip",_value,_value);
            case 2:
               return LocText.current.text("screen/guild/guild_info/stat_quest_xp_reward_boost_tooltip",_value,_value * 2);
            case 3:
               return LocText.current.text("screen/guild/guild_info/stat_quest_work_game_currency_reward_boost_tooltip",_value,_value * 2);
         }
      }
   }
}
