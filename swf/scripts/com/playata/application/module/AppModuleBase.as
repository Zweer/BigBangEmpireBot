package com.playata.application.module
{
   import com.playata.application.AppEnvironment;
   import com.playata.application.Application;
   import com.playata.application.data.application.ApplicationOptions;
   import com.playata.application.platform.AppPlatform;
   import com.playata.application.request.AppRequestResponseData;
   
   public class AppModuleBase implements IApplicationModule
   {
       
      
      protected var _application:Application = null;
      
      public function AppModuleBase(param1:Application)
      {
         super();
         _application = param1;
      }
      
      public function get platform() : AppPlatform
      {
         return AppEnvironment.appPlatform;
      }
      
      public function dispose() : void
      {
      }
      
      public function onInit(param1:ApplicationOptions = null) : void
      {
      }
      
      public function onUserRegister() : void
      {
      }
      
      public function onUserLogin(param1:AppRequestResponseData) : void
      {
      }
      
      public function onUserLogout() : void
      {
      }
      
      public function onRefreshData(param1:Object) : void
      {
      }
   }
}
