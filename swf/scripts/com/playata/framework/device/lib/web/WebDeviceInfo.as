package com.playata.framework.device.lib.web
{
   import com.playata.framework.core.TypedObject;
   import com.playata.framework.device.DeviceInfoBasic;
   import com.playata.framework.device.IDeviceInfo;
   import flash.system.Capabilities;
   
   public class WebDeviceInfo extends DeviceInfoBasic implements IDeviceInfo
   {
       
      
      public function WebDeviceInfo()
      {
         super();
      }
      
      public function get uniqueId() : String
      {
         return "web";
      }
      
      public function get advertismentId() : String
      {
         return "";
      }
      
      public function set advertismentId(param1:String) : void
      {
      }
      
      public function addDeviceInfo(param1:TypedObject) : void
      {
         param1.extend(basicDeviceInfo);
      }
      
      public function get errorInfo() : String
      {
         var _loc1_:String = "";
         _loc1_ = _loc1_ + ("Device OS: " + Capabilities.os + "\n");
         _loc1_ = _loc1_ + ("Flash Version: " + Capabilities.version + "\n");
         return _loc1_;
      }
   }
}
