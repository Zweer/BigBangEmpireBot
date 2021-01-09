package com.playata.application.ui.elements.stats
{
   import com.greensock.TimelineMax;
   import com.greensock.TweenMax;
   import com.greensock.easing.Linear;
   import com.greensock.easing.Quart;
   import com.playata.application.ui.effects.EffectsLayer;
   import com.playata.application.ui.effects.flash.SparkEffect;
   import com.playata.framework.application.Environment;
   import com.playata.framework.core.timer.ITimer;
   import com.playata.framework.core.util.NumberUtil;
   import com.playata.framework.display.lib.flash.FlashDisplayObject;
   import flash.display.Graphics;
   import flash.display.MovieClip;
   import visuals.ui.elements.gauge.SymbolGaugeGeneric;
   
   public class UiStatQuestResultGauge
   {
      
      private static const ANGLE_0:Number = 7;
      
      private static const ANGLE_100:Number = 354;
       
      
      private var _content:SymbolGaugeGeneric;
      
      private var _onAnimationCompleteCallback:Function;
      
      private var _onHideSkipButton:Function;
      
      private var _timeline:TimelineMax;
      
      private var _needleAnimation:NeedleStuttering;
      
      private var _sparkEffect:SparkEffect;
      
      private var _sparkTime:Number;
      
      private var _lastNeedleRotation:Number;
      
      private var _animationCompleteTimer:ITimer;
      
      private var _greenScale:Object;
      
      private var _winChance:Number = 0;
      
      public function UiStatQuestResultGauge(param1:SymbolGaugeGeneric, param2:Function, param3:Function)
      {
         super();
         _content = param1;
         _onHideSkipButton = param3;
         _needleAnimation = new NeedleStuttering(_content.needle.inner);
         _onAnimationCompleteCallback = param2;
         _content.m.removeAllChildren();
         _content.m.rotation = -90;
      }
      
      public function prepare(param1:Number, param2:Boolean) : void
      {
         _content.needle.rotation = 7;
         _timeline = new TimelineMax({
            "paused":true,
            "onUpdate":checkSparkEffect
         });
         _greenScale = {"green":0};
         _winChance = param1 / 1000;
         _winChance = NumberUtil.clampf(_winChance,0,1);
         _timeline.append(new TweenMax(_greenScale,1,{
            "green":_winChance,
            "ease":Quart.easeOut,
            "onUpdate":updateGreenMask
         }),1);
         _timeline.insert(new TweenMax(_needleAnimation,2,{
            "max":2,
            "ease":Linear.easeNone
         }),1);
         updateGreenMask();
         var _loc5_:Number = 354 - (354 - 7) * _winChance;
         var _loc3_:Number = Math.min(5,!!param2?(354 - _loc5_) * 0.1:Number((_loc5_ - 7) * 0.1));
         var _loc4_:Number = !!param2?NumberUtil.randomNumber(_loc5_ + _loc3_,354 - _loc3_):Number(NumberUtil.randomNumber(7 + _loc3_,_loc5_ - _loc3_));
         _timeline.addCallback(Environment.audio.playFX,_timeline.duration() - 0.4,["event_dungeon_unlocked.mp3",false]);
         _timeline.insert(new TweenMax(_needleAnimation,0.25,{
            "max":0,
            "ease":Linear.easeNone
         }),3.5);
         _timeline.insert(new TweenMax(_content.needle,2,{
            "rotation":_loc4_,
            "ease":Quart.easeOut
         }),3.5);
         _timeline.addCallback(animationPlayed,_timeline.duration());
         _timeline.addLabel("end",_timeline.duration() + 0.1);
         _animationCompleteTimer = Environment.createTimer("UiStatQuestResultGauge::timer",(_timeline.duration() + 0.7) * 1000,animationComplete,null,1);
      }
      
      private function updateGreenMask() : void
      {
         var _loc4_:* = NaN;
         _loc4_ = 0.05;
         var _loc2_:Number = NaN;
         _loc2_ = 150;
         var _loc7_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc3_:Number = (354 - (354 - 7) * _greenScale.green) / 180 * 3.14159265358979;
         var _loc5_:Graphics = (FlashDisplayObject.getNativeDisplayObject(_content.m) as MovieClip).graphics;
         _loc5_.clear();
         _loc5_.beginFill(65280);
         var _loc1_:* = 6.28318530717959;
         while(_loc1_ > _loc3_)
         {
            _loc6_ = Math.cos(_loc1_) * 150;
            _loc7_ = Math.sin(_loc1_) * 150;
            _loc5_.lineTo(_loc6_,_loc7_);
            _loc1_ = Number(_loc1_ - 0.05);
         }
         _loc6_ = Math.cos(_loc3_) * 150;
         _loc7_ = Math.sin(_loc3_) * 150;
         _loc5_.lineTo(_loc6_,_loc7_);
         _loc5_.lineTo(0,0);
         _loc5_.endFill();
      }
      
      private function checkSparkEffect() : void
      {
         if(!_timeline || !_sparkEffect)
         {
            return;
         }
         if(_timeline.paused())
         {
            return;
         }
         if(_timeline.time() < _sparkTime)
         {
            return;
         }
         var _loc1_:Number = _content.needle.rotation;
         var _loc5_:Number = Math.abs(_lastNeedleRotation - _loc1_);
         if(_loc5_ < 5 && _needleAnimation.max < 0.5)
         {
            return;
         }
         _lastNeedleRotation = _loc1_;
         var _loc3_:Number = _content.needle.rotation / 180 * 3.14159265358979;
         var _loc2_:Number = _content.x + Math.sin(_loc3_) * 85 + NumberUtil.randomNumber(-3,3);
         var _loc4_:Number = _content.y - Math.cos(_loc3_) * 85 + NumberUtil.randomNumber(-3,3);
         _sparkEffect.addSpark(_loc2_,_loc4_);
      }
      
      public function show() : void
      {
         _sparkEffect = EffectsLayer.instance.show(9) as SparkEffect;
         _needleAnimation.start();
         _timeline.play();
         _animationCompleteTimer.start();
      }
      
      public function skip() : void
      {
         _timeline.gotoAndPlay("end");
         _animationCompleteTimer.stop();
         _greenScale.green = _winChance;
         updateGreenMask();
         shutDownAnimation();
      }
      
      private function animationPlayed() : void
      {
      }
      
      private function shutDownAnimation() : void
      {
         try
         {
            _sparkEffect.shutDown();
            _sparkEffect = null;
            _needleAnimation.stop();
            _timeline.clear();
            _timeline = null;
            _animationCompleteTimer.dispose();
            _animationCompleteTimer = null;
            return;
         }
         catch(e:Error)
         {
            return;
         }
      }
      
      private function animationComplete() : void
      {
         shutDownAnimation();
      }
   }
}
