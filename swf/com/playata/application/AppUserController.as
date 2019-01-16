package com.playata.application
{
   import com.playata.application.data.user.User;
   import com.playata.application.platform.ServerInfo;
   import com.playata.application.ui.elements.generic.dialog.UiInfoDialog;
   import com.playata.framework.application.Environment;
   import com.playata.framework.application.UserController;
   import com.playata.framework.application.request.ActionRequestResponse;
   import com.playata.framework.application.user.IUser;
   import com.playata.framework.core.TypedObject;
   import com.playata.framework.core.cache.Cache;
   import com.playata.framework.core.util.TimeUtil;
   import com.playata.framework.localization.LocText;
   
   public class AppUserController extends UserController
   {
       
      
      private var _application:Application = null;
      
      public function AppUserController()
      {
         super();
      }
      
      public function set application(param1:Application) : void
      {
         _application = param1;
      }
      
      public function get appUser() : User
      {
         return _user as User;
      }
      
      override public function onUserAssigned() : void
      {
         var _loc2_:String = _user.sessionId;
         var _loc3_:int = _user.id;
         var _loc1_:String = _user.registrationSource;
         var _loc4_:String = Environment.platform.id;
         if(_loc4_ == "standalone")
         {
            _loc4_ = "";
         }
         if(_loc2_ != "" && _loc3_ != 0)
         {
            AppEnvironment.appPlatform.writeSessionCookie(_loc2_,_loc3_,_loc1_,_loc4_,ServerInfo.serverId,appUser.showFriendbar);
         }
         _application.onUserAssigned();
      }
      
      override public function onUserUnassigned() : void
      {
         _application.onUserUnassigned();
      }
      
      override public function onRegisterResponse(param1:ActionRequestResponse) : void
      {
         if(param1.hasError)
         {
            return;
         }
         _application.onRegister(param1.data);
      }
      
      override public function onLoginResponse(param1:ActionRequestResponse) : void
      {
         _application.onLoginComplete();
         if(!param1 || param1.hasError)
         {
            return;
         }
         _application.onLogin(param1.data,param1.action == "loginUser");
      }
      
      override public function onLogoutResponse(param1:ActionRequestResponse) : void
      {
         AppEnvironment.appPlatform.deleteSessionCookie();
         if(!param1.hasError)
         {
            _application.onLogout();
         }
         else if(param1.error != "errUserNotAuthorized")
         {
            Environment.reportError(param1.error,param1.request);
         }
         else
         {
            _application.onLogout();
         }
      }
      
      override public function onResetPasswordResponse(param1:ActionRequestResponse) : void
      {
         if(!param1 || param1.hasError)
         {
            return;
         }
         Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("info/screen/login/reset_password_title"),LocText.current.text("info/screen/login/reset_password_message"),LocText.current.text("general/button_ok")));
      }
      
      override public function createUser(param1:TypedObject) : IUser
      {
         return new User(param1);
      }
      
      override public function get userSessionCacheName() : String
      {
         return "userData_" + ServerInfo.serverId;
      }
      
      override public function get uniqueClientIdValue() : String
      {
         var _loc1_:String = "unique_client_id";
         if(Cache.getData(_loc1_) === null)
         {
            Cache.setData(_loc1_,new TypedObject({"unique_client_id":ServerInfo.serverId + TimeUtil.now.toString()}));
         }
         var _loc3_:TypedObject = Cache.getData("unique_client_id");
         var _loc2_:String = "";
         if(_loc3_)
         {
            _loc2_ = _loc3_.getString("unique_client_id");
         }
         return _loc2_;
      }
      
      override protected function handleRequestError(param1:ActionRequestResponse) : Boolean
      {
         var _loc2_:* = param1.action;
         switch(_loc2_)
         {
            case "registerUser":
               if(param1.error == "errRegisterInvalidEmail")
               {
                  Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("error/register_invalid_email_title"),LocText.current.text("error/register_invalid_email_text"),LocText.current.text("general/button_ok")));
               }
               else if(param1.error == "errRegisterUserAlreadyExists")
               {
                  Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("error/user_already_exists_title"),LocText.current.text("error/user_already_exists_text"),LocText.current.text("general/button_ok")));
               }
               else if(param1.error == "errServerFull")
               {
                  _application.showServerFullDialog();
               }
               else
               {
                  return false;
               }
               return true;
            case "registerUserSSO":
               if(param1.error == "errRegisterUserAlreadyExists")
               {
                  Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("error/user_already_exists_title"),LocText.current.text("error/user_already_exists_text"),LocText.current.text("general/button_ok")));
               }
               else if(param1.error == "errRegisterBanned")
               {
                  Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("error/login_invalid_status_title"),LocText.current.text("error/login_invalid_status_text"),LocText.current.text("general/button_ok")));
               }
               else if(param1.error == "errServerFull")
               {
                  _application.showServerFullDialog();
               }
               else
               {
                  return false;
               }
               return true;
            case "loginUser":
               if(param1.error == "errLoginInvalidEmail")
               {
                  Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("error/login_invalid_email_title"),LocText.current.text("error/login_invalid_email_text"),LocText.current.text("general/button_ok")));
               }
               else if(param1.error == "errLoginInvalid")
               {
                  Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("error/login_invalid_title"),LocText.current.text("error/login_invalid_text"),LocText.current.text("general/button_ok")));
               }
               else if(param1.error == "errLoginNoSuchUser")
               {
                  Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("error/user_not_found_title"),LocText.current.text("error/user_not_found_text"),LocText.current.text("general/button_ok")));
               }
               else if(param1.error == "errLoginInvalidStatus")
               {
                  Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("error/login_invalid_status_title"),LocText.current.text("error/login_invalid_status_text"),LocText.current.text("general/button_ok")));
               }
               else if(param1.error == "errServerFull")
               {
                  _application.showServerFullDialog();
               }
               else
               {
                  return false;
               }
               return true;
            case "loginUserSSO":
               if(param1.error == "errLoginInvalidStatus")
               {
                  Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("error/login_invalid_status_title"),LocText.current.text("error/login_invalid_status_text"),LocText.current.text("general/button_ok")));
               }
               else if(param1.error == "errServerFull")
               {
                  _application.showServerFullDialog();
               }
               else if(param1.error == "errLoginNoSuchUser")
               {
                  if(param1.request.getData("notify_no_account") === true)
                  {
                     Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("error/user_not_found_title"),LocText.current.text("error/user_not_found_native_text"),LocText.current.text("general/button_ok")));
                  }
               }
               else if(param1.error == "errInvalidAccessToken")
               {
                  Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("error/login_invalid_title"),LocText.current.text("error/login_invalid_text"),LocText.current.text("general/button_ok")));
               }
               else
               {
                  return false;
               }
               return true;
            case "autoLoginUser":
               if(param1.error == "errRequestMaintenance" || param1.error == "errRequestOutdatedClientVersion")
               {
                  Environment.reportError(param1.error,param1.request);
               }
               else if(param1.error == "errLoginInvalidStatus")
               {
                  Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("error/login_invalid_status_title"),LocText.current.text("error/login_invalid_status_text"),LocText.current.text("general/button_ok")));
               }
               else if(param1.error == "errServerFull")
               {
                  _application.showServerFullDialog();
               }
               else
               {
                  return false;
               }
               return true;
            case "resetUserPassword":
               if(param1.error == "errUserNotFound")
               {
                  Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("error/user_not_found_title"),LocText.current.text("error/user_not_found_text"),LocText.current.text("general/button_ok")));
                  return true;
               }
               return false;
            default:
               return false;
         }
      }
   }
}
