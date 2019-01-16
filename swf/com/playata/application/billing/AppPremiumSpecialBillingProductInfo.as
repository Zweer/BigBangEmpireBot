package com.playata.application.billing
{
   import com.playata.application.data.AppDateTime;
   import com.playata.application.platform.ServerInfo;
   import com.playata.framework.application.Environment;
   import com.playata.framework.billing.PremiumSpecialBillingProductInfo;
   import com.playata.framework.core.TypedObject;
   import com.playata.framework.core.util.DateTime;
   import com.playata.framework.core.util.StringUtil;
   import com.playata.framework.core.util.TimeUtil;
   import com.playata.framework.localization.LocText;
   
   public class AppPremiumSpecialBillingProductInfo extends PremiumSpecialBillingProductInfo
   {
       
      
      private var _minLevel:int = 0;
      
      private var _isCharityOffer:Boolean = false;
      
      private var _modifyBuyButton:Boolean = false;
      
      private var _displayHintImage:String = null;
      
      private var _displayOfferImage:String = null;
      
      private var _displayBackgroundImage:String = null;
      
      private var _displayOutlineColor:String = null;
      
      public function AppPremiumSpecialBillingProductInfo(param1:TypedObject)
      {
         super(param1);
         _minLevel = param1.getInt("min_level");
         _isCharityOffer = param1.getBoolean("charity_offer");
         var _loc2_:TypedObject = param1.getTypedObject("display_info");
         _modifyBuyButton = _loc2_.getBoolean("modify_buy_button");
         _displayHintImage = _loc2_.getString("hint");
         _displayOfferImage = _loc2_.getString("image");
         _displayBackgroundImage = _loc2_.getString("background");
         _displayOutlineColor = _loc2_.getString("outline_color");
      }
      
      override public function get description() : String
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc1_:String = super.description;
         if(availableTimeStart && availableTimeEnd)
         {
            _loc2_ = availableTimeStart.format(AppDateTime.dateFormat,Environment.info.defaultLocale);
            _loc3_ = availableTimeEnd.format(AppDateTime.dateFormat,Environment.info.defaultLocale);
            _loc1_ = StringUtil.replace(_loc1_,"<date_start>",_loc2_);
            _loc1_ = StringUtil.replace(_loc1_,"<date_end>",_loc3_);
            if(limit && limit < 999)
            {
               if(availableTimeStart.date == availableTimeEnd.date)
               {
                  _loc1_ = _loc1_ + ("\n\n" + LocText.current.text("payment/special_offer/limited_today",limit,_loc2_));
               }
               else
               {
                  _loc1_ = _loc1_ + ("\n\n" + LocText.current.text("payment/special_offer/limited_date_range",limit,_loc2_,_loc3_));
               }
            }
            else if(availableTimeStart.date == availableTimeEnd.date)
            {
               _loc1_ = _loc1_ + ("\n\n" + LocText.current.text("payment/special_offer/unlimited_today",_loc2_));
            }
            else
            {
               _loc1_ = _loc1_ + ("\n\n" + LocText.current.text("payment/special_offer/unlimited_date_range",_loc2_,_loc3_));
            }
         }
         else if(limit && limit < 999)
         {
            _loc1_ = _loc1_ + ("\n\n" + LocText.current.text("payment/special_offer/limited_without_date",limit));
         }
         return _loc1_;
      }
      
      public function get minLevel() : int
      {
         return _minLevel;
      }
      
      public function get isCharityOffer() : Boolean
      {
         return _isCharityOffer;
      }
      
      public function get modifyBuyButton() : Boolean
      {
         return _modifyBuyButton;
      }
      
      public function get amountOutlineColor() : uint
      {
         if(!_displayOutlineColor)
         {
            return 13113184;
         }
         return StringUtil.hexColorToUint(_displayOutlineColor);
      }
      
      public function get buyButtonGraphicHintImage() : String
      {
         if(!modifyBuyButton)
         {
            return null;
         }
         return ServerInfo.assetURL("special_offers/" + _displayHintImage,null);
      }
      
      public function get offerImage() : String
      {
         return ServerInfo.assetURL("special_offers/" + _displayOfferImage,null);
      }
      
      public function get backgroundImage() : String
      {
         if(_displayBackgroundImage == null)
         {
            return _displayBackgroundImage;
         }
         return ServerInfo.assetURL("special_offers/" + _displayBackgroundImage,null);
      }
      
      public function isAvailable(param1:int) : Boolean
      {
         if(availableTimeStart)
         {
            if(availableTimeStart.timestamp > TimeUtil.now)
            {
               return false;
            }
         }
         if(availableTimeEnd)
         {
            if(availableTimeEnd.timestamp < TimeUtil.now)
            {
               return false;
            }
         }
         if(minLevel > param1)
         {
            return false;
         }
         return true;
      }
      
      public function get remainingSeconds() : int
      {
         if(!availableTimeEnd)
         {
            return 0;
         }
         return int(Math.max(0,availableTimeEnd.timestamp - TimeUtil.now));
      }
      
      public function get timeRemainingString() : String
      {
         var _loc2_:Number = remainingSeconds;
         var _loc1_:Vector.<int> = new Vector.<int>(0);
         _loc1_.push(Math.floor(_loc2_ / 86400));
         _loc1_.push(Math.floor(_loc2_ / 3600 % 24));
         if(_loc1_[0] > 0)
         {
            return TimeUtil.getDayString(_loc1_[0]) + ", " + TimeUtil.getHourString(_loc1_[1]);
         }
         return TimeUtil.secondsToString(remainingSeconds,true,true);
      }
   }
}
