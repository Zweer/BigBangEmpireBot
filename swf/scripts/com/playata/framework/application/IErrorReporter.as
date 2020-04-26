package com.playata.framework.application
{
   import com.playata.framework.core.TypedObject;
   
   public interface IErrorReporter
   {
       
      
      function reportError(param1:String, param2:TypedObject = null, param3:Boolean = true, param4:Boolean = true, param5:* = null) : void;
   }
}
