package com.playata.framework.core.lib.flash
{
   import com.playata.framework.core.Core;
   import com.playata.framework.core.ICoreInfo;
   import flash.system.Capabilities;
   
   public class FlashCoreInfo implements ICoreInfo
   {
       
      
      private var _os:String;
      
      private var _isTouchScreen:Boolean;
      
      private var _majorVersion:int;
      
      private var _minorVersion:int;
      
      private var _system:String;
      
      public function FlashCoreInfo()
      {
         super();
         var _loc1_:String = Capabilities.version;
         _os = _loc1_.substr(0,3);
         var _loc3_:* = _os;
         switch(_loc3_)
         {
            case "IOS":
               _system = "ios";
               break;
            case "AND":
               _system = "android";
               break;
            default:
               _system = "web";
         }
         _isTouchScreen = /(WIN|MAC|LNX)/.exec(_os) == null;
         var _loc2_:Array = _loc1_.substr(4).split(",");
         _majorVersion = parseInt(_loc2_[0]);
         _minorVersion = parseInt(_loc2_[1]);
      }
      
      public function get os() : String
      {
         return _os;
      }
      
      public function get majorVersion() : int
      {
         return _majorVersion;
      }
      
      public function get minorVersion() : int
      {
         return _minorVersion;
      }
      
      public function get isTouchScreen() : Boolean
      {
         return _isTouchScreen || isFakeTouchScreen;
      }
      
      public function get isFakeTouchScreen() : Boolean
      {
         if(Core.config == null)
         {
            return false;
         }
         if(!Core.config.hasCfg("fakeMobileClient"))
         {
            return false;
         }
         return Core.config.getBoolean("fakeMobileClient");
      }
      
      public function get isIOS() : Boolean
      {
         return _system == "ios";
      }
      
      public function get isAndroid() : Boolean
      {
         return _system == "android";
      }
      
      public function get isBrowser() : Boolean
      {
         return _system == "web";
      }
      
      public function get system() : String
      {
         return _system;
      }
      
      public function get airDescriptorVersionNumber() : String
      {
         return null;
      }
   }
}
