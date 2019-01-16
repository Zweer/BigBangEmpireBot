package com.playata.application
{
   import com.playata.application.data.server.SyncStates;
   import com.playata.application.data.user.User;
   import com.playata.application.platform.ServerInfo;
   import com.playata.application.request.ApplicationRequest;
   import com.playata.application.request.UserActionRequest;
   import com.playata.application.ui.ViewManager;
   import com.playata.application.ui.effects.EffectsLayer;
   import com.playata.application.ui.elements.generic.dialog.UiInfoDialog;
   import com.playata.framework.application.ApplicationConfig;
   import com.playata.framework.application.Environment;
   import com.playata.framework.application.IErrorReporter;
   import com.playata.framework.core.Core;
   import com.playata.framework.core.TypedObject;
   import com.playata.framework.core.collection.StringMap;
   import com.playata.framework.core.logging.Logger;
   import com.playata.framework.core.util.TimeUtil;
   import com.playata.framework.localization.LocText;
   
   public class AppErrorReporter implements IErrorReporter
   {
       
      
      private var _globalErrorHandlers:StringMap;
      
      private var _restartPending:Boolean = false;
      
      public function AppErrorReporter()
      {
         _globalErrorHandlers = new StringMap();
         super();
      }
      
      public function addGlobalErrorHandler(param1:String, param2:Function) : void
      {
         _globalErrorHandlers.setData(param1,param2);
      }
      
      public function removeGlobalErrorHandler(param1:String) : void
      {
         _globalErrorHandlers.remove(param1);
      }
      
      public function reportError(param1:String, param2:TypedObject = null, param3:Boolean = true, param4:Boolean = true, param5:* = null) : void
      {
         var _loc15_:* = null;
         var _loc10_:* = null;
         var _loc11_:* = null;
         var _loc12_:* = null;
         var _loc8_:int = 0;
         var _loc13_:* = null;
         var _loc14_:Boolean = false;
         var _loc7_:* = null;
         var _loc17_:* = null;
         var _loc9_:* = null;
         var _loc16_:int = 0;
         var _loc6_:* = null;
         if(_restartPending)
         {
            return;
         }
         Logger.debug("[Application] Application Error: " + param1);
         if(_globalErrorHandlers.exists(param1))
         {
            _loc15_ = _globalErrorHandlers.getData(param1);
            §§push(_loc15_());
            return;
         }
         if(param1 == "errRequestMaintenance" || param1 == "errRequestOutdatedClientVersion")
         {
            Application.stopCommunication();
            if(Environment.info.isNativeMobile)
            {
               if(param1 == "errRequestMaintenance")
               {
                  AppEnvironment.showMaintenanceInfo();
               }
               else
               {
                  AppEnvironment.showInfo(LocText.current.text("mobile/info_client_outdated"));
               }
            }
            else if(param1 == "errRequestOutdatedClientVersion")
            {
               _loc10_ = Core.config.getTypedObject("title_new_version").getString(Environment.info.defaultLocale);
               _loc11_ = Core.config.getTypedObject("text_new_version").getString(Environment.info.defaultLocale);
               if(Environment.panelManager)
               {
                  Environment.panelManager.showDialog(new UiInfoDialog(_loc10_,_loc11_,LocText.current.text("general/button_reload"),Application.reloadApplication));
               }
               else
               {
                  AppEnvironment.showInfo(_loc11_);
               }
            }
            else
            {
               _loc10_ = Core.config.getTypedObject("title_maintenance").getString(Environment.info.defaultLocale);
               _loc11_ = Core.config.getTypedObject("text_maintenance").getString(Environment.info.defaultLocale);
               if(Environment.panelManager)
               {
                  Environment.panelManager.showDialog(new UiInfoDialog(_loc10_,_loc11_,LocText.current.text("general/button_reload"),Application.reloadApplication));
               }
               else
               {
                  AppEnvironment.showInfo(_loc11_);
               }
            }
            return;
         }
         if(param1 == "errUserNotAuthorized")
         {
            if(Environment.info.isNativeMobile || Environment.platform.isSteam)
            {
               User.current.renewSession(onRenewedSession);
            }
            else
            {
               Application.stopCommunication();
               Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/session_expired/title"),LocText.current.text("dialog/session_expired/text"),LocText.current.text("general/button_reload"),Application.reloadApplication));
            }
            return;
         }
         if(param5 != null && param5 is Error)
         {
            _loc12_ = param5 as Error;
            _loc8_ = _loc12_.errorID;
            _loc13_ = _loc12_.getStackTrace();
            if(_loc13_)
            {
               Logger.error("[Application] Uncaught Error: (" + _loc8_ + ") " + _loc13_);
            }
            if(_loc8_ == 1502 && _loc13_ && (_loc13_.indexOf("at com.greensock.core::Animation$/_updateRoot()") != -1 || _loc13_.indexOf("::SkeletonSprite/enterFrame()") != -1))
            {
               EffectsLayer.instance.enabled = false;
               return;
            }
            if(_loc8_ == 1009 && _loc13_ && _loc13_.indexOf("at com.greensock.core::Animation$/_updateRoot()") != -1)
            {
               return;
            }
            if(_loc8_ == 1009 && _loc13_ && _loc13_.indexOf("at com.greensock::TweenMax$/resumeAll()") != -1)
            {
               return;
            }
         }
         if(param3)
         {
            _loc14_ = false;
            if(Application.userController && Application.userController.user)
            {
               _loc14_ = Application.userController.user.isDebug;
            }
            if(!Environment.info.isTestMode && !_loc14_)
            {
               _restartPending = true;
               Application.stopCommunication();
               if(Environment.panelManager && LocText.current)
               {
                  Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("general/common_error_dialog/title"),LocText.current.text("general/common_error_dialog/text"),LocText.current.text("general/button_reload"),Application.reloadApplication));
               }
               AppEnvironment.showReloadInfo();
            }
            else
            {
               _loc7_ = "";
               if(param5 && param5 is Error)
               {
                  _loc7_ = param5.getStackTrace();
               }
               if(Environment.panelManager && LocText.current)
               {
                  Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("general/error"),LocText.current.text("general/error_message",param1 + "\nStacktrace: " + _loc7_),LocText.current.text("general/button_ok")));
               }
               if(LocText.current)
               {
                  Logger.debug("[Application] " + LocText.current.text("general/error_message",param1 + "\nStacktrace: " + _loc7_));
               }
            }
         }
         if(param4 && Application.userController)
         {
            _loc17_ = Application.userController.appUser;
            _loc9_ = "";
            _loc9_ = _loc9_ + "--------------------------------------------\n";
            _loc9_ = _loc9_ + " User Info:\n";
            _loc9_ = _loc9_ + "--------------------------------------------\n";
            _loc9_ = _loc9_ + ("Client Version: " + ApplicationConfig.clientVersionString + "\n");
            _loc9_ = _loc9_ + ("Server: " + ServerInfo.serverId + "\n");
            _loc9_ = _loc9_ + ("Local Time: " + TimeUtil.localDateTime.timestamp + " - " + TimeUtil.localDateTime.format("D.M.Y h:m:s") + "\n");
            _loc9_ = _loc9_ + ("Server Time: " + TimeUtil.serverDateTime.timestamp + " - " + TimeUtil.serverDateTime.format("D.M.Y h:m:s") + "\n");
            if(_loc17_ != null)
            {
               _loc9_ = _loc9_ + ("User Id: " + _loc17_.id + "\n");
               _loc9_ = _loc9_ + ("User Email: " + _loc17_.email + "\n");
               if(_loc17_.character != null)
               {
                  _loc9_ = _loc9_ + ("Character Id: " + _loc17_.character.id + "\n");
                  _loc9_ = _loc9_ + ("Character Name: " + _loc17_.character.name + "\n");
               }
            }
            if(ViewManager.instance != null)
            {
               _loc9_ = _loc9_ + ("Active Panel: " + ViewManager.instance.activePanel + "\n");
               if(Environment.panelManager.dialogManager.lastDialogClassName != null)
               {
                  _loc9_ = _loc9_ + ("Last Dialog: " + Environment.panelManager.dialogManager.lastDialogClassName + "\n");
               }
            }
            _loc9_ = _loc9_ + "--------------------------------------------\n";
            _loc9_ = _loc9_ + " Error Info:\n";
            _loc9_ = _loc9_ + "--------------------------------------------\n";
            if(!param3)
            {
               param1 = param1 + " (Silent)";
            }
            _loc9_ = _loc9_ + ("Error Code: " + param1 + "\n");
            if(param2 != null)
            {
               _loc9_ = _loc9_ + "Data:\n";
               _loc9_ = _loc9_ + ("Last Action: " + ApplicationRequest.lastRequestAction + "\n");
               _loc9_ = _loc9_ + (param2.asJsonString + "\n");
            }
            if(param5 != null && param5 is Error)
            {
               _loc16_ = param5.errorID;
               _loc6_ = [2068];
               _loc9_ = _loc9_ + ("Error: " + param5.getStackTrace());
               if(_loc6_.indexOf(_loc16_) != -1)
               {
                  param4 = false;
               }
            }
            if(param4)
            {
               new UserActionRequest("gameReportError",{"error":_loc9_},null,true);
            }
         }
      }
      
      private function onRenewedSession(param1:Boolean) : void
      {
         if(param1)
         {
            Environment.billing.resetProducts();
            SyncStates.pendingSyncGame = true;
            SyncStates.pendingGetGuildLog = true;
            ViewManager.instance.baseUserPanel.syncGame();
         }
         else
         {
            Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/session_expired/title"),LocText.current.text("dialog/session_expired/text_mobile"),LocText.current.text("screen/login/button_login"),Application.userController.relogin));
         }
      }
   }
}
