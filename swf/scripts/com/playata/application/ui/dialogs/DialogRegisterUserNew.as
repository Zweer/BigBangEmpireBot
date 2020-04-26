package com.playata.application.ui.dialogs
{
   import com.playata.application.AppConfig;
   import com.playata.application.data.character.AppearanceSettings;
   import com.playata.application.data.constants.CConstant;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.application.ui.elements.generic.button.UiTextButton;
   import com.playata.application.ui.elements.generic.dialog.UiDialog;
   import com.playata.application.ui.elements.generic.dialog.UiInfoDialog;
   import com.playata.application.ui.elements.generic.dialog.UiTwoChoiceDialog;
   import com.playata.framework.application.Environment;
   import com.playata.framework.application.request.ActionRequestResponse;
   import com.playata.framework.core.util.StringUtil;
   import com.playata.framework.display.ui.TextInputType;
   import com.playata.framework.display.ui.controls.Button;
   import com.playata.framework.display.ui.dialogs.Dialog;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.dialogs.SymbolDialogRegisterUserNewGeneric;
   
   public class DialogRegisterUserNew extends UiDialog
   {
       
      
      private var _characterSettings:AppearanceSettings = null;
      
      private var _characterName:String = null;
      
      private var _btnContinue:UiTextButton = null;
      
      private var _btnClose:UiButton = null;
      
      private var _btnTerms:UiButton = null;
      
      private var _getPerformanceCallback:Function;
      
      private var _currentLocale:String = null;
      
      public function DialogRegisterUserNew(param1:AppearanceSettings, param2:Function, param3:String = null)
      {
         _characterSettings = param1;
         _currentLocale = param3;
         _getPerformanceCallback = param2;
         var _loc4_:SymbolDialogRegisterUserNewGeneric = new SymbolDialogRegisterUserNewGeneric();
         super(_loc4_);
         _queued = false;
         _loc4_.txtDialogTitle.text = LocText.current.text("dialog/register_user_new/title");
         _loc4_.txtEmailCaption.text = LocText.current.text("dialog/register_user/mail");
         _loc4_.txtPasswordCaption.text = LocText.current.text("dialog/register_user/password");
         _loc4_.txtNameCaption.text = LocText.current.text("dialog/register_user/name");
         _loc4_.txtEmailCaption.autoFontSize = true;
         _loc4_.txtPasswordCaption.autoFontSize = true;
         _loc4_.txtNameCaption.autoFontSize = true;
         _loc4_.txtAge.text = LocText.current.text("dialog/register_user_new/age_confirmation");
         _loc4_.txtTerms.htmlText = "<u>" + LocText.current.text("dialog/register_user_new/terms_text") + "</u>";
         _loc4_.inputEmail.inputType = TextInputType.EMAIL;
         _btnContinue = new UiTextButton(_loc4_.btnSave,LocText.current.text("dialog/register_user_new/button_continue"),"",onClickContinue);
         _btnClose = new UiButton(_loc4_.btnClose,"",onClickClose);
         _btnTerms = new UiButton(_loc4_.txtTerms,LocText.current.text("screen/register_user/terms_tooltip"),onClickTerms);
         _btnContinue.changeWidth(300);
         _btnContinue.fitText();
         _tabObjects.push(_loc4_.inputCharacterName);
         _tabObjects.push(_loc4_.inputEmail);
         _tabObjects.push(_loc4_.inputPassword);
         if(_loc4_.txtAge.numLines == 1)
         {
            _loc4_.txtAge.y = _loc4_.txtAge.y + 20;
         }
         _loc4_.txtTerms.bringToTop();
         setFocus();
      }
      
      override public function dispose() : void
      {
         var _loc1_:SymbolDialogRegisterUserNewGeneric = _vo as SymbolDialogRegisterUserNewGeneric;
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
         var _loc2_:SymbolDialogRegisterUserNewGeneric = _vo as SymbolDialogRegisterUserNewGeneric;
         if(StringUtil.isEmpty(_loc2_.inputCharacterName.text))
         {
            Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("general/info"),LocText.current.text("error/screen/create_character/empty_name"),LocText.current.text("general/button_ok"),setFocus));
         }
         else if(StringUtil.isEmpty(_loc2_.inputEmail.text))
         {
            Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("general/info"),LocText.current.text("error/screen/register_user/empty_mail"),LocText.current.text("general/button_ok"),setFocus));
         }
         else if(StringUtil.isEmpty(_loc2_.inputPassword.text))
         {
            Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("general/info"),LocText.current.text("error/screen/register_user/empty_password"),LocText.current.text("general/button_ok"),setFocus));
         }
         else
         {
            _btnClose.buttonEnabled = false;
            _btnContinue.buttonEnabled = false;
            Environment.application.sendActionRequest("checkCharacterName",{"name":_loc2_.inputCharacterName.text},handleRequests);
         }
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
         var _loc1_:SymbolDialogRegisterUserNewGeneric = _vo as SymbolDialogRegisterUserNewGeneric;
         if(StringUtil.isEmpty(_loc1_.inputCharacterName.text))
         {
            Dialog.focus = _loc1_.inputCharacterName;
         }
         else if(StringUtil.isEmpty(_loc1_.inputEmail.text))
         {
            Dialog.focus = _loc1_.inputEmail;
         }
         else if(StringUtil.isEmpty(_loc1_.inputPassword.text))
         {
            Dialog.focus = _loc1_.inputPassword;
         }
      }
      
      private function checkUserEmail() : void
      {
         var _loc1_:SymbolDialogRegisterUserNewGeneric = _vo as SymbolDialogRegisterUserNewGeneric;
         _btnClose.buttonEnabled = false;
         _btnContinue.buttonEnabled = false;
         Environment.application.sendActionRequest("checkUserEmail",{"email":_loc1_.inputEmail.text},handleRequests);
      }
      
      private function setAlternativeName() : void
      {
         var _loc1_:SymbolDialogRegisterUserNewGeneric = _vo as SymbolDialogRegisterUserNewGeneric;
         _loc1_.inputCharacterName.text = _characterName;
      }
      
      private function showAcceptTermsDialog() : void
      {
         var _loc1_:SymbolDialogRegisterUserNewGeneric = _vo as SymbolDialogRegisterUserNewGeneric;
         Environment.panelManager.showDialog(new DialogRegisterUserAcceptTerms(_loc1_.inputEmail.text,_loc1_.inputPassword.text,null,_characterName,_characterSettings,_currentLocale,_getPerformanceCallback));
         close();
      }
      
      private function handleRequests(param1:ActionRequestResponse) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = param1.action;
         switch(_loc3_)
         {
            case "checkCharacterName":
               if(!_btnClose)
               {
                  return;
               }
               _btnClose.buttonEnabled = true;
               _btnContinue.buttonEnabled = true;
               if(param1.error == "")
               {
                  _loc2_ = _vo as SymbolDialogRegisterUserNewGeneric;
                  if(param1.appResponse.available == false)
                  {
                     _characterName = param1.appResponse.alternative;
                     Environment.panelManager.showDialog(new UiTwoChoiceDialog(LocText.current.text("dialog/set_character_name_alt/title"),LocText.current.text("dialog/set_character_name_alt/text",_loc2_.inputCharacterName.text,_characterName),LocText.current.text("dialog/set_character_name_alt/accept"),LocText.current.text("dialog/set_character_name_alt/dismiss"),checkUserEmail));
                     setAlternativeName();
                  }
                  else
                  {
                     _characterName = _loc2_.inputCharacterName.text;
                     checkUserEmail();
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
               break;
            case "checkUserEmail":
               if(!_btnClose)
               {
                  return;
               }
               _btnClose.buttonEnabled = true;
               _btnContinue.buttonEnabled = true;
               if(param1.error == "")
               {
                  if(param1.appResponse.success == true)
                  {
                     _btnClose.buttonEnabled = false;
                     _btnContinue.buttonEnabled = false;
                     showAcceptTermsDialog();
                  }
               }
               else if(param1.error == "errRegisterInvalidEmail")
               {
                  Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("error/register_invalid_email_title"),LocText.current.text("error/register_invalid_email_text"),LocText.current.text("general/button_ok")));
               }
               else if(param1.error == "errRegisterUserAlreadyExists")
               {
                  Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("error/user_already_exists_title"),LocText.current.text("error/user_already_exists_text"),LocText.current.text("general/button_ok")));
               }
               else
               {
                  Environment.reportError(param1.error,param1.request);
               }
               break;
            default:
               throw new Error("Unsupported request action \'" + param1.action + "\'!");
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
