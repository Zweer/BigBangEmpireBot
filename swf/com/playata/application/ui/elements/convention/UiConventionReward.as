package com.playata.application.ui.elements.convention
{
   import com.playata.application.data.GameUtil;
   import com.playata.application.ui.elements.generic.textfield.UiTextTooltip;
   import visuals.ui.elements.conventions.SymbolConventionRewardGeneric;
   
   public class UiConventionReward
   {
       
      
      private var _content:SymbolConventionRewardGeneric = null;
      
      private var _tooltip:UiTextTooltip = null;
      
      public function UiConventionReward(param1:SymbolConventionRewardGeneric)
      {
         super();
         _content = param1;
         _tooltip = new UiTextTooltip(_content,"");
      }
      
      public function dispose() : void
      {
         _tooltip.dispose();
         _tooltip = null;
      }
      
      public function refresh(param1:int, param2:Number) : void
      {
         if(!(int(param1) - 1))
         {
            setValue(param1,GameUtil.getEnergyString(param2));
         }
      }
      
      public function setValue(param1:int, param2:String, param3:String = null) : void
      {
         _content.iconQuestEnergy.visible = param1 == 1;
         _content.txtValue.text = param2;
         if(param3)
         {
            _tooltip.text = param3;
         }
      }
   }
}
