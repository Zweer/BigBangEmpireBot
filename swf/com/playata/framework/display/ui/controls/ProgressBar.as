package com.playata.framework.display.ui.controls
{
   import com.playata.framework.core.error.Exception;
   import com.playata.framework.core.signal.ISignal;
   import com.playata.framework.core.signal.Signal;
   import com.playata.framework.display.IDisplayObject;
   
   public class ProgressBar extends Control
   {
       
      
      protected var _currentValue:Number;
      
      protected var _maxValue:Number;
      
      protected var _onProgress:ISignal = null;
      
      public function ProgressBar(param1:IDisplayObject, param2:Number = 0, param3:Number = 1)
      {
         super(param1);
         _currentValue = param2;
         _maxValue = param3;
      }
      
      override public function dispose() : void
      {
         if(_onProgress != null)
         {
            _onProgress.removeAll();
            _onProgress = null;
         }
         super.dispose();
      }
      
      public function get onProgress() : ISignal
      {
         if(_onProgress == null)
         {
            _onProgress = new Signal();
         }
         return _onProgress;
      }
      
      public function get value() : Number
      {
         return _currentValue;
      }
      
      public function set value(param1:Number) : void
      {
         if(param1 > _maxValue)
         {
            param1 = Number(_maxValue);
         }
         if(param1 == _currentValue)
         {
            return;
         }
         if(param1 < 0)
         {
            param1 = 0;
         }
         var _loc2_:Number = _currentValue;
         _currentValue = param1;
         onValueChanged(_loc2_,_currentValue);
         if(_onProgress != null)
         {
            _onProgress.dispatch(_currentValue);
         }
      }
      
      public function get ratioValue() : Number
      {
         return _currentValue / _maxValue;
      }
      
      public function get maxValue() : Number
      {
         return _maxValue;
      }
      
      public function set maxValue(param1:Number) : void
      {
         if(param1 == _maxValue)
         {
            return;
         }
         if(param1 <= 0)
         {
            throw new Exception("Max value in progress bars must be > 0!");
         }
         var _loc2_:Number = _maxValue;
         _maxValue = param1;
         if(_maxValue < _currentValue)
         {
            _currentValue = _maxValue;
         }
         onMaxChanged(_loc2_,_maxValue);
      }
      
      protected function onValueChanged(param1:Number, param2:Number) : void
      {
      }
      
      protected function onMaxChanged(param1:Number, param2:Number) : void
      {
      }
   }
}
