package com.playata.application.ui.elements.payment
{
   import com.playata.framework.billing.IBillingProduct;
   import com.playata.framework.billing.PaymentMethod;
   import com.playata.framework.display.InteractiveDisplayObject;
   import com.playata.framework.display.filter.GrayscaleFilter;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.elements.payment.SymbolPaymentMethodMoreGeneric;
   
   public class UiPaymentButtonMore
   {
       
      
      private var _content:SymbolPaymentMethodMoreGeneric = null;
      
      private var _paymentButton:UiPaymentMethodButton = null;
      
      private var _additionalPaymentMethodsPopup:UiAdditionalPaymentMethodsPopup = null;
      
      private var _clickLayerMore:InteractiveDisplayObject = null;
      
      public function UiPaymentButtonMore(param1:SymbolPaymentMethodMoreGeneric, param2:PaymentMethod, param3:Function, param4:UiAdditionalPaymentMethodsPopup)
      {
         super();
         _content = param1;
         _content.visible = false;
         _additionalPaymentMethodsPopup = param4;
         _content.txtMore.text = LocText.current.text("dialog/buy_premium_currency/additional_caption");
         _content.txtMore.autoFontSize = true;
         _paymentButton = new UiPaymentMethodButton(_content.btnPaymentMethods,param2,param3);
         _content.btnPaymentMethods.background.visible = false;
         _clickLayerMore = new InteractiveDisplayObject(_content.clickLayerMore);
         _clickLayerMore.onInteractionOver.add(handleInteractionOverMore);
         _clickLayerMore.onInteractionOut.add(handleInteractionOutMore);
      }
      
      public function dispose() : void
      {
         _clickLayerMore.dispose();
         _paymentButton.dispose();
         _paymentButton = null;
      }
      
      public function get paymentButton() : UiPaymentMethodButton
      {
         return _paymentButton;
      }
      
      public function refresh(param1:Vector.<IBillingProduct>, param2:PaymentMethod, param3:UiPaymentOffer, param4:UiPaymentItemOffer) : void
      {
         var _loc7_:int = 0;
         var _loc6_:* = _additionalPaymentMethodsPopup.paymentMethods;
         for each(var _loc5_ in _additionalPaymentMethodsPopup.paymentMethods)
         {
            if(_loc5_ == param2)
            {
               _paymentButton.paymentMethod = param2;
            }
         }
         _paymentButton.selected = _paymentButton.paymentMethod == param2;
         if(param3)
         {
            if(param3.isSpecialOffer)
            {
               _paymentButton.buttonEnabled = param3.product.paymentMethodId == _paymentButton.paymentMethod.id;
               _paymentButton.content.alpha = !!_paymentButton.buttonEnabled?1:0.7;
               if(_paymentButton.buttonEnabled)
               {
                  _paymentButton.removeAllFilters();
               }
               else
               {
                  _paymentButton.addFilter(new GrayscaleFilter());
               }
            }
            else
            {
               _paymentButton.buttonEnabled = true;
               _paymentButton.content.alpha = 1;
               _paymentButton.removeAllFilters();
            }
         }
         else if(param4)
         {
            _paymentButton.buttonEnabled = param4.product.paymentMethodId == _paymentButton.paymentMethod.id;
            _paymentButton.content.alpha = !!_paymentButton.buttonEnabled?1:0.7;
            if(_paymentButton.buttonEnabled)
            {
               _paymentButton.removeAllFilters();
            }
            else
            {
               _paymentButton.addFilter(new GrayscaleFilter());
            }
         }
         if(_additionalPaymentMethodsPopup)
         {
            _additionalPaymentMethodsPopup.refresh(param1,param3,param4);
         }
      }
      
      public function refreshButtons() : void
      {
         _paymentButton.refresh();
         _additionalPaymentMethodsPopup.refreshButtons();
      }
      
      private function handleInteractionOverMore(param1:InteractionEvent) : void
      {
         _additionalPaymentMethodsPopup.show();
      }
      
      private function handleInteractionOutMore(param1:InteractionEvent) : void
      {
         _additionalPaymentMethodsPopup.hide();
      }
      
      public function show() : void
      {
         _content.visible = true;
      }
      
      public function hide() : void
      {
         _content.visible = false;
      }
   }
}
