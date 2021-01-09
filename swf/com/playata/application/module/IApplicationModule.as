package com.playata.application.module
{
   import com.playata.application.data.application.ApplicationOptions;
   import com.playata.application.request.AppRequestResponseData;
   import com.playata.framework.core.IDisposable;
   
   public interface IApplicationModule extends IDisposable
   {
       
      
      function onInit(param1:ApplicationOptions = null) : void;
      
      function onUserRegister() : void;
      
      function onUserLogin(param1:AppRequestResponseData) : void;
      
      function onUserLogout() : void;
      
      function onRefreshData(param1:Object) : void;
   }
}
