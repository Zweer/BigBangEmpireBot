package com.playata.application.ui.dialogs
{
   import com.greensock.TimelineMax;
   import com.playata.application.AppConfig;
   import com.playata.application.AppEnvironment;
   import com.playata.application.data.user.User;
   import com.playata.application.platform.ServerInfo;
   import com.playata.application.ui.AppUiUtil;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.application.ui.elements.generic.button.UiTextButton;
   import com.playata.application.ui.elements.generic.checkbox.UiCheckBox;
   import com.playata.application.ui.elements.generic.dialog.UiDialog;
   import com.playata.application.ui.elements.generic.locale_picker.UiLocalePicker;
   import com.playata.application.ui.elements.payment.UiAdditionalPaymentMethodsPopup;
   import com.playata.application.ui.elements.payment.UiPaymentButtonMore;
   import com.playata.application.ui.elements.payment.UiPaymentMethodButton;
   import com.playata.framework.application.Environment;
   import com.playata.framework.billing.PaymentMethod;
   import com.playata.framework.core.Runtime;
   import com.playata.framework.core.TypedObject;
   import com.playata.framework.core.cache.Cache;
   import com.playata.framework.display.ui.controls.Button;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.dialogs.SymbolDialogBuyCurrencyNewGeneric;
   import visuals.ui.elements.buttons.SymbolButtonPaymentMethodGeneric;
   
   public class DialogPaymentBase extends UiDialog
   {
      
      protected static var _currentPaymentMethod:PaymentMethod = null;
      
      protected static var _currentPaymentLocale:String = null;
       
      
      protected var _btnHelp:UiButton = null;
      
      protected var _btnClose:UiButton = null;
      
      protected var _btnContinue:UiTextButton = null;
      
      protected var _paymentMethodButtons:Vector.<UiPaymentMethodButton> = null;
      
      protected var _localePicker:UiLocalePicker = null;
      
      protected var _additionalPaymentMethodsPopup:UiAdditionalPaymentMethodsPopup = null;
      
      protected var _paymentButtonMore:UiPaymentButtonMore = null;
      
      protected var _checkIsGift:UiCheckBox = null;
      
      protected var _eyeAnimation:TimelineMax = null;
      
      public function DialogPaymentBase()
      {
         _currentPaymentMethod = null;
         super(new SymbolDialogBuyCurrencyNewGeneric());
         _queued = false;
         vo.txtMethodCaption.text = LocText.current.text("dialog/buy_premium_currency/method_caption");
         vo.txtOfferCaption.text = LocText.current.text("dialog/buy_premium_currency/offer_caption");
         vo.txtOfferCaption.visible = false;
         _btnHelp = new UiButton(vo.btnHelp,LocText.current.text("general/button_help"),onClickHelp);
         _btnClose = new UiButton(vo.btnClose,"",onClickClose);
         _btnContinue = new UiTextButton(vo.btnContinue,LocText.current.text("general/button_continue"),LocText.current.text("dialog/buy_premium_currency/button_continue_tooltip"),onClickContinue);
         _btnHelp.visible = !platform.isSSO;
         if(platform.isSSO)
         {
            _btnContinue.tooltip = "";
         }
         vo.txtLinkInfo.text = LocText.current.text("dialog/buy_premium_currency/link_offers_info");
         vo.txtLinkInfo.visible = false;
         vo.linkInfoBackground.visible = false;
         vo.itemOfferBackgroundImage.visible = false;
         vo.avatar.visible = false;
         vo.backgroundImageWide.visible = false;
         if(AppEnvironment.appPlatform.isHidePantiesAllowed)
         {
            vo.backgroundImage.gotoAndStop("usk18");
         }
         else
         {
            vo.backgroundImage.gotoAndStop("normal");
         }
         if(vo.txtLinkInfo.numLines == 3)
         {
            vo.txtLinkInfo.y = vo.txtLinkInfo.y + 20;
         }
         var _loc2_:Vector.<String> = new Vector.<String>();
         _loc2_.push(Environment.info.defaultLocale);
         if(!platform.hasCustomPayment)
         {
            if(AppConfig.paymentAlternativeLocales != null)
            {
               var _loc4_:int = 0;
               var _loc3_:* = AppConfig.paymentAlternativeLocales;
               for each(var _loc1_ in AppConfig.paymentAlternativeLocales)
               {
                  _loc2_.push(_loc1_);
               }
            }
         }
         _localePicker = new UiLocalePicker(vo.localePicker,_loc2_,currentPaymentLocale,onLocaleChange);
         vo.localePicker.iconSelectedLocale.dropDownBackground.visible = false;
         _checkIsGift = new UiCheckBox(vo.checkIsGift,false,"",onPaymentGiftingChanged);
         _checkIsGift.tooltipElement.positionType = 4;
         _loc4_ = -15;
         _checkIsGift.tooltipElement.offset = _loc4_;
         _checkIsGift.tooltipElement.offset = _loc4_;
         vo.checkIsGift.visible = platform.isPaymentGiftingAllowed;
         vo.iconIsGift.visible = platform.isPaymentGiftingAllowed;
         vo.backgroundIsGift.visible = platform.isPaymentGiftingAllowed;
         adjustGiftElements();
         _yOffset = 10;
      }
      
      public static function get currentPaymentMethod() : PaymentMethod
      {
         return _currentPaymentMethod;
      }
      
      public static function get currentPaymentLocale() : String
      {
         var _loc4_:* = undefined;
         var _loc1_:* = null;
         if(_currentPaymentLocale == null)
         {
            if(!Environment.platform.hasCustomPayment)
            {
               _loc4_ = new Vector.<String>();
               _loc4_.push(Environment.info.defaultLocale);
               if(AppConfig.paymentAlternativeLocales != null)
               {
                  var _loc6_:int = 0;
                  var _loc5_:* = AppConfig.paymentAlternativeLocales;
                  for each(var _loc3_ in AppConfig.paymentAlternativeLocales)
                  {
                     _loc4_.push(_loc3_);
                  }
               }
               if(_loc4_.length > 1 && Cache.getData(cacheKeySelectedLanguage))
               {
                  _currentPaymentLocale = Cache.getData(cacheKeySelectedLanguage).getString("locale");
                  if(_loc4_.indexOf(_currentPaymentLocale) == -1)
                  {
                     _currentPaymentLocale = Environment.info.defaultLocale;
                  }
               }
               else if(_loc4_.length > 1 && !Cache.getData(cacheKeySelectedLanguage))
               {
                  if(User.current.geoLocation)
                  {
                     var _loc8_:int = 0;
                     var _loc7_:* = _loc4_;
                     for each(var _loc2_ in _loc4_)
                     {
                        _loc1_ = _loc2_.substr(3);
                        if(_loc1_ == User.current.geoLocation)
                        {
                           _currentPaymentLocale = _loc2_;
                           break;
                        }
                     }
                  }
               }
               else
               {
                  _currentPaymentLocale = Environment.info.defaultLocale;
               }
            }
            else
            {
               _currentPaymentLocale = Environment.info.defaultLocale;
            }
         }
         if(!_currentPaymentLocale)
         {
            _currentPaymentLocale = Environment.info.defaultLocale;
         }
         return _currentPaymentLocale;
      }
      
      public static function set currentPaymentLocale(param1:String) : void
      {
         _currentPaymentLocale = param1;
         Cache.setData(cacheKeySelectedLanguage,new TypedObject({"locale":_currentPaymentLocale}));
         Environment.billing.resetProducts();
      }
      
      public static function get isDefaultCurrentPaymentLocale() : Boolean
      {
         return currentPaymentLocale == Environment.info.defaultLocale;
      }
      
      protected static function get cacheKeyAdditionalPaymentMethod() : String
      {
         return "additionalPaymentMethod_" + ServerInfo.serverId + "_" + User.current.id.toString();
      }
      
      protected static function get cacheKeySelectedLanguage() : String
      {
         return "selectedLanguage_" + ServerInfo.serverId + "_" + User.current.id.toString();
      }
      
      override public function dispose() : void
      {
         if(_btnHelp == null)
         {
            return;
         }
         if(_eyeAnimation)
         {
            _eyeAnimation.stop();
            _eyeAnimation.kill();
         }
         var _loc1_:UiPaymentMethodButton = null;
         var _loc3_:int = 0;
         var _loc2_:* = _paymentMethodButtons;
         for each(_loc1_ in _paymentMethodButtons)
         {
            _vo.removeChild(_loc1_);
            _loc1_.dispose();
            _loc1_ = null;
         }
         _paymentMethodButtons = null;
         _localePicker.dispose();
         _localePicker = null;
         if(_additionalPaymentMethodsPopup)
         {
            _additionalPaymentMethodsPopup.dispose();
            _additionalPaymentMethodsPopup = null;
         }
         if(_paymentButtonMore)
         {
            _paymentButtonMore.dispose();
            _paymentButtonMore = null;
         }
         _btnHelp.dispose();
         _btnHelp = null;
         _btnClose.dispose();
         _btnClose = null;
         _btnContinue.dispose();
         _btnContinue = null;
         _checkIsGift.dispose();
         _checkIsGift = null;
         super.dispose();
      }
      
      protected function get vo() : SymbolDialogBuyCurrencyNewGeneric
      {
         return _vo as SymbolDialogBuyCurrencyNewGeneric;
      }
      
      protected function initOffer() : void
      {
      }
      
      protected function refreshOptions() : void
      {
      }
      
      protected function reopenDialog() : void
      {
      }
      
      protected function onPaymentGiftingChanged(param1:Boolean) : void
      {
      }
      
      protected function initDefaultLayout(param1:Boolean = false) : void
      {
         var _loc5_:* = null;
         var _loc9_:* = null;
         var _loc8_:* = 0;
         _localePicker.content.bringToTop();
         vo.localePicker.visible = AppConfig.paymentAlternativeLocales != null;
         var _loc12_:SymbolButtonPaymentMethodGeneric = null;
         var _loc2_:UiPaymentMethodButton = null;
         _paymentMethodButtons = new Vector.<UiPaymentMethodButton>();
         var _loc6_:Vector.<PaymentMethod> = Environment.billing.getPaymentMethods(new TypedObject({
            "locale":currentPaymentLocale,
            "filterLinkPaymentMethods":param1,
            "ref":User.current.ref,
            "countryCode":User.current.countryCode
         }));
         var _loc10_:Vector.<PaymentMethod> = new Vector.<PaymentMethod>();
         var _loc3_:uint = 0;
         var _loc4_:int = 9;
         var _loc14_:int = 0;
         var _loc13_:* = _loc6_;
         for each(var _loc7_ in _loc6_)
         {
            _loc12_ = vo.getChildByName("btnMethod" + (_loc3_ + 1).toString()) as SymbolButtonPaymentMethodGeneric;
            if(_loc12_ == null || _loc3_ >= _loc4_ - 1 && _loc6_.length > _loc4_)
            {
               _loc10_.push(_loc7_);
            }
            else
            {
               _loc2_ = new UiPaymentMethodButton(_loc12_,_loc7_,onClickPaymentMethod);
               _loc2_.visible = true;
               _vo.addChild(_loc2_);
               _paymentMethodButtons.push(_loc2_);
               _loc3_++;
            }
         }
         _additionalPaymentMethodsPopup = new UiAdditionalPaymentMethodsPopup(vo.additionalPaymentMethods,_loc10_,onClickPaymentMethod);
         if(_loc10_.length > 0)
         {
            _loc5_ = _loc10_[0];
            _loc9_ = Cache.getData(cacheKeyAdditionalPaymentMethod);
            if(_loc9_)
            {
               var _loc16_:int = 0;
               var _loc15_:* = _loc10_;
               for each(var _loc11_ in _loc10_)
               {
                  if(_loc11_.id == _loc9_.getInt("id"))
                  {
                     _loc5_ = _loc11_;
                     break;
                  }
               }
            }
            _paymentButtonMore = new UiPaymentButtonMore(vo.btnPaymentMethodMore,_loc5_,onClickPaymentMethod,_additionalPaymentMethodsPopup);
            _paymentButtonMore.show();
         }
         else
         {
            vo.btnPaymentMethodMore.visible = false;
         }
         _loc8_ = uint(0);
         while(_loc8_ < _loc4_ - _paymentMethodButtons.length)
         {
            _loc12_ = vo.getChildByName("btnMethod" + (_loc4_ - _loc8_).toString()) as SymbolButtonPaymentMethodGeneric;
            if(_loc12_ != null)
            {
               _loc12_.visible = false;
            }
            _loc8_++;
         }
         centerPaymentMethodButtons();
         if(_paymentMethodButtons.length > 0)
         {
            selectPaymentMethod(_paymentMethodButtons[0].paymentMethod);
         }
      }
      
      private function centerPaymentMethodButtons() : void
      {
         if(_paymentMethodButtons == null)
         {
            return;
         }
         var _loc1_:int = 57;
         if(_paymentButtonMore)
         {
            _loc1_ = 2;
         }
         if(this is DialogBuyPaymentOffers)
         {
            _loc1_ = 32;
            if(_paymentButtonMore)
            {
               _loc1_ = -23;
            }
         }
         if(_paymentMethodButtons.length == 1)
         {
            AppUiUtil.alignVerticallyCentered(_vo,_loc1_,_paymentMethodButtons[0].content);
         }
         else if(_paymentMethodButtons.length == 2)
         {
            AppUiUtil.alignVerticallyCentered(_vo,_loc1_,_paymentMethodButtons[0].content,_paymentMethodButtons[1].content);
         }
         else if(_paymentMethodButtons.length == 3)
         {
            AppUiUtil.alignVerticallyCentered(_vo,_loc1_,_paymentMethodButtons[0].content,_paymentMethodButtons[1].content,_paymentMethodButtons[2].content);
         }
         else if(_paymentMethodButtons.length == 4)
         {
            AppUiUtil.alignVerticallyCentered(_vo,_loc1_,_paymentMethodButtons[0].content,_paymentMethodButtons[1].content,_paymentMethodButtons[2].content,_paymentMethodButtons[3].content);
         }
         else if(_paymentMethodButtons.length == 5)
         {
            AppUiUtil.alignVerticallyCentered(_vo,_loc1_,_paymentMethodButtons[0].content,_paymentMethodButtons[1].content,_paymentMethodButtons[2].content,_paymentMethodButtons[3].content,_paymentMethodButtons[4].content);
         }
         else if(_paymentMethodButtons.length == 6)
         {
            AppUiUtil.alignVerticallyCentered(_vo,_loc1_,_paymentMethodButtons[0].content,_paymentMethodButtons[1].content,_paymentMethodButtons[2].content,_paymentMethodButtons[3].content,_paymentMethodButtons[4].content,_paymentMethodButtons[5].content);
         }
         else if(_paymentMethodButtons.length == 7)
         {
            AppUiUtil.alignVerticallyCentered(_vo,_loc1_,_paymentMethodButtons[0].content,_paymentMethodButtons[1].content,_paymentMethodButtons[2].content,_paymentMethodButtons[3].content,_paymentMethodButtons[4].content,_paymentMethodButtons[5].content,_paymentMethodButtons[6].content);
         }
         else if(_paymentMethodButtons.length == 8)
         {
            AppUiUtil.alignVerticallyCentered(_vo,_loc1_,_paymentMethodButtons[0].content,_paymentMethodButtons[1].content,_paymentMethodButtons[2].content,_paymentMethodButtons[3].content,_paymentMethodButtons[4].content,_paymentMethodButtons[5].content,_paymentMethodButtons[6].content,_paymentMethodButtons[7].content);
         }
         else if(_paymentMethodButtons.length == 9)
         {
            AppUiUtil.alignVerticallyCentered(_vo,_loc1_,_paymentMethodButtons[0].content,_paymentMethodButtons[1].content,_paymentMethodButtons[2].content,_paymentMethodButtons[3].content,_paymentMethodButtons[4].content,_paymentMethodButtons[5].content,_paymentMethodButtons[6].content,_paymentMethodButtons[7].content,_paymentMethodButtons[8].content);
         }
      }
      
      protected function onLocaleChange(param1:String) : void
      {
         locale = param1;
         if(currentPaymentLocale == locale)
         {
            return;
         }
         currentPaymentLocale = locale;
         close();
         var openBuyCurrencyDialog:Function = function():void
         {
            reopenDialog();
         };
         Runtime.delayFunction(openBuyCurrencyDialog,0.2);
      }
      
      protected function showTutorialDialog() : void
      {
         Environment.panelManager.showDialog(new DialogTutorialPopup(LocText.current.text("dialog/tutorial/buy_premium_currency/title"),LocText.current.text("dialog/tutorial/buy_premium_currency/text"),onTutorialDialogClosed));
      }
      
      protected function onTutorialDialogClosed() : void
      {
         User.current.character.setTutorialFlag("buy_currency");
      }
      
      protected function onClickClose(param1:InteractionEvent) : void
      {
         close();
      }
      
      protected function onClickHelp(param1:InteractionEvent) : void
      {
         showTutorialDialog();
      }
      
      protected function onClickPaymentMethod(param1:InteractionEvent) : void
      {
         selectPaymentMethod((param1.target as UiPaymentMethodButton).paymentMethod);
         refreshPaymentMethodButtons();
      }
      
      protected function selectPaymentMethod(param1:PaymentMethod) : void
      {
         _currentPaymentMethod = param1;
         var _loc4_:int = 0;
         var _loc3_:* = _paymentMethodButtons;
         for each(var _loc2_ in _paymentMethodButtons)
         {
            _loc2_.selected = _loc2_.paymentMethod == _currentPaymentMethod;
         }
         if(_paymentButtonMore)
         {
            Cache.setData(cacheKeyAdditionalPaymentMethod,new TypedObject({"id":_paymentButtonMore.paymentButton.paymentMethod.id}));
         }
         refreshOptions();
      }
      
      protected function refreshPaymentMethodButtons() : void
      {
         var _loc3_:int = 0;
         var _loc2_:* = _paymentMethodButtons;
         for each(var _loc1_ in _paymentMethodButtons)
         {
            _loc1_.refresh();
         }
         if(_paymentButtonMore)
         {
            _paymentButtonMore.refreshButtons();
         }
      }
      
      protected function onClickContinue(param1:InteractionEvent) : void
      {
         initOffer();
      }
      
      protected function startInitOffer() : void
      {
         initOffer();
      }
      
      protected function switchToWideLayout() : void
      {
         switchLayoutWidth(true);
      }
      
      protected function switchLayoutWidth(param1:Boolean) : void
      {
         var _loc4_:int = 0;
         if(param1 && vo.backgroundImageWide.visible || !param1 && vo.backgroundImage.visible)
         {
            return;
         }
         vo.backgroundImage.visible = !param1;
         vo.backgroundImageWide.visible = param1;
         var _loc5_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         if(param1)
         {
            _loc5_ = vo.backgroundImageWide.x + vo.backgroundImageWide.width;
            _loc2_ = vo.backgroundImageWide.width;
            _loc3_ = (vo.backgroundImageWide.width - vo.backgroundImage.width) / 2;
         }
         else
         {
            _loc5_ = vo.backgroundImage.x + vo.backgroundImage.width;
            _loc2_ = vo.backgroundImage.width;
            _loc3_ = (vo.backgroundImage.width - vo.backgroundImageWide.width) / 2;
         }
         vo.additionalPaymentMethods.x = _loc5_ - 27;
         vo.btnScrollDown.x = _loc5_ - 32;
         vo.btnScrollUp.x = _loc5_ - 32;
         vo.teaser.x = _loc5_ - 37;
         vo.dialogBackground.width = _loc2_ + 40;
         vo.paymentMethodsBackground.background.width = _loc2_;
         vo.btnClose.x = _loc5_ - 1;
         vo.checkIsGift.x = _loc5_ - 62;
         vo.iconIsGift.x = _loc5_ - 106;
         vo.backgroundIsGift.x = _loc5_ - 120;
         vo.txtDialogTitle.x = _loc5_ / 2 - 460;
         vo.txtOfferCaption.x = _loc5_ / 2 - 360;
         vo.txtMethodCaption.x = _loc5_ / 2 - 360;
         vo.btnPaymentMethodMore.x = _loc5_ - 135;
         vo.btnContinue.x = _loc5_ / 2 - 165;
         if(_loc3_ != 0)
         {
            _loc4_ = 0;
            while(_loc4_ < vo.numChildren)
            {
               _vo.getChildAt(_loc4_).x = _vo.getChildAt(_loc4_).x - _loc3_;
               _loc4_++;
            }
         }
         centerPaymentMethodButtons();
      }
      
      protected function switchToSmallLayout() : void
      {
         switchLayoutWidth(false);
      }
      
      protected function animateEyes() : void
      {
         _eyeAnimation = new TimelineMax({
            "repeat":-1,
            "paused":true
         });
         _eyeAnimation.set(vo.eyes,{"visible":false},0);
         _eyeAnimation.set(vo.eyes,{"visible":true},0.3);
         _eyeAnimation.set(vo.eyes,{"visible":false},0.4667);
         _eyeAnimation.set(vo.eyes,{"visible":true},2.6333);
         _eyeAnimation.set(vo.eyes,{"visible":false},2.7333);
         _eyeAnimation.set(vo.eyes,{"visible":true},2.9);
         _eyeAnimation.set(vo.eyes,{"visible":false},3);
         _eyeAnimation.set(vo.eyes,{"visible":true},6);
         _eyeAnimation.set(vo.eyes,{"visible":false},6.1333);
         _eyeAnimation.set(vo.eyes,{"visible":false},12);
         _eyeAnimation.play();
      }
      
      protected function adjustGiftElements() : void
      {
         var _loc1_:int = 22;
         _checkIsGift.content.y = _btnContinue.content.y - _loc1_;
         vo.backgroundIsGift.y = _btnContinue.content.y - _loc1_ - 7;
         vo.iconIsGift.y = _btnContinue.content.y - _loc1_ - 3;
      }
      
      override public function get defaultButton() : Button
      {
         return _btnContinue;
      }
      
      override public function onEscape() : void
      {
         close();
      }
   }
}
