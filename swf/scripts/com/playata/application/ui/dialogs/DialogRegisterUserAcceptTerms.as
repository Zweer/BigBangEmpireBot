package com.playata.application.ui.dialogs
{
   import com.playata.application.AppConfig;
   import com.playata.application.Application;
   import com.playata.application.data.character.AppearanceSettings;
   import com.playata.application.messaging.Message;
   import com.playata.application.messaging.MessageRouter;
   import com.playata.application.ui.ViewManager;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.application.ui.elements.generic.button.UiTextButton;
   import com.playata.application.ui.elements.generic.dialog.UiDialog;
   import com.playata.application.ui.panels.PanelBaseNoUser;
   import com.playata.framework.application.Environment;
   import com.playata.framework.application.request.ActionRequestResponse;
   import com.playata.framework.core.TypedObject;
   import com.playata.framework.core.logging.Logger;
   import com.playata.framework.display.ui.controls.Button;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import com.playata.framework.network.request.RequestData;
   import com.playata.framework.platform.PlatformConfig;
   import visuals.ui.dialogs.SymbolDialogRegisterUserAcceptTermsGeneric;
   
   public class DialogRegisterUserAcceptTerms extends UiDialog
   {
       
      
      private var _email:String = null;
      
      private var _password:String = null;
      
      private var _registrationPlatform:String = null;
      
      private var _characterName:String = null;
      
      private var _characterSettings:AppearanceSettings = null;
      
      private var _currentLocale:String = null;
      
      private var _getPerformanceCallback:Function;
      
      private var _btnContinue:UiTextButton = null;
      
      private var _btnClose:UiButton = null;
      
      private var _btnTerms:UiButton = null;
      
      public function DialogRegisterUserAcceptTerms(param1:String, param2:String, param3:String, param4:String, param5:AppearanceSettings, param6:String = null, param7:Function = null)
      {
         _email = param1;
         _password = param2;
         _registrationPlatform = param3;
         _characterName = param4;
         _characterSettings = param5;
         _currentLocale = param6;
         _getPerformanceCallback = param7;
         var _loc8_:SymbolDialogRegisterUserAcceptTermsGeneric = new SymbolDialogRegisterUserAcceptTermsGeneric();
         super(_loc8_);
         _queued = false;
         _loc8_.txtDialogTitle.text = LocText.current.text("dialog/register_user_accept_terms/title");
         _loc8_.txtTerms.htmlText = "<u>" + LocText.current.text("dialog/register_user_accept_terms/terms_text") + "</u>";
         _loc8_.txtInfo.autoFontSize = true;
         _loc8_.txtInfo.text = LocText.current.text("dialog/register_user_accept_terms/info_text");
         _btnContinue = new UiTextButton(_loc8_.btnSave,LocText.current.text("dialog/register_user_accept_terms/button_continue"),"",onClickContinue);
         _btnClose = new UiButton(_loc8_.btnClose,"",onClickClose);
         _btnTerms = new UiButton(_loc8_.txtTerms,"",onClickTerms);
         _btnContinue.changeWidth(300);
         _btnContinue.fitText();
      }
      
      override public function dispose() : void
      {
         var _loc1_:SymbolDialogRegisterUserAcceptTermsGeneric = _vo as SymbolDialogRegisterUserAcceptTermsGeneric;
         _btnContinue.dispose();
         _btnClose.dispose();
         _btnTerms.dispose();
         _btnContinue = null;
         _btnClose = null;
         _btnTerms = null;
         super.dispose();
      }
      
      private function onClickContinue(param1:InteractionEvent) : void
      {
         if(_email == null && _password == null)
         {
            registerUserSSO();
         }
         else
         {
            registerUserEmail();
         }
      }
      
      private function registerUserSSO() : void
      {
         var _loc3_:String = AppConfig.registrationSource;
         var _loc2_:String = PlatformConfig.ssoInfo;
         var _loc1_:TypedObject = TypedObject.empty;
         try
         {
            if(_getPerformanceCallback() > 25)
            {
               Logger.info("reducing quality of client",_getPerformanceCallback());
               _loc1_.setInt("animation_quality",2);
               ViewManager.instance.setClientAnimationQuality(2);
            }
         }
         catch(e:Error)
         {
         }
         if(!PanelBaseNoUser.soundEnabled)
         {
            _loc1_.setInt("sound_volume",0);
         }
         _btnClose.buttonEnabled = false;
         _btnContinue.buttonEnabled = false;
         Application.userController.registerUserSSO(_registrationPlatform,_loc2_,_loc3_,onRegisterSuccess,onRegisterFailedSSO,platform.isSSOAutoLoginAllowed,_currentLocale,onLoginSuccess,null,_loc1_);
      }
      
      private function registerUserEmail() : void
      {
         var _loc2_:String = AppConfig.registrationSource;
         var _loc1_:TypedObject = TypedObject.empty;
         try
         {
            if(_getPerformanceCallback() > 25)
            {
               Logger.info("reducing quality of client",_getPerformanceCallback());
               _loc1_.setInt("animation_quality",2);
               ViewManager.instance.setClientAnimationQuality(2);
            }
         }
         catch(e:Error)
         {
         }
         if(!PanelBaseNoUser.soundEnabled)
         {
            _loc1_.setInt("sound_volume",0);
         }
         _btnClose.buttonEnabled = false;
         _btnContinue.buttonEnabled = false;
         Application.userController.registerUserEmail(_email,_password,_loc2_,_currentLocale,onRegisterSuccess,onRegisterFailedEmail,_loc1_);
      }
      
      private function onLoginSuccess() : void
      {
      }
      
      private function onRegisterSuccess() : void
      {
         if(!_btnClose)
         {
            return;
         }
         performCharacterCreation();
      }
      
      private function onRegisterFailedEmail(param1:String) : void
      {
         if(!_btnClose)
         {
            return;
         }
         _btnClose.buttonEnabled = true;
         _btnContinue.buttonEnabled = true;
      }
      
      private function onRegisterFailedSSO(param1:String) : void
      {
         if(!_btnClose)
         {
            return;
         }
         _btnClose.buttonEnabled = true;
         _btnContinue.buttonEnabled = true;
         if(param1 == "errRegisterUserAlreadyExists")
         {
            _btnClose.buttonEnabled = false;
            _btnContinue.buttonEnabled = false;
            close();
         }
      }
      
      private function onClickClose(param1:InteractionEvent) : void
      {
         close();
      }
      
      private function onClickTerms(param1:InteractionEvent) : void
      {
         platform.openLink(AppConfig.urlPolicy);
      }
      
      private function performCharacterCreation() : void
      {
         var _loc1_:RequestData = RequestData.fromData(_characterSettings.rawData);
         _loc1_.setString("name",_characterName);
         _loc1_.deleteData("action");
         _loc1_.deleteData("user_id");
         _loc1_.deleteData("user_session_id");
         _loc1_.deleteData("client_version");
         _loc1_.deleteData("auth");
         Environment.application.sendActionRequest("createCharacter",_loc1_,handleRequests);
      }
      
      private function handleRequests(param1:ActionRequestResponse) : void
      {
         var _loc2_:* = param1.action;
         if("createCharacter" !== _loc2_)
         {
            throw new Error("Unsupported request action \'" + param1.action + "\'!");
         }
         if(param1.error == "")
         {
            close();
            Application.tracking.onUserRegister();
            MessageRouter.dispatch(new Message("ApplicationMessage.notifyCreateCharacterComplete",param1.data,this));
         }
         else
         {
            Environment.reportError(param1.error,param1.request);
         }
      }
      
      override public function get defaultButton() : Button
      {
         return _btnContinue;
      }
      
      override public function onEscape() : void
      {
         if(!_btnClose)
         {
            return;
         }
         if(!_btnClose.buttonEnabled || !_btnContinue.buttonEnabled)
         {
            return;
         }
         close();
      }
   }
}
