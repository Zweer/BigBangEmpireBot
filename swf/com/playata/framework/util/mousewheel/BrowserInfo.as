package com.playata.framework.util.mousewheel
{
   public class BrowserInfo
   {
      
      public static const WIN_PLATFORM:String = "win";
      
      public static const MAC_PLATFORM:String = "mac";
      
      public static const SAFARI_AGENT:String = "safari";
      
      public static const OPERA_AGENT:String = "opera";
      
      public static const IE_AGENT:String = "msie";
      
      public static const MOZILLA_AGENT:String = "mozilla";
      
      public static const CHROME_AGENT:String = "chrome";
       
      
      private var _platform:String = "undefined";
      
      private var _browser:String = "undefined";
      
      private var _version:String = "undefined";
      
      public function BrowserInfo(param1:Object, param2:Object, param3:String)
      {
         super();
         if(!param1 || !param2 || !param3)
         {
            return;
         }
         _version = param1.version;
         var _loc7_:int = 0;
         var _loc6_:* = param1;
         for(var _loc5_ in param1)
         {
            if(_loc5_ != "version")
            {
               if(param1[_loc5_] == true)
               {
                  _browser = _loc5_;
                  break;
               }
            }
         }
         var _loc9_:int = 0;
         var _loc8_:* = param2;
         for(var _loc4_ in param2)
         {
            if(param2[_loc4_] == true)
            {
               _platform = _loc4_;
            }
         }
      }
      
      public function get platform() : String
      {
         return _platform;
      }
      
      public function get browser() : String
      {
         return _browser;
      }
      
      public function get version() : String
      {
         return _version;
      }
   }
}
