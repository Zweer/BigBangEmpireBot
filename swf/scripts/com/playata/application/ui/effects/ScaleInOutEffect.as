package com.playata.application.ui.effects
{
   import com.greensock.easing.Ease;
   import com.greensock.easing.Power1;
   import com.playata.framework.core.IDisposable;
   import com.playata.framework.core.TypedObject;
   import com.playata.framework.display.IDisplayObject;
   
   public class ScaleInOutEffect implements IDisposable
   {
       
      
      private var _displayObject:IDisplayObject = null;
      
      private var _duration:Number = 1;
      
      private var _ease:Ease;
      
      private var _defaultScale:Number = 1;
      
      private var _scale:Number = 1;
      
      public function ScaleInOutEffect(param1:IDisplayObject, param2:Number, param3:Number, param4:Ease = null)
      {
         _ease = Power1.easeInOut;
         super();
         _displayObject = param1;
         _duration = param2;
         _scale = param3;
         if(param4 !== null)
         {
            _ease = param4;
         }
         _defaultScale = param1.scale;
      }
      
      public function dispose() : void
      {
         stop();
      }
      
      public function get displayObject() : IDisplayObject
      {
         return _displayObject;
      }
      
      public function play() : void
      {
         _displayObject.scale = _defaultScale;
         var _loc1_:TypedObject = new TypedObject({
            "scaleX":_scale,
            "scaleY":_scale,
            "yoyo":true,
            "repeat":-1,
            "ease":_ease
         });
         _displayObject.tweenTo(_duration / 2,_loc1_);
      }
      
      public function stop() : void
      {
         _displayObject.scale = _defaultScale;
         _displayObject.killTweens();
      }
   }
}
