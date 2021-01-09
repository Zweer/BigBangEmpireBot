package com.playata.application.data.inventory
{
   import com.playata.application.AppEnvironment;
   import com.playata.application.data.constants.CConstant;
   import com.playata.application.data.dataobject.DOInventory;
   import com.playata.application.data.user.User;
   import com.playata.application.messaging.Message;
   import com.playata.application.messaging.MessageRouter;
   import com.playata.application.ui.ViewManager;
   import com.playata.application.ui.dialogs.DialogTutorialPopup;
   import com.playata.application.ui.elements.generic.dialog.UiInfoDialog;
   import com.playata.framework.application.Environment;
   import com.playata.framework.application.request.ActionRequestResponse;
   import com.playata.framework.core.TypedObject;
   import com.playata.framework.display.layout.LayoutUtil;
   import com.playata.framework.localization.LocText;
   
   public class Inventory extends DOInventory
   {
      
      public static const MAX_BAG_SLOT_COUNT:int = 18;
      
      public static var _forcePremiumShopRefresh:Boolean = false;
       
      
      private var _currentBuyPrice:int = 0;
      
      private var _ourInventory:Boolean = false;
      
      private var _lastSoldItemId:int = 0;
      
      public function Inventory(param1:DOInventory, param2:Boolean)
      {
         _ourInventory = param2;
         if(_ourInventory)
         {
            MessageRouter.addListener("InventoryMessage.notifyBuyItem",handleMessages);
            MessageRouter.addListener("InventoryMessage.notifyMoveItem",handleMessages);
            MessageRouter.addListener("InventoryMessage.notifySellItem",handleMessages);
            MessageRouter.addListener("InventoryMessage.notifyRefresh",handleMessages);
         }
         super(param1);
      }
      
      public static function reset() : void
      {
         _forcePremiumShopRefresh = false;
      }
      
      public static function isBagSlot(param1:int) : Boolean
      {
         if(param1 == 20 || param1 == 21 || param1 == 22 || param1 == 23 || param1 == 24 || param1 == 25 || param1 == 26 || param1 == 27 || param1 == 28 || param1 == 29 || param1 == 30 || param1 == 31 || param1 == 32 || param1 == 33 || param1 == 34 || param1 == 35 || param1 == 36 || param1 == 37)
         {
            return true;
         }
         return false;
      }
      
      public static function isRingSlot(param1:int) : Boolean
      {
         return param1 == 7;
      }
      
      public static function getBagIndex(param1:int) : int
      {
         if(param1 == 20 || param1 == 21 || param1 == 22 || param1 == 23 || param1 == 24 || param1 == 25)
         {
            return 0;
         }
         if(param1 == 26 || param1 == 27 || param1 == 28 || param1 == 29 || param1 == 30 || param1 == 31)
         {
            return 1;
         }
         if(param1 == 32 || param1 == 33 || param1 == 34 || param1 == 35 || param1 == 36 || param1 == 37)
         {
            return 2;
         }
         return -1;
      }
      
      override public function dispose() : void
      {
         if(_ourInventory)
         {
            MessageRouter.removeAllListeners(handleMessages);
         }
         super.dispose();
      }
      
      public function get lastSoldItemId() : int
      {
         return _lastSoldItemId;
      }
      
      override public function update(param1:TypedObject) : void
      {
         var _loc2_:DOInventory = new DOInventory(param1);
         if(_ourInventory)
         {
            if(_loc2_.hasData("bag_item1_id") && hasData("bag_item1_id") && _loc2_.bagItem1Id !== 0 && bagItem1Id == 0 || _loc2_.hasData("bag_item2_id") && hasData("bag_item2_id") && _loc2_.bagItem2Id !== 0 && bagItem2Id == 0 || _loc2_.hasData("bag_item3_id") && hasData("bag_item3_id") && _loc2_.bagItem3Id !== 0 && bagItem3Id == 0 || _loc2_.hasData("bag_item4_id") && hasData("bag_item4_id") && _loc2_.bagItem4Id !== 0 && bagItem4Id == 0 || _loc2_.hasData("bag_item5_id") && hasData("bag_item5_id") && _loc2_.bagItem5Id !== 0 && bagItem5Id == 0 || _loc2_.hasData("bag_item6_id") && hasData("bag_item6_id") && _loc2_.bagItem6Id !== 0 && bagItem6Id == 0)
            {
               MessageRouter.dispatch(new Message("InventoryMessage.notifyBagChange",0,this));
            }
            else if(_loc2_.hasData("bag_item7_id") && hasData("bag_item7_id") && _loc2_.bagItem7Id !== 0 && bagItem7Id == 0 || _loc2_.hasData("bag_item8_id") && hasData("bag_item8_id") && _loc2_.bagItem8Id !== 0 && bagItem8Id == 0 || _loc2_.hasData("bag_item9_id") && hasData("bag_item9_id") && _loc2_.bagItem9Id !== 0 && bagItem9Id == 0 || _loc2_.hasData("bag_item10_id") && hasData("bag_item10_id") && _loc2_.bagItem10Id !== 0 && bagItem10Id == 0 || _loc2_.hasData("bag_item11_id") && hasData("bag_item11_id") && _loc2_.bagItem11Id !== 0 && bagItem11Id == 0 || _loc2_.hasData("bag_item12_id") && hasData("bag_item12_id") && _loc2_.bagItem12Id !== 0 && bagItem12Id == 0)
            {
               MessageRouter.dispatch(new Message("InventoryMessage.notifyBagChange",1,this));
            }
            else if(_loc2_.hasData("bag_item13_id") && hasData("bag_item13_id") && _loc2_.bagItem13Id !== 0 && bagItem13Id == 0 || _loc2_.hasData("bag_item14_id") && hasData("bag_item14_id") && _loc2_.bagItem14Id !== 0 && bagItem14Id == 0 || _loc2_.hasData("bag_item15_id") && hasData("bag_item15_id") && _loc2_.bagItem15Id !== 0 && bagItem15Id == 0 || _loc2_.hasData("bag_item16_id") && hasData("bag_item16_id") && _loc2_.bagItem16Id !== 0 && bagItem16Id == 0 || _loc2_.hasData("bag_item17_id") && hasData("bag_item17_id") && _loc2_.bagItem17Id !== 0 && bagItem17Id == 0 || _loc2_.hasData("bag_item18_id") && hasData("bag_item18_id") && _loc2_.bagItem18Id !== 0 && bagItem18Id == 0)
            {
               MessageRouter.dispatch(new Message("InventoryMessage.notifyBagChange",2,this));
            }
         }
         var _loc3_:Boolean = _loc2_.hasData("head_item_id") && hasData("head_item_id") && _loc2_ != null && _loc2_.headItemId != headItemId;
         super.update(_loc2_);
         if(_loc3_)
         {
            AppEnvironment.friendBar.syncFriendBarCharacter(User.current.character);
         }
         MessageRouter.dispatch(new Message("InventoryMessage.notifyDataUpdated",_loc2_.rawData,this));
      }
      
      private function handleMessages(param1:Message) : void
      {
         var _loc2_:int = 0;
         if(Environment.panelManager.locked)
         {
            return;
         }
         var _loc3_:* = param1.type;
         switch(_loc3_)
         {
            case "InventoryMessage.notifyBuyItem":
               _currentBuyPrice = param1.data.buyPrice as int;
               Environment.application.sendActionRequest("buyShopItem",{
                  "item_id":param1.data.item,
                  "target_slot":param1.data.targetSlot
               },handleRequestResponse);
               break;
            case "InventoryMessage.notifyMoveItem":
               _loc2_ = 0;
               if(param1.data.targetSlot == 20 || param1.data.targetSlot == 21 || param1.data.targetSlot == 22 || param1.data.targetSlot == 23 || param1.data.targetSlot == 24 || param1.data.targetSlot == 25 || param1.data.targetSlot == 26 || param1.data.targetSlot == 27 || param1.data.targetSlot == 28 || param1.data.targetSlot == 29 || param1.data.targetSlot == 30 || param1.data.targetSlot == 31 || param1.data.targetSlot == 32 || param1.data.targetSlot == 33 || param1.data.targetSlot == 34 || param1.data.targetSlot == 35 || param1.data.targetSlot == 36 || param1.data.targetSlot == 37)
               {
                  if(param1.data.sourceSlot != 20 && param1.data.sourceSlot != 21 && param1.data.sourceSlot != 22 && param1.data.sourceSlot != 23 && param1.data.sourceSlot != 24 && param1.data.sourceSlot != 25 && param1.data.sourceSlot != 26 && param1.data.sourceSlot != 27 && param1.data.sourceSlot != 28 && param1.data.sourceSlot != 29 && param1.data.sourceSlot != 30 && param1.data.sourceSlot != 31 && param1.data.sourceSlot != 32 && param1.data.sourceSlot != 33 && param1.data.sourceSlot != 34 && param1.data.sourceSlot != 35 && param1.data.sourceSlot != 36 && param1.data.sourceSlot != 37)
                  {
                     _loc2_ = 4;
                  }
               }
               else
               {
                  _loc2_ = 3;
               }
               Environment.application.sendActionRequest("moveInventoryItem",{
                  "item_id":param1.data.item,
                  "target_slot":param1.data.targetSlot,
                  "action_type":_loc2_
               },handleRequestResponse);
               break;
            case "InventoryMessage.notifySellItem":
               Environment.application.sendActionRequest("sellInventoryItem",{"item_id":param1.data.item},handleRequestResponse);
               break;
            case "InventoryMessage.notifyRefresh":
               Environment.application.sendActionRequest("refreshShopItems",{"use_premium":param1.data.usePremium},handleRequestResponse);
               break;
            default:
               throw new Error("Encountered unknown message type! type=" + param1.type);
         }
      }
      
      private function handleRequestResponse(param1:ActionRequestResponse) : void
      {
         var _loc2_:* = param1.action;
         switch(_loc2_)
         {
            case "buyShopItem":
               if(param1.error == "")
               {
                  Environment.audio.playFX("item_buy.mp3");
                  Environment.application.updateData(param1.data);
                  if(User.current.character.hasNewTutorialFlag("first_item"))
                  {
                     Environment.panelManager.showDialog(new DialogTutorialPopup(LocText.current.text("tutorial/first_item/title"),LocText.current.text("tutorial/first_item/text"),onShopTutorialDialogClosed));
                  }
               }
               else
               {
                  if(param1.error == "errRemovePremiumCurrencyNotEnough")
                  {
                     ViewManager.instance.showNotEnoughPremiumDialog(_currentBuyPrice);
                  }
                  else if(param1.error == "errRemoveGameCurrencyNotEnough")
                  {
                     ViewManager.instance.showNotEnoughGameCurrencyDialog(_currentBuyPrice);
                  }
                  else if(param1.error == "errInventoryNoEmptySlot")
                  {
                     Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/no_empty_slot/title"),LocText.current.text("dialog/no_empty_slot/text"),LocText.current.text("general/button_ok")));
                  }
                  else
                  {
                     Environment.reportError(param1.error,param1.request);
                  }
                  ViewManager.instance.refresh();
               }
               break;
            case "moveInventoryItem":
               if(param1.error == "")
               {
                  if(param1.request.getInt("action_type") == 3)
                  {
                     Environment.audio.playFX("item_equip.mp3");
                  }
                  else if(param1.request.getInt("action_type") == 4)
                  {
                     Environment.audio.playFX("item_unequip.mp3");
                  }
                  Environment.application.updateData(param1.data);
                  MessageRouter.dispatch(new Message("InventoryMessage.notifyDataUpdated",{},this));
               }
               else
               {
                  if(param1.error == "errInventoryNoEmptySlot")
                  {
                     Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/no_empty_slot/title"),LocText.current.text("dialog/no_empty_slot/text"),LocText.current.text("general/button_ok")));
                  }
                  else if(param1.error != "errInventoryInvalidItem")
                  {
                     if(param1.error != "errInventoryInvalidSlot")
                     {
                        Environment.reportError(param1.error,param1.request);
                     }
                  }
                  ViewManager.instance.refresh();
               }
               break;
            case "sellInventoryItem":
               if(param1.error == "")
               {
                  Environment.audio.playFX("item_sell.mp3");
                  _lastSoldItemId = param1.request.getInt("item_id");
                  Environment.application.updateData(param1.data);
                  MessageRouter.dispatch(new Message("InventoryMessage.notifyDataUpdated",{},this));
               }
               else if(param1.error != "errSellInventoryItemInvalidItem")
               {
                  Environment.reportError(param1.error,param1.request);
                  ViewManager.instance.refresh();
               }
               break;
            case "refreshShopItems":
               if(param1.error == "")
               {
                  Environment.audio.playFX("shop_new_items.mp3");
                  Environment.application.updateData(param1.data);
                  _forcePremiumShopRefresh = false;
               }
               else
               {
                  if(param1.error == "errRemovePremiumCurrencyNotEnough")
                  {
                     ViewManager.instance.showNotEnoughPremiumDialog(CConstant.shop_refresh_waiting_time_premium_amount);
                  }
                  else if(param1.error == "errRefreshShopItemsNotYetAllowed")
                  {
                     Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/refresh_shop/not_yet_allowed/title"),LocText.current.text("dialog/refresh_shop/not_yet_allowed/text"),LocText.current.text("general/button_ok")));
                     _forcePremiumShopRefresh = true;
                  }
                  else
                  {
                     Environment.reportError(param1.error,param1.request);
                  }
                  ViewManager.instance.refresh();
               }
               break;
            default:
               throw new Error("Failure handling response to action \'" + param1.action + "\'. Action not supported");
         }
      }
      
      private function onShopTutorialDialogClosed() : void
      {
         ViewManager.instance.tutorialArrow.showTutorial(LocText.current.text("tutorial/duel_arrow_text"),"left_back","down",368 + LayoutUtil.deviceAdjustedWidthCorrection / 2,535 + LayoutUtil.deviceAdjustedHeightCorrection,5,-50);
      }
      
      public function get bag1ItemCount() : int
      {
         var _loc1_:int = 0;
         if(bagItem1Id != 0)
         {
            _loc1_++;
         }
         if(bagItem2Id != 0)
         {
            _loc1_++;
         }
         if(bagItem3Id != 0)
         {
            _loc1_++;
         }
         if(bagItem4Id != 0)
         {
            _loc1_++;
         }
         if(bagItem5Id != 0)
         {
            _loc1_++;
         }
         if(bagItem6Id != 0)
         {
            _loc1_++;
         }
         return _loc1_;
      }
      
      public function get bag2ItemCount() : int
      {
         var _loc1_:int = 0;
         if(bagItem7Id != 0)
         {
            _loc1_++;
         }
         if(bagItem8Id != 0)
         {
            _loc1_++;
         }
         if(bagItem9Id != 0)
         {
            _loc1_++;
         }
         if(bagItem10Id != 0)
         {
            _loc1_++;
         }
         if(bagItem11Id != 0)
         {
            _loc1_++;
         }
         if(bagItem12Id != 0)
         {
            _loc1_++;
         }
         return _loc1_;
      }
      
      public function get bag3ItemCount() : int
      {
         var _loc1_:int = 0;
         if(bagItem13Id != 0)
         {
            _loc1_++;
         }
         if(bagItem14Id != 0)
         {
            _loc1_++;
         }
         if(bagItem15Id != 0)
         {
            _loc1_++;
         }
         if(bagItem16Id != 0)
         {
            _loc1_++;
         }
         if(bagItem17Id != 0)
         {
            _loc1_++;
         }
         if(bagItem18Id != 0)
         {
            _loc1_++;
         }
         return _loc1_;
      }
      
      public function isBagFull(param1:int) : Boolean
      {
         switch(int(param1))
         {
            case 0:
               return bag1ItemCount >= 6;
            case 1:
               return bag2ItemCount >= 6;
            case 2:
               return bag3ItemCount >= 6;
         }
      }
      
      public function getFreeSlotType(param1:int) : int
      {
         switch(int(param1) - -1)
         {
            case 0:
               if(bagItem1Id == 0)
               {
                  return 20;
               }
               if(bagItem2Id == 0)
               {
                  return 21;
               }
               if(bagItem3Id == 0)
               {
                  return 22;
               }
               if(bagItem4Id == 0)
               {
                  return 23;
               }
               if(bagItem5Id == 0)
               {
                  return 24;
               }
               if(bagItem6Id == 0)
               {
                  return 25;
               }
               if(User.current.character.level >= CConstant.inventory_bag2_unlock_level)
               {
                  if(bagItem7Id == 0)
                  {
                     return 26;
                  }
                  if(bagItem8Id == 0)
                  {
                     return 27;
                  }
                  if(bagItem9Id == 0)
                  {
                     return 28;
                  }
                  if(bagItem10Id == 0)
                  {
                     return 29;
                  }
                  if(bagItem11Id == 0)
                  {
                     return 30;
                  }
                  if(bagItem12Id == 0)
                  {
                     return 31;
                  }
               }
               if(User.current.character.level >= CConstant.inventory_bag3_unlock_level)
               {
                  if(bagItem13Id == 0)
                  {
                     return 32;
                  }
                  if(bagItem14Id == 0)
                  {
                     return 33;
                  }
                  if(bagItem15Id == 0)
                  {
                     return 34;
                  }
                  if(bagItem16Id == 0)
                  {
                     return 35;
                  }
                  if(bagItem17Id == 0)
                  {
                     return 36;
                  }
                  if(bagItem18Id == 0)
                  {
                     return 37;
                  }
                  break;
               }
               break;
            case 1:
               if(bagItem1Id == 0)
               {
                  return 20;
               }
               if(bagItem2Id == 0)
               {
                  return 21;
               }
               if(bagItem3Id == 0)
               {
                  return 22;
               }
               if(bagItem4Id == 0)
               {
                  return 23;
               }
               if(bagItem5Id == 0)
               {
                  return 24;
               }
               if(bagItem6Id == 0)
               {
                  return 25;
               }
               break;
            case 2:
               if(bagItem7Id == 0)
               {
                  return 26;
               }
               if(bagItem8Id == 0)
               {
                  return 27;
               }
               if(bagItem9Id == 0)
               {
                  return 28;
               }
               if(bagItem10Id == 0)
               {
                  return 29;
               }
               if(bagItem11Id == 0)
               {
                  return 30;
               }
               if(bagItem12Id == 0)
               {
                  return 31;
               }
               break;
            case 3:
               if(bagItem13Id == 0)
               {
                  return 32;
               }
               if(bagItem14Id == 0)
               {
                  return 33;
               }
               if(bagItem15Id == 0)
               {
                  return 34;
               }
               if(bagItem16Id == 0)
               {
                  return 35;
               }
               if(bagItem17Id == 0)
               {
                  return 36;
               }
               if(bagItem18Id == 0)
               {
                  return 37;
               }
               break;
         }
         return 0;
      }
      
      public function getBagItemId(param1:int) : int
      {
         switch(int(param1) - 20)
         {
            case 0:
               return bagItem1Id;
            case 1:
               return bagItem2Id;
            case 2:
               return bagItem3Id;
            case 3:
               return bagItem4Id;
            case 4:
               return bagItem5Id;
            case 5:
               return bagItem6Id;
            case 6:
               return bagItem7Id;
            case 7:
               return bagItem8Id;
            case 8:
               return bagItem9Id;
            case 9:
               return bagItem10Id;
            case 10:
               return bagItem11Id;
            case 11:
               return bagItem12Id;
            case 12:
               return bagItem13Id;
            case 13:
               return bagItem14Id;
            case 14:
               return bagItem15Id;
            case 15:
               return bagItem16Id;
            case 16:
               return bagItem17Id;
            case 17:
               return bagItem18Id;
         }
      }
   }
}
