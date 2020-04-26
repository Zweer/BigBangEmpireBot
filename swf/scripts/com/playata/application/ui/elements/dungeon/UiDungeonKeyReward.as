package com.playata.application.ui.elements.dungeon
{
   import com.playata.application.ui.elements.generic.textfield.UiTextTooltip;
   import com.playata.framework.localization.LocText;
   import visuals.ui.elements.dungeon.SymbolDungeonKeyRewardGeneric;
   
   public class UiDungeonKeyReward
   {
       
      
      protected var _container:SymbolDungeonKeyRewardGeneric = null;
      
      protected var _tooltip:UiTextTooltip = null;
      
      public function UiDungeonKeyReward(param1:SymbolDungeonKeyRewardGeneric)
      {
         super();
         _container = param1;
         _tooltip = new UiTextTooltip(_container.tooltipLayer,LocText.current.text("general/dungeon_key/tooltip"));
      }
      
      public function dispose() : void
      {
         _tooltip.dispose();
         _tooltip = null;
      }
   }
}
