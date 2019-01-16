package com.playata.application.ui.dialogs
{
   import com.playata.application.AppConfig;
   import com.playata.application.AppEnvironment;
   import com.playata.application.data.character.AppearanceSettings;
   import com.playata.application.data.constants.CConstant;
   import com.playata.application.platform.ServerInfo;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.application.ui.elements.generic.button.UiTextButton;
   import com.playata.application.ui.elements.generic.dialog.UiDialog;
   import com.playata.application.ui.elements.generic.dialog.UiInfoDialog;
   import com.playata.application.ui.elements.generic.dialog.UiTwoChoiceDialog;
   import com.playata.framework.application.Environment;
   import com.playata.framework.application.request.ActionRequestResponse;
   import com.playata.framework.core.Core;
   import com.playata.framework.core.util.StringUtil;
   import com.playata.framework.display.ui.controls.Button;
   import com.playata.framework.display.ui.dialogs.Dialog;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.dialogs.SymbolDialogRegisterUserSSONewGeneric;
   
   public class DialogRegisterUserSSONew extends UiDialog
   {
       
      
      private var _characterSettings:AppearanceSettings = null;
      
      private var _characterName:String = null;
      
      private var _registrationPlatform:String = null;
      
      private var _alternativeRegistrationPlatform:String = null;
      
      private var _btnContinue:UiTextButton = null;
      
      private var _btnFBLogin:UiTextButton = null;
      
      private var _btnClose:UiButton = null;
      
      private var _btnTerms:UiButton = null;
      
      private var _currentLocale:String = null;
      
      private var _getPerformanceCallback:Function;
      
      public function DialogRegisterUserSSONew(param1:AppearanceSettings, param2:Function, param3:String = null)
      {
         _characterSettings = param1;
         _getPerformanceCallback = param2;
         _currentLocale = param3;
         var _loc4_:SymbolDialogRegisterUserSSONewGeneric = new SymbolDialogRegisterUserSSONewGeneric();
         super(_loc4_);
         _registrationPlatform = this.platform.id;
         _queued = false;
         _loc4_.txtDialogTitle.text = LocText.current.text("dialog/register_user_new/title");
         _loc4_.txtNameCaption.text = LocText.current.text("dialog/register_user/name");
         _loc4_.txtNameCaption.autoFontSize = true;
         _loc4_.txtAge.text = LocText.current.text("dialog/register_user_new/age_confirmation");
         _loc4_.txtTerms.htmlText = "<u>" + LocText.current.text("dialog/register_user_new/terms_text") + "</u>";
         _loc4_.alternativeAccounts.txtAlternativeCaption.text = LocText.current.text("screen/login/login_with");
         _btnFBLogin = new UiTextButton(_loc4_.alternativeAccounts.btnFBLogin,"Facebook","",onClickFBLogin);
         _btnContinue = new UiTextButton(_loc4_.btnSave,LocText.current.text("dialog/register_user_new/button_continue"),"",onClickSave);
         _btnClose = new UiButton(_loc4_.btnClose,"",onClickClose);
         _btnTerms = new UiButton(_loc4_.txtTerms,LocText.current.text("screen/register_user/terms_tooltip"),onClickTerms);
         _btnContinue.changeWidth(300);
         _btnContinue.fitText();
         _tabObjects.push(_loc4_.inputCharacterName);
         _loc4_.alternativeAccounts.visible = Environment.info.isNativeMobile && !AppEnvironment.appPlatform.isNutaku && ServerInfo.serverId != "approval";
         if(_loc4_.alternativeAccounts.visible)
         {
            _loc4_.dialogBackground.height = _loc4_.dialogBackground.height + 80;
            _loc4_.btnSave.y = _loc4_.btnSave.y + 80;
         }
         if(_loc4_.txtAge.numLines == 1)
         {
            _loc4_.txtAge.y = _loc4_.txtAge.y + 20;
            _loc4_.txtAge.height = _loc4_.txtAge.height - 18;
         }
         _loc4_.txtTerms.bringToTop();
         setFocus();
      }
      
      override public function dispose() : void
      {
         _btnContinue.dispose();
         _btnClose.dispose();
         _btnTerms.dispose();
         _btnContinue = null;
         _btnClose = null;
         _btnTerms = null;
         super.dispose();
      }
      
      private function onClickSave(param1:InteractionEvent) : void
      {
         checkRegistration();
      }
      
      private function onClickClose(param1:InteractionEvent) : void
      {
         close();
      }
      
      private function onClickTerms(param1:InteractionEvent) : void
      {
         platform.openLink(AppConfig.urlToS);
      }
      
      private function setFocus() : void
      {
         var _loc1_:SymbolDialogRegisterUserSSONewGeneric = _vo as SymbolDialogRegisterUserSSONewGeneric;
         if(StringUtil.isEmpty(_loc1_.inputCharacterName.text))
         {
            Dialog.focus = _loc1_.inputCharacterName;
         }
      }
      
      private function onClickFBLogin(param1:InteractionEvent) : void
      {
         AppEnvironment.facebook.login(onFBLoggedIn,true);
      }
      
      private function onFBLoggedIn(param1:Boolean) : void
      {
         if(param1)
         {
            Core.config.overwrite("ssoInfo",AppEnvironment.facebook.userId);
            _alternativeRegistrationPlatform = "facebook";
            _btnFBLogin.buttonEnabled = false;
         }
         else
         {
            Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("error/login_invalid_title"),LocText.current.text("error/login_invalid_text"),LocText.current.text("general/button_ok")));
         }
      }
      
      private function checkRegistration() : void
      {
         if(_alternativeRegistrationPlatform == null)
         {
            _registrationPlatform = this.platform.id;
         }
         else
         {
            _registrationPlatform = _alternativeRegistrationPlatform;
         }
         var _loc1_:SymbolDialogRegisterUserSSONewGeneric = _vo as SymbolDialogRegisterUserSSONewGeneric;
         if(StringUtil.isEmpty(_loc1_.inputCharacterName.text))
         {
            Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("general/info"),LocText.current.text("error/screen/create_character/empty_name"),LocText.current.text("general/button_ok"),setFocus));
         }
         else
         {
            _btnClose.buttonEnabled = false;
            _btnContinue.buttonEnabled = false;
            Environment.application.sendActionRequest("checkCharacterName",{"name":_loc1_.inputCharacterName.text},handleRequests);
         }
      }
      
      private function setAlternativeName() : void
      {
         var _loc1_:SymbolDialogRegisterUserSSONewGeneric = _vo as SymbolDialogRegisterUserSSONewGeneric;
         _loc1_.inputCharacterName.text = _characterName;
      }
      
      private function showAcceptTermsDialog() : void
      {
         Environment.panelManager.showDialog(new DialogRegisterUserAcceptTerms(null,null,_registrationPlatform,_characterName,_characterSettings,_currentLocale,_getPerformanceCallback));
         close();
      }
      
      private function handleRequests(param1:ActionRequestResponse) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = param1.action;
         if("checkCharacterName" !== _loc3_)
         {
            throw new Error("Unsupported request action \'" + param1.action + "\'!");
         }
         if(!_btnClose)
         {
            return;
         }
         _btnClose.buttonEnabled = true;
         _btnContinue.buttonEnabled = true;
         if(param1.error == "")
         {
            _loc2_ = _vo as SymbolDialogRegisterUserSSONewGeneric;
            if(param1.appResponse.available == false)
            {
               _characterName = param1.appResponse.alternative;
               Environment.panelManager.showDialog(new UiTwoChoiceDialog(LocText.current.text("dialog/set_character_name_alt/title"),LocText.current.text("dialog/set_character_name_alt/text",_loc2_.inputCharacterName.text,_characterName),LocText.current.text("dialog/set_character_name_alt/accept"),LocText.current.text("dialog/set_character_name_alt/dismiss"),showAcceptTermsDialog,setAlternativeName));
            }
            else
            {
               _btnClose.buttonEnabled = false;
               _btnContinue.buttonEnabled = false;
               _characterName = _loc2_.inputCharacterName.text;
               showAcceptTermsDialog();
            }
         }
         else if(param1.error == "errCheckCharacterNameProfanityName")
         {
            Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("error/check_character_name_profanity_title"),LocText.current.text("error/check_character_name_profanity_text"),LocText.current.text("general/button_ok")));
         }
         else if(param1.error == "errCheckCharacterNameInvalidName")
         {
            Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("error/check_character_name_title"),LocText.current.text("error/check_character_name_text",CConstant.character_name_length_min,CConstant.character_name_length_max),LocText.current.text("general/button_ok")));
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
         if(!_btnClose.buttonEnabled || !_btnContinue.buttonEnabled)
         {
            return;
         }
         close();
      }
   }
}
