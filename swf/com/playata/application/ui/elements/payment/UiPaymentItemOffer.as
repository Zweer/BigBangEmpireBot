package com.playata.application.ui.elements.payment
{
   import com.playata.application.billing.AppConsumableBillingProductInfo;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.framework.billing.IBillingProduct;
   import com.playata.framework.core.util.StringUtil;
   import com.playata.framework.display.filter.GrayscaleFilter;
   import com.playata.framework.input.InteractionEvent;
   import visuals.ui.elements.shop.SymbolShopItemOptionGeneric;
   
   public class UiPaymentItemOffer extends UiButton
   {
       
      
      private var _offerContent:SymbolShopItemOptionGeneric = null;
      
      private var _product:IBillingProduct = null;
      
      private var _interactionOverCallback:Function = null;
      
      private var _interactionOutCallback:Function = null;
      
      public function UiPaymentItemOffer(param1:SymbolShopItemOptionGeneric, param2:Function, param3:Function, param4:Function)
      {
         super(param1,"",param2);
         _offerContent = param1;
         _interactionOverCallback = param3;
         _interactionOutCallback = param4;
         _offerContent.backgroundSelected.visible = false;
         _offerContent.selected.visible = false;
         _offerContent.backgroundSelected.gotoAndStop(1);
         _offerContent.backgroundUnselected.gotoAndStop(1);
         _offerContent.background.removeAllChildren();
      }
      
      override public function dispose() : void
      {
         _offerContent = null;
         super.dispose();
      }
      
      public function get itemOffer() : AppConsumableBillingProductInfo
      {
         if(!_product)
         {
            return null;
         }
         return _product.info as AppConsumableBillingProductInfo;
      }
      
      public function set available(param1:Boolean) : void
      {
         _offerContent.alpha = !!param1?1:0.7;
         buttonEnabled = param1;
         if(param1)
         {
            _offerContent.removeAllFilters();
         }
         else
         {
            _offerContent.addFilter(new GrayscaleFilter());
         }
      }
      
      public function get available() : Boolean
      {
         return _product != null && buttonEnabled && visible;
      }
      
      public function set highlight(param1:Boolean) : void
      {
         _offerContent.backgroundSelected.visible = param1;
         _offerContent.backgroundUnselected.visible = !param1;
         _offerContent.selected.visible = param1;
      }
      
      public function set product(param1:IBillingProduct) : void
      {
         _product = param1;
         if(!_product)
         {
            visible = false;
            return;
         }
         visible = true;
         setOfferData(itemOffer);
      }
      
      public function get product() : IBillingProduct
      {
         return _product;
      }
      
      private function setOfferData(param1:AppConsumableBillingProductInfo) : void
      {
         tooltip = param1.description;
         _offerContent.background.setUriSprite(param1.backgroundImage,100,140,true,8,null,true);
         _offerContent.iconItem.setUriSprite(param1.itemImage,60,60,true,2,null,true);
         _offerContent.txtName.text = StringUtil.replace(param1.name,"-","- ");
         _offerContent.txtName.autoFontSize = true;
         _offerContent.txtPrice.fontSize = 18;
         _offerContent.txtPrice.text = _product.priceString;
         _offerContent.txtPrice.autoFontSize = true;
         available = param1.isBuyable;
      }
      
      override protected function handleInteractionOver(param1:InteractionEvent) : void
      {
         super.handleInteractionOver(param1);
         if(buttonEnabled)
         {
            _interactionOverCallback(itemOffer);
         }
      }
      
      override protected function handleInteractionOut(param1:InteractionEvent) : void
      {
         super.handleInteractionOut(param1);
         if(buttonEnabled)
         {
            _interactionOutCallback();
         }
      }
   }
}
