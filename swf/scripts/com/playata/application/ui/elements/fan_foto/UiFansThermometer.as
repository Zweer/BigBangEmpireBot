package com.playata.application.ui.elements.fan_foto
{
   import com.playata.framework.localization.LocText;
   import visuals.ui.elements.conventions.SymbolConventionFansBarGeneric;
   
   public class UiFansThermometer
   {
       
      
      private var _bar:SymbolConventionFansBarGeneric = null;
      
      private var _maximum:Number = 1;
      
      private var _value:int = 0;
      
      private var _maskHeight:Number;
      
      public function UiFansThermometer(param1:SymbolConventionFansBarGeneric, param2:int, param3:int, param4:Boolean = true)
      {
         super();
         _bar = param1;
         _maskHeight = param1.m.height;
         _maximum = param2;
         value = param3;
         if(!param4)
         {
            param1.txtFans.rotation = 1;
            param1.txtFans.y = param1.txtFans.y + 7;
         }
      }
      
      public function dispose() : void
      {
      }
      
      public function set maximum(param1:Number) : void
      {
         _maximum = param1;
         refresh();
      }
      
      public function set value(param1:int) : void
      {
         _value = param1;
         refresh();
      }
      
      public function get value() : int
      {
         return _value;
      }
      
      private function calculateMaskHeight() : Number
      {
         var _loc1_:Number = Math.min(1,_value / _maximum);
         var _loc2_:int = Math.ceil(_maskHeight * _loc1_);
         return _loc2_;
      }
      
      public function set text(param1:String) : void
      {
         _bar.txtFans.text = param1;
      }
      
      public function refresh() : void
      {
         text = LocText.current.text("convention/fans",LocText.current.formatHugeNumber(_value),LocText.current.formatHugeNumber(_maximum));
         _bar.m.height = calculateMaskHeight();
      }
   }
}
