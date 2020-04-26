package com.playata.application.ui.panels
{
   import com.playata.application.AppEnvironment;
   import com.playata.application.data.GameUtil;
   import com.playata.application.data.character.AppearanceSettings;
   import com.playata.application.data.user.User;
   import com.playata.application.platform.ServerInfo;
   import com.playata.application.ui.elements.avatar.UiAppearanceConfiguratorPhotographer;
   import com.playata.application.ui.elements.avatar.UiAvatarImage;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.application.ui.elements.generic.button.UiPremiumAndGameCurrencyButton;
   import com.playata.framework.core.logging.Logger;
   import com.playata.framework.display.AnchorPoint;
   import com.playata.framework.display.IDisplayObject;
   import com.playata.framework.display.IDisplayObjectContainer;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.elements.buttons.SymbolButtonPremiumAndGameCurrencyGeneric;
   import visuals.ui.panels.SymbolPanelCharacterAppearancePhotographerGeneric;
   
   public class PanelCharacterAppearancePhotographer extends PanelCharacterAppearanceBase
   {
       
      
      private var _avatarImage:UiAvatarImage;
      
      private var _itemList:Vector.<String>;
      
      private var _btnFacebookShare:UiButton;
      
      public function PanelCharacterAppearancePhotographer(param1:SymbolPanelCharacterAppearancePhotographerGeneric)
      {
         super(param1,true);
         _configurator = new UiAppearanceConfiguratorPhotographer(param1.content.configurator,onAvatarUpdate);
         _avatarImage = new UiAvatarImage(param1.content.imageAvatarPlaceholder,false);
         param1.content.txtInfo.text = LocText.current.text("screen/character_appearance_photographer/info");
         _btnFacebookShare = new UiButton(param1.content.btnShareFacebook,LocText.current.text("screen/character_appearance_photographer/share_facebook"),onClickShare);
         param1.content.btnShareFacebook.visible = AppEnvironment.appPlatform.isFacebook;
         _anchorContainer.add(param1.content,AnchorPoint.RIGHT_FIXED,0.5);
         _anchorContainer.add(param1.content,AnchorPoint.BOTTOM_FIXED,0.5);
      }
      
      override protected function get content() : IDisplayObjectContainer
      {
         return (_vo as SymbolPanelCharacterAppearancePhotographerGeneric).content;
      }
      
      override public function dispose() : void
      {
         super.dispose();
         _btnFacebookShare.dispose();
         _btnFacebookShare = null;
      }
      
      protected function onClickShare(param1:InteractionEvent) : void
      {
         var _loc2_:AppearanceSettings = _configurator.currentSettings;
         var _loc3_:AppearanceSettings = User.current.character.getCurrentSettings(9);
         updateItemList(_loc3_.gender,_loc2_.photo_rect_type);
         cleanSettings(_loc3_);
         var _loc7_:int = 0;
         var _loc6_:* = _itemList;
         for each(var _loc4_ in _itemList)
         {
            if(_loc3_.hasData(_loc4_,true))
            {
               _loc2_.setData(_loc4_,_loc3_.getData(_loc4_));
            }
         }
         changeButton.premiumAmount = _configurator.costPremium;
         changeButton.gameCurrencyAmount = _configurator.costCoins;
         var _loc5_:String = GameUtil.compressAvatarImageSettings(_loc2_,_itemList);
         if(AppEnvironment.appPlatform.isFacebook)
         {
            platform.publishFeed(ServerInfo.avatarImageURLByHash(_loc5_),LocText.current.text("screen/character_appearance_photographer/share_avatar_title"),LocText.current.text("screen/character_appearance_photographer/share_avatar_description",User.current.character.nameWithTitle));
         }
      }
      
      override protected function createChangeButton(param1:IDisplayObject) : void
      {
         var _loc3_:SymbolButtonPremiumAndGameCurrencyGeneric = param1 as SymbolButtonPremiumAndGameCurrencyGeneric;
         var _loc2_:UiPremiumAndGameCurrencyButton = new UiPremiumAndGameCurrencyButton(_loc3_,LocText.current.text("screen/change_appearance/button_change_caption"),0,0,LocText.current.text("screen/change_appearance/costs"),onClickChange);
         _btnChangeAppearance = _loc2_;
      }
      
      override public function refreshPanelLocalization() : void
      {
         super.refreshPanelLocalization();
         var _loc1_:SymbolPanelCharacterAppearancePhotographerGeneric = _vo as SymbolPanelCharacterAppearancePhotographerGeneric;
         _loc1_.content.txtInfo.text = LocText.current.text("screen/character_appearance_photographer/info");
         changeButton.caption = LocText.current.text("screen/change_appearance/button_change_caption");
      }
      
      override protected function onAvatarUpdate(param1:AppearanceSettings) : void
      {
         var _loc3_:AppearanceSettings = User.current.character.getCurrentSettings(9);
         updateItemList(_loc3_.gender,param1.photo_rect_type);
         cleanSettings(_loc3_);
         var _loc7_:int = 0;
         var _loc6_:* = _itemList;
         for each(var _loc4_ in _itemList)
         {
            if(_loc3_.hasData(_loc4_,true))
            {
               param1.setData(_loc4_,_loc3_.getData(_loc4_));
            }
         }
         param1.show_head_item = _loc3_.show_head_item;
         param1.show_chest_item = _loc3_.show_chest_item;
         param1.show_belt_item = _loc3_.show_belt_item;
         param1.show_legs_item = _loc3_.show_legs_item;
         param1.show_boots_item = _loc3_.show_boots_item;
         changeButton.premiumAmount = _configurator.costPremium;
         changeButton.gameCurrencyAmount = _configurator.costCoins;
         var _loc5_:String = GameUtil.compressAvatarImageSettings(param1,_itemList);
         Logger.info(_loc5_ + User.current.character.avatarImage);
         var _loc2_:* = _loc5_ == User.current.character.avatarImage;
         changeButton.buttonEnabled = !_loc2_;
         _avatarImage.showWithSettings(_loc5_);
      }
      
      override public function show(param1:* = null) : void
      {
         var _loc2_:AppearanceSettings = User.current.character.getCurrentSettings(9);
         (_vo as SymbolPanelCharacterAppearancePhotographerGeneric).content.avatar.x = _loc2_.gender == "m"?-40:-80;
         _avatar.update(_loc2_,true);
         _avatar.startAnimation();
         super.show(param1);
         onAvatarUpdate(_configurator.currentSettings);
      }
      
      private function updateItemList(param1:String, param2:int) : void
      {
         var _loc3_:Object = {
            "f":{},
            "m":{}
         };
         _loc3_["f"][1] = new <String>["head","chest","belt","legs","boots"];
         _loc3_["f"][2] = new <String>["head","chest","belt","legs","boots"];
         _loc3_["f"][3] = new <String>["head","chest","belt","legs","boots"];
         _loc3_["f"][4] = new <String>["head","chest","belt","legs","boots"];
         _loc3_["m"][1] = new <String>["head","chest","belt","legs","boots"];
         _loc3_["m"][2] = new <String>["head","chest","belt","legs","boots"];
         _loc3_["m"][3] = new <String>["head","chest","belt","legs","boots"];
         _loc3_["m"][4] = new <String>["head","chest","belt","legs","boots"];
         _itemList = _loc3_[param1][param2];
      }
      
      private function cleanSettings(param1:AppearanceSettings) : void
      {
         var _loc2_:Vector.<String> = new <String>["head","chest","belt","legs","boots","missiles"];
         var _loc5_:int = 0;
         var _loc4_:* = _loc2_;
         for each(var _loc3_ in _loc2_)
         {
            if(_itemList.indexOf(_loc3_) == -1)
            {
               param1.deleteData(_loc3_.toString());
            }
         }
      }
      
      private function get changeButton() : UiPremiumAndGameCurrencyButton
      {
         return _btnChangeAppearance as UiPremiumAndGameCurrencyButton;
      }
   }
}
