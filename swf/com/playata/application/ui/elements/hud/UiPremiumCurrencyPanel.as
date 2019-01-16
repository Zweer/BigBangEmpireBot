package com.playata.application.ui.elements.hud
{
   import com.greensock.TimelineMax;
   import com.greensock.easing.Back;
   import com.greensock.easing.Linear;
   import com.greensock.easing.Quint;
   import com.playata.application.data.user.User;
   import com.playata.application.ui.effects.EffectsLayer;
   import com.playata.application.ui.elements.generic.textfield.UiTextTooltip;
   import com.playata.framework.localization.LocText;
   import com.playata.framework.tween.Tween;
   import com.playata.framework.tween.lib.greensock.GreenSockTween;
   import visuals.ui.elements.generic.SymbolPremiumCurrencyPanelGeneric;
   
   public class UiPremiumCurrencyPanel
   {
      
      private static var _instance:UiPremiumCurrencyPanel;
       
      
      private var _content:SymbolPremiumCurrencyPanelGeneric;
      
      private var _tooltipPremium:UiTextTooltip;
      
      private var _tooltipPremiumIcon:UiTextTooltip;
      
      private var _value:Array;
      
      private var _timeline:TimelineMax;
      
      private var _currentUser:User;
      
      private var _targetPremium:Number;
      
      public var offset:int = 0;
      
      public function UiPremiumCurrencyPanel(param1:SymbolPremiumCurrencyPanelGeneric)
      {
         super();
         if(_instance != null)
         {
            throw new Error("only one premium currency panel allowed");
         }
         _instance = this;
         _content = param1;
         _tooltipPremium = new UiTextTooltip(param1.txtPremiumCurrency,LocText.current.text("general/premium_tooltip"));
         _tooltipPremiumIcon = new UiTextTooltip(param1.iconPremiumCurrency,LocText.current.text("general/premium_tooltip"));
         _value = [];
      }
      
      public static function get instance() : UiPremiumCurrencyPanel
      {
         return _instance;
      }
      
      public function refresh() : void
      {
         var _loc2_:User = User.current;
         var _loc1_:Number = _loc2_.premiumCurrency - offset;
         if(_currentUser == null)
         {
            _value[0] = _loc1_;
            updatePremiumCurrencyText();
            _currentUser = User.current;
            _targetPremium = _loc1_;
            return;
         }
         if(_targetPremium == _loc1_)
         {
            return;
         }
         _targetPremium = _loc1_;
         if(_loc1_ > _value[0])
         {
            Tween.to(_value,0.6,{
               "delay":0.75,
               "endArray":[_loc1_],
               "ease":Linear.easeNone,
               "onUpdate":updatePremiumCurrencyText
            });
            if(EffectsLayer.instance.enabled)
            {
               playAnimation();
            }
         }
         else
         {
            Tween.to(_value,0.6,{
               "endArray":[_loc1_],
               "ease":Linear.easeNone,
               "onUpdate":updatePremiumCurrencyText
            });
         }
      }
      
      private function updatePremiumCurrencyText() : void
      {
         _content.txtPremiumCurrency.text = LocText.current.formatHugeNumber(Math.round(_value[0]));
      }
      
      public function refreshLocalization() : void
      {
         _tooltipPremium.text = LocText.current.text("general/premium_tooltip");
         _tooltipPremiumIcon.text = LocText.current.text("general/premium_tooltip");
      }
      
      public function dispose() : void
      {
         _tooltipPremiumIcon.dispose();
         _tooltipPremiumIcon = null;
         _tooltipPremium.dispose();
         _tooltipPremium = null;
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
            _timeline.addLabel("UiPremiumCurrencyPanel");
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
