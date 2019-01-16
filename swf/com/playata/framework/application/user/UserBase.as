package com.playata.framework.application.user
{
   import com.playata.framework.application.Environment;
   import com.playata.framework.application.request.ActionRequestResponse;
   import com.playata.framework.application.request.ActionRequestResponseHandler;
   import com.playata.framework.application.request.IActionRequestResponseErrorHandler;
   import com.playata.framework.core.TypedObject;
   import com.playata.framework.network.request.RequestData;
   
   public class UserBase implements IUser
   {
       
      
      protected var _userData:TypedObject = null;
      
      protected var _settings:TypedObject = null;
      
      protected var _geoLocation:String = null;
      
      protected var _hasPendingToSUpdate:Boolean = false;
      
      protected var _hasPendingPPUpdate:Boolean = false;
      
      protected var _renewingSession:Boolean = false;
      
      public function UserBase(param1:TypedObject)
      {
         super();
         _userData = param1;
      }
      
      public function dispose() : void
      {
      }
      
      public function get id() : int
      {
         return _userData.getInt("id");
      }
      
      public function get sessionId() : String
      {
         return _userData.getString("session_id");
      }
      
      public function get email() : String
      {
         return _userData.getString("email");
      }
      
      public function get countryCode() : String
      {
         if(!_userData.hasData("geo_country_code"))
         {
            return null;
         }
         return _userData.getString("geo_country_code");
      }
      
      public function get platform() : String
      {
         return _userData.getString("network");
      }
      
      public function get hasStandaloneLogin() : Boolean
      {
         if(!email)
         {
            return false;
         }
         var _loc1_:String = _userData.getString("network");
         if(_loc1_)
         {
            if(email.indexOf(_loc1_ + "_") === 0)
            {
               return false;
            }
         }
         return true;
      }
      
      public function get locale() : String
      {
         return _userData.getString("locale");
      }
      
      public function get registrationSource() : String
      {
         return _userData.getString("registration_source");
      }
      
      public function get ref() : String
      {
         var _loc2_:* = null;
         var _loc1_:String = registrationSource;
         if(_loc1_ && _loc1_.indexOf("ref=") != -1)
         {
            _loc2_ = _loc1_.substring(_loc1_.indexOf("ref=") + 4);
            if(_loc2_.indexOf(";") != -1)
            {
               _loc2_ = _loc2_.substring(0,_loc2_.indexOf(";"));
            }
            return _loc2_;
         }
         return "";
      }
      
      public function get subId() : String
      {
         var _loc2_:* = null;
         var _loc1_:String = registrationSource;
         if(_loc1_ && _loc1_.indexOf("subid=") != -1)
         {
            _loc2_ = _loc1_.substring(_loc1_.indexOf("subid=") + 6);
            if(_loc2_.indexOf(";") != -1)
            {
               _loc2_ = _loc2_.substring(0,_loc2_.indexOf(";"));
            }
            return _loc2_;
         }
         return "";
      }
      
      public function get rsExtra() : String
      {
         var _loc2_:* = null;
         var _loc1_:String = registrationSource;
         if(_loc1_ && _loc1_.indexOf("extra=") != -1)
         {
            _loc2_ = _loc1_.substring(_loc1_.indexOf("extra=") + 6);
            if(_loc2_.indexOf(";") != -1)
            {
               _loc2_ = _loc2_.substring(0,_loc2_.indexOf(";"));
            }
            return _loc2_;
         }
         return "";
      }
      
      public function get creationTimestamp() : int
      {
         return _userData.getInt("ts_creation");
      }
      
      public function get uniqueUserId() : String
      {
         return (id + creationTimestamp).toString();
      }
      
      public function get isConfirmed() : Boolean
      {
         return _userData.getBoolean("confirmed");
      }
      
      public function set geoLocation(param1:String) : void
      {
         _geoLocation = param1;
      }
      
      public function get geoLocation() : String
      {
         return _geoLocation;
      }
      
      public function set hasPendingToSUpdate(param1:Boolean) : void
      {
         _hasPendingToSUpdate = param1;
      }
      
      public function get hasPendingToSUpdate() : Boolean
      {
         return _hasPendingToSUpdate;
      }
      
      public function set hasPendingPPUpdate(param1:Boolean) : void
      {
         _hasPendingPPUpdate = param1;
      }
      
      public function get hasPendingPPUpdate() : Boolean
      {
         return _hasPendingPPUpdate;
      }
      
      public function get premiumCurrency() : int
      {
         return _userData.getInt("premium_currency");
      }
      
      public function get isDebug() : Boolean
      {
         return this.getSettingValue("debug") === true;
      }
      
      public function refreshData(param1:TypedObject) : void
      {
         _userData.extend(param1);
      }
      
      public function get showAppNotifications() : Boolean
      {
         return this.getSettingValue("show_app_notifications") !== false;
      }
      
      public function set showAppNotifications(param1:Boolean) : void
      {
      }
      
      public function get hasRatedApp() : Boolean
      {
         return this.getSettingValue("has_rated_app") !== null;
      }
      
      public function set hasRatedApp(param1:Boolean) : void
      {
         setSettingValue("has_rated_app",param1);
      }
      
      public function hasSetting(param1:String) : Boolean
      {
         var _loc2_:Object = this.getSettingValue(param1);
         return _settings.hasData(param1);
      }
      
      public function getBooleanSettingValue(param1:String, param2:Boolean = false) : Boolean
      {
         var _loc3_:Object = getSettingValue(param1);
         if(_loc3_ === null)
         {
            return param2;
         }
         return _loc3_ as Boolean;
      }
      
      public function getSettingValue(param1:String) : Object
      {
         if(_settings == null)
         {
            _settings = _userData.getTypedObjectFromJson("settings",TypedObject.empty);
         }
         if(!_settings.hasData(param1))
         {
            return null;
         }
         return _settings.getData(param1);
      }
      
      public function setSettingValue(param1:String, param2:Object) : void
      {
         key = param1;
         value = param2;
         handleResponse = function(param1:ActionRequestResponse):void
         {
            Environment.application.updateData(param1.data);
            if(param1.hasError)
            {
               Environment.reportError(param1.error,param1.request);
            }
         };
         if(getSettingValue(key) == value)
         {
            return;
         }
         _settings.setData(key,value);
         Environment.application.sendActionRequest("setUserSettings",RequestData.fromData({"settings":_settings.asJsonString}),handleResponse);
      }
      
      public function changeEmail(param1:String, param2:String, param3:IActionRequestResponseErrorHandler = null, param4:Function = null, param5:Function = null) : void
      {
         var _loc6_:ActionRequestResponseHandler = new ActionRequestResponseHandler(param3,param4,param5);
         Environment.application.sendActionRequest("setUserEmail",RequestData.fromData({
            "email_new":param1,
            "password":param2
         }),_loc6_.handle);
      }
      
      public function changePassword(param1:String, param2:String, param3:IActionRequestResponseErrorHandler = null, param4:Function = null, param5:Function = null) : void
      {
         var _loc6_:ActionRequestResponseHandler = new ActionRequestResponseHandler(param3,param4,param5);
         Environment.application.sendActionRequest("setUserPassword",RequestData.fromData({
            "password_old":param1,
            "password_new":param2
         }),_loc6_.handle);
      }
      
      public function changeLocale(param1:String, param2:IActionRequestResponseErrorHandler = null, param3:Function = null, param4:Function = null) : void
      {
         var _loc5_:ActionRequestResponseHandler = new ActionRequestResponseHandler(param2,param3,param4);
         Environment.application.sendActionRequest("setUserLocale",RequestData.fromData({"locale":param1}),_loc5_.handle);
      }
      
      public function setLatestToS(param1:Function) : void
      {
         onLatestToSSet = param1;
         handleResponse = function(param1:ActionRequestResponse):void
         {
            Environment.application.updateData(param1.data);
         };
         Environment.application.sendActionRequest("setUserLatestToS",RequestData.empty,handleResponse);
      }
      
      public function setLatestPP(param1:Function) : void
      {
         onLatestPPSet = param1;
         handleResponse = function(param1:ActionRequestResponse):void
         {
            Environment.application.updateData(param1.data);
         };
         Environment.application.sendActionRequest("setUserLatestPP",RequestData.empty,handleResponse);
      }
      
      public function validateSession(param1:Function) : void
      {
         onValidated = param1;
         handleResponse = function(param1:ActionRequestResponse):void
         {
            Environment.application.updateData(param1.data);
            if(param1.hasError)
            {
               onValidated(false);
            }
            else
            {
               onValidated(param1.appResponse.isValid);
            }
         };
         Environment.application.sendActionRequest("validateSession",RequestData.empty,handleResponse);
      }
      
      public function renewSession(param1:Function) : void
      {
         onRenewed = param1;
         handleResponse = function(param1:ActionRequestResponse):void
         {
            Environment.application.updateData(param1.data);
            if(!param1.hasError)
            {
               Environment.application.updateData(param1.data);
               _renewingSession = false;
               onRenewed(true);
            }
            else
            {
               _renewingSession = false;
               onRenewed(false);
            }
         };
         if(_renewingSession)
         {
            return;
         }
         _renewingSession = true;
         Environment.application.sendActionRequest("renewSession",RequestData.empty,handleResponse);
      }
      
      public function registerNotificationDevice() : void
      {
         onRegistered = function(param1:Boolean, param2:String):void
         {
            var _loc3_:int = 0;
            if(param1 && param2)
            {
               _loc3_ = 0;
               if(Environment.info.isAndroid)
               {
                  _loc3_ = 2;
               }
               else if(Environment.info.isIOS)
               {
                  _loc3_ = 1;
               }
               Environment.application.sendActionRequest("registerUserNotificationDevice",RequestData.fromData({
                  "device_id":param2,
                  "device_type":_loc3_
               }),null);
            }
         };
         if(showAppNotifications)
         {
            if(Environment.pushNotificationManager != null)
            {
               Environment.pushNotificationManager.register(onRegistered);
            }
            if(Environment.notificationManager != null)
            {
               Environment.notificationManager.register();
            }
         }
      }
      
      public function unregisterNotificationDevice() : void
      {
         Environment.application.sendActionRequest("unregisterUserNotificationDevice",RequestData.fromData({"device_id":Environment.deviceInfo.uniqueId}),null);
      }
      
      public function unbindSSO(param1:String, param2:String, param3:IActionRequestResponseErrorHandler = null, param4:Function = null, param5:Function = null) : void
      {
         var _loc6_:ActionRequestResponseHandler = new ActionRequestResponseHandler(param3,param4,param5);
         Environment.application.sendActionRequest("unbindUserFromNetwork",RequestData.fromData({
            "email":param1,
            "password":param2
         }),_loc6_.handle);
      }
      
      public function deleteUser(param1:String, param2:Boolean, param3:IActionRequestResponseErrorHandler = null, param4:Function = null, param5:Function = null) : void
      {
         var _loc6_:ActionRequestResponseHandler = new ActionRequestResponseHandler(param3,param4,param5);
         Environment.application.sendActionRequest("deleteUser",RequestData.fromData({
            "password":param1,
            "request_reactivation_code":param2
         }),_loc6_.handle);
      }
   }
}
