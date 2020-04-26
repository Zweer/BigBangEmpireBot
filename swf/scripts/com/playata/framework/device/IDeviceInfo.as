package com.playata.framework.device
{
   import com.playata.framework.core.TypedObject;
   
   public interface IDeviceInfo
   {
       
      
      function get uniqueId() : String;
      
      function get advertismentId() : String;
      
      function set advertismentId(param1:String) : void;
      
      function get errorInfo() : String;
      
      function addDeviceInfo(param1:TypedObject) : void;
   }
}
