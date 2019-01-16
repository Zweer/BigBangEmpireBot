package com.playata.application.ui.elements.generic.textfield
{
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.framework.application.Environment;
   import com.playata.framework.display.IDisplayObject;
   import com.playata.framework.display.IInteractiveDisplayObject;
   import com.playata.framework.display.InteractiveDisplayObject;
   import com.playata.framework.display.ui.TooltipLayer;
   import com.playata.framework.display.ui.controls.TextTooltip;
   import com.playata.framework.input.InteractionEvent;
   import flash.geom.Rectangle;
   import visuals.ui.base.SymbolUiTooltipGeneric;
   import visuals.ui.elements.buttons.SymbolButtonCloseGeneric;
   
   public class UiTextTooltip extends TextTooltip
   {
      
      private static var _btnClose:UiButton = null;
      
      private static var _tooltipContent:SymbolUiTooltipGeneric = null;
       
      
      private var _interactiveDisplayObject:IInteractiveDisplayObject = null;
      
      private var _width:Number = 0;
      
      public function UiTextTooltip(param1:IDisplayObject, param2:String, param3:Function = null, param4:Number = 300)
      {
         if(param1 is IInteractiveDisplayObject)
         {
            _interactiveDisplayObject = param1 as IInteractiveDisplayObject;
         }
         else if(param1)
         {
            _interactiveDisplayObject = new InteractiveDisplayObject(param1);
         }
         if(!_tooltipContent)
         {
            _tooltipContent = new SymbolUiTooltipGeneric();
         }
         _width = param4;
         super(_interactiveDisplayObject,_tooltipContent,param2,param3);
      }
      
      override public function onAssigned() : void
      {
         if(_tooltipContent.tooltip.text == text)
         {
            return;
         }
         if(text == null)
         {
            text = "";
         }
         if(text == "")
         {
            return;
         }
         if(_isHtml)
         {
            _tooltipContent.tooltip.htmlText = text;
         }
         else
         {
            _tooltipContent.tooltip.text = text;
         }
         var _loc2_:Rectangle = _tooltipContent.tooltip.getTextBounds(_width);
         var _loc4_:int = 5;
         var _loc3_:int = 10;
         var _loc1_:int = 45;
         _tooltipContent.tooltip.width = _loc2_.width + _loc4_;
         _tooltipContent.tooltip.height = _loc2_.height + _loc3_;
         _tooltipContent.background.width = _loc2_.width + _loc1_;
         _tooltipContent.background.height = _loc2_.height + _loc1_;
         placeCloseButton();
      }
      
      override public function onShow() : void
      {
         _tooltipContent.visible = text != "";
      }
      
      override protected function onTextChanged() : void
      {
         if(TooltipLayer.instance && TooltipLayer.instance.tooltip == this)
         {
            onAssigned();
         }
      }
      
      protected function placeCloseButton() : void
      {
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
         _tooltipContent.addChild(_btnClose);
         _btnClose.x = _tooltipContent.background.x + _tooltipContent.background.width - 12;
         _btnClose.y = _tooltipContent.background.y + 10;
      }
   }
}
