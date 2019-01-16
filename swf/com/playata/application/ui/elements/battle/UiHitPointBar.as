package com.playata.application.ui.elements.battle
{
   import com.playata.application.ui.elements.generic.textfield.UiTextTooltip;
   import com.playata.framework.localization.LocText;
   import visuals.ui.elements.battle.SymbolBattleHitpointBarGeneric;
   
   public class UiHitPointBar
   {
       
      
      private var _bar:SymbolBattleHitpointBarGeneric = null;
      
      private var _maximum:int = 1;
      
      private var _value:int = 0;
      
      private var _tooltip:UiTextTooltip = null;
      
      public function UiHitPointBar(param1:SymbolBattleHitpointBarGeneric)
      {
         super();
         _bar = param1;
         _bar.fillRed.visible = false;
         _tooltip = new UiTextTooltip(_bar.txtInfo,LocText.current.text("screen/battle_visualization/hitpoints_tooltip"));
      }
      
      public function dispose() : void
      {
         _bar.dispose();
         _bar = null;
         _tooltip.dispose();
         _tooltip = null;
      }
      
      public function set redColor(param1:Boolean) : void
      {
         _bar.fill.visible = !param1;
         _bar.fillRed.visible = param1;
      }
      
      public function get redColor() : Boolean
      {
         return _bar.fillRed.visible;
      }
      
      public function set maximum(param1:Number) : void
      {
         _maximum = param1;
         refresh();
      }
      
      public function set value(param1:Number) : void
      {
         _value = param1;
         refresh();
      }
      
      public function init(param1:Number) : void
      {
         _maximum = param1;
         _value = param1;
         refresh();
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
         _bar.txtInfo.text = LocText.current.text("screen/battle_visualization/hitpoints",LocText.current.formatHugeNumber(_value),LocText.current.formatHugeNumber(_maximum));
         _bar.fill.tweenTo(0.5,{"x":calculateFillPosition(_value)});
      }
      
      private function calculateFillPosition(param1:Number) : Number
      {
         var _loc2_:Number = _bar.m.x - _bar.fill.width;
         var _loc3_:Number = param1 / _maximum * _bar.m.width;
         return _loc2_ + _loc3_;
      }
      
      public function refresh() : void
      {
         _bar.txtInfo.text = LocText.current.text("screen/battle_visualization/hitpoints",LocText.current.formatHugeNumber(_value),LocText.current.formatHugeNumber(_maximum));
         _bar.fill.x = calculateFillPosition(_value);
         _bar.fillRed.x = calculateFillPosition(_value);
      }
   }
}
