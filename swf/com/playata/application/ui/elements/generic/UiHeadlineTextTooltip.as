package com.playata.application.ui.elements.generic
{
   import com.playata.framework.display.IDisplayObject;
   import com.playata.framework.display.IInteractiveDisplayObject;
   import com.playata.framework.display.InteractiveDisplayObject;
   import com.playata.framework.display.ui.controls.Tooltip;
   import visuals.ui.base.SymbolUiHeadlineTooltipGeneric;
   
   public class UiHeadlineTextTooltip extends Tooltip
   {
      
      protected static var _tooltipContent:SymbolUiHeadlineTooltipGeneric;
       
      
      protected var _width:Number = 0;
      
      private var _text:String;
      
      private var _title:String;
      
      private var _interactiveDisplayObject:IInteractiveDisplayObject = null;
      
      public function UiHeadlineTextTooltip(param1:IDisplayObject, param2:String = "", param3:String = "", param4:Number = 300)
      {
         if(param1 is IInteractiveDisplayObject)
         {
            _interactiveDisplayObject = param1 as IInteractiveDisplayObject;
         }
         else if(param1)
         {
            _interactiveDisplayObject = new InteractiveDisplayObject(param1);
         }
         _width = param4;
         if(!_tooltipContent)
         {
            _tooltipContent = new SymbolUiHeadlineTooltipGeneric();
            _tooltipContent.title.autoFontSize = true;
            _tooltipContent.tooltip.autoFontSize = true;
         }
         _tooltipContent.visible = false;
         super(_interactiveDisplayObject,_tooltipContent);
         _title = param2;
         _text = param3;
         if(_title || _text)
         {
            refreshUi();
         }
      }
      
      override public function dispose() : void
      {
         super.dispose();
      }
      
      public function set title(param1:String) : void
      {
         if(_title == param1)
         {
            return;
         }
         if(param1 == null)
         {
            param1 = "";
         }
         _title = param1;
      }
      
      public function get title() : String
      {
         return _title;
      }
      
      public function set text(param1:String) : void
      {
         if(_text == param1)
         {
            return;
         }
         if(param1 == null)
         {
            param1 = "";
         }
         _text = param1;
      }
      
      public function get text() : String
      {
         return _text;
      }
      
      override public function onAssigned() : void
      {
         if(_tooltipContent.title.text == _title && _tooltipContent.tooltip.htmlText == _text)
         {
            return;
         }
         refreshUi();
      }
      
      private function refreshUi() : void
      {
         _tooltipContent.visible = _text != "" && _title != "";
         var _loc4_:* = _width;
         _tooltipContent.tooltip.width = _loc4_;
         _tooltipContent.title.width = _loc4_;
         _tooltipContent.title.text = _title;
         _tooltipContent.tooltip.htmlText = _text;
         _tooltipContent.tooltip.y = _tooltipContent.title.y + _tooltipContent.title.textHeight + 10;
         var _loc2_:Number = Math.max(_tooltipContent.title.textWidth,_tooltipContent.tooltip.textWidth);
         var _loc3_:Number = _tooltipContent.tooltip.y - _tooltipContent.title.y + _tooltipContent.tooltip.textHeight;
         var _loc1_:int = 45;
         _tooltipContent.background.width = _loc2_ + _loc1_;
         _tooltipContent.background.height = _loc3_ + _loc1_;
      }
   }
}
