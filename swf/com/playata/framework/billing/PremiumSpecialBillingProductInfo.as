package com.playata.framework.billing
{
   import com.playata.framework.core.TypedObject;
   import com.playata.framework.core.util.DateTime;
   
   public class PremiumSpecialBillingProductInfo implements IBillingProductInfo
   {
       
      
      protected var _specialOfferId:String = null;
      
      protected var _premiumAmount:int = 0;
      
      protected var _index:int = 0;
      
      protected var _limit:int = 0;
      
      protected var _name:String = null;
      
      protected var _description:String = null;
      
      protected var _availableTimeStart:String = null;
      
      protected var _availableTimeEnd:String = null;
      
      public function PremiumSpecialBillingProductInfo(param1:TypedObject)
      {
         super();
         _specialOfferId = param1.getString("special_offer_id");
         _premiumAmount = param1.getTypedObject("content").getInt("premium_amount");
         var _loc2_:TypedObject = param1.getTypedObject("display_info");
         _index = _loc2_.getInt("index");
         _limit = _loc2_.getInt("limit");
         _name = _loc2_.getString("name");
         _description = _loc2_.getString("description");
         _availableTimeStart = _loc2_.getString("available_time_start");
         _availableTimeEnd = _loc2_.getString("available_time_end");
      }
      
      public function get type() : BillingProductType
      {
         return BillingProductType.PREMIUM_SPECIAL;
      }
      
      public function get specialOfferId() : String
      {
         return _specialOfferId;
      }
      
      public function get premiumAmount() : int
      {
         return _premiumAmount;
      }
      
      public function get index() : int
      {
         return _index;
      }
      
      public function get limit() : int
      {
         return _limit;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get description() : String
      {
         return _description;
      }
      
      public function get availableTimeStart() : DateTime
      {
         var _loc1_:String = _availableTimeStart;
         if(!_loc1_)
         {
            return null;
         }
         return DateTime.fromStringServer(_loc1_);
      }
      
      public function get availableTimeEnd() : DateTime
      {
         var _loc1_:String = _availableTimeEnd;
         if(!_loc1_)
         {
            return null;
         }
         return DateTime.fromStringServer(_loc1_);
      }
      
      public function get availableTimeStartString() : String
      {
         return _availableTimeStart;
      }
      
      public function get availableTimeEndString() : String
      {
         return _availableTimeEnd;
      }
   }
}
