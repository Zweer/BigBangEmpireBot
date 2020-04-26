package com.playata.application.ui.elements.battle
{
   import com.playata.application.ui.elements.generic.UiClosableTooltip;
   import com.playata.framework.display.IInteractiveDisplayObject;
   import com.playata.framework.localization.LocText;
   import visuals.ui.base.SymbolUiBattleSkillDetailTooltipGeneric;
   
   public class UiBattleSkillDetailTooltip extends UiClosableTooltip
   {
      
      protected static var _tooltipContent:SymbolUiBattleSkillDetailTooltipGeneric;
      
      protected static var _currentQuality:int;
       
      
      protected var _width:Number = 0;
      
      private var _text:String;
      
      private var _title:String;
      
      private var _quality:int;
      
      public function UiBattleSkillDetailTooltip(param1:IInteractiveDisplayObject, param2:String = "", param3:String = "", param4:int = 0, param5:Number = 300)
      {
         _width = param5;
         if(!_tooltipContent)
         {
            _tooltipContent = new SymbolUiBattleSkillDetailTooltipGeneric();
            _tooltipContent.title.autoFontSize = true;
            _tooltipContent.tooltip.autoFontSize = true;
         }
         _tooltipContent.visible = false;
         super(param1,_tooltipContent);
         _title = param2;
         _quality = param4;
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
      
      public function get quality() : int
      {
         return _quality;
      }
      
      public function set quality(param1:int) : void
      {
         if(_quality == param1)
         {
            return;
         }
         _quality = param1;
      }
      
      override public function onAssigned() : void
      {
         if(_currentQuality == _quality && _tooltipContent.title.text == _title && _tooltipContent.tooltip.htmlText == _text)
         {
            return;
         }
         refreshUi();
      }
      
      private function refreshUi() : void
      {
         var _loc2_:Number = NaN;
         _currentQuality = _quality;
         _tooltipContent.visible = _text != "" && _title != "";
         var _loc4_:* = _width;
         _tooltipContent.tooltip.width = _loc4_;
         _tooltipContent.title.width = _loc4_;
         _tooltipContent.title.text = _title;
         _tooltipContent.quality.visible = true;
         switch(int(_quality))
         {
            case 0:
               _tooltipContent.quality.visible = false;
               break;
            case 1:
               _tooltipContent.quality.text = LocText.current.text("battle_skills/common");
               _tooltipContent.quality.textColor = 14342874;
               break;
            case 2:
               _tooltipContent.quality.text = LocText.current.text("battle_skills/rare");
               _tooltipContent.quality.textColor = 26367;
               break;
            case 3:
               _tooltipContent.quality.text = LocText.current.text("battle_skills/epic");
               _tooltipContent.quality.textColor = 13107408;
         }
         _tooltipContent.tooltip.htmlText = _text;
         if(_tooltipContent.quality.visible)
         {
            _tooltipContent.quality.y = _tooltipContent.title.y + _tooltipContent.title.textHeight + 4;
            _tooltipContent.tooltip.y = _tooltipContent.quality.y + _tooltipContent.quality.textHeight + 8;
            _loc2_ = Math.max(_tooltipContent.title.textWidth,_tooltipContent.quality.textWidth,_tooltipContent.tooltip.textWidth);
         }
         else
         {
            _tooltipContent.tooltip.y = _tooltipContent.title.y + _tooltipContent.title.textHeight + 8;
            _loc2_ = Math.max(_tooltipContent.title.textWidth,_tooltipContent.tooltip.textWidth);
         }
         _loc2_ = _loc2_ + 5;
         var _loc3_:Number = _tooltipContent.tooltip.y - _tooltipContent.title.y + _tooltipContent.tooltip.textHeight;
         var _loc1_:int = 45;
         _tooltipContent.background.width = _loc2_ + _loc1_;
         _tooltipContent.background.height = _loc3_ + _loc1_;
      }
   }
}
