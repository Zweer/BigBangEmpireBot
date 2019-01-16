package com.playata.framework.application
{
   import com.playata.framework.core.Core;
   
   public class EnvironmentInfo
   {
       
      
      public function EnvironmentInfo()
      {
         super();
      }
      
      public function get os() : String
      {
         return Core.current.info.os;
      }
      
      public function get majorVersion() : int
      {
         return Core.current.info.majorVersion;
      }
      
      public function get minorVersion() : int
      {
         return Core.current.info.minorVersion;
      }
      
      public function get isTouchScreen() : Boolean
      {
         return Core.current.info.isTouchScreen;
      }
      
      public function get isNativeMobile() : Boolean
      {
         return false;
      }
      
      public function get isFakeTouchScreen() : Boolean
      {
         return Core.current.info.isFakeTouchScreen;
      }
      
      public function get system() : String
      {
         return Core.current.info.system;
      }
      
      public function get isIOS() : Boolean
      {
         return Core.current.info.isIOS;
      }
      
      public function get isAndroid() : Boolean
      {
         return Core.current.info.isAndroid;
      }
      
      public function get isBrowser() : Boolean
      {
         return Core.current.info.isBrowser;
      }
      
      public function get isTestMode() : Boolean
      {
         return Core.config.getBoolean("testMode");
      }
      
      public function get defaultLocale() : String
      {
         return Core.config.getString("default_locale");
      }
      
      public function get availableLocales() : Vector.<String>
      {
         var _loc1_:Vector.<String> = Core.config.getStringVector("alternative_locales");
         if(_loc1_.indexOf(defaultLocale) < 0)
         {
            _loc1_.insertAt(0,defaultLocale);
         }
         return _loc1_;
      }
      
      public function get localeVersion() : String
      {
         return Core.config.getString("localeVersion");
      }
   }
}
