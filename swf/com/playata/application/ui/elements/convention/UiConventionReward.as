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
         switch(int(param1) - 1)
         {
            case 0:
               setValue(param1,GameUtil.getEnergyString(param2));
               _content.visible = param2 > 0;
               break;
            case 1:
               setValue(param1,GameUtil.getStreamingResourceString(param2));
               _content.visible = param2 > 0;
         }
      }
      
      public function setValue(param1:int, param2:String, param3:String = null) : void
      {
         _content.iconQuestEnergy.visible = param1 == 1;
         _content.iconStreamingResource.visible = param1 == 2;
         _content.txtValue.text = param2;
         if(param3)
         {
            _tooltip.text = param3;
         }
      }
   }
}
