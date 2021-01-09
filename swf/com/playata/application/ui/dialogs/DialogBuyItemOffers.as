package com.playata.application.ui.dialogs
{
   import com.playata.application.Application;
   import com.playata.application.billing.AppConsumableBillingProductInfo;
   import com.playata.application.data.character.AppearanceSettings;
   import com.playata.application.data.character.Character;
   import com.playata.application.data.payment.ItemOfferCategories;
   import com.playata.application.data.payment.ItemOfferCategory;
   import com.playata.application.data.user.User;
   import com.playata.application.messaging.Message;
   import com.playata.application.messaging.MessageRouter;
   import com.playata.application.ui.AppUiUtil;
   import com.playata.application.ui.ViewManager;
   import com.playata.application.ui.elements.avatar.UiAvatarPreview;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.application.ui.elements.generic.dialog.UiInfoDialog;
   import com.playata.application.ui.elements.generic.tab.UiTabButton;
   import com.playata.application.ui.elements.payment.UiPaymentItemOffer;
   import com.playata.application.ui.elements.payment.UiPaymentMethodButton;
   import com.playata.application.ui.panels.PanelShop;
   import com.playata.framework.application.Environment;
   import com.playata.framework.billing.ConsumableBillingProductInfo;
   import com.playata.framework.billing.IBillingProduct;
   import com.playata.framework.billing.PaymentMethod;
   import com.playata.framework.core.logging.Logger;
   import com.playata.framework.display.filter.GrayscaleFilter;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.elements.buttons.SymbolButtonTabGeneric;
   
   public class DialogBuyItemOffers extends DialogPaymentBase
   {
      
      private static var _allProducts:Vector.<IBillingProduct> = null;
       
      
      private const MAX_OFFERS:int = 8;
      
      private var _itemOffer1:UiPaymentItemOffer = null;
      
      private var _itemOffer2:UiPaymentItemOffer = null;
      
      private var _itemOffer3:UiPaymentItemOffer = null;
      
      private var _itemOffer4:UiPaymentItemOffer = null;
      
      private var _itemOffer5:UiPaymentItemOffer = null;
      
      private var _itemOffer6:UiPaymentItemOffer = null;
      
      private var _itemOffer7:UiPaymentItemOffer = null;
      
      private var _itemOffer8:UiPaymentItemOffer = null;
      
      private var _currentItemOffer:UiPaymentItemOffer = null;
      
      private var _btnScrollUp:UiButton = null;
      
      private var _btnScrollDown:UiButton = null;
      
      private var _pageOffset:int = 0;
      
      private var _btnCategoryTabs:Vector.<UiTabButton>;
      
      private var _currentCategory:String = null;
      
      private var _previewAvatar:UiAvatarPreview = null;
      
      private var _inittedAsGift:Boolean = false;
      
      public function DialogBuyItemOffers()
      {
         var _loc2_:int = 0;
         _btnCategoryTabs = new Vector.<UiTabButton>();
         super();
         _allProducts = null;
         vo.option1.visible = false;
         vo.option2.visible = false;
         vo.option3.visible = false;
         vo.option4.visible = false;
         vo.option5.visible = false;
         vo.option6.visible = false;
         vo.optionSpecial1.visible = false;
         vo.optionSpecial2.visible = false;
         vo.optionSpecial3.visible = false;
         vo.optionSpecial4.visible = false;
         vo.teaser.visible = false;
         vo.btnHelp.visible = false;
         vo.txtOfferwallLink.visible = false;
         vo.btnEarnPremiumCurrency.visible = false;
         vo.offerwallClickLayer.visible = false;
         vo.backgroundImage.visible = false;
         vo.backgroundImageWide.visible = false;
         vo.eyes.visible = false;
         vo.itemOfferBackgroundImage.visible = true;
         vo.txtDialogTitle.text = LocText.current.text("dialog/buy_items/title");
         _itemOffer1 = new UiPaymentItemOffer(vo.itemOption1,selectItemOffer,handleInteractionOver,handleInteractionOut);
         _itemOffer2 = new UiPaymentItemOffer(vo.itemOption2,selectItemOffer,handleInteractionOver,handleInteractionOut);
         _itemOffer3 = new UiPaymentItemOffer(vo.itemOption3,selectItemOffer,handleInteractionOver,handleInteractionOut);
         _itemOffer4 = new UiPaymentItemOffer(vo.itemOption4,selectItemOffer,handleInteractionOver,handleInteractionOut);
         _itemOffer5 = new UiPaymentItemOffer(vo.itemOption5,selectItemOffer,handleInteractionOver,handleInteractionOut);
         _itemOffer6 = new UiPaymentItemOffer(vo.itemOption6,selectItemOffer,handleInteractionOver,handleInteractionOut);
         _itemOffer7 = new UiPaymentItemOffer(vo.itemOption7,selectItemOffer,handleInteractionOver,handleInteractionOut);
         _itemOffer8 = new UiPaymentItemOffer(vo.itemOption8,selectItemOffer,handleInteractionOver,handleInteractionOut);
         var _loc1_:Boolean = platform.isNutaku || platform.isKongregate || platform.isOdnoklassniki || platform.isEspritGames || platform.isEroges || platform.isVkontakte || platform.isNaszaKlasa || platform.isDraugiem || platform.isSteam;
         if(_loc1_)
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
            _loc2_ = 100;
            vo.dialogBackground.height = vo.dialogBackground.height - _loc2_;
            vo.dialogBackground.y = vo.dialogBackground.y + _loc2_;
            vo.btnHelp.y = vo.btnHelp.y + _loc2_;
            vo.btnClose.y = vo.btnClose.y + _loc2_;
            vo.txtDialogTitle.y = vo.txtDialogTitle.y + _loc2_;
            _yOffset = -50;
         }
         _btnScrollUp = new UiButton(vo.btnScrollUp,"",onClickScrollUp);
         _btnScrollDown = new UiButton(vo.btnScrollDown,"",onClickScrollDown);
         _btnScrollUp.visible = false;
         _btnScrollDown.visible = false;
         _previewAvatar = new UiAvatarPreview(vo.avatar);
         hideAllItemOffers();
         if(!(platform.isKongregate || platform.isNaszaKlasa || platform.isNutaku || platform.isVkontakte || platform.isOdnoklassniki || platform.isEspritGames || platform.isEroges || platform.isSteam || platform.isDraugiem))
         {
            initDefaultLayout(true);
            vo.btnScrollUp.y = vo.btnScrollUp.y + 40;
            vo.localePicker.y = vo.localePicker.y + 40;
            if(platform.isFacebook)
            {
               vo.localePicker.visible = false;
            }
         }
         vo.txtOfferCaption.visible = false;
         onMouseWheel.add(handleMouseWheel);
         Environment.billing.requestProducts(onRequestProductsComplete,false,DialogPaymentBase.currentPaymentLocale);
      }
      
      public static function hasConsumableOfferPaymentMethod(param1:Vector.<IBillingProduct>, param2:String, param3:int) : Boolean
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
               if(_loc4_.info is ConsumableBillingProductInfo)
               {
                  _loc5_ = _loc4_.info as ConsumableBillingProductInfo;
                  if(_loc5_.consumableOfferId == param2)
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
         _btnScrollUp.dispose();
         _btnScrollUp = null;
         _btnScrollDown.dispose();
         _btnScrollDown = null;
         _itemOffer1.dispose();
         _itemOffer1 = null;
         _itemOffer2.dispose();
         _itemOffer2 = null;
         _itemOffer3.dispose();
         _itemOffer3 = null;
         _itemOffer4.dispose();
         _itemOffer4 = null;
         _itemOffer5.dispose();
         _itemOffer5 = null;
         _itemOffer6.dispose();
         _itemOffer6 = null;
         _itemOffer7.dispose();
         _itemOffer7 = null;
         _itemOffer8.dispose();
         _itemOffer8 = null;
         var _loc3_:int = 0;
         var _loc2_:* = _btnCategoryTabs;
         for each(var _loc1_ in _btnCategoryTabs)
         {
            _loc1_.dispose();
            _loc1_ = null;
         }
         _previewAvatar.dispose();
         _previewAvatar = null;
         super.dispose();
      }
      
      override public function show() : void
      {
         super.show();
         vo.avatar.bringToTop();
      }
      
      override protected function onPaymentGiftingChanged(param1:Boolean) : void
      {
         AppConsumableBillingProductInfo.checkBuyable = !param1;
         refreshOptions();
      }
      
      private function onClickCategory(param1:InteractionEvent) : void
      {
         switchCategory((param1.target as UiButton).tagAsString);
      }
      
      private function switchCategory(param1:String) : void
      {
         _currentCategory = param1;
         var _loc5_:int = 0;
         var _loc4_:* = _btnCategoryTabs;
         for each(var _loc2_ in _btnCategoryTabs)
         {
            _loc2_.tabbed = _loc2_.tag == param1;
         }
         var _loc3_:ItemOfferCategory = ItemOfferCategories.getItemOfferCategory(param1);
         vo.itemOfferBackgroundImage.backgroundImage.setUriSprite(_loc3_.offerBackgroundImage,742,283,true);
         _currentItemOffer = null;
         refreshOptions();
      }
      
      private function handleMouseWheel(param1:InteractionEvent) : void
      {
         if(param1.mouseWheelDelta > 0)
         {
            scrollUp(true);
         }
         else
         {
            scrollDown(true);
         }
      }
      
      override protected function reopenDialog() : void
      {
         Environment.panelManager.showDialog(new DialogBuyItemOffers());
      }
      
      private function handleInteractionOver(param1:AppConsumableBillingProductInfo) : void
      {
         var _loc2_:AppearanceSettings = getCharacterSettings(User.current.character,param1);
         _previewAvatar.show(_loc2_);
      }
      
      private function handleInteractionOut() : void
      {
         _previewAvatar.hide();
      }
      
      private function getCharacterSettings(param1:Character, param2:AppConsumableBillingProductInfo) : AppearanceSettings
      {
         var _loc3_:AppearanceSettings = param1.getCurrentSettings();
         if(param2.getItemIdentifierForSlot(1))
         {
            _loc3_.show_head_item = true;
            _loc3_.head = param2.getItemIdentifierForSlot(1);
         }
         if(param2.getItemIdentifierForSlot(2))
         {
            _loc3_.show_chest_item = true;
            _loc3_.chest = param2.getItemIdentifierForSlot(2);
         }
         if(param2.getItemIdentifierForSlot(3))
         {
            _loc3_.show_belt_item = true;
            _loc3_.belt = param2.getItemIdentifierForSlot(3);
         }
         if(param2.getItemIdentifierForSlot(4))
         {
            _loc3_.show_legs_item = true;
            _loc3_.legs = param2.getItemIdentifierForSlot(4);
         }
         if(param2.getItemIdentifierForSlot(5))
         {
            _loc3_.show_boots_item = true;
            _loc3_.boots = param2.getItemIdentifierForSlot(5);
         }
         if(param2.getItemIdentifierForSlot(4) && param1.getItem("chest_item_id") != null && _loc3_.chest == param1.getItem("chest_item_id").identifier && param1.getItem("chest_item_id").isOutfitItem)
         {
            _loc3_.chest = null;
         }
         return _loc3_;
      }
      
      private function onClickScrollUp(param1:InteractionEvent) : void
      {
         scrollUp(false);
      }
      
      private function onClickScrollDown(param1:InteractionEvent) : void
      {
         scrollDown(false);
      }
      
      private function scrollUp(param1:Boolean) : void
      {
         if(!_btnScrollUp.visible)
         {
            return;
         }
         _pageOffset = _pageOffset - 1;
         if(_pageOffset < 0)
         {
            _pageOffset = 0;
            param1 = false;
         }
         if(param1)
         {
            Environment.audio.playFX("ui_button_click.mp3");
         }
         refreshOptions();
      }
      
      private function scrollDown(param1:Boolean) : void
      {
         if(!_btnScrollDown.visible)
         {
            return;
         }
         _pageOffset = _pageOffset + 1;
         var _loc2_:int = Math.ceil(currentItemOffers.length / 8);
         if(_pageOffset >= _loc2_)
         {
            _pageOffset = _loc2_ - 1;
            param1 = false;
         }
         if(param1)
         {
            Environment.audio.playFX("ui_button_click.mp3");
         }
         refreshOptions();
      }
      
      private function selectItemOffer(param1:InteractionEvent) : void
      {
         setItemOffer(param1.target as UiPaymentItemOffer);
      }
      
      private function setItemOffer(param1:UiPaymentItemOffer) : void
      {
         _currentItemOffer = param1;
         if(platform.isPaymentGiftingAllowed)
         {
            _checkIsGift.tooltip = LocText.current.text("dialog/buy_items/handle_as_gift_tooltip");
            if(!_currentItemOffer.itemOffer.canBeBoughtAsVoucher)
            {
               _checkIsGift.tooltip = "";
            }
            _checkIsGift.enabled = _currentItemOffer.itemOffer.canBeBoughtAsVoucher;
            if(!_checkIsGift.enabled)
            {
               _checkIsGift.checked = false;
            }
            vo.backgroundIsGift.visible = _checkIsGift.enabled;
            vo.checkIsGift.visible = _checkIsGift.enabled;
            vo.iconIsGift.visible = _checkIsGift.enabled;
         }
         _itemOffer1.highlight = param1 == _itemOffer1;
         _itemOffer2.highlight = param1 == _itemOffer2;
         _itemOffer3.highlight = param1 == _itemOffer3;
         _itemOffer4.highlight = param1 == _itemOffer4;
         _itemOffer5.highlight = param1 == _itemOffer5;
         _itemOffer6.highlight = param1 == _itemOffer6;
         _itemOffer7.highlight = param1 == _itemOffer7;
         _itemOffer8.highlight = param1 == _itemOffer8;
         var _loc4_:int = 0;
         var _loc3_:* = _paymentMethodButtons;
         for each(var _loc2_ in _paymentMethodButtons)
         {
            if(_currentItemOffer.product != null)
            {
               _loc2_.buttonEnabled = hasConsumableOfferPaymentMethod(_allProducts,(_currentItemOffer.product.info as ConsumableBillingProductInfo).consumableOfferId,_loc2_.paymentMethod.id);
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
            _paymentButtonMore.refresh(_allProducts,DialogPaymentBase._currentPaymentMethod,null,_currentItemOffer);
         }
      }
      
      override protected function initOffer() : void
      {
         if(_currentItemOffer == null)
         {
            return;
         }
         if(PaymentMethod.isGeoBlocked(_currentItemOffer.product.paymentMethodId,User.current.countryCode))
         {
            Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("error/billing/geo_not_allowed/title"),LocText.current.text("error/billing/geo_not_allowed/text"),LocText.current.text("general/button_ok")));
            return;
         }
         _inittedAsGift = _checkIsGift.visible && _checkIsGift.enabled && _checkIsGift.checked;
         Environment.billing.purchaseProduct(_currentItemOffer.product,onPurchaseComplete,1,_inittedAsGift);
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
               Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/buy_premium_currency/payment_successful_gift/title"),LocText.current.text("dialog/buy_items/payment_successful_gift/text"),LocText.current.text("general/button_ok")));
            }
            else
            {
               Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/buy_premium_currency/payment_successful/title"),LocText.current.text("dialog/buy_items/payment_successful/text"),LocText.current.text("general/button_ok")));
            }
            Application.tracking.onPayment(param2);
            Environment.billing.resetProducts();
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
            _paymentButtonMore.refresh(_allProducts,DialogPaymentBase._currentPaymentMethod,null,_currentItemOffer);
         }
         var _loc1_:Vector.<IBillingProduct> = currentItemOffers;
         _btnScrollUp.visible = _loc1_.length > 8;
         _btnScrollDown.visible = _loc1_.length > 8;
         var _loc4_:int = Math.ceil(_loc1_.length / 8);
         if(_btnScrollUp.visible)
         {
            _btnScrollUp.buttonEnabled = _pageOffset > 0;
         }
         if(_btnScrollDown.visible)
         {
            _btnScrollDown.buttonEnabled = _pageOffset < _loc4_ - 1;
         }
         var _loc2_:int = 0;
         var _loc5_:int = 1;
         var _loc3_:int = _pageOffset * 8;
         _itemOffer1.product = _loc1_.length > 0?_loc1_[0]:null;
         _itemOffer2.product = _loc1_.length > 1?_loc1_[1]:null;
         _itemOffer3.product = _loc1_.length > 2?_loc1_[2]:null;
         _itemOffer4.product = _loc1_.length > 3?_loc1_[3]:null;
         _itemOffer5.product = _loc1_.length > 4?_loc1_[4]:null;
         _itemOffer6.product = _loc1_.length > 5?_loc1_[5]:null;
         _itemOffer7.product = _loc1_.length > 6?_loc1_[6]:null;
         _itemOffer8.product = _loc1_.length > 7?_loc1_[7]:null;
         if(_currentItemOffer == null || !_currentItemOffer.available)
         {
            setItemOffer(_itemOffer1);
         }
      }
      
      private function hideAllItemOffers() : void
      {
         _itemOffer1.visible = false;
         _itemOffer2.visible = false;
         _itemOffer3.visible = false;
         _itemOffer4.visible = false;
         _itemOffer5.visible = false;
         _itemOffer6.visible = false;
         _itemOffer7.visible = false;
         _itemOffer8.visible = false;
      }
      
      private function onRequestProductsComplete(param1:Vector.<IBillingProduct>) : void
      {
         var _loc9_:* = null;
         var _loc3_:* = null;
         if(!param1 || param1.length == 0)
         {
            onPurchaseComplete(false,null);
            return;
         }
         _allProducts = param1;
         var _loc12_:int = 0;
         var _loc11_:* = _paymentMethodButtons;
         for each(var _loc2_ in _paymentMethodButtons)
         {
            _loc2_.refresh();
         }
         var _loc7_:int = 85;
         var _loc10_:int = 0;
         var _loc4_:Vector.<Array> = new Vector.<Array>();
         var _loc6_:Array = [];
         var _loc14_:int = 0;
         var _loc13_:* = ItemOfferCategories.instance.itemOfferCategories;
         for each(var _loc8_ in ItemOfferCategories.instance.itemOfferCategories)
         {
            if(_loc8_.hasActiveOffers(_allProducts))
            {
               _loc9_ = new SymbolButtonTabGeneric();
               _loc3_ = new UiTabButton(_loc9_,_loc8_.name,"",onClickCategory);
               _loc3_.tag = _loc8_.identifier;
               _loc3_.y = _loc3_.y - _loc7_;
               _loc3_.x = _loc10_ * (_loc3_.width + 10);
               _btnCategoryTabs.push(_loc3_);
               _vo.addChild(_loc3_);
               _loc10_++;
               _loc6_.push(_loc3_);
               if(_btnCategoryTabs.length != 4)
               {
                  continue;
               }
               break;
            }
         }
         if(_loc6_.length > 0)
         {
            _loc4_.push(_loc6_);
         }
         var _loc16_:int = 0;
         var _loc15_:* = _loc4_;
         for each(var _loc5_ in _loc4_)
         {
            AppUiUtil.alignVerticallyCentered(vo,10,_loc5_);
         }
         vo.avatar.bringToTop();
         switchCategory(_btnCategoryTabs[0].tagAsString);
      }
      
      private function get currentItemOffers() : Vector.<IBillingProduct>
      {
         var _loc2_:* = null;
         var _loc1_:Vector.<IBillingProduct> = new Vector.<IBillingProduct>(0);
         if(!_allProducts || _allProducts.length == 0)
         {
            return _loc1_;
         }
         var _loc5_:int = 0;
         var _loc4_:* = _allProducts;
         for each(var _loc3_ in _allProducts)
         {
            if(!(DialogPaymentBase._currentPaymentMethod && _loc3_.paymentMethodId != DialogPaymentBase._currentPaymentMethod.id))
            {
               if(_loc3_.info is ConsumableBillingProductInfo)
               {
                  _loc2_ = _loc3_.info as AppConsumableBillingProductInfo;
                  if(_loc2_.category == _currentCategory)
                  {
                     if(_loc2_.isAvailable(User.current.character.level))
                     {
                        _loc1_.push(_loc3_);
                     }
                  }
               }
            }
         }
         return _loc1_;
      }
      
      override public function close(param1:Function = null) : void
      {
         super.close(param1);
         if(ViewManager.instance.activePanelInstance is PanelShop)
         {
            (ViewManager.instance.activePanelInstance as PanelShop).updateCharacter();
         }
      }
   }
}
