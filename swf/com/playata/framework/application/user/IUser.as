package com.playata.framework.application.user
{
   import com.playata.framework.application.request.IActionRequestResponseErrorHandler;
   import com.playata.framework.core.IDisposable;
   import com.playata.framework.core.TypedObject;
   
   public interface IUser extends IDisposable
   {
       
      
      function get id() : int;
      
      function get sessionId() : String;
      
      function get email() : String;
      
      function get platform() : String;
      
      function get hasStandaloneLogin() : Boolean;
      
      function get locale() : String;
      
      function get creationTimestamp() : int;
      
      function get isConfirmed() : Boolean;
      
      function get uniqueUserId() : String;
      
      function get registrationSource() : String;
      
      function get ref() : String;
      
      function get subId() : String;
      
      function get rsExtra() : String;
      
      function get countryCode() : String;
      
      function set geoLocation(param1:String) : void;
      
      function get geoLocation() : String;
      
      function set hasPendingToSUpdate(param1:Boolean) : void;
      
      function get hasPendingToSUpdate() : Boolean;
      
      function set hasPendingPPUpdate(param1:Boolean) : void;
      
      function get hasPendingPPUpdate() : Boolean;
      
      function get isDebug() : Boolean;
      
      function get showAppNotifications() : Boolean;
      
      function set showAppNotifications(param1:Boolean) : void;
      
      function get hasRatedApp() : Boolean;
      
      function set hasRatedApp(param1:Boolean) : void;
      
      function getSettingValue(param1:String) : Object;
      
      function setSettingValue(param1:String, param2:Object) : void;
      
      function refreshData(param1:TypedObject) : void;
      
      function changeEmail(param1:String, param2:String, param3:IActionRequestResponseErrorHandler = null, param4:Function = null, param5:Function = null) : void;
      
      function changePassword(param1:String, param2:String, param3:IActionRequestResponseErrorHandler = null, param4:Function = null, param5:Function = null) : void;
      
      function changeLocale(param1:String, param2:IActionRequestResponseErrorHandler = null, param3:Function = null, param4:Function = null) : void;
      
      function setLatestToS(param1:Function) : void;
      
      function setLatestPP(param1:Function) : void;
      
      function validateSession(param1:Function) : void;
      
      function renewSession(param1:Function) : void;
      
      function registerNotificationDevice() : void;
      
      function unregisterNotificationDevice() : void;
      
      function unbindSSO(param1:String, param2:String, param3:IActionRequestResponseErrorHandler = null, param4:Function = null, param5:Function = null) : void;
      
      function deleteUser(param1:String, param2:Boolean, param3:IActionRequestResponseErrorHandler = null, param4:Function = null, param5:Function = null) : void;
   }
}
