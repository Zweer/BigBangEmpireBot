package com.playata.application.data.inventory
{
   public class BankInventoryMessage
   {
      
      public static const NOTIFY_DATA_UPDATED:String = "BankInventoryMessage.notifyDataUpdated";
      
      public static const NOTIFY_ADD_ITEM:String = "BankInventoryMessage.notifyAddItem";
      
      public static const NOTIFY_REMOVE_ITEM:String = "BankInventoryMessage.notifyRemoveItem";
      
      public static const NOTIFY_MOVE_ITEM:String = "BankInventoryMessage.notifyMoveItem";
      
      public static const NOTIFY_SELL_ITEM:String = "BankInventoryMessage.notifySellItem";
      
      public static const NOTIFY_LOCK_ITEM:String = "BankInventoryMessage.notifyLockItem";
      
      public static const NOTIFY_UNLOCK_ITEM:String = "BankInventoryMessage.notifyUnlockItem";
       
      
      public function BankInventoryMessage()
      {
         super();
      }
   }
}
