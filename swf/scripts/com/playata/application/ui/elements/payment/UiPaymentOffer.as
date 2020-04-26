package com.playata.application.ui.elements.payment
{
   import com.greensock.easing.Elastic;
   import com.playata.application.billing.AppPremiumSpecialBillingProductInfo;
   import com.playata.application.ui.dialogs.DialogPaymentBase;
   import com.playata.application.ui.effects.SwishEffect;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.framework.billing.IBillingProduct;
   import com.playata.framework.billing.PremiumNormalBillingProductInfo;
   import com.playata.framework.billing.PremiumSpecialBillingProductInfo;
   import com.playata.framework.core.Core;
   import com.playata.framework.core.TypedObject;
   import com.playata.framework.core.util.NumberUtil;
   import com.playata.framework.display.IImage;
   import com.playata.framework.display.filter.GrayscaleFilter;
   import com.playata.framework.display.ui.Align;
   import com.playata.framework.display.ui.controls.ILabel;
   import com.playata.framework.localization.LocText;
   import visuals.ui.elements.payment.SymbolPaymentOfferSavePercentageGeneric;
   import visuals.ui.elements.shop.SymbolShopPaymentOptionGeneric;
   
   public class UiPaymentOffer extends UiButton
   {
      
      private static var _specialOfferButtons:Vector.<SymbolPaymentOfferSavePercentageGeneric> = new Vector.<SymbolPaymentOfferSavePercentageGeneric>(0);
       
      
      private var _offerContent:SymbolShopPaymentOptionGeneric = null;
      
      private var _offerIndex:int = -1;
      
      private var _product:IBillingProduct = null;
      
      private var _savePercentage:Number = -1;
      
      private var _swishEffect:SwishEffect = null;
      
      public function UiPaymentOffer(param1:SymbolShopPaymentOptionGeneric, param2:int, param3:Function)
      {
         super(param1,"",param3);
         _offerContent = param1;
         _offerIndex = param2;
         _offerContent.icon1.visible = param2 == 0;
         _offerContent.icon2.visible = param2 == 1;
         _offerContent.icon3.visible = param2 == 2;
         _offerContent.icon4.visible = param2 == 3;
         _offerContent.icon5.visible = param2 == 4;
         _offerContent.icon6.visible = param2 == 5;
         _offerContent.txtAmount.visible = param2 < 6;
         _offerContent.txtPrice.visible = param2 < 6;
         _offerContent.special.visible = param2 >= 6;
         _offerContent.backgroundSpecialCustom.visible = param2 >= 6;
         _offerContent.backgroundSpecialGeneric.visible = param2 >= 6;
         _offerContent.backgroundNormal.visible = param2 < 6;
         _offerContent.backgroundSelected.visible = false;
         _offerContent.selected.visible = false;
         _offerContent.txtAmountSpecial.visible = false;
         _offerContent.txtNameSpecial.visible = false;
         _offerContent.frameGolden.visible = false;
         _offerContent.framePurple.visible = false;
         _offerContent.swish.visible = false;
         var _loc4_:IImage = null;
         _swishEffect = new SwishEffect(_offerContent.swish.swish,100,0.6,3,true,_loc4_);
         _offerContent.backgroundSelected.gotoAndStop(1);
         _offerContent.backgroundUnselected.gotoAndStop(1);
         _offerContent.special.removeAllChildren();
         _offerContent.backgroundSpecialCustom.removeAllChildren();
         visible = false;
      }
      
      public static function resetSpecialOfferAnimation() : void
      {
         var _loc3_:int = 0;
         var _loc2_:* = _specialOfferButtons;
         for each(var _loc1_ in _specialOfferButtons)
         {
            _loc1_.killTweens();
         }
         _specialOfferButtons.length = 0;
      }
      
      public static function playSpecialOfferAnimation() : void
      {
         var _loc1_:* = 0.7;
         var _loc5_:int = 0;
         var _loc4_:* = _specialOfferButtons;
         for each(var _loc2_ in _specialOfferButtons)
         {
            var _loc3_:int = 0;
            _loc2_.scaleY = _loc3_;
            _loc2_.scaleX = _loc3_;
            _loc2_.visible = true;
            _loc2_.tweenTo(1,{
               "delay":_loc1_,
               "scaleX":1,
               "scaleY":1,
               "ease":Elastic.easeOut
            });
            _loc1_ = Number(_loc1_ + 0.2);
         }
      }
      
      override public function dispose() : void
      {
         _offerContent = null;
         _swishEffect.dispose();
         super.dispose();
      }
      
      public function get offerContent() : SymbolShopPaymentOptionGeneric
      {
         return _offerContent;
      }
      
      public function showSwish(param1:Boolean) : void
      {
         _offerContent.swish.visible = param1;
         if(param1)
         {
            _swishEffect.play();
         }
         else
         {
            _swishEffect.stop();
         }
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
         if(!_offerContent.frameGolden.visible && !_offerContent.framePurple.visible)
         {
            _offerContent.backgroundSelected.visible = param1;
         }
         _offerContent.selected.visible = param1;
      }
      
      public function get isSpecialOffer() : Boolean
      {
         if(!_product)
         {
            return false;
         }
         return _product.info is PremiumSpecialBillingProductInfo;
      }
      
      public function set product(param1:IBillingProduct) : void
      {
         _product = param1;
         _savePercentage = -1;
         if(!_product)
         {
            visible = false;
            return;
         }
         visible = true;
         if(_product.info is PremiumNormalBillingProductInfo)
         {
            setNormalOfferData(_product.info as PremiumNormalBillingProductInfo);
         }
         else if(_product.info is PremiumSpecialBillingProductInfo)
         {
            setSpecialOfferData(_product.info as AppPremiumSpecialBillingProductInfo);
         }
      }
      
      public function get product() : IBillingProduct
      {
         return _product;
      }
      
      public function refreshBonusInfo() : void
      {
         if(!_product)
         {
            return;
         }
         if(_enabled && savePercentage > 0)
         {
            _offerContent.savePercentage.visible = false;
            _offerContent.savePercentage.txtSavePercentage.text = "+" + savePercentage + "%";
            _specialOfferButtons.push(_offerContent.savePercentage);
         }
         else
         {
            _offerContent.savePercentage.visible = false;
         }
      }
      
      private function setNormalOfferData(param1:PremiumNormalBillingProductInfo) : void
      {
         var _loc2_:String = getNormalOfferTooltip();
         if(_loc2_)
         {
            if(_offerIndex == 2)
            {
               _loc2_ = LocText.current.text("dialog/buy_premium_currency/most_bough") + "!\n\n" + _loc2_;
            }
            if(_offerIndex == 5)
            {
               _loc2_ = LocText.current.text("dialog/buy_premium_currency/best_offer") + "!\n\n" + _loc2_;
            }
         }
         tooltip = _loc2_;
         _offerContent.txtPrice.fontSize = 16;
         _offerContent.txtAmount.text = LocText.current.formatHugeNumber(param1.premiumAmount);
         _offerContent.txtAmount.autoFontSize = true;
         _offerContent.txtPrice.text = _product.priceString;
         _offerContent.txtPrice.autoFontSize = true;
         _offerContent.txtPrice.x = -45;
         _offerContent.savePercentage.x = 24;
         _offerContent.savePercentage.y = -33;
         _offerContent.backgroundSelected.gotoAndStop(1);
         _offerContent.backgroundUnselected.gotoAndStop(1);
         var _loc3_:Boolean = false;
         _offerContent.backgroundSpecialGeneric.visible = _loc3_;
         _offerContent.backgroundSpecialCustom.visible = _loc3_;
         _offerContent.backgroundNormal.visible = true;
      }
      
      private function setSpecialOfferData(param1:AppPremiumSpecialBillingProductInfo) : void
      {
         _offerContent.txtNameSpecial.visible = true;
         _offerContent.txtNameSpecial.fontSize = 14;
         _offerContent.txtNameSpecial.text = param1.name;
         _offerContent.txtNameSpecial.autoFontSize = true;
         _offerContent.txtPrice.visible = true;
         _offerContent.txtPrice.fontSize = 16;
         _offerContent.txtPrice.text = _product.priceString;
         _offerContent.txtPrice.autoFontSize = true;
         _offerContent.txtAmountSpecial.visible = true;
         _offerContent.txtAmountSpecial.text = LocText.current.formatHugeNumber(param1.premiumAmount);
         _offerContent.txtAmountSpecial.autoFontSize = true;
         tooltip = param1.description;
         setGlowColor(_offerContent.txtAmountSpecial,param1.amountOutlineColor);
         setBackgroundImage(param1.offerImage,param1.backgroundImage);
         _offerContent.txtPrice.x = 10;
         _offerContent.savePercentage.x = 90;
         _offerContent.savePercentage.y = -63;
         _offerContent.backgroundSelected.gotoAndStop(2);
         _offerContent.backgroundUnselected.gotoAndStop(2);
         _offerContent.backgroundNormal.visible = false;
         _offerContent.txtPrice.hAlign = Align.CENTER;
      }
      
      private function setBackgroundImage(param1:String, param2:String) : void
      {
         _offerContent.special.setUriSprite(param1,164,140,true,4,null,true);
         if(param2)
         {
            _offerContent.backgroundSpecialCustom.visible = true;
            _offerContent.backgroundSpecialGeneric.visible = false;
            _offerContent.backgroundSpecialCustom.setUriSprite(param2,164,140,true,4,null,true);
         }
         else
         {
            _offerContent.backgroundSpecialCustom.visible = false;
            _offerContent.backgroundSpecialGeneric.visible = true;
         }
      }
      
      private function getNormalOfferTooltip() : String
      {
         if(savePercentage == 0)
         {
            return "";
         }
         return LocText.current.text("dialog/buy_premium_currency/info",savePercentage);
      }
      
      private function setGlowColor(param1:ILabel, param2:uint) : void
      {
      }
      
      private function get savePercentage() : Number
      {
         var _loc1_:* = NaN;
         var _loc2_:* = null;
         var _loc3_:* = null;
         try
         {
            if(_savePercentage > -1)
            {
               var _loc5_:* = _savePercentage;
               return _loc5_;
            }
            _loc1_ = 0;
            if(_product.info is PremiumNormalBillingProductInfo)
            {
               _loc2_ = _product.info as PremiumNormalBillingProductInfo;
               _loc1_ = Number(getSavePercentage(_loc2_.premiumAmount,_product.price));
            }
            else if(_product.info is PremiumSpecialBillingProductInfo)
            {
               _loc3_ = _product.info as PremiumSpecialBillingProductInfo;
               _loc1_ = Number(getSavePercentage(_loc3_.premiumAmount,_product.price));
            }
            _savePercentage = _loc1_;
            var _loc6_:* = _savePercentage;
            return _loc6_;
            return;
         }
         catch(e:Error)
         {
            var _loc7_:int = 0;
            return _loc7_;
         }
      }
      
      private function getSavePercentage(param1:int, param2:Number) : Number
      {
         var _loc3_:String = DialogPaymentBase.currentPaymentLocale;
         var _loc9_:int = DialogPaymentBase.currentPaymentMethod.baseOption;
         var _loc6_:TypedObject = Core.config.getTypedObject("payment_currencies").getTypedObject(_loc3_);
         var _loc4_:Number = _loc6_.getTypedObject("rates").getNumber(DialogPaymentBase.currentPaymentMethod.baseOption.toString());
         if(_loc9_ >= param1)
         {
            return 0;
         }
         var _loc8_:Number = _loc9_ / param1;
         var _loc7_:Number = param2 * _loc8_;
         var _loc5_:Number = Math.round((1 - _loc4_ / _loc7_) * -100);
         if(_loc3_ == "pl_PL")
         {
            _loc5_ = NumberUtil.roundToNearest(10,_loc5_);
         }
         else
         {
            _loc5_ = NumberUtil.roundToNearest(5,_loc5_);
         }
         if(_loc5_ <= 0)
         {
            return 0;
         }
         if(isNaN(_loc5_))
         {
            return 0;
         }
         return _loc5_;
      }
   }
}
