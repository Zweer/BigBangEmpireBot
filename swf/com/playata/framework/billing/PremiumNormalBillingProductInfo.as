package com.playata.framework.billing
{
   import com.playata.framework.core.TypedObject;
   
   public class PremiumNormalBillingProductInfo implements IBillingProductInfo
   {
       
      
      protected var _premiumAmount:int = 0;
      
      protected var _index:int = 0;
      
      protected var _limit:int = 0;
      
      protected var _name:String = null;
      
      protected var _description:String = null;
      
      public function PremiumNormalBillingProductInfo(param1:TypedObject)
      {
         super();
         _premiumAmount = param1.getTypedObject("content").getInt("premium_amount");
         var _loc2_:TypedObject = param1.getTypedObject("display_info");
         _index = _loc2_.getInt("index");
         _limit = _loc2_.getInt("limit");
         _name = _loc2_.getString("name");
         _description = _loc2_.getString("description");
      }
      
      public function get type() : BillingProductType
      {
         return BillingProductType.PREMIUM_NORMAL;
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
   }
}
