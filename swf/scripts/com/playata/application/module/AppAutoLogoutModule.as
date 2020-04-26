package com.playata.application.module
{
   import com.playata.application.Application;
   import com.playata.application.data.application.ApplicationOptions;
   import com.playata.application.data.user.User;
   import com.playata.application.request.AppRequestResponseData;
   import com.playata.application.ui.dialogs.DialogCreatePrivateConversation;
   import com.playata.framework.application.Environment;
   import com.playata.framework.application.user.IUser;
   import com.playata.framework.core.timer.ITimer;
   import com.playata.framework.core.util.TimeUtil;
   
   public class AppAutoLogoutModule extends AppModuleBase
   {
      
      public static const AUTO_LOGOUT_CHECK_RATE:int = 60;
      
      public static const AUTO_LOGOUT_TIME:int = 1800;
       
      
      private var _autoLogoffTimer:ITimer = null;
      
      public function AppAutoLogoutModule(param1:Application)
      {
         super(param1);
      }
      
      public function autoLogoff() : void
      {
         onAutoLogoffTimerEvent();
      }
      
      override public function dispose() : void
      {
         _autoLogoffTimer.dispose();
         _autoLogoffTimer = null;
      }
      
      override public function onInit(param1:ApplicationOptions = null) : void
      {
         _autoLogoffTimer = Environment.createTimer("AppAutoLogoutModule::autoLogoff",1000 * 60,onAutoLogoffTimerEvent);
         _autoLogoffTimer.start();
      }
      
      override public function onUserLogin(param1:AppRequestResponseData) : void
      {
         if(!_autoLogoffTimer)
         {
            _autoLogoffTimer = Environment.createTimer("AppAutoLogoutModule::autoLogoff",1000 * 60,onAutoLogoffTimerEvent);
         }
         if(_autoLogoffTimer.isStopped)
         {
            _autoLogoffTimer.start();
         }
      }
      
      private function onAutoLogoffTimerEvent() : void
      {
         var _loc1_:* = null;
         try
         {
            if(!User.current)
            {
               if(_autoLogoffTimer)
               {
                  _autoLogoffTimer.stop();
               }
               return;
            }
            if(Application.lastInteractionActivityTimestamp + 1800 < TimeUtil.now)
            {
               if(Environment.platform.isSSO)
               {
                  return;
               }
               _loc1_ = Application.userController.user;
               if(_loc1_ && _loc1_.getSettingValue("auto_logoff") === false)
               {
                  return;
               }
               if(Environment.panelManager.dialogManager.hasVisibleDialog(DialogCreatePrivateConversation))
               {
                  return;
               }
               platform.autoLogoff();
               Application.resetLastInteractionActivityTimestamp();
               Application.userController.logoutUser();
            }
            return;
         }
         catch(e:Error)
         {
            return;
         }
      }
   }
}
