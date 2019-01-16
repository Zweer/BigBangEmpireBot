package com.playata.application.ui.effects
{
   import com.greensock.TweenMax;
   import com.greensock.easing.Ease;
   import com.greensock.easing.Linear;
   import com.playata.framework.core.IDisposable;
   import com.playata.framework.core.TypedObject;
   import com.playata.framework.display.IDisplayObject;
   import com.playata.framework.display.filter.GlowFilter;
   import com.playata.framework.display.lib.flash.FlashDisplayObject;
   
   public class GlowFilterEffect implements IDisposable
   {
       
      
      private var _displayObject:IDisplayObject = null;
      
      private var _duration:Number = 1;
      
      private var _loop:Boolean = false;
      
      private var _startGlowFilter:GlowFilter = null;
      
      private var _endGlowFilter:GlowFilter = null;
      
      private var _ease:Ease;
      
      private var _applied:Boolean = false;
      
      public function GlowFilterEffect(param1:IDisplayObject, param2:Number, param3:GlowFilter, param4:GlowFilter, param5:Boolean, param6:Ease = null)
      {
         _ease = Linear.easeInOut;
         super();
         _displayObject = param1;
         _duration = param2;
         _startGlowFilter = param3;
         _endGlowFilter = param4;
         _loop = param5;
         if(param6 != null)
         {
            _ease = param6;
         }
      }
      
      public function dispose() : void
      {
         stop();
      }
      
      public function set displayObject(param1:IDisplayObject) : void
      {
         _displayObject = param1;
      }
      
      public function set duration(param1:Number) : void
      {
         _duration = param1;
      }
      
      public function set loop(param1:Boolean) : void
      {
         _loop = param1;
      }
      
      public function play() : void
      {
         if(_applied)
         {
            return;
         }
         _displayObject.killTweens();
         var _loc2_:TypedObject = new TypedObject({
            "glowFilter":{
               "color":_startGlowFilter.color,
               "alpha":_startGlowFilter.alpha,
               "blurX":_startGlowFilter.blur,
               "blurY":_startGlowFilter.blur,
               "strength":_startGlowFilter.resolution / 100
            },
            "ease":_ease
         });
         var _loc1_:TypedObject = new TypedObject({
            "glowFilter":{
               "color":_endGlowFilter.color,
               "alpha":_endGlowFilter.alpha,
               "blurX":_endGlowFilter.blur,
               "blurY":_endGlowFilter.blur,
               "strength":_endGlowFilter.resolution / 100
            },
            "ease":_ease
         });
         if(_loop)
         {
            _loc1_.setBoolean("yoyo",true);
            _loc1_.setInt("repeat",-1);
         }
         _displayObject.tweenFromTo(_duration,_loc2_,_loc1_);
         _applied = true;
      }
      
      public function stop() : void
      {
         if(!_applied)
         {
            return;
         }
         try
         {
            TweenMax.set(FlashDisplayObject.getNativeDisplayObject(_displayObject),{"glowFilter":{"remove":true}});
            _displayObject.killTweens();
         }
         catch(e:Error)
         {
         }
         _applied = false;
      }
   }
}
