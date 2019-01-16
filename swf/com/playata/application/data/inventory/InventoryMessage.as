package com.playata.application.data.inventory
{
   public class InventoryMessage
   {
      
      public static const NOTIFY_DATA_UPDATED:String = "InventoryMessage.notifyDataUpdated";
      
      public static const NOTIFY_BUY_ITEM:String = "InventoryMessage.notifyBuyItem";
      
      public static const NOTIFY_MOVE_ITEM:String = "InventoryMessage.notifyMoveItem";
      
      public static const NOTIFY_SELL_ITEM:String = "InventoryMessage.notifySellItem";
      
      public static const NOTIFY_REFRESH:String = "InventoryMessage.notifyRefresh";
      
      public static const NOTIFY_FIRST_ITEM_BOUGHT:String = "InventoryMessage.notifyFirstItemBought";
      
      public static const NOTIFY_BAG_CHANGE:String = "InventoryMessage.notifyBagChange";
       
      
      public function InventoryMessage()
      {
         super();
      }
   }
}
