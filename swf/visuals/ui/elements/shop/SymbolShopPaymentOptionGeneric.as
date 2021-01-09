package visuals.ui.elements.shop
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabelArea;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabelArea;
   import flash.display.MovieClip;
   import visuals.ui.base.SymbolDummyGeneric;
   import visuals.ui.base.SymbolPlaceholderGeneric;
   import visuals.ui.elements.payment.SymbolPaymentMethodSelectedGeneric;
   import visuals.ui.elements.payment.SymbolPaymentOfferSavePercentageGeneric;
   import visuals.ui.elements.payment.SymbolPaymentOptionSwishGeneric;
   
   public class SymbolShopPaymentOptionGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolShopPaymentOption = null;
      
      public var backgroundNormal:SymbolShopBackgroundOptionNormalGeneric = null;
      
      public var backgroundSpecialGeneric:SymbolShopBackgroundOptionSpecialGenericGeneric = null;
      
      public var backgroundSpecialCustom:SymbolDummyGeneric = null;
      
      public var backgroundUnselected:SymbolShopBackgroundUnselectedGeneric = null;
      
      public var backgroundSelected:SymbolShopBackgroundSelectedGeneric = null;
      
      public var framePurple:SymbolPaymentOptionFramePurpleGeneric = null;
      
      public var frameGolden:SymbolPaymentOptionFrameGoldenGeneric = null;
      
      public var swish:SymbolPaymentOptionSwishGeneric = null;
      
      public var special:SymbolPlaceholderGeneric = null;
      
      public var icon1:SymbolShopIconOption1Generic = null;
      
      public var icon2:SymbolShopIconOption2Generic = null;
      
      public var icon3:SymbolShopIconOption3Generic = null;
      
      public var icon4:SymbolShopIconOption4Generic = null;
      
      public var icon5:SymbolShopIconOption5Generic = null;
      
      public var icon6:SymbolShopIconOption6Generic = null;
      
      public var txtAmount:ILabelArea = null;
      
      public var txtPrice:ILabelArea = null;
      
      public var selected:SymbolPaymentMethodSelectedGeneric = null;
      
      public var txtAmountSpecial:ILabelArea = null;
      
      public var txtNameSpecial:ILabelArea = null;
      
      public var savePercentage:SymbolPaymentOfferSavePercentageGeneric = null;
      
      public function SymbolShopPaymentOptionGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolShopPaymentOption;
         }
         else
         {
            _nativeObject = new SymbolShopPaymentOption();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         backgroundNormal = new SymbolShopBackgroundOptionNormalGeneric(_nativeObject.backgroundNormal);
         backgroundSpecialGeneric = new SymbolShopBackgroundOptionSpecialGenericGeneric(_nativeObject.backgroundSpecialGeneric);
         backgroundSpecialCustom = new SymbolDummyGeneric(_nativeObject.backgroundSpecialCustom);
         backgroundUnselected = new SymbolShopBackgroundUnselectedGeneric(_nativeObject.backgroundUnselected);
         backgroundSelected = new SymbolShopBackgroundSelectedGeneric(_nativeObject.backgroundSelected);
         framePurple = new SymbolPaymentOptionFramePurpleGeneric(_nativeObject.framePurple);
         frameGolden = new SymbolPaymentOptionFrameGoldenGeneric(_nativeObject.frameGolden);
         swish = new SymbolPaymentOptionSwishGeneric(_nativeObject.swish);
         special = new SymbolPlaceholderGeneric(_nativeObject.special);
         icon1 = new SymbolShopIconOption1Generic(_nativeObject.icon1);
         icon2 = new SymbolShopIconOption2Generic(_nativeObject.icon2);
         icon3 = new SymbolShopIconOption3Generic(_nativeObject.icon3);
         icon4 = new SymbolShopIconOption4Generic(_nativeObject.icon4);
         icon5 = new SymbolShopIconOption5Generic(_nativeObject.icon5);
         icon6 = new SymbolShopIconOption6Generic(_nativeObject.icon6);
         txtAmount = FlashLabelArea.fromNative(_nativeObject.txtAmount);
         txtPrice = FlashLabelArea.fromNative(_nativeObject.txtPrice);
         selected = new SymbolPaymentMethodSelectedGeneric(_nativeObject.selected);
         txtAmountSpecial = FlashLabelArea.fromNative(_nativeObject.txtAmountSpecial);
         txtNameSpecial = FlashLabelArea.fromNative(_nativeObject.txtNameSpecial);
         savePercentage = new SymbolPaymentOfferSavePercentageGeneric(_nativeObject.savePercentage);
      }
      
      public function setNativeInstance(param1:SymbolShopPaymentOption) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.backgroundNormal)
         {
            backgroundNormal.setNativeInstance(_nativeObject.backgroundNormal);
         }
         if(_nativeObject.backgroundSpecialGeneric)
         {
            backgroundSpecialGeneric.setNativeInstance(_nativeObject.backgroundSpecialGeneric);
         }
         if(_nativeObject.backgroundSpecialCustom)
         {
            backgroundSpecialCustom.setNativeInstance(_nativeObject.backgroundSpecialCustom);
         }
         if(_nativeObject.backgroundUnselected)
         {
            backgroundUnselected.setNativeInstance(_nativeObject.backgroundUnselected);
         }
         if(_nativeObject.backgroundSelected)
         {
            backgroundSelected.setNativeInstance(_nativeObject.backgroundSelected);
         }
         if(_nativeObject.framePurple)
         {
            framePurple.setNativeInstance(_nativeObject.framePurple);
         }
         if(_nativeObject.frameGolden)
         {
            frameGolden.setNativeInstance(_nativeObject.frameGolden);
         }
         if(_nativeObject.swish)
         {
            swish.setNativeInstance(_nativeObject.swish);
         }
         if(_nativeObject.special)
         {
            special.setNativeInstance(_nativeObject.special);
         }
         if(_nativeObject.icon1)
         {
            icon1.setNativeInstance(_nativeObject.icon1);
         }
         if(_nativeObject.icon2)
         {
            icon2.setNativeInstance(_nativeObject.icon2);
         }
         if(_nativeObject.icon3)
         {
            icon3.setNativeInstance(_nativeObject.icon3);
         }
         if(_nativeObject.icon4)
         {
            icon4.setNativeInstance(_nativeObject.icon4);
         }
         if(_nativeObject.icon5)
         {
            icon5.setNativeInstance(_nativeObject.icon5);
         }
         if(_nativeObject.icon6)
         {
            icon6.setNativeInstance(_nativeObject.icon6);
         }
         FlashLabelArea.setNativeInstance(txtAmount,_nativeObject.txtAmount);
         FlashLabelArea.setNativeInstance(txtPrice,_nativeObject.txtPrice);
         if(_nativeObject.selected)
         {
            selected.setNativeInstance(_nativeObject.selected);
         }
         FlashLabelArea.setNativeInstance(txtAmountSpecial,_nativeObject.txtAmountSpecial);
         FlashLabelArea.setNativeInstance(txtNameSpecial,_nativeObject.txtNameSpecial);
         if(_nativeObject.savePercentage)
         {
            savePercentage.setNativeInstance(_nativeObject.savePercentage);
         }
      }
   }
}
