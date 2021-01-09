package com.playata.application.data.inventory
{
   import com.playata.application.data.dataobject.DOBankInventory;
   import com.playata.application.data.item.Item;
   import com.playata.application.data.user.User;
   import com.playata.application.messaging.Message;
   import com.playata.application.messaging.MessageRouter;
   import com.playata.application.ui.elements.generic.dialog.UiInfoDialog;
   import com.playata.framework.application.Environment;
   import com.playata.framework.application.request.ActionRequestResponse;
   import com.playata.framework.core.TypedObject;
   import com.playata.framework.core.util.JsonUtil;
   import com.playata.framework.localization.LocText;
   
   public class BankInventory extends DOBankInventory
   {
      
      public static const MAX_BANK_SLOT_COUNT:int = 378;
      
      public static const MAX_BANK_SLOTS_PER_BANK:int = 18;
      
      public static const MAX_BANK_INDEX:int = 20;
       
      
      private var _currentAction:int = 0;
      
      private var _lockedItemIds:Array = null;
      
      public function BankInventory(param1:DOBankInventory)
      {
         super(param1);
         MessageRouter.addListener("BankInventoryMessage.notifyAddItem",handleMessages);
         MessageRouter.addListener("BankInventoryMessage.notifyRemoveItem",handleMessages);
         MessageRouter.addListener("BankInventoryMessage.notifyMoveItem",handleMessages);
         MessageRouter.addListener("BankInventoryMessage.notifySellItem",handleMessages);
      }
      
      override public function dispose() : void
      {
         super.dispose();
         _lockedItemIds = null;
         MessageRouter.removeAllListeners(handleMessages);
      }
      
      override public function update(param1:TypedObject) : void
      {
         super.update(param1);
         _lockedItemIds = null;
      }
      
      public function getItemByIndex(param1:int, param2:int) : Item
      {
         var _loc3_:int = param1 * 18 + param2 + 1;
         var _loc4_:int = getInt("bank_item" + _loc3_ + "_id");
         if(_loc4_ == 0)
         {
            return null;
         }
         return User.current.character.getItemById(_loc4_);
      }
      
      public function getBankIndex(param1:int) : int
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         _loc2_ = 0;
         while(_loc2_ < 378)
         {
            _loc3_ = getInt("bank_item" + (_loc2_ + 1) + "_id");
            if(_loc3_ == param1)
            {
               return (Math.ceil((_loc2_ + 1) / 18) as int) - 1;
            }
            _loc2_++;
         }
         return -1;
      }
      
      public function getFreeBankIndex() : int
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         _loc1_ = 0;
         while(_loc1_ < User.current.character.maxBankIndex)
         {
            _loc2_ = getFreeBankSlotIndex(_loc1_);
            if(_loc2_ != -1)
            {
               return _loc1_;
            }
            _loc1_++;
         }
         return -1;
      }
      
      public function getFreeBankSlotIndex(param1:int) : int
      {
         var _loc3_:* = 0;
         var _loc4_:int = 0;
         var _loc2_:int = param1 * 18;
         var _loc6_:int = _loc2_ + 18;
         var _loc5_:int = 0;
         _loc3_ = _loc2_;
         while(_loc3_ < _loc6_)
         {
            _loc4_ = getInt("bank_item" + (_loc3_ + 1) + "_id");
            if(_loc4_ == 0)
            {
               return _loc5_;
            }
            _loc5_++;
            _loc3_++;
         }
         return -1;
      }
      
      public function getBankItemCount(param1:int) : int
      {
         var _loc4_:* = 0;
         var _loc5_:* = null;
         var _loc2_:int = 0;
         var _loc3_:int = param1 * 18;
         var _loc6_:int = _loc3_ + 18;
         _loc4_ = _loc3_;
         while(_loc4_ < _loc6_)
         {
            _loc5_ = "bank_item" + (_loc4_ + 1) + "_id";
            if(hasData(_loc5_) && getInt(_loc5_) != 0)
            {
               _loc2_++;
            }
            _loc4_++;
         }
         return _loc2_;
      }
      
      private function handleMessages(param1:Message) : void
      {
         if(_currentAction != 0)
         {
            return;
         }
         if(Environment.panelManager.locked)
         {
            return;
         }
         var _loc2_:* = param1.type;
         switch(_loc2_)
         {
            case "BankInventoryMessage.notifyAddItem":
               if(param1.data.bankIndex > User.current.character.maxBankIndex)
               {
                  return;
               }
               _currentAction = 1;
               Environment.application.sendActionRequest("addInventoryItemToBank",{
                  "item_id":param1.data.item,
                  "bank_index":param1.data.bankIndex,
                  "target_slot_index":param1.data.targetSlotIndex
               },handleRequests);
               break;
            case "BankInventoryMessage.notifyRemoveItem":
               _currentAction = 2;
               Environment.application.sendActionRequest("removeBankItemToInventory",{
                  "item_id":param1.data.item,
                  "target_slot":param1.data.targetSlot
               },handleRequests);
               break;
            case "BankInventoryMessage.notifyMoveItem":
               _currentAction = 3;
               Environment.application.sendActionRequest("moveBankInventoryItem",{
                  "item_id":param1.data.item,
                  "bank_index":param1.data.bankIndex,
                  "target_slot_index":param1.data.targetSlotIndex
               },handleRequests);
               break;
            case "BankInventoryMessage.notifySellItem":
               _currentAction = 4;
               if(isItemLocked(param1.data.item))
               {
                  Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/bank_inventory/err_sell_item_item_is_locked_title"),LocText.current.text("dialog/bank_inventory/err_sell_item_item_is_locked_text"),LocText.current.text("general/button_ok")));
               }
               else
               {
                  Environment.application.sendActionRequest("sellBankInventoryItem",{"item_id":param1.data.item},handleRequests);
               }
               break;
            default:
               throw new Error("Encountered unknown message type! type=" + param1.type);
         }
      }
      
      private function handleRequests(param1:ActionRequestResponse) : void
      {
         var _loc2_:* = param1.action;
         switch(_loc2_)
         {
            case "addInventoryItemToBank":
               if(param1.error == "")
               {
                  Environment.audio.playFX("item_unequip.mp3");
                  Environment.application.updateData(param1.data);
               }
               else if(param1.error != "errAddItemFromInventoryInvalidTargetSlot")
               {
                  if(param1.error != "errInventoryInvalidItem")
                  {
                     Environment.reportError(param1.error,param1.request);
                  }
               }
               break;
            case "removeBankItemToInventory":
               if(param1.error == "")
               {
                  Environment.audio.playFX("item_unequip.mp3");
                  Environment.application.updateData(param1.data);
               }
               else if(param1.error != "errInventoryInvalidItem")
               {
                  Environment.reportError(param1.error,param1.request);
               }
               break;
            case "moveBankInventoryItem":
               if(param1.error == "")
               {
                  Environment.audio.playFX("item_unequip.mp3");
                  Environment.application.updateData(param1.data);
               }
               else
               {
                  Environment.reportError(param1.error,param1.request);
               }
               break;
            case "sellBankInventoryItem":
               if(param1.error == "")
               {
                  Environment.audio.playFX("item_sell.mp3");
                  Environment.application.updateData(param1.data);
               }
               else if(param1.error == "errSellItemItemIsLocked")
               {
                  Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/bank_inventory/err_sell_item_item_is_locked_title"),LocText.current.text("dialog/bank_inventory/err_sell_item_item_is_locked_text"),LocText.current.text("general/button_ok")));
               }
               else
               {
                  Environment.reportError(param1.error,param1.request);
               }
               break;
            default:
               throw new Error("Unsupported request action \'" + param1.action + "\'!");
         }
         _currentAction = 0;
         MessageRouter.dispatch(new Message("BankInventoryMessage.notifyDataUpdated",param1.data,this));
      }
      
      public function isItemLocked(param1:int) : Boolean
      {
         if(!_lockedItemIds)
         {
            if(!lockedItemIds || lockedItemIds == "")
            {
               _lockedItemIds = [];
            }
            else
            {
               _lockedItemIds = JsonUtil.decode(lockedItemIds);
            }
         }
         return _lockedItemIds.indexOf(param1) >= 0;
      }
   }
}
