package com.playata.application.ui.elements.duel
{
   import com.playata.application.data.duel.Duel;
   import com.playata.application.data.user.User;
   import visuals.ui.elements.duel.SymbolDuelStaminaBarGeneric;
   
   public class UiDuelStaminaBar
   {
       
      
      private var _bar:SymbolDuelStaminaBarGeneric = null;
      
      private var _value:Number = 0;
      
      private var _lastMaxValue:int = 0;
      
      public function UiDuelStaminaBar(param1:SymbolDuelStaminaBarGeneric)
      {
         super();
         _bar = param1;
         param1.delimiterContainer.removeAllChildren();
      }
      
      public function dispose() : void
      {
         _bar.dispose();
         _bar = null;
      }
      
      public function set value(param1:Number) : void
      {
         _value = param1;
         refresh();
      }
      
      public function get value() : Number
      {
         return _value;
      }
      
      public function decrease(param1:Number) : void
      {
         _value = _value - param1;
         setValue(_value);
      }
      
      public function setValue(param1:Number) : void
      {
         _value = param1;
         if(_value < 0)
         {
            _value = 0;
         }
         _bar.fill.tweenTo(0.5,{"x":calculateFillPosition(_value)});
      }
      
      private function calculateFillPosition(param1:Number) : Number
      {
         var _loc2_:Number = _bar.m.x - _bar.fill.width;
         var _loc3_:Number = param1 / Duel.maxDuelStamina * _bar.m.width;
         return _loc2_ + _loc3_;
      }
      
      public function refresh() : void
      {
         var _loc4_:Number = NaN;
         var _loc3_:int = 0;
         var _loc1_:Number = NaN;
         var _loc2_:int = 0;
         _bar.fill.x = calculateFillPosition(_value);
         if(Duel.maxDuelStamina != _lastMaxValue && User.current && User.current.character)
         {
            _lastMaxValue = Duel.maxDuelStamina;
            _bar.delimiterContainer.nativeInstance.graphics.clear();
            _loc4_ = Duel.maxDuelStamina / User.current.character.duelStaminaCost;
            _loc3_ = Math.floor(_loc4_);
            _loc1_ = _bar.m.width / _loc4_;
            if(_loc3_ == _loc4_)
            {
               _loc3_--;
            }
            _bar.delimiterContainer.nativeInstance.graphics.lineStyle(1.1,16777215);
            _loc2_ = 1;
            while(_loc2_ <= _loc3_)
            {
               _bar.delimiterContainer.nativeInstance.graphics.moveTo(_loc2_ * _loc1_,0);
               _bar.delimiterContainer.nativeInstance.graphics.lineTo(_loc2_ * _loc1_,30);
               _loc2_++;
            }
         }
      }
   }
}
