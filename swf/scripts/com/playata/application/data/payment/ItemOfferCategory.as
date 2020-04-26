package com.playata.application.data.payment
{
   import com.playata.application.billing.AppConsumableBillingProductInfo;
   import com.playata.application.data.user.User;
   import com.playata.application.platform.ServerInfo;
   import com.playata.framework.billing.ConsumableBillingProductInfo;
   import com.playata.framework.billing.IBillingProduct;
   import com.playata.framework.data.DataObject;
   import com.playata.framework.localization.LocText;
   
   public class ItemOfferCategory extends DataObject
   {
       
      
      public function ItemOfferCategory(param1:String, param2:Object)
      {
         super(param2);
         setData("identifier",param1);
      }
      
      public function get identifier() : String
      {
         return getString("identifier");
      }
      
      public function get index() : int
      {
         return getInt("index");
      }
      
      public function get name() : String
      {
         return LocText.current.text("payment/item_offer_category/" + identifier + "/name");
      }
      
      public function get description() : String
      {
         return LocText.current.text("payment/item_offer_category/" + identifier + "/description");
      }
      
      public function get offerBackgroundImage() : String
      {
         var _loc1_:String = getString("offer_background");
         return ServerInfo.assetURL("item_offers/" + _loc1_,null);
      }
      
      public function hasActiveOffers(param1:Vector.<IBillingProduct>) : Boolean
      {
         var _loc2_:* = null;
         if(!param1 || param1.length == 0)
         {
            return false;
         }
         var _loc5_:int = 0;
         var _loc4_:* = param1;
         for each(var _loc3_ in param1)
         {
            if(_loc3_.info is ConsumableBillingProductInfo)
            {
               _loc2_ = _loc3_.info as AppConsumableBillingProductInfo;
               if(_loc2_.category == this.identifier)
               {
                  if(_loc2_.isAvailable(User.current.character.level))
                  {
                     return true;
                  }
               }
            }
         }
         return false;
      }
      
      public function get tabBackgroundImage() : String
      {
         var _loc1_:String = getString("tab_background");
         return ServerInfo.assetURL("item_offers/" + _loc1_,null);
      }
   }
}
