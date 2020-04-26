package com.playata.application.ui.elements.slotmachine
{
   import com.playata.application.data.GameUtil;
   import com.playata.application.ui.elements.generic.textfield.UiTextTooltip;
   import visuals.ui.elements.slotmachine.SymbolSlotmachineJetonRewardGeneric;
   
   public class UiSlotMachineJetonReward
   {
       
      
      protected var _container:SymbolSlotmachineJetonRewardGeneric = null;
      
      protected var _tooltip:UiTextTooltip = null;
      
      public function UiSlotMachineJetonReward(param1:SymbolSlotmachineJetonRewardGeneric)
      {
         super();
         _container = param1;
         _tooltip = new UiTextTooltip(_container.tooltipLayer,"");
         _container.txtAmount.text = "";
      }
      
      public function dispose() : void
      {
         _tooltip.dispose();
         _tooltip = null;
      }
      
      public function set amount(param1:int) : void
      {
         _container.txtAmount.text = param1.toString();
         _tooltip.text = GameUtil.getSlotmachineJetonCountString(param1);
      }
   }
}
