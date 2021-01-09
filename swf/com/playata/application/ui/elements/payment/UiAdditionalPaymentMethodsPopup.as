package com.playata.application.ui.elements.payment
{
   import com.playata.application.ui.dialogs.DialogBuyItemOffers;
   import com.playata.application.ui.dialogs.DialogBuyPaymentOffers;
   import com.playata.framework.billing.ConsumableBillingProductInfo;
   import com.playata.framework.billing.IBillingProduct;
   import com.playata.framework.billing.PaymentMethod;
   import com.playata.framework.billing.PremiumSpecialBillingProductInfo;
   import com.playata.framework.display.InteractiveDisplayObject;
   import com.playata.framework.display.filter.GrayscaleFilter;
   import com.playata.framework.input.InteractionEvent;
   import visuals.ui.elements.buttons.SymbolButtonPaymentMethodGeneric;
   import visuals.ui.elements.shop.SymbolShopAdditionalPaymentMethodsPopupGeneric;
   
   public class UiAdditionalPaymentMethodsPopup
   {
       
      
      private var _content:SymbolShopAdditionalPaymentMethodsPopupGeneric = null;
      
      private var _paymentMethods:Vector.<PaymentMethod> = null;
      
      private var _paymentButtons:Vector.<UiPaymentMethodButton>;
      
      private var _onSelect:Function = null;
      
      private var _background:InteractiveDisplayObject;
      
      private const MAX_PAYMENT_METHODS:int = 8;
      
      public function UiAdditionalPaymentMethodsPopup(param1:SymbolShopAdditionalPaymentMethodsPopupGeneric, param2:Vector.<PaymentMethod>, param3:Function)
      {
         var _loc6_:int = 0;
         var _loc4_:* = null;
         var _loc5_:* = null;
         _paymentButtons = new Vector.<UiPaymentMethodButton>();
         super();
         _content = param1;
         _paymentMethods = param2;
         _onSelect = param3;
         _loc6_ = 1;
         while(_loc6_ <= param2.length)
         {
            _loc4_ = _content.getChildByName("btnMethod" + _loc6_) as SymbolButtonPaymentMethodGeneric;
            _loc5_ = new UiPaymentMethodButton(_loc4_,param2[_loc6_ - 1],_onSelect);
            _loc5_.visible = true;
            _paymentButtons.push(_loc5_);
            _loc6_++;
         }
         _loc6_ = param2.length;
         while(_loc6_ < 8)
         {
            _content.getChildByName("btnMethod" + (_loc6_ + 1)).visible = false;
            _loc6_++;
         }
         _content.background.height = Math.ceil(param2.length / 2) * 60 + 25;
         _content.visible = false;
         _background = new InteractiveDisplayObject(_content.background);
         _background.onInteractionOut.add(handleInteractionOut);
      }
      
      public function dispose() : void
      {
         var _loc3_:int = 0;
         var _loc2_:* = _paymentButtons;
         for each(var _loc1_ in _paymentButtons)
         {
            _content.removeChild(_loc1_);
         }
         _background.dispose();
      }
      
      private function handleInteractionOut(param1:InteractionEvent) : void
      {
         hide();
      }
      
      public function get paymentMethods() : Vector.<PaymentMethod>
      {
         return _paymentMethods;
      }
      
      public function show() : void
      {
         _content.visible = true;
      }
      
      public function hide() : void
      {
         _content.visible = false;
      }
      
      public function refresh(param1:Vector.<IBillingProduct>, param2:UiPaymentOffer, param3:UiPaymentItemOffer) : void
      {
         var _loc6_:int = 0;
         var _loc5_:* = _paymentButtons;
         for each(var _loc4_ in _paymentButtons)
         {
            if(param2)
            {
               if(param2.isSpecialOffer)
               {
                  _loc4_.buttonEnabled = DialogBuyPaymentOffers.hasSpecialOfferPaymentMethod(param1,(param2.product.info as PremiumSpecialBillingProductInfo).specialOfferId,_loc4_.paymentMethod.id);
                  _loc4_.content.alpha = !!_loc4_.buttonEnabled?1:0.7;
                  if(_loc4_.buttonEnabled)
                  {
                     _loc4_.removeAllFilters();
                  }
                  else
                  {
                     _loc4_.addFilter(new GrayscaleFilter());
                  }
               }
               else
               {
                  _loc4_.buttonEnabled = true;
                  _loc4_.content.alpha = 1;
                  _loc4_.removeAllFilters();
               }
            }
            else if(param3)
            {
               _loc4_.buttonEnabled = DialogBuyItemOffers.hasConsumableOfferPaymentMethod(param1,(param3.product.info as ConsumableBillingProductInfo).consumableOfferId,_loc4_.paymentMethod.id);
               _loc4_.content.alpha = !!_loc4_.buttonEnabled?1:0.7;
               if(_loc4_.buttonEnabled)
               {
                  _loc4_.removeAllFilters();
               }
               else
               {
                  _loc4_.addFilter(new GrayscaleFilter());
               }
            }
         }
      }
      
      public function refreshButtons() : void
      {
         var _loc3_:int = 0;
         var _loc2_:* = _paymentButtons;
         for each(var _loc1_ in _paymentButtons)
         {
            _loc1_.refresh();
         }
      }
   }
}
