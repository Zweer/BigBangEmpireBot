package com.playata.application.ui.elements.payment
{
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.framework.billing.PaymentMethod;
   import visuals.ui.elements.buttons.SymbolButtonPaymentMethodGeneric;
   
   public class UiPaymentMethodButton extends UiButton
   {
       
      
      private var _button:SymbolButtonPaymentMethodGeneric = null;
      
      private var _paymentMethod:PaymentMethod = null;
      
      public function UiPaymentMethodButton(param1:SymbolButtonPaymentMethodGeneric, param2:PaymentMethod, param3:Function)
      {
         super(param1,"",param3);
         _button = param1;
         _paymentMethod = param2;
         _button.selected.visible = false;
         refresh();
      }
      
      override public function dispose() : void
      {
         _button = null;
         _paymentMethod = null;
         super.dispose();
      }
      
      public function get paymentMethod() : PaymentMethod
      {
         return _paymentMethod;
      }
      
      public function set paymentMethod(param1:PaymentMethod) : void
      {
         _paymentMethod = param1;
         refresh();
      }
      
      public function refresh() : void
      {
         tooltip = _paymentMethod.description;
         _button.method.setUriSprite(_paymentMethod.iconImageUrl,63,64,true,2);
      }
      
      public function set selected(param1:Boolean) : void
      {
         _button.selected.visible = param1;
      }
      
      public function get selected() : Boolean
      {
         return _button.selected.visible;
      }
   }
}
