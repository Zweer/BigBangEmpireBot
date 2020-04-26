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
   import visuals.ui.elements.duel.SymbolHonorPanelGeneric;
   
   public class UiHonorPanel
   {
       
      
      private var _content:SymbolHonorPanelGeneric;
      
      private var _tooltipHonor:UiTextTooltip;
      
      private var _tooltipHonorText:UiTextTooltip;
      
      private var _value:Array;
      
      private var _timeline:TimelineMax;
      
      private var _currentUser:User;
      
      private var _targetHonor:Number;
      
      public function UiHonorPanel(param1:SymbolHonorPanelGeneric)
      {
         super();
         _content = param1;
         _tooltipHonor = new UiTextTooltip(param1.iconOwnHonor,LocText.current.text("screen/duel/own_honor_tooltip"));
         _tooltipHonorText = new UiTextTooltip(param1.txtOwnHonor,LocText.current.text("screen/duel/own_honor_tooltip"));
         _value = [];
      }
      
      public function refresh() : void
      {
         var _loc1_:Character = User.current.character;
         var _loc2_:Number = _loc1_.honor;
         if(_currentUser != User.current)
         {
            _value[0] = _loc2_;
            updateHonorText();
            _currentUser = User.current;
            _targetHonor = _loc2_;
            return;
         }
         if(_targetHonor == _loc2_)
         {
            return;
         }
         _targetHonor = _loc2_;
         if(_loc2_ > _value[0])
         {
            Tween.to(_value,0.6,{
               "delay":0.75,
               "endArray":[_loc2_],
               "ease":Linear.easeNone,
               "onUpdate":updateHonorText
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
               "onUpdate":updateHonorText
            });
         }
      }
      
      private function updateHonorText() : void
      {
         _content.txtOwnHonor.text = LocText.current.formatHugeNumber(Math.round(_value[0]));
      }
      
      public function refreshLocalization() : void
      {
         _tooltipHonor.text = LocText.current.text("screen/duel/own_honor_tooltip");
         _tooltipHonorText.text = LocText.current.text("screen/duel/own_honor_tooltip");
      }
      
      public function dispose() : void
      {
         _tooltipHonor.dispose();
         _tooltipHonor = null;
         _tooltipHonorText.dispose();
         _tooltipHonorText = null;
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
            _timeline.addLabel("UiHonorPanel");
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
   }
}
