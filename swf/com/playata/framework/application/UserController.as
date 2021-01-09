package com.playata.framework.application
{
   import com.playata.application.ui.ViewManager;
   import com.playata.framework.application.request.ActionRequestResponse;
   import com.playata.framework.application.user.IUser;
   import com.playata.framework.core.Core;
   import com.playata.framework.core.IDisposable;
   import com.playata.framework.core.TypedObject;
   import com.playata.framework.core.error.Exception;
   import com.playata.framework.core.error.NotImplementedException;
   import com.playata.framework.core.logging.Logger;
   import com.playata.framework.core.util.StringUtil;
   import com.playata.framework.data.LocalDataObject;
   import com.playata.framework.localization.LocText;
   import com.playata.framework.localization.Locale;
   import com.playata.framework.network.request.RequestData;
   import com.playata.framework.platform.PlatformConfig;
   
   public class UserController implements IDisposable
   {
       
      
      protected var _user:IUser = null;
      
      protected var _onRegisterSuccess:Function = null;
      
      protected var _onRegisterFailed:Function = null;
      
      protected var _onLoginSuccess:Function = null;
      
      protected var _onLoginFailed:Function = null;
      
      protected var _onLoggedOut:Function = null;
      
      protected var _logoutPending:Boolean = false;
      
      protected var _additionalSSOLoginParams:TypedObject = null;
      
      public function UserController()
      {
         super();
      }
      
      public static function get userSessionId() : String
      {
         return Core.config.getString("userSessionId");
      }
      
      public static function set userSessionId(param1:String) : void
      {
         Core.config.overwrite("userSessionId",param1);
      }
      
      public static function get userId() : int
      {
         return parseInt(Core.config.getString("userId"));
      }
      
      public static function set userId(param1:int) : void
      {
         Core.config.overwrite("userId",param1.toString());
      }
      
      public function dispose() : void
      {
         _user.dispose();
         _user = null;
      }
      
      public function createUser(param1:TypedObject) : IUser
      {
         throw new NotImplementedException();
      }
      
      public function get userSessionCacheName() : String
      {
         throw new NotImplementedException();
      }
      
      public function get uniqueClientIdValue() : String
      {
         throw new NotImplementedException();
      }
      
      public function get user() : IUser
      {
         return _user;
      }
      
      public function onUserAssigned() : void
      {
      }
      
      public function onUserUnassigned() : void
      {
      }
      
      public function onRegisterResponse(param1:ActionRequestResponse) : void
      {
         if(param1 != null && !param1.hasError)
         {
            updateData(param1.typedData);
         }
      }
      
      public function onLoginResponse(param1:ActionRequestResponse) : void
      {
         if(param1 != null && !param1.hasError)
         {
            updateData(param1.typedData);
         }
      }
      
      public function onLogoutResponse(param1:ActionRequestResponse) : void
      {
         if(param1 != null && !param1.hasError)
         {
            updateData(param1.typedData);
         }
      }
      
      public function onResetPasswordResponse(param1:ActionRequestResponse) : void
      {
      }
      
      public function get isLoggedIn() : Boolean
      {
         return _user != null && !_logoutPending;
      }
      
      public function set additionalSSOLoginParams(param1:TypedObject) : void
      {
         _additionalSSOLoginParams = param1;
      }
      
      public function get additionalSSOLoginParams() : TypedObject
      {
         return _additionalSSOLoginParams;
      }
      
      public function registerUserEmail(param1:String, param2:String, param3:String, param4:String = null, param5:Function = null, param6:Function = null, param7:TypedObject = null) : void
      {
         _onRegisterSuccess = param5;
         _onRegisterFailed = param6;
         var _loc9_:TypedObject = TypedObject.empty;
         Environment.deviceInfo.addDeviceInfo(_loc9_);
         if(param1.indexOf(" ") != -1)
         {
            param1 = StringUtil.replace(param1," ","");
         }
         var _loc8_:RequestData = RequestData.fromData({
            "email":param1,
            "password":param2,
            "registration_source":param3
         });
         if(param4)
         {
            _loc8_.setString("locale",param4);
         }
         _loc8_.setInt("app_version",ApplicationConfig.clientVersion);
         _loc8_.setString("device_info",_loc9_.asJsonString);
         _loc8_.setString("device_id",Environment.deviceInfo.uniqueId);
         if(param7 != null)
         {
            _loc8_.setData("settings",param7.asJsonString);
         }
         Environment.application.sendActionRequest("registerUser",_loc8_,handleRequestResponse);
      }
      
      public function registerUserSSO(param1:String, param2:String, param3:String, param4:Function, param5:Function, param6:Boolean, param7:String = null, param8:Function = null, param9:Function = null, param10:TypedObject = null) : void
      {
         _onRegisterSuccess = param4;
         _onRegisterFailed = param5;
         _onLoginSuccess = param8;
         _onLoginFailed = param9;
         var _loc12_:TypedObject = TypedObject.empty;
         Environment.deviceInfo.addDeviceInfo(_loc12_);
         var _loc11_:RequestData = RequestData.fromData({
            "platform":param1,
            "platform_user_id":param2,
            "registration_source":param3
         });
         if(param7)
         {
            _loc11_.setString("locale",param7);
         }
         _loc11_.setInt("app_version",ApplicationConfig.clientVersion);
         _loc11_.setString("device_info",_loc12_.asJsonString);
         _loc11_.setString("device_id",Environment.deviceInfo.uniqueId);
         _loc11_.setBoolean("login_existing_user",param6);
         if(param10 != null)
         {
            _loc11_.setData("settings",param10.asJsonString);
         }
         if(Environment.deviceInfo.advertismentId != null)
         {
            _loc11_.setString("device_advertisment_id",Environment.deviceInfo.advertismentId);
         }
         Environment.application.sendActionRequest("registerUserSSO",_loc11_,handleRequestResponse);
      }
      
      public function relogin() : void
      {
         var onLoggedOut:Function = function():void
         {
            autoLoginUser();
         };
         logoutUser(onLoggedOut);
      }
      
      public function autoLoginUser(param1:Function = null, param2:Function = null) : void
      {
         var _loc3_:* = null;
         var _loc4_:int = 0;
         var _loc6_:Boolean = false;
         var _loc5_:* = null;
         _onLoginSuccess = param1;
         _onLoginFailed = param2;
         try
         {
            _loc3_ = UserController.userSessionId;
            _loc4_ = UserController.userId;
            if(isNaN(_loc4_))
            {
               _loc4_ = 0;
            }
            if(_loc3_ == null || _loc3_ == "0" || _loc4_ == 0)
            {
               _loc6_ = Environment.platform.isAutoLoginAllowed;
               if(_loc6_)
               {
                  _loc5_ = new LocalDataObject(userSessionCacheName);
                  _loc3_ = _loc5_.getString("userSessionId");
                  _loc4_ = _loc5_.getInt("userId");
               }
            }
            else
            {
               UserController.userId = 0;
               UserController.userSessionId = "0";
            }
            if(_loc3_ !== null && _loc3_ !== "0" && _loc4_ !== 0)
            {
               Environment.application.sendActionRequest("autoLoginUser",RequestData.fromData({
                  "existing_session_id":_loc3_,
                  "existing_user_id":_loc4_,
                  "client_id":uniqueClientIdValue,
                  "app_version":ApplicationConfig.clientVersion
               }),handleRequestResponse);
            }
            else if(Environment.platform.isSSOAutoLoginAllowed)
            {
               loginUserSSO(false,Environment.platform.id,PlatformConfig.ssoInfo,_onLoginSuccess,_onLoginFailed);
            }
            else
            {
               onLoginResponse(null);
               if(_onLoginFailed != null)
               {
                  _onLoginFailed();
               }
            }
            return;
         }
         catch(e:Error)
         {
            Logger.debug("[Application] Warning: auto login via SharedObject failed. Error: " + e.message);
            onLoginResponse(null);
            if(_onLoginFailed != null)
            {
               _onLoginFailed();
            }
            return;
         }
      }
      
      public function loginUserEmail(param1:String, param2:String, param3:Function = null, param4:Function = null) : void
      {
         _onLoginSuccess = param3;
         _onLoginFailed = param4;
         var _loc6_:TypedObject = TypedObject.empty;
         Environment.deviceInfo.addDeviceInfo(_loc6_);
         var _loc5_:RequestData = RequestData.fromData({
            "email":param1,
            "password":param2,
            "platform":"",
            "platform_user_id":"",
            "client_id":uniqueClientIdValue
         });
         _loc5_.setInt("app_version",ApplicationConfig.clientVersion);
         _loc5_.setString("device_info",_loc6_.asJsonString);
         _loc5_.setString("device_id",Environment.deviceInfo.uniqueId);
         Environment.application.sendActionRequest("loginUser",_loc5_,handleRequestResponse);
      }
      
      public function loginUserSSO(param1:Boolean, param2:String, param3:String, param4:Function = null, param5:Function = null) : void
      {
         _onLoginSuccess = param4;
         _onLoginFailed = param5;
         var _loc7_:TypedObject = TypedObject.empty;
         Environment.deviceInfo.addDeviceInfo(_loc7_);
         var _loc6_:RequestData = RequestData.fromData({
            "platform":param2,
            "platform_user_id":param3
         });
         _loc6_.setInt("app_version",ApplicationConfig.clientVersion);
         _loc6_.setString("device_info",_loc7_.asJsonString);
         _loc6_.setString("device_id",Environment.deviceInfo.uniqueId);
         _loc6_.setBoolean("notify_no_account",param1);
         if(additionalSSOLoginParams)
         {
            _loc6_.extend(additionalSSOLoginParams);
         }
         Environment.application.sendActionRequest("loginUserSSO",_loc6_,handleRequestResponse);
      }
      
      public function logoutUser(param1:Function = null, param2:Boolean = false) : void
      {
         _onLoggedOut = param1;
         _logoutPending = true;
         var _loc4_:String = null;
         var _loc3_:int = 0;
         if(param2)
         {
            if(Environment.pushNotificationManager != null)
            {
               _loc4_ = Environment.pushNotificationManager.deviceNotificationId;
               _loc3_ = Environment.pushNotificationManager.deviceType;
            }
         }
         if(_loc4_ != null)
         {
            Environment.application.sendActionRequest("logoutUser",RequestData.fromData({
               "device_id":_loc4_,
               "device_type":_loc3_
            }),handleRequestResponse);
         }
         else
         {
            Environment.application.sendActionRequest("logoutUser",RequestData.empty,handleRequestResponse);
         }
      }
      
      public function resetUserPassword(param1:String) : void
      {
         Environment.application.sendActionRequest("resetUserPassword",RequestData.fromData({"email":param1}),handleRequestResponse);
      }
      
      public function updateData(param1:TypedObject) : void
      {
         refreshUser(param1.getTypedObject("user"));
         if(_user && param1.hasData("user_geo_location",true))
         {
            _user.geoLocation = param1.getString("user_geo_location");
         }
         if(_user && param1.hasData("tos_update_needed",true))
         {
            _user.hasPendingToSUpdate = param1.getBoolean("tos_update_needed");
         }
         if(_user && param1.hasData("pp_update_needed",true))
         {
            _user.hasPendingPPUpdate = param1.getBoolean("pp_update_needed");
         }
         if(_user && param1.hasData("has_marketing_email",true))
         {
            _user.hasMarketingEmail = param1.getBoolean("has_marketing_email");
         }
         if(param1.hasData("campaigns"))
         {
            Environment.application.abTests.updateData(param1.getTypedObject("campaigns"));
         }
      }
      
      protected function refreshUser(param1:TypedObject) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         if(param1 == null)
         {
            return;
         }
         if(_user == null)
         {
            _user = createUser(param1);
            onUserAssigned();
         }
         else
         {
            _user.refreshData(param1);
         }
         try
         {
            _loc2_ = new LocalDataObject(userSessionCacheName);
            _loc2_.setString("userSessionId",_user.sessionId);
            _loc2_.setInt("userId",_user.id);
            _loc2_.setString("email",_user.email);
            _loc2_.save();
         }
         catch(e:Error)
         {
            Logger.debug("[Application] Warning: saving session details to SharedObject failed. Error: " + e.message);
         }
         UserController.userId = _user.id;
         UserController.userSessionId = _user.sessionId;
         if(_user.locale != LocText.current.locale)
         {
            _loc3_ = new Locale(_user.locale,Core.config.getString("localeVersion"));
            Environment.application.loadLocale(_loc3_,onLocaleLoaded);
         }
      }
      
      private function onLocaleLoaded() : void
      {
         if(LocText.current.locale == _user.locale)
         {
            ViewManager.instance.refreshPanelLocalization();
         }
      }
      
      protected function invalidateUser() : void
      {
         var _loc1_:* = null;
         if(_user)
         {
            _user.dispose();
            _user = null;
            onUserUnassigned();
         }
         try
         {
            _loc1_ = new LocalDataObject(userSessionCacheName);
            _loc1_.setString("userSessionId","0");
            _loc1_.setInt("userId",0);
            _loc1_.setString("email","");
            _loc1_.save();
         }
         catch(e:Error)
         {
            Logger.debug("[Application] Warning: resetting session details in SharedObject failed. Error: " + e.message);
         }
         UserController.userId = 0;
         UserController.userSessionId = "0";
      }
      
      protected function handleRequestError(param1:ActionRequestResponse) : Boolean
      {
         return false;
      }
      
      protected function handleRequestResponse(param1:ActionRequestResponse) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         Logger.debug("[Application] Handling request response for: " + param1.action);
         var _loc4_:* = param1.action;
         switch(_loc4_)
         {
            case "registerUser":
               onRegisterResponse(param1);
               if(param1.error != "")
               {
                  if(_onRegisterFailed != null)
                  {
                     _onRegisterFailed(param1.error);
                  }
                  _onRegisterSuccess = null;
                  _onRegisterFailed = null;
               }
               if(param1.error == "")
               {
                  if(_onRegisterSuccess != null)
                  {
                     _onRegisterSuccess();
                  }
                  _onRegisterSuccess = null;
                  _onRegisterFailed = null;
               }
               else if(!handleRequestError(param1))
               {
                  Environment.reportError(param1.error,param1.request);
               }
               break;
            case "registerUserSSO":
               onRegisterResponse(param1);
               if(param1.error == "")
               {
                  if(_onRegisterSuccess != null)
                  {
                     _onRegisterSuccess();
                  }
                  _onRegisterSuccess = null;
                  _onRegisterFailed = null;
               }
               else
               {
                  if(_onRegisterFailed != null)
                  {
                     _onRegisterFailed(param1.error);
                  }
                  _onRegisterSuccess = null;
                  _onRegisterFailed = null;
                  if(param1.error == "errRegisterUserAlreadyExists")
                  {
                     if(param1.request.getBoolean("login_existing_user"))
                     {
                        _loc2_ = TypedObject.empty;
                        Environment.deviceInfo.addDeviceInfo(_loc2_);
                        _loc3_ = RequestData.fromData({
                           "platform":param1.request.getString("platform"),
                           "platform_user_id":param1.request.getString("platform_user_id")
                        });
                        _loc3_.setInt("app_version",ApplicationConfig.clientVersion);
                        _loc3_.setString("device_info",_loc2_.asJsonString);
                        _loc3_.setString("device_id",Environment.deviceInfo.uniqueId);
                        if(additionalSSOLoginParams)
                        {
                           _loc3_.extend(additionalSSOLoginParams);
                        }
                        Environment.application.sendActionRequest("loginUserSSO",_loc3_,handleRequestResponseRegisterLoginUserSSO);
                     }
                     else
                     {
                        handleRequestError(param1);
                     }
                  }
                  else if(!handleRequestError(param1))
                  {
                     Environment.reportError(param1.error,param1.request);
                  }
               }
               break;
            case "loginUser":
               onLoginResponse(param1);
               if(param1.error != "")
               {
                  if(_onLoginFailed != null)
                  {
                     _onLoginFailed();
                  }
                  _onLoginSuccess = null;
                  _onLoginFailed = null;
               }
               if(param1.error == "")
               {
                  if(_onLoginSuccess != null)
                  {
                     _onLoginSuccess();
                  }
                  _onLoginSuccess = null;
                  _onLoginFailed = null;
               }
               else if(!handleRequestError(param1))
               {
                  Environment.reportError(param1.error,param1.request);
               }
               break;
            case "loginUserSSO":
               onLoginResponse(param1);
               if(param1.error != "")
               {
                  if(_onLoginFailed != null)
                  {
                     _onLoginFailed();
                  }
                  _onLoginSuccess = null;
                  _onLoginFailed = null;
               }
               if(param1.error == "")
               {
                  if(_onLoginSuccess != null)
                  {
                     _onLoginSuccess();
                  }
                  _onLoginSuccess = null;
                  _onLoginFailed = null;
               }
               else if(!handleRequestError(param1))
               {
                  Environment.reportError(param1.error,param1.request);
               }
               break;
            case "logoutUser":
               _logoutPending = false;
               onLogoutResponse(param1);
               invalidateUser();
               if(_onLoggedOut != null)
               {
                  _onLoggedOut();
               }
               break;
            case "autoLoginUser":
               onLoginResponse(param1);
               if(param1.error != "")
               {
                  if(_onLoginFailed != null)
                  {
                     _onLoginFailed();
                  }
                  _onLoginSuccess = null;
                  _onLoginFailed = null;
               }
               if(param1.error == "")
               {
                  if(_onLoginSuccess != null)
                  {
                     _onLoginSuccess();
                  }
                  _onLoginSuccess = null;
                  _onLoginFailed = null;
               }
               else if(handleRequestError(param1))
               {
               }
               break;
            case "resetUserPassword":
               onResetPasswordResponse(param1);
               if(param1.hasError && !handleRequestError(param1))
               {
               }
               break;
            default:
               throw new Exception("Failure handling response to action \'" + param1.action + "\'. Action not supported");
         }
      }
      
      protected function handleRequestResponseRegisterLoginUserSSO(param1:ActionRequestResponse) : void
      {
         Logger.debug("[Application] Handling request response for: " + param1.action);
         var _loc2_:* = param1.action;
         if("loginUserSSO" !== _loc2_)
         {
            throw new Exception("Failure handling response to action \'" + param1.action + "\'. Action not supported");
         }
         onLoginResponse(param1);
         if(param1.error == "")
         {
            if(_onLoginSuccess != null)
            {
               _onLoginSuccess();
            }
            _onLoginSuccess = null;
            _onLoginFailed = null;
         }
         else if(!handleRequestError(param1))
         {
            Environment.reportError(param1.error,param1.request);
         }
      }
   }
}
