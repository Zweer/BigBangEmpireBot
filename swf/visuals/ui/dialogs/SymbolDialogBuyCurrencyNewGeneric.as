package visuals.ui.dialogs
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabel;
   import com.playata.framework.display.lib.flash.FlashLabelArea;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabel;
   import com.playata.framework.display.ui.controls.ILabelArea;
   import flash.display.MovieClip;
   import visuals.ui.base.SymbolDummyGeneric;
   import visuals.ui.base.SymbolUiButtonDefaultGeneric;
   import visuals.ui.base.SymbolUiCheckboxGeneric;
   import visuals.ui.elements.backgrounds.SymbolBackgroundScalableGeneric;
   import visuals.ui.elements.backgrounds.SymbolSlice9BackgroundDialogGeneric;
   import visuals.ui.elements.buttons.SymbolButtonArrowDownGeneric;
   import visuals.ui.elements.buttons.SymbolButtonArrowRightBlueGeneric;
   import visuals.ui.elements.buttons.SymbolButtonArrowUpGeneric;
   import visuals.ui.elements.buttons.SymbolButtonCloseGeneric;
   import visuals.ui.elements.buttons.SymbolButtonHelpGeneric;
   import visuals.ui.elements.buttons.SymbolButtonPaymentMethodGeneric;
   import visuals.ui.elements.generic.SymbolLocalePickerGeneric;
   import visuals.ui.elements.icons.SymbolIconPremiumCurrencyGiftGeneric;
   import visuals.ui.elements.payment.SymbolAvatarPreviewGeneric;
   import visuals.ui.elements.payment.SymbolPaymentMethodMoreGeneric;
   import visuals.ui.elements.payment.SymbolPaymentMethodsBackgroundGeneric;
   import visuals.ui.elements.payment.SymbolPaymentTeaserGeneric;
   import visuals.ui.elements.shop.SymbolItemOfferShopBackgroundGeneric;
   import visuals.ui.elements.shop.SymbolPaymentLinkInfoBackgroundGeneric;
   import visuals.ui.elements.shop.SymbolShopAdditionalPaymentMethodsPopupGeneric;
   import visuals.ui.elements.shop.SymbolShopBackgroundImageGeneric;
   import visuals.ui.elements.shop.SymbolShopBackgroundImageWideGeneric;
   import visuals.ui.elements.shop.SymbolShopEyesGeneric;
   import visuals.ui.elements.shop.SymbolShopItemOptionGeneric;
   import visuals.ui.elements.shop.SymbolShopPaymentOptionGeneric;
   
   public class SymbolDialogBuyCurrencyNewGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolDialogBuyCurrencyNew = null;
      
      public var dialogBackground:SymbolSlice9BackgroundDialogGeneric = null;
      
      public var backgroundImage:SymbolShopBackgroundImageGeneric = null;
      
      public var backgroundImageWide:SymbolShopBackgroundImageWideGeneric = null;
      
      public var itemOfferBackgroundImage:SymbolItemOfferShopBackgroundGeneric = null;
      
      public var txtDialogTitle:ILabel = null;
      
      public var btnClose:SymbolButtonCloseGeneric = null;
      
      public var paymentMethodsBackground:SymbolPaymentMethodsBackgroundGeneric = null;
      
      public var txtMethodCaption:ILabel = null;
      
      public var btnMethod1:SymbolButtonPaymentMethodGeneric = null;
      
      public var btnMethod2:SymbolButtonPaymentMethodGeneric = null;
      
      public var btnMethod3:SymbolButtonPaymentMethodGeneric = null;
      
      public var btnMethod4:SymbolButtonPaymentMethodGeneric = null;
      
      public var btnMethod5:SymbolButtonPaymentMethodGeneric = null;
      
      public var btnMethod6:SymbolButtonPaymentMethodGeneric = null;
      
      public var btnMethod7:SymbolButtonPaymentMethodGeneric = null;
      
      public var teaser:SymbolPaymentTeaserGeneric = null;
      
      public var btnMethod8:SymbolButtonPaymentMethodGeneric = null;
      
      public var btnMethod9:SymbolButtonPaymentMethodGeneric = null;
      
      public var txtOfferCaption:ILabel = null;
      
      public var btnContinue:SymbolUiButtonDefaultGeneric = null;
      
      public var eyes:SymbolShopEyesGeneric = null;
      
      public var linkInfoBackground:SymbolPaymentLinkInfoBackgroundGeneric = null;
      
      public var txtLinkInfo:ILabelArea = null;
      
      public var btnHelp:SymbolButtonHelpGeneric = null;
      
      public var localePicker:SymbolLocalePickerGeneric = null;
      
      public var btnPaymentMethodMore:SymbolPaymentMethodMoreGeneric = null;
      
      public var btnEarnPremiumCurrency:SymbolButtonArrowRightBlueGeneric = null;
      
      public var txtOfferwallLink:ILabel = null;
      
      public var offerwallClickLayer:SymbolDummyGeneric = null;
      
      public var option1:SymbolShopPaymentOptionGeneric = null;
      
      public var optionSpecial1:SymbolShopPaymentOptionGeneric = null;
      
      public var option2:SymbolShopPaymentOptionGeneric = null;
      
      public var option3:SymbolShopPaymentOptionGeneric = null;
      
      public var option4:SymbolShopPaymentOptionGeneric = null;
      
      public var option5:SymbolShopPaymentOptionGeneric = null;
      
      public var option6:SymbolShopPaymentOptionGeneric = null;
      
      public var optionSpecial2:SymbolShopPaymentOptionGeneric = null;
      
      public var optionSpecial3:SymbolShopPaymentOptionGeneric = null;
      
      public var optionSpecial4:SymbolShopPaymentOptionGeneric = null;
      
      public var itemOption1:SymbolShopItemOptionGeneric = null;
      
      public var itemOption4:SymbolShopItemOptionGeneric = null;
      
      public var itemOption2:SymbolShopItemOptionGeneric = null;
      
      public var itemOption3:SymbolShopItemOptionGeneric = null;
      
      public var itemOption5:SymbolShopItemOptionGeneric = null;
      
      public var itemOption6:SymbolShopItemOptionGeneric = null;
      
      public var itemOption7:SymbolShopItemOptionGeneric = null;
      
      public var itemOption8:SymbolShopItemOptionGeneric = null;
      
      public var backgroundIsGift:SymbolBackgroundScalableGeneric = null;
      
      public var checkIsGift:SymbolUiCheckboxGeneric = null;
      
      public var iconIsGift:SymbolIconPremiumCurrencyGiftGeneric = null;
      
      public var btnScrollUp:SymbolButtonArrowUpGeneric = null;
      
      public var btnScrollDown:SymbolButtonArrowDownGeneric = null;
      
      public var additionalPaymentMethods:SymbolShopAdditionalPaymentMethodsPopupGeneric = null;
      
      public var avatar:SymbolAvatarPreviewGeneric = null;
      
      public function SymbolDialogBuyCurrencyNewGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolDialogBuyCurrencyNew;
         }
         else
         {
            _nativeObject = new SymbolDialogBuyCurrencyNew();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         dialogBackground = new SymbolSlice9BackgroundDialogGeneric(_nativeObject.dialogBackground);
         backgroundImage = new SymbolShopBackgroundImageGeneric(_nativeObject.backgroundImage);
         backgroundImageWide = new SymbolShopBackgroundImageWideGeneric(_nativeObject.backgroundImageWide);
         itemOfferBackgroundImage = new SymbolItemOfferShopBackgroundGeneric(_nativeObject.itemOfferBackgroundImage);
         txtDialogTitle = FlashLabel.fromNative(_nativeObject.txtDialogTitle);
         btnClose = new SymbolButtonCloseGeneric(_nativeObject.btnClose);
         paymentMethodsBackground = new SymbolPaymentMethodsBackgroundGeneric(_nativeObject.paymentMethodsBackground);
         txtMethodCaption = FlashLabel.fromNative(_nativeObject.txtMethodCaption);
         btnMethod1 = new SymbolButtonPaymentMethodGeneric(_nativeObject.btnMethod1);
         btnMethod2 = new SymbolButtonPaymentMethodGeneric(_nativeObject.btnMethod2);
         btnMethod3 = new SymbolButtonPaymentMethodGeneric(_nativeObject.btnMethod3);
         btnMethod4 = new SymbolButtonPaymentMethodGeneric(_nativeObject.btnMethod4);
         btnMethod5 = new SymbolButtonPaymentMethodGeneric(_nativeObject.btnMethod5);
         btnMethod6 = new SymbolButtonPaymentMethodGeneric(_nativeObject.btnMethod6);
         btnMethod7 = new SymbolButtonPaymentMethodGeneric(_nativeObject.btnMethod7);
         teaser = new SymbolPaymentTeaserGeneric(_nativeObject.teaser);
         btnMethod8 = new SymbolButtonPaymentMethodGeneric(_nativeObject.btnMethod8);
         btnMethod9 = new SymbolButtonPaymentMethodGeneric(_nativeObject.btnMethod9);
         txtOfferCaption = FlashLabel.fromNative(_nativeObject.txtOfferCaption);
         btnContinue = new SymbolUiButtonDefaultGeneric(_nativeObject.btnContinue);
         eyes = new SymbolShopEyesGeneric(_nativeObject.eyes);
         linkInfoBackground = new SymbolPaymentLinkInfoBackgroundGeneric(_nativeObject.linkInfoBackground);
         txtLinkInfo = FlashLabelArea.fromNative(_nativeObject.txtLinkInfo);
         btnHelp = new SymbolButtonHelpGeneric(_nativeObject.btnHelp);
         localePicker = new SymbolLocalePickerGeneric(_nativeObject.localePicker);
         btnPaymentMethodMore = new SymbolPaymentMethodMoreGeneric(_nativeObject.btnPaymentMethodMore);
         btnEarnPremiumCurrency = new SymbolButtonArrowRightBlueGeneric(_nativeObject.btnEarnPremiumCurrency);
         txtOfferwallLink = FlashLabel.fromNative(_nativeObject.txtOfferwallLink);
         offerwallClickLayer = new SymbolDummyGeneric(_nativeObject.offerwallClickLayer);
         option1 = new SymbolShopPaymentOptionGeneric(_nativeObject.option1);
         optionSpecial1 = new SymbolShopPaymentOptionGeneric(_nativeObject.optionSpecial1);
         option2 = new SymbolShopPaymentOptionGeneric(_nativeObject.option2);
         option3 = new SymbolShopPaymentOptionGeneric(_nativeObject.option3);
         option4 = new SymbolShopPaymentOptionGeneric(_nativeObject.option4);
         option5 = new SymbolShopPaymentOptionGeneric(_nativeObject.option5);
         option6 = new SymbolShopPaymentOptionGeneric(_nativeObject.option6);
         optionSpecial2 = new SymbolShopPaymentOptionGeneric(_nativeObject.optionSpecial2);
         optionSpecial3 = new SymbolShopPaymentOptionGeneric(_nativeObject.optionSpecial3);
         optionSpecial4 = new SymbolShopPaymentOptionGeneric(_nativeObject.optionSpecial4);
         itemOption1 = new SymbolShopItemOptionGeneric(_nativeObject.itemOption1);
         itemOption4 = new SymbolShopItemOptionGeneric(_nativeObject.itemOption4);
         itemOption2 = new SymbolShopItemOptionGeneric(_nativeObject.itemOption2);
         itemOption3 = new SymbolShopItemOptionGeneric(_nativeObject.itemOption3);
         itemOption5 = new SymbolShopItemOptionGeneric(_nativeObject.itemOption5);
         itemOption6 = new SymbolShopItemOptionGeneric(_nativeObject.itemOption6);
         itemOption7 = new SymbolShopItemOptionGeneric(_nativeObject.itemOption7);
         itemOption8 = new SymbolShopItemOptionGeneric(_nativeObject.itemOption8);
         backgroundIsGift = new SymbolBackgroundScalableGeneric(_nativeObject.backgroundIsGift);
         checkIsGift = new SymbolUiCheckboxGeneric(_nativeObject.checkIsGift);
         iconIsGift = new SymbolIconPremiumCurrencyGiftGeneric(_nativeObject.iconIsGift);
         btnScrollUp = new SymbolButtonArrowUpGeneric(_nativeObject.btnScrollUp);
         btnScrollDown = new SymbolButtonArrowDownGeneric(_nativeObject.btnScrollDown);
         additionalPaymentMethods = new SymbolShopAdditionalPaymentMethodsPopupGeneric(_nativeObject.additionalPaymentMethods);
         avatar = new SymbolAvatarPreviewGeneric(_nativeObject.avatar);
      }
      
      public function setNativeInstance(param1:SymbolDialogBuyCurrencyNew) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.dialogBackground)
         {
            dialogBackground.setNativeInstance(_nativeObject.dialogBackground);
         }
         if(_nativeObject.backgroundImage)
         {
            backgroundImage.setNativeInstance(_nativeObject.backgroundImage);
         }
         if(_nativeObject.backgroundImageWide)
         {
            backgroundImageWide.setNativeInstance(_nativeObject.backgroundImageWide);
         }
         if(_nativeObject.itemOfferBackgroundImage)
         {
            itemOfferBackgroundImage.setNativeInstance(_nativeObject.itemOfferBackgroundImage);
         }
         FlashLabel.setNativeInstance(txtDialogTitle,_nativeObject.txtDialogTitle);
         if(_nativeObject.btnClose)
         {
            btnClose.setNativeInstance(_nativeObject.btnClose);
         }
         if(_nativeObject.paymentMethodsBackground)
         {
            paymentMethodsBackground.setNativeInstance(_nativeObject.paymentMethodsBackground);
         }
         FlashLabel.setNativeInstance(txtMethodCaption,_nativeObject.txtMethodCaption);
         if(_nativeObject.btnMethod1)
         {
            btnMethod1.setNativeInstance(_nativeObject.btnMethod1);
         }
         if(_nativeObject.btnMethod2)
         {
            btnMethod2.setNativeInstance(_nativeObject.btnMethod2);
         }
         if(_nativeObject.btnMethod3)
         {
            btnMethod3.setNativeInstance(_nativeObject.btnMethod3);
         }
         if(_nativeObject.btnMethod4)
         {
            btnMethod4.setNativeInstance(_nativeObject.btnMethod4);
         }
         if(_nativeObject.btnMethod5)
         {
            btnMethod5.setNativeInstance(_nativeObject.btnMethod5);
         }
         if(_nativeObject.btnMethod6)
         {
            btnMethod6.setNativeInstance(_nativeObject.btnMethod6);
         }
         if(_nativeObject.btnMethod7)
         {
            btnMethod7.setNativeInstance(_nativeObject.btnMethod7);
         }
         if(_nativeObject.teaser)
         {
            teaser.setNativeInstance(_nativeObject.teaser);
         }
         if(_nativeObject.btnMethod8)
         {
            btnMethod8.setNativeInstance(_nativeObject.btnMethod8);
         }
         if(_nativeObject.btnMethod9)
         {
            btnMethod9.setNativeInstance(_nativeObject.btnMethod9);
         }
         FlashLabel.setNativeInstance(txtOfferCaption,_nativeObject.txtOfferCaption);
         if(_nativeObject.btnContinue)
         {
            btnContinue.setNativeInstance(_nativeObject.btnContinue);
         }
         if(_nativeObject.eyes)
         {
            eyes.setNativeInstance(_nativeObject.eyes);
         }
         if(_nativeObject.linkInfoBackground)
         {
            linkInfoBackground.setNativeInstance(_nativeObject.linkInfoBackground);
         }
         FlashLabelArea.setNativeInstance(txtLinkInfo,_nativeObject.txtLinkInfo);
         if(_nativeObject.btnHelp)
         {
            btnHelp.setNativeInstance(_nativeObject.btnHelp);
         }
         if(_nativeObject.localePicker)
         {
            localePicker.setNativeInstance(_nativeObject.localePicker);
         }
         if(_nativeObject.btnPaymentMethodMore)
         {
            btnPaymentMethodMore.setNativeInstance(_nativeObject.btnPaymentMethodMore);
         }
         if(_nativeObject.btnEarnPremiumCurrency)
         {
            btnEarnPremiumCurrency.setNativeInstance(_nativeObject.btnEarnPremiumCurrency);
         }
         FlashLabel.setNativeInstance(txtOfferwallLink,_nativeObject.txtOfferwallLink);
         if(_nativeObject.offerwallClickLayer)
         {
            offerwallClickLayer.setNativeInstance(_nativeObject.offerwallClickLayer);
         }
         if(_nativeObject.option1)
         {
            option1.setNativeInstance(_nativeObject.option1);
         }
         if(_nativeObject.optionSpecial1)
         {
            optionSpecial1.setNativeInstance(_nativeObject.optionSpecial1);
         }
         if(_nativeObject.option2)
         {
            option2.setNativeInstance(_nativeObject.option2);
         }
         if(_nativeObject.option3)
         {
            option3.setNativeInstance(_nativeObject.option3);
         }
         if(_nativeObject.option4)
         {
            option4.setNativeInstance(_nativeObject.option4);
         }
         if(_nativeObject.option5)
         {
            option5.setNativeInstance(_nativeObject.option5);
         }
         if(_nativeObject.option6)
         {
            option6.setNativeInstance(_nativeObject.option6);
         }
         if(_nativeObject.optionSpecial2)
         {
            optionSpecial2.setNativeInstance(_nativeObject.optionSpecial2);
         }
         if(_nativeObject.optionSpecial3)
         {
            optionSpecial3.setNativeInstance(_nativeObject.optionSpecial3);
         }
         if(_nativeObject.optionSpecial4)
         {
            optionSpecial4.setNativeInstance(_nativeObject.optionSpecial4);
         }
         if(_nativeObject.itemOption1)
         {
            itemOption1.setNativeInstance(_nativeObject.itemOption1);
         }
         if(_nativeObject.itemOption4)
         {
            itemOption4.setNativeInstance(_nativeObject.itemOption4);
         }
         if(_nativeObject.itemOption2)
         {
            itemOption2.setNativeInstance(_nativeObject.itemOption2);
         }
         if(_nativeObject.itemOption3)
         {
            itemOption3.setNativeInstance(_nativeObject.itemOption3);
         }
         if(_nativeObject.itemOption5)
         {
            itemOption5.setNativeInstance(_nativeObject.itemOption5);
         }
         if(_nativeObject.itemOption6)
         {
            itemOption6.setNativeInstance(_nativeObject.itemOption6);
         }
         if(_nativeObject.itemOption7)
         {
            itemOption7.setNativeInstance(_nativeObject.itemOption7);
         }
         if(_nativeObject.itemOption8)
         {
            itemOption8.setNativeInstance(_nativeObject.itemOption8);
         }
         if(_nativeObject.backgroundIsGift)
         {
            backgroundIsGift.setNativeInstance(_nativeObject.backgroundIsGift);
         }
         if(_nativeObject.checkIsGift)
         {
            checkIsGift.setNativeInstance(_nativeObject.checkIsGift);
         }
         if(_nativeObject.iconIsGift)
         {
            iconIsGift.setNativeInstance(_nativeObject.iconIsGift);
         }
         if(_nativeObject.btnScrollUp)
         {
            btnScrollUp.setNativeInstance(_nativeObject.btnScrollUp);
         }
         if(_nativeObject.btnScrollDown)
         {
            btnScrollDown.setNativeInstance(_nativeObject.btnScrollDown);
         }
         if(_nativeObject.additionalPaymentMethods)
         {
            additionalPaymentMethods.setNativeInstance(_nativeObject.additionalPaymentMethods);
         }
         if(_nativeObject.avatar)
         {
            avatar.setNativeInstance(_nativeObject.avatar);
         }
      }
   }
}
