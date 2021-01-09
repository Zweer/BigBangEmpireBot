package com.playata.application.ui.elements.optical_changes
{
   import com.greensock.TimelineMax;
   import com.greensock.easing.Back;
   import com.greensock.easing.Linear;
   import com.greensock.easing.Quint;
   import com.playata.application.data.character.Character;
   import com.playata.application.data.constants.CConstant;
   import com.playata.application.data.optical_changes.OpticalChanges;
   import com.playata.application.ui.effects.EffectsLayer;
   import com.playata.application.ui.elements.generic.textfield.UiTextTooltip;
   import com.playata.framework.localization.LocText;
   import com.playata.framework.tween.Tween;
   import com.playata.framework.tween.lib.greensock.GreenSockTween;
   import visuals.ui.elements.optical_changes.SymbolOpticalChangeCurrencyGeneric;
   
   public class UiOpticalChangesCurrencyProgressBar
   {
       
      
      private var _vo:SymbolOpticalChangeCurrencyGeneric;
      
      private var _value:Array;
      
      private var _timeline:TimelineMax;
      
      private var _currentCharacter:Character;
      
      private var _targetValue:Number;
      
      private var _fillHeight:int = 134;
      
      private var _fillY:int = -94;
      
      private var _tooltip:UiTextTooltip = null;
      
      public function UiOpticalChangesCurrencyProgressBar(param1:SymbolOpticalChangeCurrencyGeneric)
      {
         super();
         _vo = param1;
         _value = [];
         _vo.txtOpticalChangeCurrency.autoFontSize = true;
         _tooltip = new UiTextTooltip(param1,LocText.current.text("general/optical_changes_currency_tooltip"));
      }
      
      public function refreshLocalization() : void
      {
         _tooltip.text = LocText.current.text("general/optical_changes_currency_tooltip");
      }
      
      public function refresh(param1:Character) : void
      {
         var _loc2_:Number = NaN;
         if(param1 && param1.isMe && param1.level >= CConstant.optical_change_unlock_level)
         {
            _vo.visible = true;
            _loc2_ = OpticalChanges.instance.resource;
            if(_currentCharacter == null)
            {
               _value[0] = _loc2_;
               updateValueText();
               _currentCharacter = param1;
               _targetValue = _loc2_;
               return;
            }
            if(_targetValue == _loc2_)
            {
               return;
            }
            _targetValue = _loc2_;
            if(_loc2_ > _value[0])
            {
               Tween.to(_value,0.6,{
                  "delay":0.75,
                  "endArray":[_loc2_],
                  "ease":Linear.easeNone,
                  "onUpdate":updateValueText
               });
               if(EffectsLayer.instance.enabled)
               {
                  playAnimation();
               }
            }
            else
            {
               Tween.to(_value,0.6,{
                  "endArray":[_loc2_],
                  "ease":Linear.easeNone,
                  "onUpdate":updateValueText
               });
            }
         }
         else
         {
            _vo.visible = false;
            _currentCharacter = null;
         }
      }
      
      private function updateValueText() : void
      {
         var _loc2_:int = Math.floor(_value[0]);
         _vo.txtOpticalChangeCurrency.text = LocText.current.formatHugeNumber(Math.round(_loc2_)) + "/" + CConstant.optical_change_chest_price_small;
         var _loc1_:Number = Math.min(_loc2_ / CConstant.optical_change_chest_price_small,1);
         var _loc3_:Number = _fillHeight * _loc1_;
         _vo.m.height = _loc3_;
         _vo.m.y = _fillY + _fillHeight - _loc3_ - 1;
      }
      
      public function dispose() : void
      {
      }
      
      public function reset() : void
      {
         _currentCharacter = null;
      }
      
      private function playAnimation() : void
      {
         if(!_timeline)
         {
            _timeline = new TimelineMax({"onComplete":function():void
            {
               _timeline.kill();
               _timeline = null;
            }});
            _timeline.addLabel("UiOpticalChangesCurrencyPanel");
            _timeline.paused(true);
            _timeline.insert((_vo.tweenTo(0.1,{
               "rotation":2,
               "scaleX":1.05,
               "scaleY":1.05,
               "ease":Quint.easeOut
            }) as GreenSockTween).tween,0.7);
            _timeline.append((_vo.tweenTo(0.01,{
               "rotation":1,
               "scaleX":0.95,
               "scaleY":0.95,
               "ease":Linear.easeNone
            }) as GreenSockTween).tween);
            _timeline.append((_vo.tweenTo(0.1,{
               "rotation":2,
               "scaleX":1.05,
               "scaleY":1.05,
               "ease":Quint.easeOut
            }) as GreenSockTween).tween);
            _timeline.append((_vo.tweenTo(0.01,{
               "rotation":1,
               "scaleX":0.95,
               "scaleY":0.95,
               "ease":Linear.easeNone
            }) as GreenSockTween).tween);
            _timeline.append((_vo.tweenTo(0.1,{
               "rotation":2,
               "scaleX":1.05,
               "scaleY":1.05,
               "ease":Quint.easeOut
            }) as GreenSockTween).tween);
            _timeline.append((_vo.tweenTo(0.4,{
               "rotation":0,
               "scaleX":1,
               "scaleY":1,
               "ease":Back.easeOut
            }) as GreenSockTween).tween);
         }
         _timeline.gotoAndPlay(0);
      }
      
      public function hide() : void
      {
         _vo.visible = false;
      }
   }
}
