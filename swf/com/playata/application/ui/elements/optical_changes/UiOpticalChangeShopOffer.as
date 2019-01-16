package com.playata.application.ui.elements.optical_changes
{
   import com.playata.application.data.constants.CConstant;
   import com.playata.application.data.optical_changes.OpticalChanges;
   import com.playata.application.ui.ViewManager;
   import com.playata.application.ui.dialogs.DialogOpenOpticalChangeChests;
   import com.playata.application.ui.dialogs.DialogOpticalChanges;
   import com.playata.application.ui.elements.generic.button.UiPremiumButton;
   import com.playata.application.ui.elements.generic.dialog.UiInfoDialog;
   import com.playata.application.ui.elements.generic.textfield.UiTextTooltip;
   import com.playata.framework.application.Environment;
   import com.playata.framework.application.request.ActionRequestResponse;
   import com.playata.framework.core.TypedObject;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.elements.optical_changes.SymbolOpticalChangeShopOfferGeneric;
   
   public class UiOpticalChangeShopOffer
   {
       
      
      private var _content:SymbolOpticalChangeShopOfferGeneric;
      
      private var _tooltip:UiTextTooltip;
      
      private var _btnBuyOfferPremium:UiPremiumButton;
      
      private var _btnBuyOfferResource:UiPremiumButton;
      
      private var _type:int;
      
      private var _opticalChangeDialog:DialogOpticalChanges;
      
      public function UiOpticalChangeShopOffer(param1:SymbolOpticalChangeShopOfferGeneric, param2:int, param3:DialogOpticalChanges)
      {
         super();
         _content = param1;
         _type = param2;
         _opticalChangeDialog = param3;
         _content.icon1.visible = param2 == 1;
         _content.icon2.visible = param2 == 2;
         _content.icon1.applySettings(new TypedObject({"touchable":false}));
         _content.icon2.applySettings(new TypedObject({"touchable":false}));
         _btnBuyOfferPremium = new UiPremiumButton(_content.btnBuyPremium,CConstant.optical_change_chest_price_big,"",LocText.current.text("dialog/optical_change/btn_buy_shop_offer",CConstant.optical_change_chest_amount_big),"","",onClickBuyOffer);
         _btnBuyOfferPremium.premium = true;
         _btnBuyOfferResource = new UiPremiumButton(_content.btnBuyResource,CConstant.optical_change_chest_price_small,"",LocText.current.text("dialog/optical_change/btn_buy_shop_offer",CConstant.optical_change_chest_amount_small),"","",onClickBuyOffer);
         _btnBuyOfferResource.premium = true;
         _tooltip = new UiTextTooltip(_content.bg,"");
         refresh();
      }
      
      public function refresh() : void
      {
         if(_opticalChangeDialog == null)
         {
            return;
         }
         if(_type == 1)
         {
            _btnBuyOfferResource.visible = true;
            _btnBuyOfferPremium.visible = false;
            _tooltip.text = LocText.current.text("dialog/optical_change/shop_offer_small",CConstant.optical_change_chest_amount_small);
         }
         else if(_type == 2)
         {
            _btnBuyOfferResource.visible = false;
            _btnBuyOfferPremium.visible = true;
            _tooltip.text = LocText.current.text("dialog/optical_change/shop_offer_big",CConstant.optical_change_chest_amount_big);
         }
      }
      
      public function dispose() : void
      {
         _tooltip.dispose();
         _tooltip = null;
         _btnBuyOfferPremium.dispose();
         _btnBuyOfferPremium = null;
         _opticalChangeDialog = null;
      }
      
      private function onClickBuyOffer(param1:InteractionEvent) : void
      {
         Environment.application.sendActionRequest("buyOpticalChangeOffer",{"type":_type},handleRequests);
      }
      
      private function handleRequests(param1:ActionRequestResponse) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:* = param1.action;
         switch(_loc4_)
         {
            case "buyOpticalChangeOffer":
               if(param1.error == "")
               {
                  Environment.application.updateData(param1.data);
                  if(_type == 1)
                  {
                     _opticalChangeDialog.refreshOpticalChangeResource();
                  }
                  Environment.panelManager.showDialog(new DialogOpenOpticalChangeChests(OpticalChanges.instance.allAvailableChests,_opticalChangeDialog));
               }
               else if(param1.error == "errRemovePremiumCurrencyNotEnough")
               {
                  ViewManager.instance.showNotEnoughPremiumDialog(_btnBuyOfferPremium.premiumAmount);
               }
               else if(param1.error == "errRemoveOpticalChangeResourceNotEnough")
               {
                  _loc2_ = OpticalChanges.instance.resource;
                  _loc3_ = _btnBuyOfferResource.premiumAmount;
                  Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/unlock_optical_change/err_not_enough_resource_title"),LocText.current.text("dialog/unlock_optical_change/err_not_enough_resource_text",_loc3_ - _loc2_),LocText.current.text("general/button_ok")));
               }
               else
               {
                  Environment.reportError(param1.error,param1.request);
               }
               break;
            case "syncOpticalChanges":
               if(param1.error == "")
               {
                  Environment.application.updateData(param1.data);
                  refresh();
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
