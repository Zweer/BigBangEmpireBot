package com.playata.framework.tween
{
   public interface ITweenHandler
   {
       
      
      function to(param1:Object, param2:Number, param3:Object) : ITween;
      
      function from(param1:Object, param2:Number, param3:Object) : ITween;
      
      function fromTo(param1:Object, param2:Number, param3:Object, param4:Object) : ITween;
      
      function killTweensOf(param1:Object, param2:Boolean = false, param3:Object = null) : void;
      
      function isTweening(param1:Object) : Boolean;
      
      function pauseAll() : void;
      
      function resumeAll() : void;
      
      function printActiveTweens(param1:Boolean = true, param2:Array = null) : void;
   }
}
