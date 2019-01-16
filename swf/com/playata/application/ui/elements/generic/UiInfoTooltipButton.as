package com.playata.application.ui.elements.generic
{
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.application.ui.elements.generic.textfield.UiTextTooltip;
   import com.playata.framework.application.Environment;
   import com.playata.framework.display.IDisplayObjectContainer;
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.ui.TooltipLayer;
   import com.playata.framework.display.ui.controls.Tooltip;
   import com.playata.framework.input.InteractionEvent;
   import visuals.ui.elements.buttons.SymbolButtonHelpGeneric;
   
   public class UiInfoTooltipButton
   {
       
      
      public function UiInfoTooltipButton()
      {
         super();
      }
      
      public static function assign(param1:IDisplayObjectContainer, param2:Tooltip, param3:Number, param4:Number) : void
      {
         displayObjectContainer = param1;
         tooltip = param2;
         x = param3;
         y = param4;
         if(!Environment.info.isTouchScreen)
         {
            return;
         }
         var buttonContent:Sprite = new SymbolButtonHelpGeneric();
         buttonContent.scale = 0.6;
         var button:UiButton = new UiButton(buttonContent,"",function(param1:InteractionEvent):void
         {
            var _loc2_:* = null;
            var _loc3_:* = null;
            if(tooltip && tooltip is UiTextTooltip)
            {
               _loc2_ = tooltip as UiTextTooltip;
               if(_loc2_.requestTextFunction != null)
               {
                  _loc3_ = _loc2_.requestTextFunction;
                  _loc2_.text = _loc3_();
               }
            }
            TooltipLayer.instance.tooltip = tooltip;
            TooltipLayer.instance.tooltipVisible = true;
         });
         button.x = x;
         button.y = y;
         displayObjectContainer.addChild(button);
      }
   }
}
