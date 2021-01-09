package com.playata.application.ui.elements.streaming
{
   import com.greensock.TimelineMax;
   import com.greensock.easing.Back;
   import com.greensock.easing.Linear;
   import com.greensock.easing.Quint;
   import com.playata.application.data.streaming.Streaming;
   import com.playata.application.data.user.User;
   import com.playata.application.ui.effects.EffectsLayer;
   import com.playata.application.ui.elements.generic.textfield.UiTextTooltip;
   import com.playata.framework.localization.LocText;
   import com.playata.framework.tween.Tween;
   import com.playata.framework.tween.lib.greensock.GreenSockTween;
   import visuals.ui.elements.streaming.SymbolStreamingResourcePanelGeneric;
   
   public class UiStreamingResourcePanel
   {
       
      
      private var _content:SymbolStreamingResourcePanelGeneric;
      
      private var _tooltip:UiTextTooltip;
      
      private var _value:Array;
      
      private var _timeline:TimelineMax;
      
      private var _currentStreaming:Streaming;
      
      private var _targetResource:Number;
      
      public function UiStreamingResourcePanel(param1:SymbolStreamingResourcePanelGeneric)
      {
         super();
         _content = param1;
         _tooltip = new UiTextTooltip(param1,LocText.current.text("screen/streaming/resource_panel_tooltip"));
         _value = [];
         refresh();
      }
      
      public function refresh() : void
      {
         if(!User.current || !User.current.character || !User.current.character.streaming)
         {
            _content.visible = false;
            return;
         }
         var _loc1_:Streaming = User.current.character.streaming;
         _content.visible = true;
         var _loc2_:Number = _loc1_.streamingResource;
         if(_currentStreaming != _loc1_)
         {
            _value[0] = _loc2_;
            updateResourceText();
            _currentStreaming = _loc1_;
            _targetResource = _loc2_;
            return;
         }
         if(_targetResource == _loc2_)
         {
            return;
         }
         _targetResource = _loc2_;
         if(_loc2_ > _value[0])
         {
            Tween.to(_value,0.6,{
               "delay":0.75,
               "endArray":[_loc2_],
               "ease":Linear.easeNone,
               "onUpdate":updateResourceText
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
               "onUpdate":updateResourceText
            });
         }
      }
      
      private function updateResourceText() : void
      {
         _content.txtResource.text = LocText.current.formatHugeNumber(Math.round(_value[0]));
      }
      
      public function refreshLocalization() : void
      {
         _tooltip.text = LocText.current.text("screen/duel/own_honor_tooltip");
      }
      
      public function dispose() : void
      {
         _tooltip.dispose();
         _tooltip = null;
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
            _timeline.addLabel("UiStreamingResourcePanel");
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
