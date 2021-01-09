package com.playata.framework.task
{
   import com.playata.framework.core.IDisposable;
   import com.playata.framework.core.Runtime;
   import com.playata.framework.core.data.IByteArray;
   import com.playata.framework.core.error.NotImplementedException;
   
   public class Task implements IDisposable
   {
       
      
      protected var _id:int;
      
      protected var _sendProgress:Function;
      
      protected var _sendResult:Function;
      
      protected var _sendResultByteArray:Function;
      
      public function Task(param1:int, param2:Function, param3:Function, param4:Function)
      {
         super();
         _id = param1;
         _sendProgress = param2;
         _sendResult = param3;
         _sendResultByteArray = param4;
      }
      
      public function dispose() : void
      {
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function start(... rest) : void
      {
         throw new NotImplementedException();
      }
      
      protected function sendProgress(param1:Number) : void
      {
         if(_sendProgress != null)
         {
            _sendProgress(_id,param1);
         }
      }
      
      protected function sendResult(... rest) : void
      {
         rest.unshift(_id);
         Runtime.callMethod(null,_sendResult,rest);
      }
      
      protected function sendResultByteArray(param1:IByteArray, ... rest) : void
      {
         rest.unshift(param1);
         rest.unshift(_id);
         Runtime.callMethod(null,_sendResultByteArray,rest);
      }
   }
}
