package com.playata.application.ui.panels
{
   import com.playata.application.AppConfig;
   import com.playata.application.Application;
   import com.playata.application.data.character.AppearanceSettings;
   import com.playata.application.data.user.User;
   import com.playata.application.platform.ServerInfo;
   import com.playata.application.ui.ViewManager;
   import com.playata.application.ui.dialogs.DialogLoginUser;
   import com.playata.application.ui.dialogs.DialogRegisterUserNew;
   import com.playata.application.ui.dialogs.DialogRegisterUserSSONew;
   import com.playata.application.ui.elements.avatar.UiAppearanceConfiguratorCreate;
   import com.playata.application.ui.elements.avatar.UiAvatar;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.application.ui.elements.generic.button.UiTextButton;
   import com.playata.application.ui.elements.generic.locale_picker.UiLocalePicker;
   import com.playata.application.ui.elements.generic.server_picker.UiServerSelection;
   import com.playata.application.ui.elements.generic.textfield.UiTextTooltip;
   import com.playata.framework.application.Environment;
   import com.playata.framework.display.AnchorPoint;
   import com.playata.framework.display.InteractiveDisplayObject;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import com.playata.framework.localization.Locale;
   import visuals.ui.panels.SymbolPanelCreateCharacterGeneric;
   
   public class PanelCreateCharacter extends DefaultPanel
   {
       
      
      private var _avatar:UiAvatar = null;
      
      private var _configurator:UiAppearanceConfiguratorCreate = null;
      
      private var _btnLogin:UiButton = null;
      
      private var _btnSaveCharacter:UiTextButton = null;
      
      private var _tooltipLogin:UiTextTooltip = null;
      
      private var _serverSelection:UiServerSelection = null;
      
      private var _localePicker:UiLocalePicker = null;
      
      private var _currentLocale:String = null;
      
      private var _localeTooltip:UiTextTooltip;
      
      private var _clickLayerLogin:InteractiveDisplayObject = null;
      
      public function PanelCreateCharacter(param1:SymbolPanelCreateCharacterGeneric)
      {
         var _loc3_:Number = NaN;
         super(param1);
         _btnLogin = new UiButton(param1.btnLogin,LocText.current.text("screen/create_character/go_to_login_button_tooltip"),onClickLogin);
         _btnSaveCharacter = new UiTextButton(param1.btnSaveCharacter,LocText.current.text("general/button_next"),LocText.current.text("screen/create_character/next_tooltip"),onClickSaveCharacter);
         param1.btnLogin.caption.text = LocText.current.text("screen/create_character/go_to_login_button");
         param1.txtInstructions.text = LocText.current.text("screen/create_character/title");
         param1.txtLoginCaption.text = LocText.current.text("screen/create_character/go_to_login_text");
         if(param1.txtLoginCaption.textWidth > param1.txtLoginCaption.width)
         {
            _loc3_ = param1.txtLoginCaption.textWidth - param1.txtLoginCaption.width + 20;
            param1.txtLoginCaption.width = param1.txtLoginCaption.width + _loc3_;
            param1.txtLoginCaption.x = param1.txtLoginCaption.x - _loc3_;
            param1.bgLogin.width = param1.bgLogin.width + _loc3_;
            param1.bgLogin.x = param1.bgLogin.x - _loc3_;
         }
         _avatar = new UiAvatar(param1.avatar,true,true,true);
         _configurator = new UiAppearanceConfiguratorCreate(param1.configurator,onAvatarUpdate);
         _clickLayerLogin = new InteractiveDisplayObject(param1.clickLayerLogin);
         _clickLayerLogin.onClick.add(handleLoginClick);
         var _loc2_:Boolean = platform.isStandaloneLoginAllowed && ServerInfo.serverId != "approval";
         param1.bgLogin.visible = _loc2_;
         param1.txtLoginCaption.visible = _loc2_;
         param1.btnLogin.visible = _loc2_;
         param1.clickLayerLogin.visible = _loc2_;
         param1.serverSelection.visible = false;
         _btnSaveCharacter.buttonEnabled = !Application.isRegistrationBlocked;
         if(platform.showIngameServerSelection)
         {
            param1.serverSelection.visible = true;
            _serverSelection = new UiServerSelection(param1.serverSelection,(Environment.application as Application).onServerSelectionChange);
         }
         if(AppConfig.alternativeLocales != null)
         {
            _currentLocale = Environment.info.defaultLocale;
            if(!Environment.info.isTouchScreen)
            {
               _localeTooltip = new UiTextTooltip(param1.localePicker,LocText.current.text("dialog/change_locale/title"));
            }
            _localePicker = new UiLocalePicker(param1.localePicker,Environment.info.availableLocales,Environment.info.defaultLocale,onLocaleChange,null,true,false);
            if(param1.serverSelection.visible)
            {
               param1.localePicker.x = 150;
               param1.bgLocale.x = 130;
            }
         }
         else
         {
            param1.localePicker.visible = false;
            param1.bgLocale.visible = false;
         }
         _tooltipLogin = new UiTextTooltip(param1.clickLayerLogin,LocText.current.text("screen/create_character/go_to_login_button_tooltip"));
         if(AppConfig.registrationEnabled == false)
         {
            param1.txtInstructions.visible = false;
            param1.configurator.visible = false;
            param1.avatar.visible = false;
            param1.btnSaveCharacter.visible = false;
            Environment.startupParams = "login";
         }
         _anchorContainer.add(param1.bgLogin,AnchorPoint.RIGHT_FIXED);
         _anchorContainer.add(param1.txtLoginCaption,AnchorPoint.RIGHT_FIXED);
         _anchorContainer.add(param1.clickLayerLogin,AnchorPoint.RIGHT_FIXED);
         _anchorContainer.add(param1.btnLogin,AnchorPoint.RIGHT_FIXED);
         _anchorContainer.add(param1.txtInstructions,AnchorPoint.RIGHT_FIXED,0.5);
         _anchorContainer.add(param1.avatar,AnchorPoint.RIGHT_FIXED,0.5);
         _anchorContainer.add(param1.configurator,AnchorPoint.RIGHT_FIXED,0.5);
         _anchorContainer.add(param1.btnSaveCharacter,AnchorPoint.RIGHT_FIXED,0.5);
         _anchorContainer.add(param1.txtInstructions,AnchorPoint.BOTTOM_FIXED,0.5);
         _anchorContainer.add(param1.avatar,AnchorPoint.BOTTOM_FIXED,0.5);
         _anchorContainer.add(param1.configurator,AnchorPoint.BOTTOM_FIXED,0.5);
         _anchorContainer.add(param1.btnSaveCharacter,AnchorPoint.BOTTOM_FIXED,0.5);
      }
      
      public function get serverSelection() : UiServerSelection
      {
         return _serverSelection;
      }
      
      override public function refreshPanelLocalization() : void
      {
         var _loc1_:SymbolPanelCreateCharacterGeneric = _vo as SymbolPanelCreateCharacterGeneric;
         _btnLogin.tooltip = LocText.current.text("screen/create_character/go_to_login_button_tooltip");
         _btnSaveCharacter.caption = LocText.current.text("general/button_next");
         _btnSaveCharacter.tooltip = LocText.current.text("screen/create_character/next_tooltip");
         _configurator.refreshLocalization();
         _loc1_.btnLogin.caption.text = LocText.current.text("screen/create_character/go_to_login_button");
         _loc1_.txtInstructions.text = LocText.current.text("screen/create_character/title");
         _loc1_.txtLoginCaption.text = LocText.current.text("screen/create_character/go_to_login_text");
         _tooltipLogin.text = LocText.current.text("screen/create_character/go_to_login_button_tooltip");
         if(_localeTooltip)
         {
            _localeTooltip.text = LocText.current.text("dialog/change_locale/title");
         }
      }
      
      override public function hide() : void
      {
         if(_avatar)
         {
            _avatar.stopAnimation();
         }
         super.hide();
      }
      
      override public function show(param1:* = null) : void
      {
         super.show(param1);
         _avatar.startAnimation();
         _avatar.measurePerformance = true;
         ViewManager.instance.setBackground(1);
         _configurator.show();
         _avatar.update(checkAndMakeSoftcore(_configurator.currentSettings),true);
         ViewManager.instance.tutorialArrow.hide();
         var _loc2_:SymbolPanelCreateCharacterGeneric = _vo as SymbolPanelCreateCharacterGeneric;
         LocText.current.gender = !!_configurator.isMale?1:2;
         _loc2_.txtInstructions.text = LocText.current.text("screen/create_character/title");
      }
      
      override public function refresh() : void
      {
         super.refresh();
         _btnSaveCharacter.buttonEnabled = !Application.isRegistrationBlocked;
      }
      
      override public function dispose() : void
      {
         _clickLayerLogin.dispose();
         _avatar.dispose();
         _configurator.dispose();
         _btnLogin.dispose();
         _btnSaveCharacter.dispose();
         _btnLogin = null;
         _btnSaveCharacter = null;
         _avatar = null;
         _configurator = null;
         _tooltipLogin.dispose();
         _tooltipLogin = null;
         if(_serverSelection)
         {
            _serverSelection.dispose();
            _serverSelection = null;
         }
         if(_localeTooltip)
         {
            _localeTooltip.dispose();
            _localeTooltip = null;
         }
         if(_localePicker)
         {
            _localePicker.dispose();
            _localePicker = null;
         }
         super.dispose();
      }
      
      private function handleLoginClick(param1:InteractionEvent) : void
      {
         onClickLogin(null);
      }
      
      private function onAvatarUpdate(param1:AppearanceSettings) : void
      {
         _avatar.update(checkAndMakeSoftcore(param1),true);
         var _loc2_:SymbolPanelCreateCharacterGeneric = _vo as SymbolPanelCreateCharacterGeneric;
         LocText.current.gender = !!_configurator.isMale?1:2;
         _loc2_.txtInstructions.text = LocText.current.text("screen/create_character/title");
      }
      
      private function onClickLogin(param1:InteractionEvent) : void
      {
         if(User.current == null)
         {
            Environment.panelManager.showDialog(new DialogLoginUser());
         }
      }
      
      private function onClickSaveCharacter(param1:InteractionEvent) : void
      {
         if(platform.isSSO || Environment.info.isNativeMobile)
         {
            Environment.panelManager.showDialog(new DialogRegisterUserSSONew(_configurator.currentSettings,getAvatarPerformace,_currentLocale));
         }
         else
         {
            Environment.panelManager.showDialog(new DialogRegisterUserNew(_configurator.currentSettings,getAvatarPerformace,_currentLocale));
         }
      }
      
      private function getAvatarPerformace() : Number
      {
         return _avatar.averageRenderTime;
      }
      
      private function checkAndMakeSoftcore(param1:AppearanceSettings) : AppearanceSettings
      {
         var _loc3_:* = null;
         var _loc4_:String = AppConfig.registrationSource;
         if(!_loc4_)
         {
            return param1;
         }
         var _loc2_:Boolean = false;
         if(_loc4_.indexOf("ref=") != -1)
         {
            _loc3_ = _loc4_.substring(_loc4_.indexOf("ref=") + 4);
            if(_loc3_.indexOf(";") != -1)
            {
               _loc3_ = _loc3_.substring(0,_loc3_.indexOf(";"));
            }
            if(_loc3_.indexOf("007-") == 0)
            {
               _loc2_ = true;
            }
         }
         if(_loc2_)
         {
            if(param1.gender == "f")
            {
               param1.chest = "chest_tank_norm_c";
               param1.legs = "legs_pants_cloth_e";
            }
            else
            {
               param1.deleteData("chest");
               param1.legs = "legs_jeans_slim_e";
            }
         }
         return param1;
      }
      
      protected function onLocaleChange(param1:String) : void
      {
         _localePicker.close();
         _localePicker.enabled = false;
         var _loc2_:Locale = new Locale(param1,AppConfig.localeVersion);
         Environment.application.loadLocale(_loc2_,onLocaleLoaded);
      }
      
      private function onLocaleLoaded() : void
      {
         _localePicker.enabled = true;
         if(LocText.current.locale == _localePicker.activeLocale.locale)
         {
            _currentLocale = _localePicker.activeLocale.locale;
            ViewManager.instance.refreshPanelLocalization();
         }
      }
   }
}
