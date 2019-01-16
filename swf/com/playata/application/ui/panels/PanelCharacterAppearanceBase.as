package com.playata.application.ui.panels
{
   import com.playata.application.data.character.AppearanceSettings;
   import com.playata.application.data.constants.CCharacterAppearance;
   import com.playata.application.data.optical_changes.OpticalChangeBackground;
   import com.playata.application.data.optical_changes.OpticalChanges;
   import com.playata.application.data.user.User;
   import com.playata.application.ui.ViewManager;
   import com.playata.application.ui.elements.avatar.UiAppearanceConfigurator;
   import com.playata.application.ui.elements.avatar.UiAvatar;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.application.ui.elements.generic.button.UiPremiumButton;
   import com.playata.application.ui.elements.generic.checkbox.UiCheckBox;
   import com.playata.framework.application.Environment;
   import com.playata.framework.application.request.ActionRequestResponse;
   import com.playata.framework.display.IDisplayObject;
   import com.playata.framework.display.IDisplayObjectContainer;
   import com.playata.framework.display.ui.controls.ILabel;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.base.SymbolUiCheckboxGeneric;
   import visuals.ui.elements.avatar.SymbolAvatarGeneric;
   import visuals.ui.elements.buttons.SymbolButtonPremiumGeneric;
   
   public class PanelCharacterAppearanceBase extends DefaultPanel
   {
       
      
      protected var _avatar:UiAvatar;
      
      protected var _configurator:UiAppearanceConfigurator;
      
      protected var _btnChangeAppearance:UiButton;
      
      protected var _btnCancel:UiButton;
      
      protected var _checkboxShowClothes:UiCheckBox = null;
      
      private var _background:OpticalChangeBackground = null;
      
      public function PanelCharacterAppearanceBase(param1:IDisplayObjectContainer, param2:Boolean = true)
      {
         super(param1);
         _avatar = new UiAvatar(content.getChildByName("avatar") as SymbolAvatarGeneric,true,true,param2);
         createChangeButton(content["btnChange"]);
         _btnCancel = new UiButton(content.getChildByName("btnCancel"),LocText.current.text("screen/change_appearance/withdraw_tooltip"),onClickCancel);
         if(content.getChildByName("checkShowClothes") && content.getChildByName("txtShowClothes"))
         {
            _checkboxShowClothes = new UiCheckBox(content.getChildByName("checkShowClothes") as SymbolUiCheckboxGeneric,false,"",onCheckedShowClothes,null,content.getChildByName("txtShowClothes") as ILabel);
            (content.getChildByName("txtShowClothes") as ILabel).text = LocText.current.text("screen/change_appearance/show_clothes");
         }
         _background = new OpticalChangeBackground(param1["background"],1);
      }
      
      protected function get content() : IDisplayObjectContainer
      {
         return null;
      }
      
      override public function refreshAppSize() : void
      {
         super.refreshAppSize();
         _background.refreshAppSize();
      }
      
      private function onCheckedShowClothes(param1:Boolean) : void
      {
         onAvatarUpdate(_configurator.currentSettings);
      }
      
      protected function createChangeButton(param1:IDisplayObject) : void
      {
         var _loc3_:SymbolButtonPremiumGeneric = param1 as SymbolButtonPremiumGeneric;
         var _loc2_:UiPremiumButton = new UiPremiumButton(_loc3_,0,LocText.current.text("screen/change_appearance/button_change_caption"),LocText.current.text("screen/change_appearance/button_change_caption"),LocText.current.text("screen/change_appearance/costs"),"",onClickChange);
         _loc2_.premium = false;
         _btnChangeAppearance = _loc2_;
      }
      
      override public function refreshPanelLocalization() : void
      {
         _btnCancel.tooltip = LocText.current.text("screen/change_appearance/withdraw_tooltip");
         if(_checkboxShowClothes)
         {
            (content.getChildByName("txtShowClothes") as ILabel).text = LocText.current.text("screen/change_appearance/show_clothes");
         }
      }
      
      public function get avatar() : UiAvatar
      {
         return _avatar;
      }
      
      override public function dispose() : void
      {
         _btnChangeAppearance.dispose();
         _btnCancel.dispose();
         _avatar.dispose();
         _configurator.dispose();
         _background.dispose();
         _btnChangeAppearance = null;
         _btnCancel = null;
         _avatar = null;
         _configurator = null;
         _background = null;
         super.dispose();
      }
      
      override public function hide() : void
      {
         if(_avatar)
         {
            _avatar.stopAnimation();
         }
         if(_background)
         {
            _background.hide();
         }
         if(_btnCancel)
         {
            ViewManager.instance.baseUserPanel.fadeInMainNavigationButtons();
            ViewManager.instance.baseUserPanel.showUserBars(true,false);
            ViewManager.instance.baseUserPanel.showTopIcons(true);
         }
         super.hide();
      }
      
      override public function show(param1:* = null) : void
      {
         if(_checkboxShowClothes)
         {
            _checkboxShowClothes.checked = false;
         }
         super.show(param1);
         _configurator.currentSettings = User.current.character.getCurrentSettings();
         ViewManager.instance.setBackground(22);
         ViewManager.instance.fadeInPanel(_vo);
         ViewManager.instance.baseUserPanel.fadeOutMainNavigationButtons();
         ViewManager.instance.baseUserPanel.showUserBars(false,false);
         ViewManager.instance.baseUserPanel.showTopIcons(false);
      }
      
      protected function onAvatarUpdate(param1:AppearanceSettings) : void
      {
         var _loc2_:AppearanceSettings = User.current.character.getCurrentSettings();
         if(_checkboxShowClothes)
         {
            if(_checkboxShowClothes.checked)
            {
               if(_loc2_.head)
               {
                  param1.head = _loc2_.head;
               }
               if(_loc2_.chest)
               {
                  param1.chest = _loc2_.chest;
               }
               if(_loc2_.belt)
               {
                  param1.belt = _loc2_.belt;
               }
               if(_loc2_.legs)
               {
                  param1.legs = _loc2_.legs;
               }
               if(_loc2_.boots)
               {
                  param1.boots = _loc2_.boots;
               }
            }
            else
            {
               param1.deleteData("head");
               param1.deleteData("chest");
               param1.deleteData("belt");
               param1.deleteData("legs");
               param1.deleteData("boots");
            }
         }
         param1.show_head_item = _loc2_.show_head_item;
         param1.show_chest_item = _loc2_.show_chest_item;
         param1.show_belt_item = _loc2_.show_belt_item;
         param1.show_legs_item = _loc2_.show_legs_item;
         param1.show_boots_item = _loc2_.show_boots_item;
         _avatar.update(param1,true);
         _btnChangeAppearance.buttonEnabled = !areSettingsEqual(_loc2_,param1);
      }
      
      protected function areSettingsEqual(param1:AppearanceSettings, param2:AppearanceSettings) : Boolean
      {
         if(param1.gender != param2.gender)
         {
            return false;
         }
         var _loc3_:CCharacterAppearance = CCharacterAppearance.fromId(param1.gender);
         var _loc6_:int = 0;
         var _loc5_:* = _loc3_.constantKeys;
         for each(var _loc4_ in _loc3_.constantKeys)
         {
            if(!(_loc4_ == "hair_back" || _loc4_ == "hair_middle" || _loc4_.indexOf("change_cost") > 0 || _loc4_.indexOf("required_level") > 0 || _loc4_.indexOf("_style") > 0))
            {
               if(param1.getAppearance(_loc4_) != param2.getAppearance(_loc4_))
               {
                  return false;
               }
            }
         }
         return true;
      }
      
      protected function onClickChange(param1:InteractionEvent) : void
      {
         Environment.application.sendActionRequest("setCharacterAppearance",_configurator.getRelevantSettings(User.current.character.getCurrentSettings()),handleRequests);
      }
      
      protected function onClickCancel(param1:InteractionEvent) : void
      {
         ViewManager.instance.showPanel("character");
      }
      
      override public function refresh() : void
      {
         _background.setBackground(OpticalChanges.instance.allActiveOptions);
         super.refresh();
      }
      
      protected function handleRequests(param1:ActionRequestResponse) : void
      {
         var _loc2_:* = param1.action;
         if("setCharacterAppearance" !== _loc2_)
         {
            throw new Error("Unsupported request action \'" + param1.action + "\'!");
         }
         if(param1.error == "")
         {
            Environment.application.updateData(param1.data);
            _configurator.currentSettings = User.current.character.getCurrentSettings();
            ViewManager.instance.showPanel("character");
         }
         else if(param1.error == "errRemoveGameCurrencyNotEnough")
         {
            ViewManager.instance.showNotEnoughGameCurrencyDialog(_configurator.costCoins);
         }
         else if(param1.error == "errRemovePremiumCurrencyNotEnough")
         {
            ViewManager.instance.showNotEnoughPremiumDialog(_configurator.costPremium);
         }
         else
         {
            Environment.reportError(param1.error,param1.request);
         }
      }
   }
}
