package com.playata.application.ui.dialogs
{
   import com.playata.application.AppEnvironment;
   import com.playata.application.Application;
   import com.playata.application.platform.ServerInfo;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.application.ui.elements.generic.button.UiTextButton;
   import com.playata.application.ui.elements.generic.dialog.UiDialog;
   import com.playata.application.ui.elements.generic.dialog.UiInfoDialog;
   import com.playata.application.ui.elements.generic.dialog.UiTwoChoiceDialog;
   import com.playata.application.ui.elements.generic.tab.UiTabIconOnlyButton;
   import com.playata.framework.application.Environment;
   import com.playata.framework.core.Core;
   import com.playata.framework.core.util.StringUtil;
   import com.playata.framework.display.ui.controls.Button;
   import com.playata.framework.display.ui.dialogs.Dialog;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import com.playata.framework.platform.PlatformConfig;
   import flash.net.SharedObject;
   import visuals.ui.dialogs.SymbolDialogLoginUserGeneric;
   
   public class DialogLoginUser extends UiDialog
   {
       
      
      private var _btnClose:UiButton = null;
      
      private var _btnLogin:UiTextButton = null;
      
      private var _btnPasswordLost:UiTextButton = null;
      
      private var _tabMobile:UiTabIconOnlyButton = null;
      
      private var _tabFacebook:UiTabIconOnlyButton = null;
      
      private var _tabGameService:UiTabIconOnlyButton = null;
      
      private var _tabEmail:UiTabIconOnlyButton = null;
      
      public function DialogLoginUser()
      {
         var _loc1_:* = null;
         var _loc3_:* = null;
         Environment.panelManager.dialogManager.resetCloseAllDialogs();
         var _loc2_:SymbolDialogLoginUserGeneric = new SymbolDialogLoginUserGeneric();
         super(_loc2_);
         _queued = false;
         _btnClose = new UiButton(_loc2_.btnClose,"",onClickClose);
         _btnLogin = new UiTextButton(_loc2_.btnSave,LocText.current.text("screen/login/button_login"),"",onClickLogin);
         _btnPasswordLost = new UiTextButton(_loc2_.emailContent.btnPasswordLost,LocText.current.text("screen/login/button_reset_password"),LocText.current.text("screen/login/button_reset_password_tooltip"),onClickPasswordLost);
         _tabMobile = new UiTabIconOnlyButton(_loc2_.tabMobile,onClickTab,3);
         _tabFacebook = new UiTabIconOnlyButton(_loc2_.tabFacebook,onClickTab,2);
         _tabGameService = new UiTabIconOnlyButton(_loc2_.tabGameService,onClickTab,!!Environment.info.isAndroid?4:5);
         _tabEmail = new UiTabIconOnlyButton(_loc2_.tabEmail,onClickTab,1);
         _tabMobile.visible = Environment.info.isNativeMobile;
         _tabFacebook.visible = Environment.info.isNativeMobile;
         _tabGameService.visible = false;
         _tabEmail.visible = Environment.info.isNativeMobile;
         _tabMobile.x = _tabMobile.x + 35;
         _tabFacebook.x = _tabFacebook.x + 35;
         _tabEmail.x = _tabEmail.x - 38;
         _loc2_.txtDialogTitle.text = LocText.current.text("screen/login/title");
         _loc2_.emailContent.txtEmailCaption.text = LocText.current.text("screen/login/mail");
         _loc2_.emailContent.txtPasswordCaption.text = LocText.current.text("screen/login/password");
         _loc2_.emailContent.txtPasswordLostCaption.text = LocText.current.text("screen/login/password_forgot");
         _tabObjects.push(_loc2_.emailContent.inputEmail);
         _tabObjects.push(_loc2_.emailContent.inputPassword);
         try
         {
            _loc1_ = SharedObject.getLocal("userData_" + ServerInfo.serverId);
            _loc3_ = _loc1_.data.email;
            if(_loc3_ !== null && _loc3_ !== "" && _loc3_.indexOf("@") != -1)
            {
               _loc2_.emailContent.inputEmail.text = _loc3_;
            }
         }
         catch(e:Error)
         {
         }
         if(Environment.info.isNativeMobile)
         {
            _loc2_.btnSave.y = 90;
            _loc2_.emailContent.y = 55;
            _loc2_.emailContent.btnPasswordLost.y = _loc2_.emailContent.btnPasswordLost.y - 35;
            _loc2_.emailContent.txtPasswordLostCaption.y = _loc2_.emailContent.txtPasswordLostCaption.y - 35;
            _loc2_.dialogBackground.height = _loc2_.dialogBackground.height + 10;
            switchTab(_tabMobile);
         }
         else
         {
            switchTab(_tabEmail);
         }
      }
      
      override public function dispose() : void
      {
         var _loc1_:SymbolDialogLoginUserGeneric = _vo as SymbolDialogLoginUserGeneric;
         _btnClose.dispose();
         _btnLogin.dispose();
         _btnPasswordLost.dispose();
         _tabMobile.dispose();
         _tabFacebook.dispose();
         _tabGameService.dispose();
         _tabEmail.dispose();
         _btnClose = null;
         _btnLogin = null;
         _btnPasswordLost = null;
         _tabMobile = null;
         _tabFacebook = null;
         _tabGameService = null;
         _tabEmail = null;
         super.dispose();
      }
      
      private function onClickClose(param1:InteractionEvent) : void
      {
         close();
      }
      
      private function onClickTab(param1:InteractionEvent) : void
      {
         switchTab(param1.target as UiTabIconOnlyButton);
      }
      
      private function switchTab(param1:UiTabIconOnlyButton) : void
      {
         _tabMobile.tabbed = param1 == _tabMobile;
         _tabFacebook.tabbed = param1 == _tabFacebook;
         _tabGameService.tabbed = param1 == _tabGameService;
         _tabEmail.tabbed = param1 == _tabEmail;
         var _loc2_:SymbolDialogLoginUserGeneric = _vo as SymbolDialogLoginUserGeneric;
         if(_tabEmail.tabbed)
         {
            setFocus();
         }
         _loc2_.emailContent.visible = _tabEmail.tabbed;
         _loc2_.txtLoginInfo.visible = !_tabEmail.tabbed;
         if(_tabMobile.tabbed)
         {
            _loc2_.txtLoginInfo.text = LocText.current.text("screen/login/mobile_login_info");
         }
         if(_tabFacebook.tabbed)
         {
            _loc2_.txtLoginInfo.text = LocText.current.text("screen/login/facebook_login_info");
         }
         if(_tabGameService.tabbed)
         {
            _loc2_.txtLoginInfo.text = !!Environment.info.isAndroid?LocText.current.text("screen/login/gameservice_login_info_android"):LocText.current.text("screen/login/gameservice_login_info_ios");
         }
      }
      
      private function onClickLogin(param1:InteractionEvent) : void
      {
         if(_tabMobile.tabbed)
         {
            loginMobile();
         }
         else if(_tabFacebook.tabbed)
         {
            loginFacebook();
         }
         else if(_tabGameService.tabbed)
         {
            loginGameService();
         }
         else if(_tabEmail.tabbed)
         {
            loginEmail();
         }
      }
      
      private function loginMobile() : void
      {
         close();
         Core.config.overwrite("ssoInfo",Environment.deviceInfo.uniqueId);
         Application.userController.loginUserSSO(true,AppEnvironment.appPlatform.id,PlatformConfig.ssoInfo);
      }
      
      private function loginFacebook() : void
      {
         AppEnvironment.facebook.login(onFBLoggedIn,true);
      }
      
      private function loginGameService() : void
      {
         if(Environment.gameServices != null)
         {
            Environment.gameServices.login(onGameServiceLoggedIn);
         }
      }
      
      private function loginEmail() : void
      {
         var _loc1_:SymbolDialogLoginUserGeneric = _vo as SymbolDialogLoginUserGeneric;
         if(StringUtil.isEmpty(_loc1_.emailContent.inputEmail.text))
         {
            Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("general/info"),LocText.current.text("error/screen/login/empty_mail"),LocText.current.text("general/button_ok"),setFocus));
         }
         else if(StringUtil.isEmpty(_loc1_.emailContent.inputPassword.text))
         {
            Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("general/info"),LocText.current.text("error/screen/login/empty_password"),LocText.current.text("general/button_ok"),setFocus));
         }
         else
         {
            if(_loc1_.emailContent.inputEmail.text.indexOf(" ") != -1)
            {
               _loc1_.emailContent.inputEmail.text = StringUtil.replace(_loc1_.emailContent.inputEmail.text," ","");
            }
            _btnClose.buttonEnabled = false;
            _btnLogin.buttonEnabled = false;
            _btnPasswordLost.buttonEnabled = false;
            Application.userController.loginUserEmail(_loc1_.emailContent.inputEmail.text,_loc1_.emailContent.inputPassword.text,onLoginSuccess,onLoginFailed);
         }
      }
      
      private function onFBLoggedIn(param1:Boolean) : void
      {
         if(param1)
         {
            Core.config.overwrite("ssoInfo",AppEnvironment.facebook.userId);
            close();
            Application.userController.loginUserSSO(true,"facebook",PlatformConfig.ssoInfo);
         }
         else
         {
            Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("error/login_invalid_title"),LocText.current.text("error/login_invalid_text"),LocText.current.text("general/button_ok")));
         }
      }
      
      private function onGameServiceLoggedIn(param1:Boolean) : void
      {
         if(param1 && Environment.gameServices != null)
         {
            Core.config.overwrite("ssoInfo",Environment.gameServices.userId);
            close();
            Application.userController.loginUserSSO(true,Environment.gameServices.platformId,PlatformConfig.ssoInfo);
         }
         else
         {
            Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("error/login_invalid_title"),LocText.current.text("error/login_invalid_text"),LocText.current.text("general/button_ok")));
         }
      }
      
      private function setFocus() : void
      {
         if(!_tabEmail.tabbed)
         {
            return;
         }
         var _loc1_:SymbolDialogLoginUserGeneric = _vo as SymbolDialogLoginUserGeneric;
         if(StringUtil.isEmpty(_loc1_.emailContent.inputEmail.text))
         {
            Dialog.focus = _loc1_.emailContent.inputEmail;
         }
         else if(StringUtil.isEmpty(_loc1_.emailContent.inputPassword.text))
         {
            Dialog.focus = _loc1_.emailContent.inputPassword;
         }
      }
      
      private function onClickPasswordLost(param1:InteractionEvent) : void
      {
         var _loc2_:SymbolDialogLoginUserGeneric = _vo as SymbolDialogLoginUserGeneric;
         if(StringUtil.isEmpty(_loc2_.emailContent.inputEmail.text))
         {
            Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("general/info"),LocText.current.text("error/screen/login/reset_empty_mail"),LocText.current.text("general/button_ok"),setFocus));
         }
         else
         {
            Environment.panelManager.showDialog(new UiTwoChoiceDialog(LocText.current.text("dialog/login/password_reset_confirmation_title"),LocText.current.text("dialog/login/password_reset_confirmation_text"),LocText.current.text("general/button_yes"),LocText.current.text("general/button_no"),resetPassword));
         }
      }
      
      private function resetPassword() : void
      {
         var _loc1_:SymbolDialogLoginUserGeneric = _vo as SymbolDialogLoginUserGeneric;
         Application.userController.resetUserPassword(_loc1_.emailContent.inputEmail.text);
      }
      
      private function onLoginSuccess() : void
      {
         close();
      }
      
      private function onLoginFailed() : void
      {
         if(_btnClose)
         {
            _btnClose.buttonEnabled = true;
         }
         if(_btnLogin)
         {
            _btnLogin.buttonEnabled = true;
         }
         if(_btnPasswordLost)
         {
            _btnPasswordLost.buttonEnabled = true;
         }
      }
      
      override public function get defaultButton() : Button
      {
         return _btnLogin;
      }
      
      override public function onEscape() : void
      {
         if(_btnClose == null || !_btnClose.buttonEnabled)
         {
            return;
         }
         close();
      }
   }
}
