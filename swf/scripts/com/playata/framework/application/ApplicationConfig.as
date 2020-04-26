package com.playata.framework.application
{
   import com.playata.framework.core.Core;
   
   public final class ApplicationConfig
   {
       
      
      public function ApplicationConfig()
      {
         super();
      }
      
      public static function get clientVersion() : int
      {
         return Core.config.getInt("client_version");
      }
      
      public static function get clientVersionString() : String
      {
         var _loc1_:String = "v";
         if(Core.current.info.isIOS)
         {
            _loc1_ = "ios";
         }
         else if(Core.current.info.isAndroid)
         {
            _loc1_ = "android";
         }
         else
         {
            _loc1_ = "flash";
         }
         if(_loc1_ == "flash")
         {
            try
            {
               if(Environment.platform.isSteam)
               {
                  _loc1_ = "steam";
               }
               else if(Environment.platform.isAir)
               {
                  _loc1_ = "windows";
               }
            }
            catch(e:Error)
            {
            }
         }
         return _loc1_ + "_" + clientVersion;
      }
   }
}
