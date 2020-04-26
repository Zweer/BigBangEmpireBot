package com.playata.application.ui.elements.hud
{
   import com.greensock.TimelineMax;
   import com.greensock.easing.Back;
   import com.greensock.easing.Linear;
   import com.greensock.easing.Quint;
   import com.playata.application.data.character.Character;
   import com.playata.application.data.user.User;
   import com.playata.application.ui.effects.EffectsLayer;
   import com.playata.application.ui.elements.generic.textfield.UiTextTooltip;
   import com.playata.framework.localization.LocText;
   import com.playata.framework.tween.Tween;
   import com.playata.framework.tween.lib.greensock.GreenSockTween;
   import visuals.ui.elements.generic.SymbolCoinsPanelGeneric;
   
   public class UiGameCurrencyPanel
   {
       
      
      private var _content:SymbolCoinsPanelGeneric;
      
      private var _tooltipGameCurrencyIcon:UiTextTooltip;
      
      private var _tooltipGameCurrency:UiTextTooltip;
      
      private var _value:Array;
      
      private var _timeline:TimelineMax;
      
      private var _currentUser:User;
      
      private var _targetGameCurrency:Number;
      
      public var offset:int;
      
      public function UiGameCurrencyPanel(param1:SymbolCoinsPanelGeneric)
      {
         super();
         _content = param1;
         _tooltipGameCurrencyIcon = new UiTextTooltip(param1.iconGameCurrency,LocText.current.text("general/coins_tooltip"));
         _tooltipGameCurrency = new UiTextTooltip(param1.txtGameCurrency,LocText.current.text("general/coins_tooltip"));
         _content.txtGameCurrency.autoFontSize = true;
         _value = [];
      }
      
      public function refresh() : void
      {
         var _loc1_:Character = User.current.character;
         var _loc2_:Number = _loc1_.gameCurrency - offset;
         if(_currentUser == null)
         {
            _value[0] = _loc2_;
            updateGameCurrencyText();
            _currentUser = User.current;
            _targetGameCurrency = _loc2_;
            return;
         }
         if(_targetGameCurrency == _loc2_)
         {
            return;
         }
         _targetGameCurrency = _loc2_;
         if(_targetGameCurrency > _value[0])
         {
            Tween.to(_value,0.6,{
               "delay":0.75,
               "endArray":[_targetGameCurrency],
               "ease":Linear.easeNone,
               "onUpdate":updateGameCurrencyText
            });
            if(EffectsLayer.instance.enabled)
            {
               playAnimation();
            }
         }
         else
         {
            Tween.to(_value,0.6,{
               "endArray":[_targetGameCurrency],
               "ease":Linear.easeNone,
               "onUpdate":updateGameCurrencyText
            });
         }
      }
      
      private function updateGameCurrencyText() : void
      {
         _content.txtGameCurrency.text = LocText.current.formatHugeNumber(Math.round(_value[0]));
      }
      
      public function refreshLocalization() : void
      {
         _tooltipGameCurrency.text = LocText.current.text("general/coins_tooltip");
         _tooltipGameCurrencyIcon.text = LocText.current.text("general/coins_tooltip");
      }
      
      public function dispose() : void
      {
         _tooltipGameCurrencyIcon.dispose();
         _tooltipGameCurrencyIcon = null;
         _tooltipGameCurrency.dispose();
         _tooltipGameCurrency = null;
      }
      
      public function reset() : void
      {
         _currentUser = null;
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
            _timeline.addLabel("UiGameCurrencyPanel");
            _timeline.paused(true);
            _timeline.insert((_content.tweenTo(0.1,{
               "rotation":2,
               "scaleX":1.05,
               "scaleY":1.05,
               "ease":Quint.easeOut
            }) as GreenSockTween).tween,0.7);
            _timeline.append((_content.tweenTo(0.01,{
               "rotation":1,
               "scaleX":0.95,
               "scaleY":0.95,
               "ease":Linear.easeNone
            }) as GreenSockTween).tween);
            _timeline.append((_content.tweenTo(0.1,{
               "rotation":2,
               "scaleX":1.05,
               "scaleY":1.05,
               "ease":Quint.easeOut
            }) as GreenSockTween).tween);
            _timeline.append((_content.tweenTo(0.01,{
               "rotation":1,
               "scaleX":0.95,
               "scaleY":0.95,
               "ease":Linear.easeNone
            }) as GreenSockTween).tween);
            _timeline.append((_content.tweenTo(0.1,{
               "rotation":2,
               "scaleX":1.05,
               "scaleY":1.05,
               "ease":Quint.easeOut
            }) as GreenSockTween).tween);
            _timeline.append((_content.tweenTo(0.4,{
               "rotation":0,
               "scaleX":1,
               "scaleY":1,
               "ease":Back.easeOut
            }) as GreenSockTween).tween);
         }
         _timeline.gotoAndPlay(0);
      }
      
      public function set visible(param1:Boolean) : void
      {
         _content.visible = param1;
      }
   }
}
