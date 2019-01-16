package com.playata.application.ui.elements.generic
{
   import com.playata.framework.display.ui.controls.ILabel;
   import com.playata.framework.localization.LocText;
   import visuals.ui.elements.generic.SymbolCounterGeneric;
   
   public class UiCounterBubble
   {
       
      
      public function UiCounterBubble()
      {
         super();
      }
      
      public static function setStringValue(param1:SymbolCounterGeneric, param2:String) : void
      {
         param1.bringToTop();
         var _loc4_:* = 31;
         var _loc3_:ILabel = param1.caption;
         _loc3_.text = param2;
         if(_loc3_.textWidth + 10 > _loc4_)
         {
            _loc3_.width = _loc3_.textWidth + 10;
         }
         else
         {
            _loc3_.width = 29;
         }
      }
      
      public static function setIntValue(param1:SymbolCounterGeneric, param2:int) : void
      {
         param1.bringToTop();
         var _loc4_:* = 31;
         var _loc3_:ILabel = param1.caption;
         _loc3_.text = LocText.current.formatHugeNumber(param2);
         if(_loc3_.textWidth + 10 > _loc4_)
         {
            _loc3_.width = _loc3_.textWidth + 10;
         }
         else
         {
            _loc3_.width = 29;
         }
      }
   }
}
