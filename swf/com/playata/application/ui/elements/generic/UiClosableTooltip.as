package com.playata.application.ui.elements.generic
{
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.framework.application.Environment;
   import com.playata.framework.display.IInteractiveDisplayObject;
   import com.playata.framework.display.ISprite;
   import com.playata.framework.display.ui.TooltipLayer;
   import com.playata.framework.display.ui.controls.Tooltip;
   import com.playata.framework.input.InteractionEvent;
   import visuals.ui.elements.buttons.SymbolButtonCloseGeneric;
   
   public class UiClosableTooltip extends Tooltip
   {
      
      protected static var _btnClose:UiButton = null;
       
      
      protected var _visualSprite:ISprite = null;
      
      public function UiClosableTooltip(param1:IInteractiveDisplayObject, param2:ISprite)
      {
         _visualSprite = param2;
         super(param1,param2);
      }
      
      protected function placeCloseButton(param1:ISprite) : void
      {
         background = param1;
         if(!Environment.info.isTouchScreen)
         {
            return;
         }
         if(!_btnClose)
         {
            var buttonCloseContent:SymbolButtonCloseGeneric = new SymbolButtonCloseGeneric();
            buttonCloseContent.scale = 0.75;
            _btnClose = new UiButton(buttonCloseContent,"",function(param1:InteractionEvent):void
            {
               TooltipLayer.instance.tooltipVisible = false;
            });
         }
         _visualSprite.addChild(_btnClose);
         _btnClose.x = background.x + background.width - 12;
         _btnClose.y = background.y + 10;
      }
   }
}
