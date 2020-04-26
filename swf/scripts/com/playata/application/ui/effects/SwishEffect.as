package com.playata.application.ui.effects
{
   import com.playata.framework.core.IDisposable;
   import com.playata.framework.core.TypedObject;
   import com.playata.framework.display.IDisplayObject;
   import com.playata.framework.display.IImage;
   
   public class SwishEffect implements IDisposable
   {
       
      
      private var _swishDisplayObject:IDisplayObject = null;
      
      private var _initX:Number = 0;
      
      private var _swishEndX:Number = 0;
      
      private var _swishDuration:Number = 1;
      
      private var _pauseDuration:Number = 1;
      
      private var _loop:Boolean = false;
      
      public function SwishEffect(param1:IDisplayObject, param2:Number, param3:Number, param4:Number, param5:Boolean, param6:IImage = null)
      {
         super();
         _swishDisplayObject = param1;
         _swishEndX = param2;
         _swishDuration = param3;
         _pauseDuration = param4;
         _loop = param5;
         _initX = _swishDisplayObject.x;
         _swishDisplayObject.visible = false;
         if(!param6)
         {
         }
      }
      
      public function dispose() : void
      {
         stop();
      }
      
      public function set loop(param1:Boolean) : void
      {
         _loop = param1;
      }
      
      public function play() : void
      {
         _swishDisplayObject.killTweens();
         _swishDisplayObject.x = _initX;
         _swishDisplayObject.visible = true;
         var _loc1_:TypedObject = new TypedObject({
            "x":_swishEndX,
            "repeatDelay":_pauseDuration
         });
         if(_loop)
         {
            _loc1_.setInt("repeat",-1);
         }
         _swishDisplayObject.tweenTo(_swishDuration,_loc1_);
      }
      
      public function stop() : void
      {
         _swishDisplayObject.killTweens();
         _swishDisplayObject.visible = false;
      }
   }
}
