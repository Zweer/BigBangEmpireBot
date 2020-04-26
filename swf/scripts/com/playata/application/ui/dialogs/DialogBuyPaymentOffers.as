package com.playata.application.ui.dialogs
{
   import com.playata.application.AppConfig;
   import com.playata.application.Application;
   import com.playata.application.billing.AppBillingHandler;
   import com.playata.application.data.user.User;
   import com.playata.application.messaging.Message;
   import com.playata.application.messaging.MessageRouter;
   import com.playata.application.ui.ViewManager;
   import com.playata.application.ui.elements.generic.dialog.UiInfoDialog;
   import com.playata.application.ui.elements.payment.UiPaymentMethodButton;
   import com.playata.application.ui.elements.payment.UiPaymentOffer;
   import com.playata.framework.advertisement.AdType;
   import com.playata.framework.application.Environment;
   import com.playata.framework.billing.IBillingProduct;
   import com.playata.framework.billing.PaymentMethod;
   import com.playata.framework.billing.PremiumNormalBillingProductInfo;
   import com.playata.framework.billing.PremiumSpecialBillingProductInfo;
   import com.playata.framework.core.logging.Logger;
   import com.playata.framework.display.InteractiveDisplayObject;
   import com.playata.framework.display.filter.GrayscaleFilter;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   
   public class DialogBuyPaymentOffers extends DialogPaymentBase
   {
      
      private static var _allProducts:Vector.<IBillingProduct> = null;
       
      
      private var _paymentOffer1:UiPaymentOffer = null;
      
      private var _paymentOffer2:UiPaymentOffer = null;
      
      private var _paymentOffer3:UiPaymentOffer = null;
      
      private var _paymentOffer4:UiPaymentOffer = null;
      
      private var _paymentOffer5:UiPaymentOffer = null;
      
      private var _paymentOffer6:UiPaymentOffer = null;
      
      private var _paymentOfferSpecial1:UiPaymentOffer = null;
      
      private var _paymentOfferSpecial2:UiPaymentOffer = null;
      
      private var _paymentOfferSpecial3:UiPaymentOffer = null;
      
      private var _paymentOfferSpecial4:UiPaymentOffer = null;
      
      private var _currentPaymentOffer:UiPaymentOffer = null;
      
      private var _offerwallClickLayer:InteractiveDisplayObject;
      
      private var _paymentOfferSpecial1InitY:int = 0;
      
      private var _inittedAsGift:Boolean = false;
      
      public function DialogBuyPaymentOffers(param1:String = null)
      {
         var _loc3_:int = 0;
         super();
         _allProducts = null;
         vo.itemOption1.visible = false;
         vo.itemOption2.visible = false;
         vo.itemOption3.visible = false;
         vo.itemOption4.visible = false;
         vo.itemOption5.visible = false;
         vo.itemOption6.visible = false;
         vo.itemOption7.visible = false;
         vo.itemOption8.visible = false;
         vo.btnScrollUp.visible = false;
         vo.btnScrollDown.visible = false;
         vo.teaser.x = vo.teaser.x + 40;
         animateEyes();
         showTeaser(param1);
         vo.txtDialogTitle.text = LocText.current.text("dialog/buy_premium_currency/title");
         var _loc6_:* = Boolean(AppConfig.offerwallEnabled && platform.isOfferwallAllowed);
         if(_loc6_ && Environment.info.isNativeMobile)
         {
            _loc6_ = Environment.application.advertisment.getAdProvidersForType(AdType.OFFERWALL).length > 0;
         }
         vo.txtOfferwallLink.visible = _loc6_;
         vo.txtOfferwallLink.text = LocText.current.text("dialog/buy_premium_currency/offerwall_earn_premium_currency");
         vo.btnEarnPremiumCurrency.visible = _loc6_;
         vo.offerwallClickLayer.visible = _loc6_;
         _offerwallClickLayer = new InteractiveDisplayObject(vo.offerwallClickLayer);
         _offerwallClickLayer.onClick.add(handleOfferwallClick);
         _paymentOffer1 = new UiPaymentOffer(vo.option1,0,selectPaymentOffer);
         _paymentOffer2 = new UiPaymentOffer(vo.option2,1,selectPaymentOffer);
         _paymentOffer3 = new UiPaymentOffer(vo.option3,2,selectPaymentOffer);
         _paymentOffer4 = new UiPaymentOffer(vo.option4,3,selectPaymentOffer);
         _paymentOffer5 = new UiPaymentOffer(vo.option5,4,selectPaymentOffer);
         _paymentOffer6 = new UiPaymentOffer(vo.option6,5,selectPaymentOffer);
         _paymentOfferSpecial1 = new UiPaymentOffer(vo.optionSpecial1,6,selectPaymentOffer);
         _paymentOfferSpecial2 = new UiPaymentOffer(vo.optionSpecial2,7,selectPaymentOffer);
         _paymentOfferSpecial3 = new UiPaymentOffer(vo.optionSpecial3,8,selectPaymentOffer);
         _paymentOfferSpecial4 = new UiPaymentOffer(vo.optionSpecial4,9,selectPaymentOffer);
         vo.option3.bringToTop();
         vo.option2.bringToTop();
         vo.option1.bringToTop();
         vo.option6.bringToTop();
         vo.option5.bringToTop();
         vo.option4.bringToTop();
         var _loc2_:Boolean = platform.isKongregate || platform.isNaszaKlasa || platform.isNutaku || platform.isVkontakte || platform.isOdnoklassniki || platform.isEspritGames || platform.isEroges || platform.isSteam;
         if(_loc2_)
         {
            vo.localePicker.visible = false;
            vo.additionalPaymentMethods.visible = false;
            vo.btnPaymentMethodMore.visible = false;
            vo.txtMethodCaption.visible = false;
            vo.txtOfferCaption.visible = false;
            vo.btnMethod1.visible = false;
            vo.btnMethod2.visible = false;
            vo.btnMethod3.visible = false;
            vo.btnMethod4.visible = false;
            vo.btnMethod5.visible = false;
            vo.btnMethod6.visible = false;
            vo.btnMethod7.visible = false;
            vo.btnMethod8.visible = false;
            vo.btnMethod9.visible = false;
            vo.paymentMethodsBackground.visible = false;
            _loc3_ = 100;
            vo.dialogBackground.height = vo.dialogBackground.height - _loc3_;
            vo.dialogBackground.y = vo.dialogBackground.y + _loc3_;
            vo.btnHelp.y = vo.btnHelp.y + _loc3_;
            vo.btnClose.y = vo.btnClose.y + _loc3_;
            vo.txtDialogTitle.y = vo.txtDialogTitle.y + _loc3_;
            adjustGiftElements();
         }
         hideAllPaymentOffers();
         if(!(platform.isKongregate || platform.isNaszaKlasa || platform.isNutaku || platform.isVkontakte || platform.isOdnoklassniki || platform.isEspritGames || platform.isEroges || platform.isSteam))
         {
            initDefaultLayout();
            _paymentOffer3.offerContent.framePurple.visible = true;
            _paymentOffer6.offerContent.frameGolden.visible = true;
            _paymentOffer3.showSwish(true);
            _paymentOffer6.showSwish(true);
            if(platform.isFacebook || platform.isDraugiem)
            {
               vo.localePicker.visible = false;
            }
         }
         var _loc4_:int = 50;
         var _loc5_:int = 8;
         vo.option2.x = vo.option2.x + 1 * _loc5_;
         vo.option3.x = vo.option3.x + 2 * _loc5_;
         vo.option5.x = vo.option5.x + 1 * _loc5_;
         vo.option6.x = vo.option6.x + 2 * _loc5_;
         vo.optionSpecial1.x = vo.optionSpecial1.x + 3 * _loc5_;
         vo.optionSpecial2.x = vo.optionSpecial2.x + 3 * _loc5_;
         vo.optionSpecial3.x = vo.optionSpecial3.x + 10 * _loc5_;
         vo.optionSpecial4.x = vo.optionSpecial4.x + 10 * _loc5_;
         vo.option1.x = vo.option1.x - _loc4_ / 2;
         vo.option2.x = vo.option2.x - _loc4_ / 2;
         vo.option3.x = vo.option3.x - _loc4_ / 2;
         vo.option4.x = vo.option4.x - _loc4_ / 2;
         vo.option5.x = vo.option5.x - _loc4_ / 2;
         vo.option6.x = vo.option6.x - _loc4_ / 2;
         vo.optionSpecial1.x = vo.optionSpecial1.x - _loc4_ / 2;
         vo.optionSpecial2.x = vo.optionSpecial2.x - _loc4_ / 2;
         vo.optionSpecial3.x = vo.optionSpecial3.x - _loc4_ / 2;
         vo.optionSpecial4.x = vo.optionSpecial4.x - _loc4_ / 2;
         _paymentOfferSpecial1InitY = int(_paymentOfferSpecial1.y);
         Environment.billing.requestProducts(onRequestProductsComplete,false,DialogPaymentBase.currentPaymentLocale);
      }
      
      public static function hasSpecialOfferPaymentMethod(param1:Vector.<IBillingProduct>, param2:String, param3:int) : Boolean
      {
         var _loc5_:* = null;
         if(!param1 || param1.length == 0)
         {
            return false;
         }
         var _loc7_:int = 0;
         var _loc6_:* = param1;
         for each(var _loc4_ in param1)
         {
            if(_loc4_.paymentMethodId == param3)
            {
               if(_loc4_.info is PremiumSpecialBillingProductInfo)
               {
                  _loc5_ = _loc4_.info as PremiumSpecialBillingProductInfo;
                  if(_loc5_.specialOfferId == param2)
                  {
                     return true;
                  }
               }
            }
         }
         return false;
      }
      
      override public function dispose() : void
      {
         vo.teaser.background.killTweens();
         vo.teaser.line.killTweens();
         _paymentOffer1.dispose();
         _paymentOffer1 = null;
         _paymentOffer2.dispose();
         _paymentOffer2 = null;
         _paymentOffer3.dispose();
         _paymentOffer3 = null;
         _paymentOffer4.dispose();
         _paymentOffer4 = null;
         _paymentOffer5.dispose();
         _paymentOffer5 = null;
         _paymentOffer6.dispose();
         _paymentOffer6 = null;
         _paymentOfferSpecial1.dispose();
         _paymentOfferSpecial1 = null;
         _paymentOfferSpecial2.dispose();
         _paymentOfferSpecial2 = null;
         _paymentOfferSpecial3.dispose();
         _paymentOfferSpecial3 = null;
         _paymentOfferSpecial4.dispose();
         _paymentOfferSpecial4 = null;
         _offerwallClickLayer.dispose();
         super.dispose();
      }
      
      public function showTeaser(param1:String) : void
      {
         vo.teaser.visible = param1 != null;
         if(!vo.teaser.visible)
         {
            return;
         }
         vo.teaser.line.caption.text = param1;
      }
      
      private function handleOfferwallClick(param1:InteractionEvent) : void
      {
         platform.showOfferwall(User.current.id);
      }
      
      override protected function reopenDialog() : void
      {
         Environment.panelManager.showDialog(new DialogBuyPaymentOffers());
      }
      
      private function selectPaymentOffer(param1:InteractionEvent) : void
      {
         setPaymentOffer(param1.target as UiPaymentOffer);
      }
      
      private function setPaymentOffer(param1:UiPaymentOffer) : void
      {
         _currentPaymentOffer = param1;
         if(platform.isPaymentGiftingAllowed)
         {
            _checkIsGift.tooltip = LocText.current.text("dialog/buy_premium_currency/handle_as_gift_tooltip");
            if(_currentPaymentOffer.isSpecialOffer)
            {
               _checkIsGift.tooltip = LocText.current.text("dialog/buy_premium_currency/handle_as_gift_not_available_tooltip");
            }
            _checkIsGift.enabled = !_currentPaymentOffer.isSpecialOffer;
            if(!_checkIsGift.enabled)
            {
               _checkIsGift.checked = false;
            }
         }
         _paymentOffer1.highlight = _currentPaymentOffer == _paymentOffer1;
         _paymentOffer2.highlight = _currentPaymentOffer == _paymentOffer2;
         _paymentOffer3.highlight = _currentPaymentOffer == _paymentOffer3;
         _paymentOffer4.highlight = _currentPaymentOffer == _paymentOffer4;
         _paymentOffer5.highlight = _currentPaymentOffer == _paymentOffer5;
         _paymentOffer6.highlight = _currentPaymentOffer == _paymentOffer6;
         _paymentOfferSpecial1.highlight = _currentPaymentOffer == _paymentOfferSpecial1;
         _paymentOfferSpecial2.highlight = _currentPaymentOffer == _paymentOfferSpecial2;
         _paymentOfferSpecial3.highlight = _currentPaymentOffer == _paymentOfferSpecial3;
         _paymentOfferSpecial4.highlight = _currentPaymentOffer == _paymentOfferSpecial4;
         var _loc4_:int = 0;
         var _loc3_:* = _paymentMethodButtons;
         for each(var _loc2_ in _paymentMethodButtons)
         {
            if(_currentPaymentOffer.isSpecialOffer)
            {
               _loc2_.buttonEnabled = hasSpecialOfferPaymentMethod(_allProducts,(_currentPaymentOffer.product.info as PremiumSpecialBillingProductInfo).specialOfferId,_loc2_.paymentMethod.id);
               _loc2_.content.alpha = !!_loc2_.buttonEnabled?1:0.7;
               if(_loc2_.buttonEnabled)
               {
                  _loc2_.removeAllFilters();
               }
               else
               {
                  _loc2_.addFilter(new GrayscaleFilter());
               }
            }
            else
            {
               _loc2_.buttonEnabled = true;
               _loc2_.content.alpha = 1;
               _loc2_.removeAllFilters();
            }
         }
         if(_paymentButtonMore)
         {
            _paymentButtonMore.refresh(_allProducts,DialogPaymentBase._currentPaymentMethod,_currentPaymentOffer,null);
         }
      }
      
      override protected function initOffer() : void
      {
         if(_currentPaymentOffer == null)
         {
            Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/buy_premium_currency/no_option/title"),LocText.current.text("dialog/buy_premium_currency/no_option/text"),LocText.current.text("general/button_ok")));
            return;
         }
         if(PaymentMethod.isGeoBlocked(_currentPaymentOffer.product.paymentMethodId,User.current.countryCode))
         {
            Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("error/billing/geo_not_allowed/title"),LocText.current.text("error/billing/geo_not_allowed/text"),LocText.current.text("general/button_ok")));
            return;
         }
         _inittedAsGift = _checkIsGift.visible && _checkIsGift.enabled && _checkIsGift.checked;
         Environment.billing.purchaseProduct(_currentPaymentOffer.product,onPurchaseComplete,1,_inittedAsGift);
      }
      
      private function onPurchaseComplete(param1:Boolean, param2:Object) : void
      {
         Logger.debug("[Payment] Payment status: " + param1);
         if(param1 == true)
         {
            Environment.application.updateData(param2);
            platform.hideAdvertisment();
            MessageRouter.dispatch(new Message("ViewMessage.notifyPaymentSuccess",{},this));
            if(_inittedAsGift)
            {
               Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/buy_premium_currency/payment_successful_gift/title"),LocText.current.text("dialog/buy_premium_currency/payment_successful_gift/text"),LocText.current.text("general/button_ok")));
            }
            else
            {
               Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/buy_premium_currency/payment_successful/title"),LocText.current.text("dialog/buy_premium_currency/payment_successful/text"),LocText.current.text("general/button_ok")));
            }
            Application.tracking.onPayment(param2);
            Environment.billing.resetProducts();
            ViewManager.instance.baseUserPanel.syncGame();
         }
         else
         {
            Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/buy_premium_currency/payment_failed/title"),LocText.current.text("dialog/buy_premium_currency/payment_failed/text"),LocText.current.text("general/button_ok")));
         }
         close();
      }
      
      override protected function refreshOptions() : void
      {
         if(!_allProducts)
         {
            return;
         }
         if(_paymentButtonMore)
         {
            _paymentButtonMore.refresh(_allProducts,DialogPaymentBase._currentPaymentMethod,_currentPaymentOffer,null);
         }
         vo.txtLinkInfo.visible = DialogPaymentBase._currentPaymentMethod != null && DialogPaymentBase._currentPaymentMethod.isLinkMethod;
         vo.linkInfoBackground.visible = DialogPaymentBase._currentPaymentMethod != null && DialogPaymentBase._currentPaymentMethod.isLinkMethod;
         if(DialogPaymentBase._currentPaymentMethod && DialogPaymentBase._currentPaymentMethod.isLinkMethod)
         {
            hideAllPaymentOffers();
            _checkIsGift.enabled = false;
            _checkIsGift.checked = false;
            return;
         }
         var _loc2_:Vector.<IBillingProduct> = currentNormalOffers;
         _paymentOffer1.product = _loc2_.length > 0?_loc2_[0]:null;
         _paymentOffer2.product = _loc2_.length > 1?_loc2_[1]:null;
         _paymentOffer3.product = _loc2_.length > 2?_loc2_[2]:null;
         _paymentOffer4.product = _loc2_.length > 3?_loc2_[3]:null;
         _paymentOffer5.product = _loc2_.length > 4?_loc2_[4]:null;
         _paymentOffer6.product = _loc2_.length > 5?_loc2_[5]:null;
         var _loc1_:Vector.<IBillingProduct> = currentSpecialOffers;
         _paymentOfferSpecial1.product = _loc1_.length > 0?_loc1_[0]:null;
         _paymentOfferSpecial2.product = _loc1_.length > 1?_loc1_[1]:null;
         _paymentOfferSpecial3.product = _loc1_.length > 2?_loc1_[2]:null;
         _paymentOfferSpecial4.product = _loc1_.length > 3?_loc1_[3]:null;
         _paymentOfferSpecial1.y = _paymentOfferSpecial1InitY;
         _paymentOfferSpecial3.y = _paymentOfferSpecial1InitY;
         if(_paymentOfferSpecial1.available && !_paymentOfferSpecial2.available)
         {
            _paymentOfferSpecial1.y = _paymentOfferSpecial1.y + 70;
         }
         if(_paymentOfferSpecial3.available && !_paymentOfferSpecial4.available)
         {
            _paymentOfferSpecial3.y = _paymentOfferSpecial3.y + 70;
         }
         if(_currentPaymentOffer == null || !_currentPaymentOffer.available)
         {
            if(_paymentOffer2.available)
            {
               setPaymentOffer(_paymentOffer2);
            }
            else
            {
               setPaymentOffer(_paymentOffer1);
            }
         }
         else
         {
            _checkIsGift.enabled = platform.isPaymentGiftingAllowed && !_currentPaymentOffer.isSpecialOffer;
         }
         UiPaymentOffer.resetSpecialOfferAnimation();
         _paymentOffer1.refreshBonusInfo();
         _paymentOffer2.refreshBonusInfo();
         _paymentOffer3.refreshBonusInfo();
         _paymentOffer4.refreshBonusInfo();
         _paymentOffer5.refreshBonusInfo();
         _paymentOffer6.refreshBonusInfo();
         _paymentOfferSpecial1.refreshBonusInfo();
         _paymentOfferSpecial2.refreshBonusInfo();
         _paymentOfferSpecial3.refreshBonusInfo();
         _paymentOfferSpecial4.refreshBonusInfo();
         UiPaymentOffer.playSpecialOfferAnimation();
         if(_loc1_.length > 2)
         {
            switchToWideLayout();
         }
      }
      
      private function hideAllPaymentOffers() : void
      {
         _paymentOffer1.visible = false;
         _paymentOffer2.visible = false;
         _paymentOffer3.visible = false;
         _paymentOffer4.visible = false;
         _paymentOffer5.visible = false;
         _paymentOffer6.visible = false;
         _paymentOfferSpecial1.visible = false;
         _paymentOfferSpecial2.visible = false;
         _paymentOfferSpecial3.visible = false;
         _paymentOfferSpecial4.visible = false;
      }
      
      private function onRequestProductsComplete(param1:Vector.<IBillingProduct>) : void
      {
         if(!param1 || param1.length == 0)
         {
            onPurchaseComplete(false,null);
            return;
         }
         _allProducts = param1;
         var _loc4_:int = 0;
         var _loc3_:* = _paymentMethodButtons;
         for each(var _loc2_ in _paymentMethodButtons)
         {
            _loc2_.refresh();
         }
         refreshOptions();
      }
      
      private function get currentNormalOffers() : Vector.<IBillingProduct>
      {
         var _loc1_:Vector.<IBillingProduct> = new Vector.<IBillingProduct>(0);
         if(!_allProducts || _allProducts.length == 0)
         {
            return _loc1_;
         }
         var _loc4_:int = 0;
         var _loc3_:* = _allProducts;
         for each(var _loc2_ in _allProducts)
         {
            if(!(DialogPaymentBase._currentPaymentMethod && _loc2_.paymentMethodId != DialogPaymentBase._currentPaymentMethod.id))
            {
               if(_loc2_.info is PremiumNormalBillingProductInfo)
               {
                  _loc1_.push(_loc2_);
               }
            }
         }
         _loc1_.sort(AppBillingHandler.sortByTypeIndex);
         return _loc1_;
      }
      
      private function get currentSpecialOffers() : Vector.<IBillingProduct>
      {
         var _loc1_:Vector.<IBillingProduct> = new Vector.<IBillingProduct>(0);
         if(!_allProducts || _allProducts.length == 0)
         {
            return _loc1_;
         }
         var _loc4_:int = 0;
         var _loc3_:* = _allProducts;
         for each(var _loc2_ in _allProducts)
         {
            if(!(DialogPaymentBase._currentPaymentMethod && _loc2_.paymentMethodId != DialogPaymentBase._currentPaymentMethod.id))
            {
               if(_loc2_.info is PremiumSpecialBillingProductInfo)
               {
                  _loc1_.push(_loc2_);
               }
            }
         }
         _loc1_.sort(AppBillingHandler.sortByTypeIndex);
         return _loc1_;
      }
   }
}
