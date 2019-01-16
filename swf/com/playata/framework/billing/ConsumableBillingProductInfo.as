package com.playata.framework.billing
{
   import com.playata.framework.core.TypedObject;
   import com.playata.framework.core.util.DateTime;
   
   public class ConsumableBillingProductInfo implements IBillingProductInfo
   {
       
      
      protected var _consumableOfferId:String = null;
      
      protected var _content:TypedObject = null;
      
      protected var _index:int = 0;
      
      protected var _limit:int = 0;
      
      protected var _name:String = null;
      
      protected var _description:String = null;
      
      protected var _availableTimeStart:String = null;
      
      protected var _availableTimeEnd:String = null;
      
      public function ConsumableBillingProductInfo(param1:TypedObject)
      {
         super();
         _consumableOfferId = param1.getString("consumable_offer_id");
         _content = param1.getTypedObject("content");
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
         return BillingProductType.CONSUMABLE;
      }
      
      public function get consumableOfferId() : String
      {
         return _consumableOfferId;
      }
      
      public function get content() : TypedObject
      {
         return _content;
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
