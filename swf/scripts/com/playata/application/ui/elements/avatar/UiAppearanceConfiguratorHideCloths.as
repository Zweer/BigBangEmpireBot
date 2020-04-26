package com.playata.application.ui.elements.avatar
{
   import com.playata.application.AppConfig;
   import com.playata.application.AppEnvironment;
   import com.playata.application.data.character.Character;
   import com.playata.application.data.constants.CConstant;
   import com.playata.application.data.user.User;
   import com.playata.application.ui.ViewManager;
   import com.playata.application.ui.elements.generic.button.UiPremiumButton;
   import com.playata.application.ui.elements.generic.checkbox.UiCheckBox;
   import com.playata.application.ui.elements.generic.dialog.UiTwoChoiceDialog;
   import com.playata.framework.application.Environment;
   import com.playata.framework.application.request.ActionRequestResponse;
   import com.playata.framework.data.constants.Constants;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.elements.avatar.SymbolCharacterConfiguratorHideClothsGeneric;
   
   public class UiAppearanceConfiguratorHideCloths
   {
       
      
      private var _content:SymbolCharacterConfiguratorHideClothsGeneric;
      
      private var _btnUnlockChest:UiPremiumButton = null;
      
      private var _btnUnlockBelt:UiPremiumButton = null;
      
      private var _btnUnlockLegs:UiPremiumButton = null;
      
      private var _btnUnlockBoots:UiPremiumButton = null;
      
      private var _checkboxShowHead:UiCheckBox = null;
      
      private var _checkboxShowChest:UiCheckBox = null;
      
      private var _checkboxShowBelt:UiCheckBox = null;
      
      private var _checkboxShowLegs:UiCheckBox = null;
      
      private var _checkboxShowBoots:UiCheckBox = null;
      
      public function UiAppearanceConfiguratorHideCloths(param1:SymbolCharacterConfiguratorHideClothsGeneric)
      {
         super();
         _content = param1;
         var _loc2_:Number = _content.btnUnlockHideTop.width;
         _btnUnlockChest = new UiPremiumButton(_content.btnUnlockHideTop,CConstant.unlock_hide_chest_premium_amount,"",LocText.current.text("screen/create_character/button_unlock"),"",LocText.current.text("screen/create_character/unlock_hide_top_tooltip"),onClickUnlockHideChest);
         _btnUnlockChest.premium = true;
         _content.btnUnlockHideTop.x = _content.btnUnlockHideTop.x + int((_content.btnUnlockHideTop.width - _loc2_) / 2);
         _btnUnlockBelt = new UiPremiumButton(_content.btnUnlockHideBelt,CConstant.unlock_hide_belt_premium_amount,"",LocText.current.text("screen/create_character/button_unlock"),"",LocText.current.text("screen/create_character/unlock_hide_belt_tooltip"),onClickUnlockHideBelt);
         _btnUnlockBelt.premium = true;
         _content.btnUnlockHideBelt.x = _content.btnUnlockHideBelt.x + int((_content.btnUnlockHideBelt.width - _loc2_) / 2);
         _btnUnlockLegs = new UiPremiumButton(_content.btnUnlockHideLegs,CConstant.unlock_hide_legs_premium_amount,"",LocText.current.text("screen/create_character/button_unlock"),"",LocText.current.text("screen/create_character/unlock_hide_legs_tooltip"),onClickUnlockHideLegs);
         _btnUnlockLegs.premium = true;
         _content.btnUnlockHideLegs.x = _content.btnUnlockHideLegs.x + int((_content.btnUnlockHideLegs.width - _loc2_) / 2);
         _btnUnlockBoots = new UiPremiumButton(_content.btnUnlockHideBoots,CConstant.unlock_hide_boots_premium_amount,"",LocText.current.text("screen/create_character/button_unlock"),"",LocText.current.text("screen/create_character/unlock_hide_boots_tooltip"),onClickUnlockHideBoots);
         _btnUnlockBoots.premium = true;
         _content.btnUnlockHideBoots.x = _content.btnUnlockHideBoots.x + int((_content.btnUnlockHideBoots.width - _loc2_) / 2);
         _checkboxShowHead = new UiCheckBox(_content.checkShowHead,false,"",onCheckedShowMask,null,_content.txtShowHead);
         _content.txtShowHead.text = LocText.current.text("screen/character/show_head_item");
         _content.txtShowHead.autoFontSize = true;
         _checkboxShowChest = new UiCheckBox(_content.checkShowTop,false,"",onCheckedShowChest,null,_content.txtShowTop);
         _content.txtShowTop.text = LocText.current.text("screen/character/show_chest_item");
         _content.txtShowTop.autoFontSize = true;
         _checkboxShowBelt = new UiCheckBox(_content.checkShowBelt,false,"",onCheckedShowBelt,null,_content.txtShowBelt);
         _content.txtShowBelt.text = LocText.current.text("screen/character/show_belt_item");
         _content.txtShowBelt.autoFontSize = true;
         _checkboxShowLegs = new UiCheckBox(_content.checkShowLegs,false,"",onCheckedShowLegs,null,_content.txtShowLegs);
         _content.txtShowLegs.text = LocText.current.text("screen/character/show_legs_item");
         _content.txtShowLegs.autoFontSize = true;
         _checkboxShowBoots = new UiCheckBox(_content.checkShowBoots,false,"",onCheckedShowBoots,null,_content.txtShowBoots);
         _content.txtShowBoots.text = LocText.current.text("screen/character/show_boots_item");
         _content.txtShowBoots.autoFontSize = true;
      }
      
      public function set visible(param1:Boolean) : void
      {
         _content.visible = param1;
      }
      
      public function get visible() : Boolean
      {
         return _content.visible;
      }
      
      public function dispose() : void
      {
         _btnUnlockChest.dispose();
         _btnUnlockBelt.dispose();
         _btnUnlockLegs.dispose();
         _btnUnlockBoots.dispose();
         _checkboxShowHead.dispose();
         _checkboxShowChest.dispose();
         _checkboxShowBelt.dispose();
         _checkboxShowLegs.dispose();
         _checkboxShowBoots.dispose();
         _btnUnlockChest = null;
         _btnUnlockBelt = null;
         _btnUnlockLegs = null;
         _btnUnlockBoots = null;
         _checkboxShowHead = null;
         _checkboxShowChest = null;
         _checkboxShowBelt = null;
         _checkboxShowLegs = null;
         _checkboxShowBoots = null;
         _content = null;
      }
      
      public function refresh() : void
      {
         var _loc1_:Character = User.current.character;
         _btnUnlockChest.visible = !_loc1_.isChestItemShowUnlocked;
         _btnUnlockBelt.visible = !_loc1_.isBeltItemShowUnlocked;
         _btnUnlockLegs.visible = !_loc1_.isLegsItemShowUnlocked;
         _btnUnlockBoots.visible = !_loc1_.isBootsItemShowUnlocked;
         _checkboxShowChest.content.visible = !_btnUnlockChest.visible;
         _checkboxShowBelt.content.visible = !_btnUnlockBelt.visible;
         _checkboxShowLegs.content.visible = !_btnUnlockLegs.visible;
         _checkboxShowBoots.content.visible = !_btnUnlockBoots.visible;
         _content.txtShowTop.visible = !_btnUnlockChest.visible;
         _content.txtShowBelt.visible = !_btnUnlockBelt.visible;
         _content.txtShowLegs.visible = !_btnUnlockLegs.visible;
         _content.txtShowBoots.visible = !_btnUnlockBoots.visible;
         _checkboxShowHead.checked = _loc1_.isHeadItemShown;
         _checkboxShowChest.checked = _loc1_.isChestItemShown;
         _checkboxShowBelt.checked = _loc1_.isBeltItemShown;
         _checkboxShowLegs.checked = _loc1_.isLegsItemShown;
         _checkboxShowBoots.checked = _loc1_.isBootsItemShown;
      }
      
      private function onClickUnlockHideChest(param1:InteractionEvent) : void
      {
         if(!AppEnvironment.appPlatform.isHideBraAllowed)
         {
            Environment.panelManager.showDialog(new UiTwoChoiceDialog(LocText.current.text("dialog/buy_hide_chest/title"),LocText.current.text("dialog/buy_hide_chest/text"),LocText.current.text("screen/create_character/button_unlock"),LocText.current.text("general/button_cancel"),unlockHideChest));
         }
         else
         {
            unlockHideChest();
         }
      }
      
      private function unlockHideChest() : void
      {
         Environment.application.sendActionRequest("unlockHideItem",{"item":"chest"},handleRequests);
      }
      
      private function onClickUnlockHideBelt(param1:InteractionEvent) : void
      {
         Environment.application.sendActionRequest("unlockHideItem",{"item":"belt"},handleRequests);
      }
      
      private function onClickUnlockHideLegs(param1:InteractionEvent) : void
      {
         if(!AppEnvironment.appPlatform.isHidePantiesAllowed)
         {
            if(!AppConfig.hidePantiesAllowed)
            {
               Environment.panelManager.showDialog(new UiTwoChoiceDialog(LocText.current.text("dialog/buy_hide_legs/title"),LocText.current.text("dialog/buy_hide_legs/not_usk18_text"),LocText.current.text("screen/create_character/button_unlock"),LocText.current.text("general/button_cancel"),unlockkHideLegs));
            }
            else
            {
               Environment.panelManager.showDialog(new UiTwoChoiceDialog(LocText.current.text("dialog/buy_hide_legs/title"),LocText.current.text("dialog/buy_hide_legs/text"),LocText.current.text("screen/create_character/button_unlock"),LocText.current.text("general/button_cancel"),unlockkHideLegs));
            }
         }
         else
         {
            unlockkHideLegs();
         }
      }
      
      private function unlockkHideLegs() : void
      {
         Environment.application.sendActionRequest("unlockHideItem",{"item":"legs"},handleRequests);
      }
      
      private function onClickUnlockHideBoots(param1:InteractionEvent) : void
      {
         Environment.application.sendActionRequest("unlockHideItem",{"item":"boots"},handleRequests);
      }
      
      private function onCheckedShowMask(param1:Boolean) : void
      {
         Environment.application.sendActionRequest("setCharacterAppearanceFlag",{
            "flag":"show_head_item",
            "value":param1
         },handleRequests);
      }
      
      private function onCheckedShowChest(param1:Boolean) : void
      {
         Environment.application.sendActionRequest("setCharacterAppearanceFlag",{
            "flag":"show_chest_item",
            "value":param1
         },handleRequests);
      }
      
      private function onCheckedShowBelt(param1:Boolean) : void
      {
         Environment.application.sendActionRequest("setCharacterAppearanceFlag",{
            "flag":"show_belt_item",
            "value":param1
         },handleRequests);
      }
      
      private function onCheckedShowLegs(param1:Boolean) : void
      {
         Environment.application.sendActionRequest("setCharacterAppearanceFlag",{
            "flag":"show_legs_item",
            "value":param1
         },handleRequests);
      }
      
      private function onCheckedShowBoots(param1:Boolean) : void
      {
         Environment.application.sendActionRequest("setCharacterAppearanceFlag",{
            "flag":"show_boots_item",
            "value":param1
         },handleRequests);
      }
      
      private function handleRequests(param1:ActionRequestResponse) : void
      {
         var _loc2_:* = param1.action;
         switch(_loc2_)
         {
            case "setCharacterAppearanceFlag":
               if(param1.error == "")
               {
                  Environment.application.updateData(param1.data);
               }
               else
               {
                  Environment.reportError(param1.error,param1.request);
               }
               break;
            case "unlockHideItem":
               if(param1.error == "")
               {
                  Environment.application.updateData(param1.data);
                  refresh();
               }
               else if(param1.error == "errRemovePremiumCurrencyNotEnough")
               {
                  ViewManager.instance.showNotEnoughPremiumDialog(Constants.current.getInt("unlock_hide_" + param1.request.getString("item") + "_premium_amount"));
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
   }
}
