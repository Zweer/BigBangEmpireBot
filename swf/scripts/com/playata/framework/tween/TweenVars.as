package com.playata.framework.tween
{
   import com.playata.framework.core.TypedObject;
   import com.playata.framework.core.signal.ISignal;
   import com.playata.framework.core.signal.Signal;
   
   public class TweenVars
   {
       
      
      protected var _vars:TypedObject = null;
      
      protected var _easeType:TweenEaseType;
      
      protected var _yoyo:Boolean = false;
      
      protected var _delay:Number = 0;
      
      protected var _repeat:int = 0;
      
      protected var _repeatDelay:Number = 0;
      
      protected var _onComplete:ISignal = null;
      
      protected var _onRepeat:ISignal = null;
      
      public function TweenVars(param1:TypedObject)
      {
         _easeType = TweenEaseType.Linear;
         super();
         _vars = param1;
      }
      
      public function get vars() : TypedObject
      {
         return _vars;
      }
      
      public function set vars(param1:TypedObject) : void
      {
         _vars = param1;
      }
      
      public function get easeType() : TweenEaseType
      {
         return _easeType;
      }
      
      public function set easeType(param1:TweenEaseType) : void
      {
         _easeType = param1;
      }
      
      public function get yoyo() : Boolean
      {
         return _yoyo;
      }
      
      public function set yoyo(param1:Boolean) : void
      {
         _yoyo = param1;
      }
      
      public function get delay() : Number
      {
         return _delay;
      }
      
      public function set delay(param1:Number) : void
      {
         _delay = param1;
      }
      
      public function get repeat() : int
      {
         return _repeat;
      }
      
      public function set repeat(param1:int) : void
      {
         _repeat = param1;
      }
      
      public function get repeatDelay() : Number
      {
         return _repeatDelay;
      }
      
      public function set repeatDelay(param1:Number) : void
      {
         _repeatDelay = param1;
      }
      
      public function get hasComplete() : Boolean
      {
         return _onComplete !== null;
      }
      
      public function get onComplete() : ISignal
      {
         if(_onComplete === null)
         {
            _onComplete = new Signal();
         }
         return _onComplete;
      }
      
      public function get hasRepeat() : Boolean
      {
         return _onRepeat !== null;
      }
      
      public function get onRepeat() : ISignal
      {
         if(_onRepeat === null)
         {
            _onRepeat = new Signal();
         }
         return _onRepeat;
      }
   }
}
