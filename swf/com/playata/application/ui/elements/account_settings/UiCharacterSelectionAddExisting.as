package com.playata.application.ui.elements.account_settings
{
   import com.playata.application.AppConfig;
   import com.playata.application.AppEnvironment;
   import com.playata.application.data.character.CharacterSelection;
   import com.playata.application.data.character.CharacterSelectionEntry;
   import com.playata.application.platform.ServerInfo;
   import com.playata.application.request.ApplicationRequest;
   import com.playata.application.ui.dialogs.DialogCharacterSelection;
   import com.playata.application.ui.elements.generic.dialog.UiInfoDialog;
   import com.playata.application.ui.elements.generic.locale_picker.UiLocalePicker;
   import com.playata.application.ui.elements.generic.server_picker.UiServerPicker;
   import com.playata.application.ui.elements.generic.tab.UiTabIconOnlyButton;
   import com.playata.framework.application.Environment;
   import com.playata.framework.core.util.StringUtil;
   import com.playata.framework.display.ui.dialogs.Dialog;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import com.playata.framework.network.request.RequestData;
   import visuals.ui.elements.application.SymbolCharacterSelectionAddExistingGeneric;
   
   public class UiCharacterSelectionAddExisting
   {
       
      
      private var _usedServerIds:Vector.<String> = null;
      
      private var _content:SymbolCharacterSelectionAddExistingGeneric = null;
      
      private var _parentDialog:Dialog = null;
      
      private var _localePicker:UiLocalePicker = null;
      
      private var _serverPicker:UiServerPicker = null;
      
      private var _tabMobile:UiTabIconOnlyButton = null;
      
      private var _tabFacebook:UiTabIconOnlyButton = null;
      
      private var _tabGameService:UiTabIconOnlyButton = null;
      
      private var _tabEmail:UiTabIconOnlyButton = null;
      
      public function UiCharacterSelectionAddExisting(param1:SymbolCharacterSelectionAddExistingGeneric, param2:Vector.<String>, param3:Dialog)
      {
         super();
         _content = param1;
         _usedServerIds = param2;
         _parentDialog = param3;
         var _loc6_:Vector.<String> = ServerInfo.getAvailableNewCharacterLocales(_usedServerIds);
         var _loc4_:String = _loc6_[0];
         if(_loc6_.indexOf(Environment.info.defaultLocale) != -1)
         {
            _loc4_ = Environment.info.defaultLocale;
         }
         var _loc5_:Vector.<String> = ServerInfo.getServersForNewCharacterLocale(_loc4_,_usedServerIds);
         _localePicker = new UiLocalePicker(_content.localePicker,_loc6_,_loc4_,onLocaleChange,onLocaleOpen,false);
         _serverPicker = new UiServerPicker(_content.serverPicker,_loc5_,_loc5_[_loc5_.length - 1],onServerChange,onServerOpen,_content.txtLoginInfo.textColor);
         _localePicker.content.bringToTop();
         _serverPicker.content.bringToTop();
         _tabMobile = new UiTabIconOnlyButton(_content.tabMobile,onClickTab,3);
         _tabFacebook = new UiTabIconOnlyButton(_content.tabFacebook,onClickTab,2);
         _tabGameService = new UiTabIconOnlyButton(_content.tabGameService,onClickTab,!!Environment.info.isAndroid?4:5);
         _tabEmail = new UiTabIconOnlyButton(_content.tabEmail,onClickTab,1);
         _tabGameService.visible = false;
         _tabMobile.x = _tabMobile.x + 35;
         _tabFacebook.x = _tabFacebook.x + 35;
         _tabEmail.x = _tabEmail.x - 38;
         _content.emailLogin.txtEmailCaption.text = LocText.current.text("screen/login/mail");
         _content.emailLogin.txtPasswordCaption.text = LocText.current.text("screen/login/password");
         switchTab(_tabMobile);
      }
      
      public function dispose() : void
      {
         _localePicker.dispose();
         _localePicker = null;
         _serverPicker.dispose();
         _serverPicker = null;
         _tabMobile.dispose();
         _tabMobile = null;
         _tabFacebook.dispose();
         _tabFacebook = null;
         _tabGameService.dispose();
         _tabGameService = null;
         _tabEmail.dispose();
         _tabEmail = null;
      }
      
      public function get content() : SymbolCharacterSelectionAddExistingGeneric
      {
         return _content;
      }
      
      public function onAction() : void
      {
         if(_tabMobile.tabbed)
         {
            requestMobileCharacters();
         }
         else if(_tabFacebook.tabbed)
         {
            requestFacebookCharacters();
         }
         else if(_tabGameService.tabbed)
         {
            requestGameServiceCharacters();
         }
         else if(_tabEmail.tabbed)
         {
            requestEmailCharacter();
         }
      }
      
      protected function onLocaleChange(param1:String) : void
      {
         _localePicker.close();
         if(_serverPicker)
         {
            _serverPicker.dispose();
            _serverPicker = null;
         }
         var _loc2_:Vector.<String> = ServerInfo.getServersForNewCharacterLocale(param1,_usedServerIds);
         _serverPicker = new UiServerPicker(_content.serverPicker,_loc2_,_loc2_[_loc2_.length - 1],onServerChange,onServerOpen,_content.txtLoginInfo.textColor);
      }
      
      protected function onServerChange(param1:String) : void
      {
         _serverPicker.close();
      }
      
      protected function onLocaleOpen() : void
      {
         _serverPicker.close();
      }
      
      protected function onServerOpen() : void
      {
         _localePicker.close();
      }
      
      private function requestMobileCharacters() : void
      {
         requestCharacter(Environment.platform.id,Environment.deviceInfo.uniqueId,null,null);
      }
      
      private function requestFacebookCharacters() : void
      {
         AppEnvironment.facebook.login(onFBLoggedIn,true);
      }
      
      private function requestGameServiceCharacters() : void
      {
         if(Environment.gameServices != null)
         {
            Environment.gameServices.login(onGameServiceLoggedIn);
         }
      }
      
      private function requestEmailCharacter() : void
      {
         if(StringUtil.isEmpty(_content.emailLogin.inputEmail.text))
         {
            Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("general/info"),LocText.current.text("error/screen/login/empty_mail"),LocText.current.text("general/button_ok"),setFocus));
         }
         else if(StringUtil.isEmpty(_content.emailLogin.inputPassword.text))
         {
            Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("general/info"),LocText.current.text("error/screen/login/empty_password"),LocText.current.text("general/button_ok"),setFocus));
         }
         else
         {
            requestCharacter("standalone",null,_content.emailLogin.inputEmail.text,_content.emailLogin.inputPassword.text);
         }
      }
      
      private function requestCharacter(param1:String, param2:String, param3:String, param4:String) : void
      {
         var _loc5_:String = AppConfig.urlRequestServer;
         _loc5_ = StringUtil.replace(_loc5_,"//" + ServerInfo.serverId + ".","//" + _serverPicker.activeServer.serverId + ".");
         _loc5_ = StringUtil.replace(_loc5_,"//" + ServerInfo.serverId + "-","//" + _serverPicker.activeServer.serverId + "-");
      }
      
      private function onFBLoggedIn(param1:Boolean) : void
      {
         if(param1)
         {
            requestCharacter("facebook",AppEnvironment.facebook.userId,null,null);
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
            requestCharacter(Environment.gameServices.platformId,Environment.gameServices.userId,null,null);
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
         if(StringUtil.isEmpty(_content.emailLogin.inputEmail.text))
         {
            Environment.display.focus = _content.emailLogin.inputEmail;
         }
         else if(StringUtil.isEmpty(_content.emailLogin.inputPassword.text))
         {
            Environment.display.focus = _content.emailLogin.inputPassword;
         }
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
         if(_tabEmail.tabbed)
         {
            setFocus();
         }
         _content.emailLogin.visible = _tabEmail.tabbed;
         _content.txtLoginInfo.visible = false;
         if(_tabMobile.tabbed)
         {
            _content.txtLoginInfo.text = LocText.current.text("screen/login/mobile_login_info");
         }
         if(_tabFacebook.tabbed)
         {
            _content.txtLoginInfo.text = LocText.current.text("screen/login/facebook_login_info");
         }
         if(_tabGameService.tabbed)
         {
            _content.txtLoginInfo.text = !!Environment.info.isAndroid?LocText.current.text("screen/login/gameservice_login_info_android"):LocText.current.text("screen/login/gameservice_login_info_ios");
         }
      }
      
      private function handleRequests(param1:String, param2:RequestData, param3:Object, param4:String) : void
      {
         action = param1;
         request = param2;
         data = param3;
         error = param4;
         var _loc6_:* = action;
         if("requestCharacter" !== _loc6_)
         {
            throw new Error("Unsupported request action \'" + action + "\'!");
         }
         if(error == "")
         {
            var characterSelectionEntry:CharacterSelectionEntry = new CharacterSelectionEntry(_serverPicker.activeServer.serverId,data.character_selection_entry);
            var characterSelection:CharacterSelection = new CharacterSelection();
            characterSelection.add(characterSelectionEntry);
            _parentDialog.close();
            Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/character_selection/title"),LocText.current.text("dialog/character_selection_add/character_added",characterSelectionEntry.name),LocText.current.text("general/button_ok"),function():void
            {
               Environment.panelManager.showDialog(new DialogCharacterSelection());
            }));
         }
         else if(error == "errLoginInvalidEmail")
         {
            Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("error/login_invalid_email_title"),LocText.current.text("error/login_invalid_email_text"),LocText.current.text("general/button_ok")));
         }
         else if(error == "errLoginInvalid")
         {
            Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("error/login_invalid_title"),LocText.current.text("error/login_invalid_text"),LocText.current.text("general/button_ok")));
         }
         else if(error == "errLoginNoSuchUser")
         {
            Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("error/user_not_found_title"),LocText.current.text("error/user_not_found_native_text"),LocText.current.text("general/button_ok")));
         }
         else if(error == "errLoginInvalidStatus")
         {
            Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("error/login_invalid_status_title"),LocText.current.text("error/login_invalid_status_text"),LocText.current.text("general/button_ok")));
         }
         else
         {
            Environment.reportError(error,request);
         }
      }
   }
}
