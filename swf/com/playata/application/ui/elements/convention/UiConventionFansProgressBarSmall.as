package com.playata.application.ui.elements.convention
{
   import visuals.ui.elements.conventions.SymbolConventionFansBarSmallGeneric;
   
   public class UiConventionFansProgressBarSmall
   {
       
      
      private var _bar:SymbolConventionFansBarSmallGeneric = null;
      
      private var _maximum:int = 1;
      
      private var _value:int = 0;
      
      private var _maskHeight:Number = 0;
      
      public function UiConventionFansProgressBarSmall(param1:SymbolConventionFansBarSmallGeneric)
      {
         super();
         _bar = param1;
         _maskHeight = _bar.m.height;
      }
      
      public function dispose() : void
      {
         _bar = null;
      }
      
      public function refresh(param1:int, param2:int) : void
      {
         _maximum = param1;
         _value = param2;
         var _loc3_:Number = Math.min(1,_value / _maximum);
         _bar.m.height = Math.ceil(_loc3_ * _maskHeight);
      }
   }
}
