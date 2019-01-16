package com.playata.application.ui.panels
{
   import com.playata.application.data.character.AppearanceSettings;
   import com.playata.application.data.constants.CConstant;
   import com.playata.application.data.user.User;
   import com.playata.application.ui.dialogs.DialogCharacterAppearanceUnsavedChanges;
   import com.playata.application.ui.elements.avatar.UiAppearanceConfiguratorBarber;
   import com.playata.application.ui.elements.avatar.UiAppearanceConfiguratorHideCloths;
   import com.playata.application.ui.elements.avatar.UiAppearanceConfiguratorSurgeon;
   import com.playata.application.ui.elements.avatar.UiAppearanceConfiguratorTattoo;
   import com.playata.application.ui.elements.avatar.UiAppearanceConfiguratorUnderwear;
   import com.playata.application.ui.elements.avatar.UiAppearanceSheet;
   import com.playata.application.ui.elements.generic.button.UiPremiumButton;
   import com.playata.framework.application.Environment;
   import com.playata.framework.application.request.ActionRequestResponse;
   import com.playata.framework.display.AnchorPoint;
   import com.playata.framework.display.IDisplayObjectContainer;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.panels.SymbolPanelCharacterAppearanceGeneric;
   
   public class PanelCharacterAppearance extends PanelCharacterAppearanceBase
   {
       
      
      private var _configuratorSurgeon:UiAppearanceConfiguratorSurgeon = null;
      
      private var _configuratorBarber:UiAppearanceConfiguratorBarber = null;
      
      private var _configuratorTattoo:UiAppearanceConfiguratorTattoo = null;
      
      private var _configuratorUnderwear:UiAppearanceConfiguratorUnderwear = null;
      
      private var _configuratorHideCloths:UiAppearanceConfiguratorHideCloths = null;
      
      private var _btnTabSurgeon:UiAppearanceSheet = null;
      
      private var _btnTabBarber:UiAppearanceSheet = null;
      
      private var _btnTabTattoo:UiAppearanceSheet = null;
      
      private var _btnTabUnderwear:UiAppearanceSheet = null;
      
      private var _btnTabHideCloths:UiAppearanceSheet = null;
      
      private var _showCloths:Boolean = false;
      
      private var _updatingAvatar:Boolean = false;
      
      public function PanelCharacterAppearance(param1:SymbolPanelCharacterAppearanceGeneric)
      {
         super(param1);
         _configuratorSurgeon = new UiAppearanceConfiguratorSurgeon(param1.content.configuratorSurgeon,onAvatarUpdate);
         _configuratorBarber = new UiAppearanceConfiguratorBarber(param1.content.configuratorBarber,onAvatarUpdate);
         _configuratorTattoo = new UiAppearanceConfiguratorTattoo(param1.content.configuratorTattoo,onAvatarUpdate);
         _configuratorUnderwear = new UiAppearanceConfiguratorUnderwear(param1.content.configuratorUnderwear,onAvatarUpdate);
         _configuratorHideCloths = new UiAppearanceConfiguratorHideCloths(param1.content.configuratorHideCloths);
         _btnTabSurgeon = new UiAppearanceSheet(param1.content.btnTabSurgeon,1,LocText.current.text("screen/character_overview/button_change_appearance_surgeon_tooltip"),onClickChangeAppearanceSurgeon);
         _btnTabBarber = new UiAppearanceSheet(param1.content.btnTabBarber,2,LocText.current.text("screen/character_overview/button_change_appearance_barber_tooltip"),onClickChangeAppearanceBarber);
         _btnTabTattoo = new UiAppearanceSheet(param1.content.btnTabTattoo,3,LocText.current.text("screen/character_overview/button_change_appearance_tattoo_tooltip"),onClickChangeAppearanceTattoo);
         _btnTabUnderwear = new UiAppearanceSheet(param1.content.btnTabUnderwear,4,LocText.current.text("screen/character_overview/button_change_appearance_underwear_tooltip"),onClickChangeAppearanceUnderwear);
         _btnTabHideCloths = new UiAppearanceSheet(param1.content.btnTabHideCloths,5,LocText.current.text("screen/character_overview/button_change_appearance_hide_cloths_tooltip"),onClickChangeAppearanceHideCloths);
         _configurator = _configuratorSurgeon;
         _anchorContainer.add(param1.content,AnchorPoint.RIGHT_FIXED,0.5);
         _anchorContainer.add(param1.content,AnchorPoint.BOTTOM_FIXED,0.5);
      }
      
      override protected function get content() : IDisplayObjectContainer
      {
         return (_vo as SymbolPanelCharacterAppearanceGeneric).content;
      }
      
      private function onClickChangeAppearanceSurgeon(param1:InteractionEvent) : void
      {
         _configurator = _configuratorSurgeon;
         _configuratorSurgeon.visible = true;
         _configuratorBarber.visible = false;
         _configuratorTattoo.visible = false;
         _configuratorUnderwear.visible = false;
         _configuratorHideCloths.visible = false;
         updateChangeButton();
         _checkboxShowClothes.checked = _showCloths;
         _checkboxShowClothes.content.visible = true;
         (_vo as SymbolPanelCharacterAppearanceGeneric).content.txtShowClothes.visible = true;
         onAvatarUpdate(_configurator.currentSettings);
         _configuratorSurgeon.refreshPanelLocalization();
      }
      
      private function onClickChangeAppearanceBarber(param1:InteractionEvent) : void
      {
         _configurator = _configuratorBarber;
         _configuratorSurgeon.visible = false;
         _configuratorBarber.visible = true;
         _configuratorTattoo.visible = false;
         _configuratorUnderwear.visible = false;
         _configuratorHideCloths.visible = false;
         updateChangeButton();
         _checkboxShowClothes.checked = _showCloths;
         _checkboxShowClothes.content.visible = true;
         (_vo as SymbolPanelCharacterAppearanceGeneric).content.txtShowClothes.visible = true;
         onAvatarUpdate(_configurator.currentSettings);
         _configuratorBarber.refreshPanelLocalization();
      }
      
      private function onClickChangeAppearanceTattoo(param1:InteractionEvent) : void
      {
         _configurator = _configuratorTattoo;
         _configuratorSurgeon.visible = false;
         _configuratorBarber.visible = false;
         _configuratorTattoo.visible = true;
         _configuratorUnderwear.visible = false;
         _configuratorHideCloths.visible = false;
         updateChangeButton();
         _checkboxShowClothes.checked = _showCloths;
         _checkboxShowClothes.content.visible = true;
         (_vo as SymbolPanelCharacterAppearanceGeneric).content.txtShowClothes.visible = true;
         onAvatarUpdate(_configurator.currentSettings);
      }
      
      private function onClickChangeAppearanceUnderwear(param1:InteractionEvent) : void
      {
         _configurator = _configuratorUnderwear;
         _configuratorSurgeon.visible = false;
         _configuratorBarber.visible = false;
         _configuratorTattoo.visible = false;
         _configuratorUnderwear.visible = true;
         _configuratorHideCloths.visible = false;
         updateChangeButton();
         if(_checkboxShowClothes.enabled)
         {
            _showCloths = _checkboxShowClothes.checked;
         }
         _checkboxShowClothes.content.visible = false;
         (_vo as SymbolPanelCharacterAppearanceGeneric).content.txtShowClothes.visible = false;
         _checkboxShowClothes.checked = false;
         onAvatarUpdate(_configurator.currentSettings);
      }
      
      private function onClickChangeAppearanceHideCloths(param1:InteractionEvent) : void
      {
         _configuratorSurgeon.visible = false;
         _configuratorBarber.visible = false;
         _configuratorTattoo.visible = false;
         _configuratorUnderwear.visible = false;
         _configuratorHideCloths.visible = true;
         updateChangeButton();
         if(_checkboxShowClothes.enabled)
         {
            _showCloths = _checkboxShowClothes.checked;
         }
         _checkboxShowClothes.content.visible = false;
         (_vo as SymbolPanelCharacterAppearanceGeneric).content.txtShowClothes.visible = false;
         _checkboxShowClothes.checked = true;
         onAvatarUpdate(_configurator.currentSettings);
      }
      
      override public function refresh() : void
      {
         super.refresh();
         updateSettings();
         _configuratorHideCloths.refresh();
      }
      
      public function updateSettings() : void
      {
         var _loc1_:AppearanceSettings = User.current.character.getCurrentSettings();
         var _loc4_:AppearanceSettings = _configuratorBarber.getRelevantSettings(_loc1_);
         var _loc3_:AppearanceSettings = _configuratorSurgeon.getRelevantSettings(_loc1_);
         var _loc2_:AppearanceSettings = _configuratorTattoo.getRelevantSettings(_loc1_);
         var _loc5_:AppearanceSettings = _configuratorUnderwear.getRelevantSettings(_loc1_);
         var _loc8_:int = 0;
         var _loc7_:* = _loc1_.keys;
         for each(var _loc6_ in _loc1_.keys)
         {
            if(_loc4_.hasData(_loc6_) && _loc4_.getAppearance(_loc6_) != _loc1_.getAppearance(_loc6_))
            {
               _loc1_.setAppearance(_loc6_,_loc4_.getAppearance(_loc6_));
            }
            else if(_loc3_.hasData(_loc6_) && _loc3_.getAppearance(_loc6_) != _loc1_.getAppearance(_loc6_))
            {
               _loc1_.setAppearance(_loc6_,_loc3_.getAppearance(_loc6_));
            }
            else if(_loc2_.hasData(_loc6_) && _loc2_.getAppearance(_loc6_) != _loc1_.getAppearance(_loc6_))
            {
               _loc1_.setAppearance(_loc6_,_loc2_.getAppearance(_loc6_));
            }
            else if(_loc5_.hasData(_loc6_) && _loc5_.getAppearance(_loc6_) != _loc1_.getAppearance(_loc6_))
            {
               _loc1_.setAppearance(_loc6_,_loc5_.getAppearance(_loc6_));
            }
         }
         _configurator.currentSettings = _loc1_;
      }
      
      override public function dispose() : void
      {
         _btnTabSurgeon.dispose();
         _btnTabBarber.dispose();
         _btnTabTattoo.dispose();
         _btnTabUnderwear.dispose();
         _btnTabHideCloths.dispose();
         _configuratorBarber.dispose();
         _configuratorTattoo.dispose();
         _configuratorUnderwear.dispose();
         _configuratorHideCloths.dispose();
         _btnTabSurgeon = null;
         _btnTabBarber = null;
         _btnTabTattoo = null;
         _btnTabUnderwear = null;
         _btnTabHideCloths = null;
         _configuratorBarber = null;
         _configuratorTattoo = null;
         _configuratorUnderwear = null;
         _configuratorHideCloths = null;
         _configurator = _configuratorSurgeon;
         super.dispose();
      }
      
      override public function refreshPanelLocalization() : void
      {
         super.refreshPanelLocalization();
         changeButton.nonPremiumCaption = LocText.current.text("screen/change_appearance/button_change_caption");
         changeButton.premiumCaption = LocText.current.text("screen/change_appearance/button_change_caption");
      }
      
      override public function show(param1:* = null) : void
      {
         _configuratorSurgeon.currentSettings = User.current.character.getCurrentSettings();
         super.show(param1);
         _avatar.startAnimation();
         _configuratorHideCloths.refresh();
         _showCloths = _checkboxShowClothes.checked;
         _btnTabHideCloths.visible = User.current.character.level >= CConstant.character_show_head_item_min_level;
         onClickChangeAppearanceSurgeon(null);
      }
      
      override protected function onClickCancel(param1:InteractionEvent) : void
      {
         if(_configuratorSurgeon.costCoins > 0 || _configuratorSurgeon.costPremium > 0 || _configuratorBarber.costCoins > 0 || _configuratorBarber.costPremium > 0 || _configuratorTattoo.costCoins > 0 || _configuratorTattoo.costPremium > 0 || _configuratorUnderwear.costCoins > 0 || _configuratorUnderwear.costPremium > 0)
         {
            Environment.panelManager.showDialog(new DialogCharacterAppearanceUnsavedChanges(_configuratorSurgeon,_configuratorBarber,_configuratorTattoo,_configuratorUnderwear,onClose));
         }
         else
         {
            super.onClickCancel(param1);
         }
      }
      
      private function onClose() : void
      {
         super.onClickCancel(null);
      }
      
      override protected function onAvatarUpdate(param1:AppearanceSettings) : void
      {
         if(_updatingAvatar)
         {
            return;
         }
         _updatingAvatar = true;
         super.onAvatarUpdate(param1);
         _configuratorSurgeon.currentSettings = param1;
         _configuratorBarber.currentSettings = param1;
         _configuratorTattoo.currentSettings = param1;
         _configuratorUnderwear.currentSettings = param1;
         updateChangeButton();
         _updatingAvatar = false;
      }
      
      private function updateChangeButton() : void
      {
         _btnTabSurgeon.tabbed = _configuratorSurgeon.visible;
         _btnTabBarber.tabbed = _configuratorBarber.visible;
         _btnTabTattoo.tabbed = _configuratorTattoo.visible;
         _btnTabUnderwear.tabbed = _configuratorUnderwear.visible;
         _btnTabHideCloths.tabbed = _configuratorHideCloths.visible;
         _btnTabSurgeon.infoVisible = _configuratorSurgeon.costPremium > 0 || _configuratorSurgeon.costCoins > 0;
         _btnTabBarber.infoVisible = _configuratorBarber.costPremium > 0 || _configuratorBarber.costCoins > 0;
         _btnTabTattoo.infoVisible = _configuratorTattoo.costPremium > 0 || _configuratorTattoo.costCoins > 0;
         _btnTabUnderwear.infoVisible = _configuratorUnderwear.costPremium > 0 || _configuratorUnderwear.costCoins > 0;
         if(_configurator.costPremium > 0)
         {
            changeButton.premium = true;
            changeButton.premiumAmount = _configurator.costPremium;
            changeButton.buttonEnabled = true;
         }
         else if(_configurator.costCoins > 0)
         {
            changeButton.premium = false;
            changeButton.premiumAmount = _configurator.costCoins;
            changeButton.buttonEnabled = true;
         }
         else
         {
            changeButton.premium = false;
            changeButton.buttonEnabled = false;
         }
      }
      
      private function get changeButton() : UiPremiumButton
      {
         return _btnChangeAppearance as UiPremiumButton;
      }
      
      override protected function handleRequests(param1:ActionRequestResponse) : void
      {
         var _loc2_:* = param1.action;
         if("setCharacterAppearance" === _loc2_)
         {
            if(param1.error == "")
            {
               Environment.application.updateData(param1.data);
               updateSettings();
               return;
            }
         }
         super.handleRequests(param1);
      }
   }
}
