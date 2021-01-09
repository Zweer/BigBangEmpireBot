package com.playata.framework.billing
{
   import com.playata.application.ui.dialogs.DialogPaymentBase;
   import com.playata.framework.application.Environment;
   import com.playata.framework.assets.Assets;
   import com.playata.framework.core.TypedObject;
   import com.playata.framework.data.DataObject;
   import com.playata.framework.localization.LocText;
   
   public class PaymentMethod extends DataObject
   {
       
      
      private var _locale:String = null;
      
      private var _localeData:TypedObject = null;
      
      public function PaymentMethod(param1:TypedObject, param2:String)
      {
         super(param1.rawData);
         _locale = param2;
         var _loc3_:TypedObject = param1.getTypedObject("amounts");
         if(_loc3_ != null && _loc3_.hasData(_locale))
         {
            _localeData = _loc3_.getTypedObject(_locale);
         }
      }
      
      public static function isGeoBlocked(param1:int, param2:String) : Boolean
      {
         var _loc4_:* = null;
         var _loc5_:Object = BillingConfig.paymentGeoBlocks;
         var _loc7_:int = 0;
         var _loc6_:* = _loc5_;
         for(var _loc3_ in _loc5_)
         {
            if(param2 == _loc3_)
            {
               _loc4_ = _loc5_[_loc3_];
               if(_loc4_.indexOf(param1) != -1)
               {
                  return true;
               }
            }
         }
         return false;
      }
      
      public function get id() : int
      {
         return getInt("id");
      }
      
      public function get name() : String
      {
         if(hasData("name"))
         {
            return getString("name");
         }
         if(LocText.current == null)
         {
            return "";
         }
         var _loc1_:String = "payment/method/" + id;
         return LocText.current.text(_loc1_);
      }
      
      public function get description() : String
      {
         if(hasData("description"))
         {
            return getString("description");
         }
         if(LocText.current == null)
         {
            return "";
         }
         var _loc1_:String = "payment/method/" + id + "/info";
         return LocText.current.text(_loc1_);
      }
      
      public function get locale() : String
      {
         return _locale;
      }
      
      public function isAvailable(param1:TypedObject = null) : Boolean
      {
         var _loc5_:* = null;
         var _loc4_:* = _localeData != null;
         var _loc2_:String = param1 != null && param1.getString("countryCode")?param1.getString("countryCode"):null;
         var _loc7_:String = param1 != null && param1.getString("ref")?param1.getString("ref"):null;
         if(!_loc4_)
         {
            return false;
         }
         if(isGeoBlocked(this.id,_loc2_))
         {
            return false;
         }
         var _loc6_:Object = BillingConfig.paymentMethodFilter;
         var _loc9_:int = 0;
         var _loc8_:* = _loc6_;
         for each(var _loc3_ in _loc6_)
         {
            _loc5_ = new TypedObject(_loc3_);
            if(_loc5_.getBoolean("active") == true)
            {
               if(!(!Environment.info.isTestMode && _loc5_.getBoolean("test") == true))
               {
                  if(!(_loc5_.hasData("locales") && _loc5_.getArray("locales").indexOf(locale) == -1))
                  {
                     if(_loc5_.getBoolean("exclude") != true)
                     {
                        if(!(!_loc7_ || _loc5_.hasData("refs") && _loc5_.getArray("refs").indexOf(_loc7_) == -1))
                        {
                           return _loc5_.getArray("payment_methods").indexOf(id) != -1;
                        }
                     }
                     else if(!(_loc7_ && _loc5_.hasData("refs") && _loc5_.getArray("refs").indexOf(_loc7_) != -1))
                     {
                        return _loc5_.getArray("payment_methods").indexOf(id) == -1;
                     }
                  }
               }
            }
         }
         return true;
      }
      
      public function get iconImageUrl() : String
      {
         var _loc1_:String = "";
         if(locale == "es_MX")
         {
            if(id == 18 || id == 19)
            {
               _loc1_ = "_es_MX";
            }
         }
         return Assets.assetURL("payment_providers/payment_method" + id + _loc1_,"png");
      }
      
      public function get link() : String
      {
         return getString("link");
      }
      
      public function get isLinkMethod() : Boolean
      {
         if(!hasData("options"))
         {
            return false;
         }
         return getString("options") == "link";
      }
      
      public function get index() : int
      {
         return _localeData.getInt("index",99);
      }
      
      public function get baseOption() : int
      {
         var _loc1_:String = DialogPaymentBase.currentPaymentLocale;
         return _data["base_options"][_loc1_] as int;
      }
   }
}
