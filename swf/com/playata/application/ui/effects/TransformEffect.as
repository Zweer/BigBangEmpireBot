package com.playata.application.ui.effects
{
   import com.greensock.easing.Ease;
   import com.greensock.easing.Linear;
   import com.playata.framework.core.IDisposable;
   import com.playata.framework.core.Runtime;
   import com.playata.framework.core.TypedObject;
   import com.playata.framework.display.IDisplayObject;
   
   public class TransformEffect implements IDisposable
   {
       
      
      private var _displayObject:IDisplayObject = null;
      
      private var _duration:Number = 1;
      
      private var _defaultValue:Number = 1;
      
      private var _transformationKey:String = "";
      
      private var _transformationValue:Number = 1;
      
      private var _loop:Boolean = true;
      
      private var _yoyo:Boolean = true;
      
      private var _ease:Ease;
      
      public function TransformEffect(param1:IDisplayObject, param2:Number, param3:String, param4:Number, param5:Boolean = true, param6:Boolean = true, param7:Ease = null)
      {
         _ease = Linear.easeNone;
         super();
         _displayObject = param1;
         _duration = param2;
         _transformationKey = param3;
         _transformationValue = param4;
         _loop = param5;
         _yoyo = param6;
         if(param7 !== null)
         {
            _ease = param7;
         }
         _defaultValue = Runtime.getProperty(_displayObject,_transformationKey);
      }
      
      public function dispose() : void
      {
         stop();
      }
      
      public function get displayObject() : IDisplayObject
      {
         return _displayObject;
      }
      
      public function play(param1:Number = 0) : void
      {
         _displayObject.killTweens();
         Runtime.setProperty(_displayObject,_transformationKey,_defaultValue);
         if(param1 != 0)
         {
            _duration = param1;
         }
         var _loc2_:TypedObject = new TypedObject({"ease":_ease});
         if(_loop)
         {
            _loc2_.setInt("repeat",-1);
         }
         if(_yoyo)
         {
            _loc2_.setBoolean("yoyo",true);
         }
         _loc2_.setNumber(_transformationKey,_transformationValue);
         _displayObject.tweenTo(_duration,_loc2_);
      }
      
      public function stop() : void
      {
         Runtime.setProperty(_displayObject,_transformationKey,_defaultValue);
         _displayObject.killTweens();
      }
   }
}
