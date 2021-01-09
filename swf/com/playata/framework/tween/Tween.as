package com.playata.framework.tween
{
   import com.playata.framework.core.error.Exception;
   
   public class Tween
   {
      
      private static var _tweenHandler:ITweenHandler = null;
       
      
      public function Tween()
      {
         super();
         throw new Exception("TweenUtil only provides static functions and must not be initialized directly.");
      }
      
      public static function init(param1:ITweenHandler) : void
      {
         _tweenHandler = param1;
      }
      
      public static function to(param1:Object, param2:Number, param3:Object) : ITween
      {
         if(_tweenHandler == null)
         {
            return null;
         }
         return _tweenHandler.to(param1,param2,param3);
      }
      
      public static function from(param1:Object, param2:Number, param3:Object) : ITween
      {
         if(_tweenHandler == null)
         {
            return null;
         }
         return _tweenHandler.from(param1,param2,param3);
      }
      
      public static function fromTo(param1:Object, param2:Number, param3:Object, param4:Object) : ITween
      {
         if(_tweenHandler == null)
         {
            return null;
         }
         return _tweenHandler.fromTo(param1,param2,param3,param4);
      }
      
      public static function killTweensOf(param1:Object, param2:Boolean = false, param3:Object = null) : void
      {
         if(_tweenHandler == null)
         {
            return;
         }
         _tweenHandler.killTweensOf(param1,param2,param3);
      }
      
      public static function isTweening(param1:Object) : Boolean
      {
         if(_tweenHandler == null)
         {
            return false;
         }
         return _tweenHandler.isTweening(param1);
      }
      
      public static function pauseAll() : void
      {
         if(_tweenHandler == null)
         {
            return;
         }
         _tweenHandler.pauseAll();
      }
      
      public static function resumeAll() : void
      {
         if(_tweenHandler == null)
         {
            return;
         }
         _tweenHandler.resumeAll();
      }
      
      public static function printActiveTweens(param1:Boolean = true, param2:Array = null) : void
      {
         if(_tweenHandler == null)
         {
            return;
         }
         _tweenHandler.printActiveTweens(param1,param2);
      }
   }
}
