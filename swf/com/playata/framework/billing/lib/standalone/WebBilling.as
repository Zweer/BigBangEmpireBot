package com.playata.framework.billing.lib.standalone
{
   import com.playata.application.ui.elements.generic.dialog.UiInfoDialog;
   import com.playata.framework.application.Environment;
   import com.playata.framework.application.request.ActionRequestResponse;
   import com.playata.framework.billing.Billing;
   import com.playata.framework.billing.BillingConfig;
   import com.playata.framework.billing.BillingProductType;
   import com.playata.framework.billing.ConsumableBillingProductInfo;
   import com.playata.framework.billing.IBilling;
   import com.playata.framework.billing.IBillingHandler;
   import com.playata.framework.billing.IBillingProduct;
   import com.playata.framework.billing.PaymentMethod;
   import com.playata.framework.billing.PremiumNormalBillingProductInfo;
   import com.playata.framework.billing.PremiumSpecialBillingProductInfo;
   import com.playata.framework.billing.lib.facebook.FacebookBillingProduct;
   import com.playata.framework.core.TypedObject;
   import com.playata.framework.core.error.Exception;
   import com.playata.framework.core.logging.Logger;
   import com.playata.framework.localization.LocText;
   import com.playata.framework.network.request.RequestData;
   import com.playata.framework.network.request.RequestResponseData;
   import com.playata.framework.platform.PlatformConfig;
   
   public class WebBilling extends Billing implements IBilling
   {
       
      
      protected var _currentPaymentId:int = 0;
      
      public function WebBilling(param1:IBillingHandler)
      {
         super(param1);
      }
      
      public function get hasProductsLoaded() : Boolean
      {
         if(_products == null)
         {
            return false;
         }
         return _products.length > 0;
      }
      
      public function requestProducts(param1:Function = null, param2:Boolean = false, param3:String = null) : void
      {
         var _loc5_:* = null;
         var _loc4_:* = null;
         if(_products != null && _products.length > 0)
         {
            §§push(param1(_products));
            return;
         }
         if(_initializing)
         {
            return;
         }
         _callbackRequestProductsOnComplete = param1;
         _initializing = true;
         if(Environment.platform.isKongregate || Environment.platform.isNaszaKlasa || Environment.platform.isNutaku || Environment.platform.isVkontakte || Environment.platform.isOdnoklassniki || Environment.platform.isEspritGames || Environment.platform.isEroges || Environment.platform.isDraugiem || Environment.platform.isSteam)
         {
            Environment.application.sendActionRequest("getPlatformPaymentOffersNew",RequestData.fromData({"platform":Environment.platform.id}),handleRequests,param2);
         }
         else if(Environment.platform.isFacebook)
         {
            _loc5_ = PlatformConfig.facebookAccessToken;
            _loc4_ = PlatformConfig.ssoInfo;
            Environment.application.sendActionRequest("getFacebookPaymentOffersNew",RequestData.fromData({
               "facebook_access_token":_loc5_,
               "facebook_user_id":_loc4_
            }),handleRequests,param2);
         }
         else
         {
            Environment.application.sendActionRequest("getStandalonePaymentOffers",RequestData.fromData({"locale":param3}),handleRequests,param2);
         }
      }
      
      public function purchaseProduct(param1:IBillingProduct, param2:Function, param3:int = 1, param4:Boolean = false) : void
      {
         var _loc8_:* = null;
         var _loc6_:* = null;
         _callbackPurchaseProductOnComplete = param2;
         var _loc7_:RequestData = RequestData.fromData({
            "payment_method":param1.paymentMethodId,
            "amount":param1.price,
            "currency":param1.currencyCode,
            "locale":param1.locale,
            "is_gift":param4
         });
         if(Environment.platform.isFacebook)
         {
            _loc8_ = PlatformConfig.facebookAccessToken;
            _loc7_.setString("currency","EUR");
            _loc6_ = param1 as FacebookBillingProduct;
            _loc7_.setString("facebook_mobile_pricepoint_id",_loc6_.facebookMobilePricepointId);
            _loc7_.setString("facebook_access_token",_loc8_);
         }
         else if(Environment.platform.isDraugiem)
         {
            _loc7_.setString("custom1",PlatformConfig.draugiemUserKey);
         }
         var _loc5_:BillingProductType = param1.info.type;
         var _loc9_:* = _loc5_;
         switch(_loc9_)
         {
            case BillingProductType.PREMIUM_NORMAL:
               if(Environment.platform.isFacebook)
               {
                  _loc7_.setInt("facebook_premium_currency_amount",(param1.info as PremiumNormalBillingProductInfo).premiumAmount);
                  _loc7_.setInt("facebook_offer_index",(param1 as FacebookBillingProduct).facebookOfferIndex);
               }
               else if(Environment.platform.isSteam)
               {
                  _loc7_.setInt("premium_amount",(param1.info as PremiumNormalBillingProductInfo).premiumAmount);
               }
               Environment.application.sendActionRequest("initPayment",_loc7_,handleRequests);
               break;
            case BillingProductType.PREMIUM_SPECIAL:
               if(Environment.platform.isFacebook)
               {
                  _loc7_.setInt("facebook_premium_currency_amount",(param1.info as PremiumSpecialBillingProductInfo).premiumAmount);
               }
               _loc7_.setInt("premium_amount",(param1.info as PremiumSpecialBillingProductInfo).premiumAmount);
               _loc7_.setString("special_offer_key",(param1.info as PremiumSpecialBillingProductInfo).specialOfferId);
               Environment.application.sendActionRequest("initPayment",_loc7_,handleRequests);
               break;
            case BillingProductType.CONSUMABLE:
               _loc7_.setString("offer_identifier",(param1.info as ConsumableBillingProductInfo).consumableOfferId);
               Environment.application.sendActionRequest("initConsumableOfferPayment",_loc7_,handleRequests);
         }
      }
      
      public function restorePurchases(param1:Function) : void
      {
      }
      
      public function resetProducts() : void
      {
         if(_initializing)
         {
            return;
         }
         _products = null;
      }
      
      public function getPaymentMethods(param1:TypedObject = null) : Vector.<PaymentMethod>
      {
         var _loc6_:* = 0;
         var _loc7_:String = param1 != null && param1.getString("locale")?param1.getString("locale"):Environment.info.defaultLocale;
         var _loc3_:Boolean = param1 != null && param1.getBoolean("filterLinkPaymentMethods");
         var _loc4_:Vector.<PaymentMethod> = new Vector.<PaymentMethod>();
         if(Environment.platform.isKongregate)
         {
            _loc4_.push(new PaymentMethod(new TypedObject({"id":23}),_loc7_));
            return _loc4_;
         }
         if(Environment.platform.isNaszaKlasa)
         {
            _loc4_.push(new PaymentMethod(new TypedObject({"id":43}),_loc7_));
            return _loc4_;
         }
         if(Environment.platform.isNutaku)
         {
            _loc4_.push(new PaymentMethod(new TypedObject({"id":111}),_loc7_));
            return _loc4_;
         }
         if(Environment.platform.isEroges)
         {
            _loc4_.push(new PaymentMethod(new TypedObject({"id":117}),_loc7_));
            return _loc4_;
         }
         if(Environment.platform.isVkontakte)
         {
            _loc4_.push(new PaymentMethod(new TypedObject({"id":93}),_loc7_));
            return _loc4_;
         }
         if(Environment.platform.isOdnoklassniki)
         {
            _loc4_.push(new PaymentMethod(new TypedObject({"id":94}),_loc7_));
            return _loc4_;
         }
         if(Environment.platform.isEspritGames)
         {
            _loc4_.push(new PaymentMethod(new TypedObject({"id":116}),_loc7_));
            return _loc4_;
         }
         if(Environment.platform.isSteam)
         {
            _loc4_.push(new PaymentMethod(new TypedObject({"id":114}),_loc7_));
            return _loc4_;
         }
         if(Environment.platform.isDraugiem)
         {
            _loc4_.push(new PaymentMethod(new TypedObject({"id":112}),_loc7_));
            _loc4_.push(new PaymentMethod(new TypedObject({"id":113}),_loc7_));
            return _loc4_;
         }
         var _loc2_:Array = BillingConfig.paymentMethods;
         var _loc5_:PaymentMethod = null;
         _loc6_ = uint(0);
         while(_loc6_ < _loc2_.length)
         {
            _loc5_ = new PaymentMethod(new TypedObject(_loc2_[_loc6_]),_loc7_);
            if(!(_loc3_ && _loc5_.isLinkMethod))
            {
               if(_loc5_.isAvailable(param1))
               {
                  if(!((_loc5_.id == 27 || _loc5_.id == 42) && !Environment.platform.isFacebook))
                  {
                     if(!(_loc5_.id != 27 && _loc5_.id != 42 && Environment.platform.isFacebook))
                     {
                        _loc4_.push(_loc5_);
                     }
                  }
               }
            }
            _loc6_++;
         }
         _loc4_.sort(sortPaymentMethodsByIndex);
         return _loc4_;
      }
      
      protected function onCreatePurchaseSuccess(param1:Object) : void
      {
         Environment.platform.openBillingDialog(new RequestResponseData(param1),callbackPurchaseProductOnComplete);
      }
      
      protected function onCreatePurchaseFailed() : void
      {
         if(_callbackPurchaseProductOnComplete != null)
         {
            _callbackPurchaseProductOnComplete(false,null);
         }
      }
      
      protected function callbackPurchaseProductOnComplete(param1:Boolean) : void
      {
         Logger.info("[WebBilling] callbackPurchaseProductOnComplete");
         Environment.application.sendActionRequest("getLastPaymentStatusNew",RequestData.fromData({
            "payment_id":_currentPaymentId,
            "callback_status":param1
         }),handleRequests);
      }
      
      protected function onGetPlatformPaymentOffersSuccess(param1:Object) : void
      {
         _products = new Vector.<IBillingProduct>(0);
         var _loc3_:TypedObject = new TypedObject(param1);
         var _loc6_:TypedObject = _loc3_.getTypedObject("normal_offers");
         var _loc5_:TypedObject = _loc3_.getTypedObject("special_offers");
         var _loc4_:TypedObject = _loc3_.getTypedObject("consumable_offers");
         var _loc2_:String = null;
         var _loc8_:int = 0;
         var _loc7_:* = _loc6_.keys;
         for each(_loc2_ in _loc6_.keys)
         {
            _products.push(new WebBillingProduct("premium_normal_" + _loc2_,_handler.createProductInfo(BillingProductType.PREMIUM_NORMAL,_loc6_.getTypedObject(_loc2_)),_loc6_.getTypedObject(_loc2_)));
         }
         var _loc10_:int = 0;
         var _loc9_:* = _loc5_.keys;
         for each(_loc2_ in _loc5_.keys)
         {
            _products.push(new WebBillingProduct("premium_special_" + _loc2_,_handler.createProductInfo(BillingProductType.PREMIUM_SPECIAL,_loc5_.getTypedObject(_loc2_)),_loc5_.getTypedObject(_loc2_)));
         }
         var _loc12_:int = 0;
         var _loc11_:* = _loc4_.keys;
         for each(_loc2_ in _loc4_.keys)
         {
            _products.push(new WebBillingProduct("consumable_" + _loc2_,_handler.createProductInfo(BillingProductType.CONSUMABLE,_loc4_.getTypedObject(_loc2_)),_loc4_.getTypedObject(_loc2_)));
         }
         _handler.sortProducts(_products);
         _initializing = false;
         if(_callbackRequestProductsOnComplete != null)
         {
            _callbackRequestProductsOnComplete(_products);
         }
      }
      
      protected function onGetFacebookPaymentOffersSuccess(param1:Object) : void
      {
         _products = new Vector.<IBillingProduct>(0);
         var _loc3_:TypedObject = new TypedObject(param1);
         var _loc7_:TypedObject = _loc3_.getTypedObject("normal_offers");
         var _loc5_:TypedObject = _loc3_.getTypedObject("mobile_offers");
         var _loc6_:TypedObject = _loc3_.getTypedObject("special_offers");
         var _loc4_:TypedObject = _loc3_.getTypedObject("consumable_offers");
         var _loc2_:String = null;
         var _loc9_:int = 0;
         var _loc8_:* = _loc7_.keys;
         for each(_loc2_ in _loc7_.keys)
         {
            _products.push(new FacebookBillingProduct("premium_normal_" + _loc2_,_handler.createProductInfo(BillingProductType.PREMIUM_NORMAL,_loc7_.getTypedObject(_loc2_)),_loc7_.getTypedObject(_loc2_)));
         }
         var _loc11_:int = 0;
         var _loc10_:* = _loc5_.keys;
         for each(_loc2_ in _loc5_.keys)
         {
            _products.push(new FacebookBillingProduct("premium_normal_mobile_" + _loc2_,_handler.createProductInfo(BillingProductType.PREMIUM_NORMAL,_loc5_.getTypedObject(_loc2_)),_loc5_.getTypedObject(_loc2_)));
         }
         var _loc13_:int = 0;
         var _loc12_:* = _loc6_.keys;
         for each(_loc2_ in _loc6_.keys)
         {
            _products.push(new FacebookBillingProduct("premium_special_" + _loc2_,_handler.createProductInfo(BillingProductType.PREMIUM_SPECIAL,_loc6_.getTypedObject(_loc2_)),_loc6_.getTypedObject(_loc2_)));
         }
         var _loc15_:int = 0;
         var _loc14_:* = _loc4_.keys;
         for each(_loc2_ in _loc4_.keys)
         {
            _products.push(new FacebookBillingProduct("consumable_" + _loc2_,_handler.createProductInfo(BillingProductType.CONSUMABLE,_loc4_.getTypedObject(_loc2_)),_loc4_.getTypedObject(_loc2_)));
         }
         _handler.sortProducts(_products);
         _initializing = false;
         if(_callbackRequestProductsOnComplete != null)
         {
            _callbackRequestProductsOnComplete(_products);
         }
      }
      
      protected function onGetStandalonePaymentOffersSuccess(param1:Object) : void
      {
         _products = new Vector.<IBillingProduct>(0);
         var _loc3_:TypedObject = new TypedObject(param1);
         var _loc6_:TypedObject = _loc3_.getTypedObject("normal_offers");
         var _loc5_:TypedObject = _loc3_.getTypedObject("special_offers");
         var _loc4_:TypedObject = _loc3_.getTypedObject("consumable_offers");
         var _loc2_:String = null;
         var _loc8_:int = 0;
         var _loc7_:* = _loc6_.keys;
         for each(_loc2_ in _loc6_.keys)
         {
            _products.push(new WebBillingProduct("premium_normal_" + _loc2_,_handler.createProductInfo(BillingProductType.PREMIUM_NORMAL,_loc6_.getTypedObject(_loc2_)),_loc6_.getTypedObject(_loc2_)));
         }
         var _loc10_:int = 0;
         var _loc9_:* = _loc5_.keys;
         for each(_loc2_ in _loc5_.keys)
         {
            _products.push(new WebBillingProduct("premium_special_" + _loc2_,_handler.createProductInfo(BillingProductType.PREMIUM_SPECIAL,_loc5_.getTypedObject(_loc2_)),_loc5_.getTypedObject(_loc2_)));
         }
         var _loc12_:int = 0;
         var _loc11_:* = _loc4_.keys;
         for each(_loc2_ in _loc4_.keys)
         {
            _products.push(new WebBillingProduct("consumable_" + _loc2_,_handler.createProductInfo(BillingProductType.CONSUMABLE,_loc4_.getTypedObject(_loc2_)),_loc4_.getTypedObject(_loc2_)));
         }
         if(LocText.current != null && _loc3_.hasData("text"))
         {
            LocText.current.addData(_loc3_.getTypedObject("text"));
         }
         _handler.sortProducts(_products);
         _initializing = false;
         if(_callbackRequestProductsOnComplete != null)
         {
            _callbackRequestProductsOnComplete(_products);
         }
      }
      
      protected function onGetPaymentOffersFailed() : void
      {
         _initializing = false;
         if(_callbackRequestProductsOnComplete != null)
         {
            _callbackRequestProductsOnComplete(_products);
         }
      }
      
      protected function sortPaymentMethodsByIndex(param1:PaymentMethod, param2:PaymentMethod) : int
      {
         if(param1.index < param2.index)
         {
            return -1;
         }
         if(param1.index > param2.index)
         {
            return 1;
         }
         return 0;
      }
      
      protected function handleRequests(param1:ActionRequestResponse) : void
      {
         var _loc2_:Boolean = false;
         var _loc3_:* = param1.action;
         switch(_loc3_)
         {
            case "getPlatformPaymentOffersNew":
               if(!param1.hasError)
               {
                  onGetPlatformPaymentOffersSuccess(param1.data);
               }
               else
               {
                  onGetPaymentOffersFailed();
               }
               break;
            case "getFacebookPaymentOffersNew":
               if(!param1.hasError)
               {
                  onGetFacebookPaymentOffersSuccess(param1.data);
               }
               else
               {
                  onGetPaymentOffersFailed();
               }
               break;
            case "getStandalonePaymentOffers":
               if(!param1.hasError)
               {
                  onGetStandalonePaymentOffersSuccess(param1.data);
               }
               else
               {
                  onGetPaymentOffersFailed();
               }
               break;
            case "initPayment":
            case "initConsumableOfferPayment":
               if(!param1.hasError)
               {
                  _currentPaymentId = param1.data.payment_id as int;
                  onCreatePurchaseSuccess(param1.data);
               }
               else
               {
                  if(param1.error == "errInitPaymentInvalidSpecialOffer")
                  {
                     Environment.billing.resetProducts();
                  }
                  else if(param1.error == "errInitPaymentGeoNotAllowed")
                  {
                     Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("error/billing/geo_not_allowed/title"),LocText.current.text("error/billing/geo_not_allowed/text"),LocText.current.text("general/button_ok")));
                  }
                  onCreatePurchaseFailed();
               }
               break;
            case "getLastPaymentStatusNew":
               if(!param1.hasError)
               {
                  _loc2_ = param1.request.getBoolean("callback_status");
                  if(!_loc2_)
                  {
                     _loc2_ = param1.data.last_payment_confirmed;
                  }
                  if(_callbackPurchaseProductOnComplete != null)
                  {
                     _callbackPurchaseProductOnComplete(_loc2_,param1.data);
                  }
               }
               else
               {
                  onCreatePurchaseFailed();
               }
               break;
            default:
               throw new Exception("Unsupported request action \'" + param1.action + "\'!");
         }
      }
   }
}
