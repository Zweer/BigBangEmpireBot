package com.playata.application.ui.dialogs
{
   import com.playata.application.data.GameUtil;
   import com.playata.application.data.character.Character;
   import com.playata.application.data.constants.CConstant;
   import com.playata.application.data.inventory.BankInventory;
   import com.playata.application.data.item.Item;
   import com.playata.application.data.outfit.Outfit;
   import com.playata.application.data.user.User;
   import com.playata.application.messaging.Message;
   import com.playata.application.messaging.MessageRouter;
   import com.playata.application.ui.ViewManager;
   import com.playata.application.ui.elements.bank.UiBankInventoryTabButton;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.application.ui.elements.generic.button.UiPremiumButton;
   import com.playata.application.ui.elements.generic.dialog.UiDialog;
   import com.playata.application.ui.elements.generic.dialog.UiInfoDialog;
   import com.playata.application.ui.elements.generic.dialog.UiTwoChoiceDialog;
   import com.playata.application.ui.elements.generic.tab.UiInventoryTabButton;
   import com.playata.application.ui.elements.item.UiBankItemSlot;
   import com.playata.application.ui.elements.item.UiItemSlot;
   import com.playata.application.ui.elements.shop.UiSellArea;
   import com.playata.framework.application.Environment;
   import com.playata.framework.application.request.ActionRequestResponse;
   import com.playata.framework.data.constants.Constants;
   import com.playata.framework.display.ui.IDropTarget;
   import com.playata.framework.display.ui.controls.Button;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.dialogs.SymbolDialogBankInventoryGeneric;
   
   public class DialogBankInventory extends UiDialog
   {
       
      
      private var _bagIndex:int = 0;
      
      private var _bankIndex:int = 0;
      
      private var _btnClose:UiButton = null;
      
      private var _btnUpgrade:UiPremiumButton = null;
      
      private var _btnTabBag1:UiInventoryTabButton = null;
      
      private var _btnTabBag2:UiInventoryTabButton = null;
      
      private var _btnTabBag3:UiInventoryTabButton = null;
      
      private var _btnTabBank1:UiBankInventoryTabButton = null;
      
      private var _btnTabBank2:UiBankInventoryTabButton = null;
      
      private var _btnTabBank3:UiBankInventoryTabButton = null;
      
      private var _btnTabBank4:UiBankInventoryTabButton = null;
      
      private var _btnTabBank5:UiBankInventoryTabButton = null;
      
      private var _btnTabBank6:UiBankInventoryTabButton = null;
      
      private var _btnTabBank7:UiBankInventoryTabButton = null;
      
      private var _btnTabBank8:UiBankInventoryTabButton = null;
      
      private var _btnTabBank9:UiBankInventoryTabButton = null;
      
      private var _btnTabBank10:UiBankInventoryTabButton = null;
      
      private var _btnTabBank11:UiBankInventoryTabButton = null;
      
      private var _btnTabBank12:UiBankInventoryTabButton = null;
      
      private var _btnTabBank13:UiBankInventoryTabButton = null;
      
      private var _btnTabBank14:UiBankInventoryTabButton = null;
      
      private var _btnTabBank15:UiBankInventoryTabButton = null;
      
      private var _btnTabBank16:UiBankInventoryTabButton = null;
      
      private var _btnTabBank17:UiBankInventoryTabButton = null;
      
      private var _btnTabBank18:UiBankInventoryTabButton = null;
      
      private var _btnTabBank19:UiBankInventoryTabButton = null;
      
      private var _btnTabBank20:UiBankInventoryTabButton = null;
      
      private var _btnTabBank21:UiBankInventoryTabButton = null;
      
      private var _inventorySlot1:UiItemSlot = null;
      
      private var _inventorySlot2:UiItemSlot = null;
      
      private var _inventorySlot3:UiItemSlot = null;
      
      private var _inventorySlot4:UiItemSlot = null;
      
      private var _inventorySlot5:UiItemSlot = null;
      
      private var _inventorySlot6:UiItemSlot = null;
      
      private var _inventorySlot7:UiItemSlot = null;
      
      private var _inventorySlot8:UiItemSlot = null;
      
      private var _inventorySlot9:UiItemSlot = null;
      
      private var _inventorySlot10:UiItemSlot = null;
      
      private var _inventorySlot11:UiItemSlot = null;
      
      private var _inventorySlot12:UiItemSlot = null;
      
      private var _inventorySlot13:UiItemSlot = null;
      
      private var _inventorySlot14:UiItemSlot = null;
      
      private var _inventorySlot15:UiItemSlot = null;
      
      private var _inventorySlot16:UiItemSlot = null;
      
      private var _inventorySlot17:UiItemSlot = null;
      
      private var _inventorySlot18:UiItemSlot = null;
      
      private var _bankSlot1:UiBankItemSlot = null;
      
      private var _bankSlot2:UiBankItemSlot = null;
      
      private var _bankSlot3:UiBankItemSlot = null;
      
      private var _bankSlot4:UiBankItemSlot = null;
      
      private var _bankSlot5:UiBankItemSlot = null;
      
      private var _bankSlot6:UiBankItemSlot = null;
      
      private var _bankSlot7:UiBankItemSlot = null;
      
      private var _bankSlot8:UiBankItemSlot = null;
      
      private var _bankSlot9:UiBankItemSlot = null;
      
      private var _bankSlot10:UiBankItemSlot = null;
      
      private var _bankSlot11:UiBankItemSlot = null;
      
      private var _bankSlot12:UiBankItemSlot = null;
      
      private var _bankSlot13:UiBankItemSlot = null;
      
      private var _bankSlot14:UiBankItemSlot = null;
      
      private var _bankSlot15:UiBankItemSlot = null;
      
      private var _bankSlot16:UiBankItemSlot = null;
      
      private var _bankSlot17:UiBankItemSlot = null;
      
      private var _bankSlot18:UiBankItemSlot = null;
      
      private var _currentDropTargets:Vector.<IDropTarget> = null;
      
      private var _sellArea:UiSellArea = null;
      
      private var _btnSellAll:UiButton = null;
      
      public function DialogBankInventory()
      {
         var _loc2_:SymbolDialogBankInventoryGeneric = new SymbolDialogBankInventoryGeneric();
         super(_loc2_);
         _queued = false;
         _loc2_.txtDialogTitle.text = LocText.current.text("dialog/bank_inventory/title");
         _loc2_.txtInfo.text = LocText.current.text("dialog/bank_inventory/info_text");
         _btnClose = new UiButton(_loc2_.btnClose,"",onClickClose);
         _btnUpgrade = new UiPremiumButton(_loc2_.btnUpgrade,0,"",LocText.current.text("dialog/bank_inventory/button_upgrade"),"","",onClickUpgrade);
         _btnUpgrade.premium = true;
         var _loc1_:* = 7;
         _btnUpgrade.realContent.caption.x = _btnUpgrade.realContent.caption.x - _loc1_;
         _btnUpgrade.realContent.iconPremiumCurrency.x = _btnUpgrade.realContent.iconPremiumCurrency.x - _loc1_;
         _btnUpgrade.realContent.cost.x = _btnUpgrade.realContent.cost.x - _loc1_;
         _btnTabBag1 = new UiInventoryTabButton(_loc2_.btnTabBag1,0,"1","",onClickTabBag1);
         _btnTabBag2 = new UiInventoryTabButton(_loc2_.btnTabBag2,1,"2","",onClickTabBag2);
         _btnTabBag3 = new UiInventoryTabButton(_loc2_.btnTabBag3,2,"3","",onClickTabBag3);
         _btnTabBag1.textTooltip.requestTextFunction = requestBag1Tooltip;
         _btnTabBag2.textTooltip.requestTextFunction = requestBag2Tooltip;
         _btnTabBag3.textTooltip.requestTextFunction = requestBag3Tooltip;
         _btnTabBank1 = new UiBankInventoryTabButton(_loc2_.btnTabBank1,0,"1","",onClickTabBank1);
         _btnTabBank2 = new UiBankInventoryTabButton(_loc2_.btnTabBank2,1,"2","",onClickTabBank2);
         _btnTabBank3 = new UiBankInventoryTabButton(_loc2_.btnTabBank3,2,"3","",onClickTabBank3);
         _btnTabBank4 = new UiBankInventoryTabButton(_loc2_.btnTabBank4,3,"4","",onClickTabBank4);
         _btnTabBank5 = new UiBankInventoryTabButton(_loc2_.btnTabBank5,4,"5","",onClickTabBank5);
         _btnTabBank6 = new UiBankInventoryTabButton(_loc2_.btnTabBank6,5,"6","",onClickTabBank6);
         _btnTabBank7 = new UiBankInventoryTabButton(_loc2_.btnTabBank7,6,"7","",onClickTabBank7);
         _btnTabBank8 = new UiBankInventoryTabButton(_loc2_.btnTabBank8,7,"8","",onClickTabBank8);
         _btnTabBank9 = new UiBankInventoryTabButton(_loc2_.btnTabBank9,8,"9","",onClickTabBank9);
         _btnTabBank10 = new UiBankInventoryTabButton(_loc2_.btnTabBank10,9,"10","",onClickTabBank10);
         _btnTabBank11 = new UiBankInventoryTabButton(_loc2_.btnTabBank11,10,"11","",onClickTabBank11);
         _btnTabBank12 = new UiBankInventoryTabButton(_loc2_.btnTabBank12,11,"12","",onClickTabBank12);
         _btnTabBank13 = new UiBankInventoryTabButton(_loc2_.btnTabBank13,12,"13","",onClickTabBank13);
         _btnTabBank14 = new UiBankInventoryTabButton(_loc2_.btnTabBank14,13,"14","",onClickTabBank14);
         _btnTabBank15 = new UiBankInventoryTabButton(_loc2_.btnTabBank15,14,"15","",onClickTabBank15);
         _btnTabBank16 = new UiBankInventoryTabButton(_loc2_.btnTabBank16,15,"16","",onClickTabBank16);
         _btnTabBank17 = new UiBankInventoryTabButton(_loc2_.btnTabBank17,16,"17","",onClickTabBank17);
         _btnTabBank18 = new UiBankInventoryTabButton(_loc2_.btnTabBank18,17,"18","",onClickTabBank18);
         _btnTabBank19 = new UiBankInventoryTabButton(_loc2_.btnTabBank19,18,"19","",onClickTabBank19);
         _btnTabBank20 = new UiBankInventoryTabButton(_loc2_.btnTabBank20,19,"20","",onClickTabBank20);
         _btnTabBank21 = new UiBankInventoryTabButton(_loc2_.btnTabBank21,20,"21","",onClickTabBank21);
         _btnTabBank1.textTooltip.requestTextFunction = requestBank1Tooltip;
         _btnTabBank2.textTooltip.requestTextFunction = requestBank2Tooltip;
         _btnTabBank3.textTooltip.requestTextFunction = requestBank3Tooltip;
         _btnTabBank4.textTooltip.requestTextFunction = requestBank4Tooltip;
         _btnTabBank5.textTooltip.requestTextFunction = requestBank5Tooltip;
         _btnTabBank6.textTooltip.requestTextFunction = requestBank6Tooltip;
         _btnTabBank7.textTooltip.requestTextFunction = requestBank7Tooltip;
         _btnTabBank8.textTooltip.requestTextFunction = requestBank8Tooltip;
         _btnTabBank9.textTooltip.requestTextFunction = requestBank9Tooltip;
         _btnTabBank10.textTooltip.requestTextFunction = requestBank10Tooltip;
         _btnTabBank11.textTooltip.requestTextFunction = requestBank11Tooltip;
         _btnTabBank12.textTooltip.requestTextFunction = requestBank12Tooltip;
         _btnTabBank13.textTooltip.requestTextFunction = requestBank13Tooltip;
         _btnTabBank14.textTooltip.requestTextFunction = requestBank14Tooltip;
         _btnTabBank15.textTooltip.requestTextFunction = requestBank15Tooltip;
         _btnTabBank16.textTooltip.requestTextFunction = requestBank16Tooltip;
         _btnTabBank17.textTooltip.requestTextFunction = requestBank17Tooltip;
         _btnTabBank18.textTooltip.requestTextFunction = requestBank18Tooltip;
         _btnTabBank19.textTooltip.requestTextFunction = requestBank19Tooltip;
         _btnTabBank20.textTooltip.requestTextFunction = requestBank20Tooltip;
         _btnTabBank21.textTooltip.requestTextFunction = requestBank21Tooltip;
         _inventorySlot1 = new UiItemSlot(_loc2_.inventorySlot1,20);
         _inventorySlot2 = new UiItemSlot(_loc2_.inventorySlot2,21);
         _inventorySlot3 = new UiItemSlot(_loc2_.inventorySlot3,22);
         _inventorySlot4 = new UiItemSlot(_loc2_.inventorySlot4,23);
         _inventorySlot5 = new UiItemSlot(_loc2_.inventorySlot5,24);
         _inventorySlot6 = new UiItemSlot(_loc2_.inventorySlot6,25);
         _inventorySlot7 = new UiItemSlot(_loc2_.inventorySlot7,26);
         _inventorySlot8 = new UiItemSlot(_loc2_.inventorySlot8,27);
         _inventorySlot9 = new UiItemSlot(_loc2_.inventorySlot9,28);
         _inventorySlot10 = new UiItemSlot(_loc2_.inventorySlot10,29);
         _inventorySlot11 = new UiItemSlot(_loc2_.inventorySlot11,30);
         _inventorySlot12 = new UiItemSlot(_loc2_.inventorySlot12,31);
         _inventorySlot13 = new UiItemSlot(_loc2_.inventorySlot13,32);
         _inventorySlot14 = new UiItemSlot(_loc2_.inventorySlot14,33);
         _inventorySlot15 = new UiItemSlot(_loc2_.inventorySlot15,34);
         _inventorySlot16 = new UiItemSlot(_loc2_.inventorySlot16,35);
         _inventorySlot17 = new UiItemSlot(_loc2_.inventorySlot17,36);
         _inventorySlot18 = new UiItemSlot(_loc2_.inventorySlot18,37);
         _bankSlot1 = new UiBankItemSlot(_loc2_.bankSlot1,100);
         _bankSlot2 = new UiBankItemSlot(_loc2_.bankSlot2,100);
         _bankSlot3 = new UiBankItemSlot(_loc2_.bankSlot3,100);
         _bankSlot4 = new UiBankItemSlot(_loc2_.bankSlot4,100);
         _bankSlot5 = new UiBankItemSlot(_loc2_.bankSlot5,100);
         _bankSlot6 = new UiBankItemSlot(_loc2_.bankSlot6,100);
         _bankSlot7 = new UiBankItemSlot(_loc2_.bankSlot7,100);
         _bankSlot8 = new UiBankItemSlot(_loc2_.bankSlot8,100);
         _bankSlot9 = new UiBankItemSlot(_loc2_.bankSlot9,100);
         _bankSlot10 = new UiBankItemSlot(_loc2_.bankSlot10,100);
         _bankSlot11 = new UiBankItemSlot(_loc2_.bankSlot11,100);
         _bankSlot12 = new UiBankItemSlot(_loc2_.bankSlot12,100);
         _bankSlot13 = new UiBankItemSlot(_loc2_.bankSlot13,100);
         _bankSlot14 = new UiBankItemSlot(_loc2_.bankSlot14,100);
         _bankSlot15 = new UiBankItemSlot(_loc2_.bankSlot15,100);
         _bankSlot16 = new UiBankItemSlot(_loc2_.bankSlot16,100);
         _bankSlot17 = new UiBankItemSlot(_loc2_.bankSlot17,100);
         _bankSlot18 = new UiBankItemSlot(_loc2_.bankSlot18,100);
         _sellArea = new UiSellArea(_loc2_.sellArea);
         _btnSellAll = new UiButton(_loc2_.btnSellAll,LocText.current.text("dialog/bank_inventory/button_sell_all_tooltip"),onClickSellAll);
         refreshUI();
         panelManager.dragDropManager.dialogDragLayer = _loc2_.dragLayer;
         panelManager.dragDropManager.dialogDragLayer.x = panelManager.dragDropManager.dialogDragLayer.x - Environment.layout.appWidth / 2;
         panelManager.dragDropManager.dialogDragLayer.y = panelManager.dragDropManager.dialogDragLayer.y - Environment.layout.appHeight / 2;
         _currentDropTargets = panelManager.dragDropManager.dropTargets;
         panelManager.dragDropManager.clearDropTargets();
         panelManager.dragDropManager.addDropTarget(_inventorySlot1);
         panelManager.dragDropManager.addDropTarget(_inventorySlot2);
         panelManager.dragDropManager.addDropTarget(_inventorySlot3);
         panelManager.dragDropManager.addDropTarget(_inventorySlot4);
         panelManager.dragDropManager.addDropTarget(_inventorySlot5);
         panelManager.dragDropManager.addDropTarget(_inventorySlot6);
         panelManager.dragDropManager.addDropTarget(_inventorySlot7);
         panelManager.dragDropManager.addDropTarget(_inventorySlot8);
         panelManager.dragDropManager.addDropTarget(_inventorySlot9);
         panelManager.dragDropManager.addDropTarget(_inventorySlot10);
         panelManager.dragDropManager.addDropTarget(_inventorySlot11);
         panelManager.dragDropManager.addDropTarget(_inventorySlot12);
         panelManager.dragDropManager.addDropTarget(_inventorySlot13);
         panelManager.dragDropManager.addDropTarget(_inventorySlot14);
         panelManager.dragDropManager.addDropTarget(_inventorySlot15);
         panelManager.dragDropManager.addDropTarget(_inventorySlot16);
         panelManager.dragDropManager.addDropTarget(_inventorySlot17);
         panelManager.dragDropManager.addDropTarget(_inventorySlot18);
         panelManager.dragDropManager.addDropTarget(_bankSlot1);
         panelManager.dragDropManager.addDropTarget(_bankSlot2);
         panelManager.dragDropManager.addDropTarget(_bankSlot3);
         panelManager.dragDropManager.addDropTarget(_bankSlot4);
         panelManager.dragDropManager.addDropTarget(_bankSlot5);
         panelManager.dragDropManager.addDropTarget(_bankSlot6);
         panelManager.dragDropManager.addDropTarget(_bankSlot7);
         panelManager.dragDropManager.addDropTarget(_bankSlot8);
         panelManager.dragDropManager.addDropTarget(_bankSlot9);
         panelManager.dragDropManager.addDropTarget(_bankSlot10);
         panelManager.dragDropManager.addDropTarget(_bankSlot11);
         panelManager.dragDropManager.addDropTarget(_bankSlot12);
         panelManager.dragDropManager.addDropTarget(_bankSlot13);
         panelManager.dragDropManager.addDropTarget(_bankSlot14);
         panelManager.dragDropManager.addDropTarget(_bankSlot15);
         panelManager.dragDropManager.addDropTarget(_bankSlot16);
         panelManager.dragDropManager.addDropTarget(_bankSlot17);
         panelManager.dragDropManager.addDropTarget(_bankSlot18);
         panelManager.dragDropManager.addDropTarget(_sellArea);
         panelManager.dragDropManager.addDropTarget(_btnTabBag1);
         panelManager.dragDropManager.addDropTarget(_btnTabBag2);
         panelManager.dragDropManager.addDropTarget(_btnTabBag3);
         panelManager.dragDropManager.addDropTarget(_btnTabBank1);
         panelManager.dragDropManager.addDropTarget(_btnTabBank2);
         panelManager.dragDropManager.addDropTarget(_btnTabBank3);
         panelManager.dragDropManager.addDropTarget(_btnTabBank4);
         panelManager.dragDropManager.addDropTarget(_btnTabBank5);
         panelManager.dragDropManager.addDropTarget(_btnTabBank6);
         panelManager.dragDropManager.addDropTarget(_btnTabBank7);
         panelManager.dragDropManager.addDropTarget(_btnTabBank8);
         panelManager.dragDropManager.addDropTarget(_btnTabBank9);
         panelManager.dragDropManager.addDropTarget(_btnTabBank10);
         panelManager.dragDropManager.addDropTarget(_btnTabBank11);
         panelManager.dragDropManager.addDropTarget(_btnTabBank12);
         panelManager.dragDropManager.addDropTarget(_btnTabBank13);
         panelManager.dragDropManager.addDropTarget(_btnTabBank14);
         panelManager.dragDropManager.addDropTarget(_btnTabBank15);
         panelManager.dragDropManager.addDropTarget(_btnTabBank16);
         panelManager.dragDropManager.addDropTarget(_btnTabBank17);
         panelManager.dragDropManager.addDropTarget(_btnTabBank18);
         panelManager.dragDropManager.addDropTarget(_btnTabBank19);
         panelManager.dragDropManager.addDropTarget(_btnTabBank20);
         panelManager.dragDropManager.addDropTarget(_btnTabBank21);
         MessageRouter.addListener("InventoryMessage.notifyDataUpdated",handleMessages);
         MessageRouter.addListener("BankInventoryMessage.notifyDataUpdated",handleMessages);
         MessageRouter.addListener("BankInventoryMessage.notifyLockItem",handleMessages);
         MessageRouter.addListener("BankInventoryMessage.notifyUnlockItem",handleMessages);
      }
      
      override public function onClose(param1:Function = null) : void
      {
         panelManager.dragDropManager.dialogDragLayer = null;
         panelManager.dragDropManager.clearDropTargets();
         var _loc4_:int = 0;
         var _loc3_:* = _currentDropTargets;
         for each(var _loc2_ in _currentDropTargets)
         {
            panelManager.dragDropManager.addDropTarget(_loc2_);
         }
         super.onClose(param1);
      }
      
      override public function dispose() : void
      {
         MessageRouter.removeAllListeners(handleMessages);
         _sellArea.dispose();
         _btnClose.dispose();
         _btnClose = null;
         _btnUpgrade.dispose();
         _btnUpgrade = null;
         _btnTabBag1.dispose();
         _btnTabBag1 = null;
         _btnTabBag2.dispose();
         _btnTabBag2 = null;
         _btnTabBag3.dispose();
         _btnTabBag3 = null;
         _btnTabBank1.dispose();
         _btnTabBank1 = null;
         _btnTabBank2.dispose();
         _btnTabBank2 = null;
         _btnTabBank3.dispose();
         _btnTabBank3 = null;
         _btnTabBank4.dispose();
         _btnTabBank4 = null;
         _btnTabBank5.dispose();
         _btnTabBank5 = null;
         _btnTabBank6.dispose();
         _btnTabBank6 = null;
         _btnTabBank7.dispose();
         _btnTabBank7 = null;
         _btnTabBank8.dispose();
         _btnTabBank8 = null;
         _btnTabBank9.dispose();
         _btnTabBank9 = null;
         _btnTabBank10.dispose();
         _btnTabBank10 = null;
         _btnTabBank11.dispose();
         _btnTabBank11 = null;
         _btnTabBank12.dispose();
         _btnTabBank12 = null;
         _btnTabBank13.dispose();
         _btnTabBank13 = null;
         _btnTabBank14.dispose();
         _btnTabBank14 = null;
         _btnTabBank15.dispose();
         _btnTabBank15 = null;
         _btnTabBank16.dispose();
         _btnTabBank16 = null;
         _btnTabBank17.dispose();
         _btnTabBank17 = null;
         _btnTabBank18.dispose();
         _btnTabBank18 = null;
         _btnTabBank19.dispose();
         _btnTabBank19 = null;
         _btnTabBank20.dispose();
         _btnTabBank20 = null;
         _btnTabBank21.dispose();
         _btnTabBank21 = null;
         _inventorySlot1.dispose();
         _inventorySlot2.dispose();
         _inventorySlot3.dispose();
         _inventorySlot4.dispose();
         _inventorySlot5.dispose();
         _inventorySlot6.dispose();
         _inventorySlot7.dispose();
         _inventorySlot8.dispose();
         _inventorySlot9.dispose();
         _inventorySlot10.dispose();
         _inventorySlot11.dispose();
         _inventorySlot12.dispose();
         _inventorySlot13.dispose();
         _inventorySlot14.dispose();
         _inventorySlot15.dispose();
         _inventorySlot16.dispose();
         _inventorySlot17.dispose();
         _inventorySlot18.dispose();
         _inventorySlot1 = null;
         _inventorySlot2 = null;
         _inventorySlot3 = null;
         _inventorySlot4 = null;
         _inventorySlot5 = null;
         _inventorySlot6 = null;
         _inventorySlot7 = null;
         _inventorySlot8 = null;
         _inventorySlot9 = null;
         _inventorySlot10 = null;
         _inventorySlot11 = null;
         _inventorySlot12 = null;
         _inventorySlot13 = null;
         _inventorySlot14 = null;
         _inventorySlot15 = null;
         _inventorySlot16 = null;
         _inventorySlot17 = null;
         _inventorySlot18 = null;
         _bankSlot1.dispose();
         _bankSlot2.dispose();
         _bankSlot3.dispose();
         _bankSlot4.dispose();
         _bankSlot5.dispose();
         _bankSlot6.dispose();
         _bankSlot7.dispose();
         _bankSlot8.dispose();
         _bankSlot9.dispose();
         _bankSlot10.dispose();
         _bankSlot11.dispose();
         _bankSlot12.dispose();
         _bankSlot13.dispose();
         _bankSlot14.dispose();
         _bankSlot15.dispose();
         _bankSlot16.dispose();
         _bankSlot17.dispose();
         _bankSlot18.dispose();
         _bankSlot1 = null;
         _bankSlot2 = null;
         _bankSlot3 = null;
         _bankSlot4 = null;
         _bankSlot5 = null;
         _bankSlot6 = null;
         _bankSlot7 = null;
         _bankSlot8 = null;
         _bankSlot9 = null;
         _bankSlot10 = null;
         _bankSlot11 = null;
         _bankSlot12 = null;
         _bankSlot13 = null;
         _bankSlot14 = null;
         _bankSlot15 = null;
         _bankSlot16 = null;
         _bankSlot17 = null;
         _bankSlot18 = null;
         _btnSellAll.dispose();
         _btnSellAll = null;
         super.dispose();
      }
      
      private function refreshUI() : void
      {
         refreshInventory();
         switchBag(User.current.character.currentBag);
         switchBank(User.current.character.currentBank);
      }
      
      private function refreshBank() : void
      {
         var _loc1_:SymbolDialogBankInventoryGeneric = _vo as SymbolDialogBankInventoryGeneric;
         var _loc2_:* = _bankIndex > User.current.character.maxBankIndex;
         _bankSlot1.data = {
            "bankIndex":_bankIndex,
            "targetSlotIndex":0
         };
         _bankSlot2.data = {
            "bankIndex":_bankIndex,
            "targetSlotIndex":1
         };
         _bankSlot3.data = {
            "bankIndex":_bankIndex,
            "targetSlotIndex":2
         };
         _bankSlot4.data = {
            "bankIndex":_bankIndex,
            "targetSlotIndex":3
         };
         _bankSlot5.data = {
            "bankIndex":_bankIndex,
            "targetSlotIndex":4
         };
         _bankSlot6.data = {
            "bankIndex":_bankIndex,
            "targetSlotIndex":5
         };
         _bankSlot7.data = {
            "bankIndex":_bankIndex,
            "targetSlotIndex":6
         };
         _bankSlot8.data = {
            "bankIndex":_bankIndex,
            "targetSlotIndex":7
         };
         _bankSlot9.data = {
            "bankIndex":_bankIndex,
            "targetSlotIndex":8
         };
         _bankSlot10.data = {
            "bankIndex":_bankIndex,
            "targetSlotIndex":9
         };
         _bankSlot11.data = {
            "bankIndex":_bankIndex,
            "targetSlotIndex":10
         };
         _bankSlot12.data = {
            "bankIndex":_bankIndex,
            "targetSlotIndex":11
         };
         _bankSlot13.data = {
            "bankIndex":_bankIndex,
            "targetSlotIndex":12
         };
         _bankSlot14.data = {
            "bankIndex":_bankIndex,
            "targetSlotIndex":13
         };
         _bankSlot15.data = {
            "bankIndex":_bankIndex,
            "targetSlotIndex":14
         };
         _bankSlot16.data = {
            "bankIndex":_bankIndex,
            "targetSlotIndex":15
         };
         _bankSlot17.data = {
            "bankIndex":_bankIndex,
            "targetSlotIndex":16
         };
         _bankSlot18.data = {
            "bankIndex":_bankIndex,
            "targetSlotIndex":17
         };
         var _loc3_:* = 0.5;
         _bankSlot1.container.alpha = !!_loc2_?_loc3_:1;
         _bankSlot2.container.alpha = !!_loc2_?_loc3_:1;
         _bankSlot3.container.alpha = !!_loc2_?_loc3_:1;
         _bankSlot4.container.alpha = !!_loc2_?_loc3_:1;
         _bankSlot5.container.alpha = !!_loc2_?_loc3_:1;
         _bankSlot6.container.alpha = !!_loc2_?_loc3_:1;
         _bankSlot7.container.alpha = !!_loc2_?_loc3_:1;
         _bankSlot8.container.alpha = !!_loc2_?_loc3_:1;
         _bankSlot9.container.alpha = !!_loc2_?_loc3_:1;
         _bankSlot10.container.alpha = !!_loc2_?_loc3_:1;
         _bankSlot11.container.alpha = !!_loc2_?_loc3_:1;
         _bankSlot12.container.alpha = !!_loc2_?_loc3_:1;
         _bankSlot13.container.alpha = !!_loc2_?_loc3_:1;
         _bankSlot14.container.alpha = !!_loc2_?_loc3_:1;
         _bankSlot15.container.alpha = !!_loc2_?_loc3_:1;
         _bankSlot16.container.alpha = !!_loc2_?_loc3_:1;
         _bankSlot17.container.alpha = !!_loc2_?_loc3_:1;
         _bankSlot18.container.alpha = !!_loc2_?_loc3_:1;
         _bankSlot1.locked = _loc2_;
         _bankSlot2.locked = _loc2_;
         _bankSlot3.locked = _loc2_;
         _bankSlot4.locked = _loc2_;
         _bankSlot5.locked = _loc2_;
         _bankSlot6.locked = _loc2_;
         _bankSlot7.locked = _loc2_;
         _bankSlot8.locked = _loc2_;
         _bankSlot9.locked = _loc2_;
         _bankSlot10.locked = _loc2_;
         _bankSlot11.locked = _loc2_;
         _bankSlot12.locked = _loc2_;
         _bankSlot13.locked = _loc2_;
         _bankSlot14.locked = _loc2_;
         _bankSlot15.locked = _loc2_;
         _bankSlot16.locked = _loc2_;
         _bankSlot17.locked = _loc2_;
         _bankSlot18.locked = _loc2_;
         _btnUpgrade.visible = _loc2_;
         _loc1_.txtInfo.visible = _loc2_;
         _loc1_.iconLock.visible = _loc2_;
         _btnSellAll.visible = !_loc2_;
         if(_loc2_)
         {
            _btnUpgrade.premiumAmount = Constants.current.getInt("bank_upgrade" + (User.current.character.maxBankIndex + 1).toString() + "_premium_amount");
            _bankSlot1.item = null;
            _bankSlot2.item = null;
            _bankSlot3.item = null;
            _bankSlot4.item = null;
            _bankSlot5.item = null;
            _bankSlot6.item = null;
            _bankSlot7.item = null;
            _bankSlot8.item = null;
            _bankSlot9.item = null;
            _bankSlot10.item = null;
            _bankSlot11.item = null;
            _bankSlot12.item = null;
            _bankSlot13.item = null;
            _bankSlot14.item = null;
            _bankSlot15.item = null;
            _bankSlot16.item = null;
            _bankSlot17.item = null;
            _bankSlot18.item = null;
            return;
         }
         _bankSlot1.item = User.current.character.bankInventory.getItemByIndex(_bankIndex,0);
         _bankSlot2.item = User.current.character.bankInventory.getItemByIndex(_bankIndex,1);
         _bankSlot3.item = User.current.character.bankInventory.getItemByIndex(_bankIndex,2);
         _bankSlot4.item = User.current.character.bankInventory.getItemByIndex(_bankIndex,3);
         _bankSlot5.item = User.current.character.bankInventory.getItemByIndex(_bankIndex,4);
         _bankSlot6.item = User.current.character.bankInventory.getItemByIndex(_bankIndex,5);
         _bankSlot7.item = User.current.character.bankInventory.getItemByIndex(_bankIndex,6);
         _bankSlot8.item = User.current.character.bankInventory.getItemByIndex(_bankIndex,7);
         _bankSlot9.item = User.current.character.bankInventory.getItemByIndex(_bankIndex,8);
         _bankSlot10.item = User.current.character.bankInventory.getItemByIndex(_bankIndex,9);
         _bankSlot11.item = User.current.character.bankInventory.getItemByIndex(_bankIndex,10);
         _bankSlot12.item = User.current.character.bankInventory.getItemByIndex(_bankIndex,11);
         _bankSlot13.item = User.current.character.bankInventory.getItemByIndex(_bankIndex,12);
         _bankSlot14.item = User.current.character.bankInventory.getItemByIndex(_bankIndex,13);
         _bankSlot15.item = User.current.character.bankInventory.getItemByIndex(_bankIndex,14);
         _bankSlot16.item = User.current.character.bankInventory.getItemByIndex(_bankIndex,15);
         _bankSlot17.item = User.current.character.bankInventory.getItemByIndex(_bankIndex,16);
         _bankSlot18.item = User.current.character.bankInventory.getItemByIndex(_bankIndex,17);
      }
      
      private function onClickTabBank1(param1:InteractionEvent) : void
      {
         switchBank(0);
      }
      
      private function onClickTabBank2(param1:InteractionEvent) : void
      {
         switchBank(1);
      }
      
      private function onClickTabBank3(param1:InteractionEvent) : void
      {
         switchBank(2);
      }
      
      private function onClickTabBank4(param1:InteractionEvent) : void
      {
         switchBank(3);
      }
      
      private function onClickTabBank5(param1:InteractionEvent) : void
      {
         switchBank(4);
      }
      
      private function onClickTabBank6(param1:InteractionEvent) : void
      {
         switchBank(5);
      }
      
      private function onClickTabBank7(param1:InteractionEvent) : void
      {
         switchBank(6);
      }
      
      private function onClickTabBank8(param1:InteractionEvent) : void
      {
         switchBank(7);
      }
      
      private function onClickTabBank9(param1:InteractionEvent) : void
      {
         switchBank(8);
      }
      
      private function onClickTabBank10(param1:InteractionEvent) : void
      {
         switchBank(9);
      }
      
      private function onClickTabBank11(param1:InteractionEvent) : void
      {
         switchBank(10);
      }
      
      private function onClickTabBank12(param1:InteractionEvent) : void
      {
         switchBank(11);
      }
      
      private function onClickTabBank13(param1:InteractionEvent) : void
      {
         switchBank(12);
      }
      
      private function onClickTabBank14(param1:InteractionEvent) : void
      {
         switchBank(13);
      }
      
      private function onClickTabBank15(param1:InteractionEvent) : void
      {
         switchBank(14);
      }
      
      private function onClickTabBank16(param1:InteractionEvent) : void
      {
         switchBank(15);
      }
      
      private function onClickTabBank17(param1:InteractionEvent) : void
      {
         switchBank(16);
      }
      
      private function onClickTabBank18(param1:InteractionEvent) : void
      {
         switchBank(17);
      }
      
      private function onClickTabBank19(param1:InteractionEvent) : void
      {
         switchBank(18);
      }
      
      private function onClickTabBank20(param1:InteractionEvent) : void
      {
         switchBank(19);
      }
      
      private function onClickTabBank21(param1:InteractionEvent) : void
      {
         switchBank(20);
      }
      
      private function switchBank(param1:int) : void
      {
         _bankIndex = param1;
         _btnTabBank1.tabbed = param1 == 0;
         _btnTabBank2.tabbed = param1 == 1;
         _btnTabBank3.tabbed = param1 == 2;
         _btnTabBank4.tabbed = param1 == 3;
         _btnTabBank5.tabbed = param1 == 4;
         _btnTabBank6.tabbed = param1 == 5;
         _btnTabBank7.tabbed = param1 == 6;
         _btnTabBank8.tabbed = param1 == 7;
         _btnTabBank9.tabbed = param1 == 8;
         _btnTabBank10.tabbed = param1 == 9;
         _btnTabBank11.tabbed = param1 == 10;
         _btnTabBank12.tabbed = param1 == 11;
         _btnTabBank13.tabbed = param1 == 12;
         _btnTabBank14.tabbed = param1 == 13;
         _btnTabBank15.tabbed = param1 == 14;
         _btnTabBank16.tabbed = param1 == 15;
         _btnTabBank17.tabbed = param1 == 16;
         _btnTabBank18.tabbed = param1 == 17;
         _btnTabBank19.tabbed = param1 == 18;
         _btnTabBank20.tabbed = param1 == 19;
         _btnTabBank21.tabbed = param1 == 20;
         _btnTabBank3.buttonEnabled = User.current.character.maxBankIndex >= 1;
         _btnTabBank4.buttonEnabled = User.current.character.maxBankIndex >= 2;
         _btnTabBank5.buttonEnabled = User.current.character.maxBankIndex >= 3;
         _btnTabBank6.buttonEnabled = User.current.character.maxBankIndex >= 4;
         _btnTabBank7.buttonEnabled = User.current.character.maxBankIndex >= 5;
         _btnTabBank8.buttonEnabled = User.current.character.maxBankIndex >= 6;
         _btnTabBank9.buttonEnabled = User.current.character.maxBankIndex >= 7;
         _btnTabBank10.buttonEnabled = User.current.character.maxBankIndex >= 8;
         _btnTabBank11.buttonEnabled = User.current.character.maxBankIndex >= 9;
         _btnTabBank12.buttonEnabled = User.current.character.maxBankIndex >= 10;
         _btnTabBank13.buttonEnabled = User.current.character.maxBankIndex >= 11;
         _btnTabBank14.buttonEnabled = User.current.character.maxBankIndex >= 12;
         _btnTabBank15.buttonEnabled = User.current.character.maxBankIndex >= 13;
         _btnTabBank16.buttonEnabled = User.current.character.maxBankIndex >= 14;
         _btnTabBank17.buttonEnabled = User.current.character.maxBankIndex >= 15;
         _btnTabBank18.buttonEnabled = User.current.character.maxBankIndex >= 16;
         _btnTabBank19.buttonEnabled = User.current.character.maxBankIndex >= 17;
         _btnTabBank20.buttonEnabled = User.current.character.maxBankIndex >= 18;
         _btnTabBank21.buttonEnabled = User.current.character.maxBankIndex >= 19;
         if(User.current != null && User.current.character != null)
         {
            User.current.character.currentBank = param1;
         }
         refreshBank();
      }
      
      private function requestBankTooltip(param1:int) : String
      {
         if(User.current.character.maxBankIndex < param1 - 1)
         {
            if(User.current.character.maxBankIndex < param1 - 2)
            {
               return LocText.current.text("bank_inventory/locked_unlock_next_bank_inventory",param1);
            }
            return LocText.current.text("bank_inventory/locked",param1);
         }
         return LocText.current.text("bank_inventory/info",param1,GameUtil.getItemCountString(User.current.character.bankInventory.getBankItemCount(param1 - 1)));
      }
      
      private function requestBank1Tooltip() : String
      {
         return requestBankTooltip(1);
      }
      
      private function requestBank2Tooltip() : String
      {
         return requestBankTooltip(2);
      }
      
      private function requestBank3Tooltip() : String
      {
         return requestBankTooltip(3);
      }
      
      private function requestBank4Tooltip() : String
      {
         return requestBankTooltip(4);
      }
      
      private function requestBank5Tooltip() : String
      {
         return requestBankTooltip(5);
      }
      
      private function requestBank6Tooltip() : String
      {
         return requestBankTooltip(6);
      }
      
      private function requestBank7Tooltip() : String
      {
         return requestBankTooltip(7);
      }
      
      private function requestBank8Tooltip() : String
      {
         return requestBankTooltip(8);
      }
      
      private function requestBank9Tooltip() : String
      {
         return requestBankTooltip(9);
      }
      
      private function requestBank10Tooltip() : String
      {
         return requestBankTooltip(10);
      }
      
      private function requestBank11Tooltip() : String
      {
         return requestBankTooltip(11);
      }
      
      private function requestBank12Tooltip() : String
      {
         return requestBankTooltip(12);
      }
      
      private function requestBank13Tooltip() : String
      {
         return requestBankTooltip(13);
      }
      
      private function requestBank14Tooltip() : String
      {
         return requestBankTooltip(14);
      }
      
      private function requestBank15Tooltip() : String
      {
         return requestBankTooltip(15);
      }
      
      private function requestBank16Tooltip() : String
      {
         return requestBankTooltip(16);
      }
      
      private function requestBank17Tooltip() : String
      {
         return requestBankTooltip(17);
      }
      
      private function requestBank18Tooltip() : String
      {
         return requestBankTooltip(18);
      }
      
      private function requestBank19Tooltip() : String
      {
         return requestBankTooltip(19);
      }
      
      private function requestBank20Tooltip() : String
      {
         return requestBankTooltip(20);
      }
      
      private function requestBank21Tooltip() : String
      {
         return requestBankTooltip(21);
      }
      
      private function refreshInventory() : void
      {
         if(!_inventorySlot1)
         {
            return;
         }
         _inventorySlot1.container.visible = _btnTabBag1.tabbed;
         _inventorySlot2.container.visible = _btnTabBag1.tabbed;
         _inventorySlot3.container.visible = _btnTabBag1.tabbed;
         _inventorySlot4.container.visible = _btnTabBag1.tabbed;
         _inventorySlot5.container.visible = _btnTabBag1.tabbed;
         _inventorySlot6.container.visible = _btnTabBag1.tabbed;
         _inventorySlot7.container.visible = _btnTabBag2.tabbed;
         _inventorySlot8.container.visible = _btnTabBag2.tabbed;
         _inventorySlot9.container.visible = _btnTabBag2.tabbed;
         _inventorySlot10.container.visible = _btnTabBag2.tabbed;
         _inventorySlot11.container.visible = _btnTabBag2.tabbed;
         _inventorySlot12.container.visible = _btnTabBag2.tabbed;
         _inventorySlot13.container.visible = _btnTabBag3.tabbed;
         _inventorySlot14.container.visible = _btnTabBag3.tabbed;
         _inventorySlot15.container.visible = _btnTabBag3.tabbed;
         _inventorySlot16.container.visible = _btnTabBag3.tabbed;
         _inventorySlot17.container.visible = _btnTabBag3.tabbed;
         _inventorySlot18.container.visible = _btnTabBag3.tabbed;
         var _loc1_:Character = User.current.character;
         _inventorySlot1.item = _loc1_.getItem("bag_item1_id");
         _inventorySlot2.item = _loc1_.getItem("bag_item2_id");
         _inventorySlot3.item = _loc1_.getItem("bag_item3_id");
         _inventorySlot4.item = _loc1_.getItem("bag_item4_id");
         _inventorySlot5.item = _loc1_.getItem("bag_item5_id");
         _inventorySlot6.item = _loc1_.getItem("bag_item6_id");
         _inventorySlot7.item = _loc1_.getItem("bag_item7_id");
         _inventorySlot8.item = _loc1_.getItem("bag_item8_id");
         _inventorySlot9.item = _loc1_.getItem("bag_item9_id");
         _inventorySlot10.item = _loc1_.getItem("bag_item10_id");
         _inventorySlot11.item = _loc1_.getItem("bag_item11_id");
         _inventorySlot12.item = _loc1_.getItem("bag_item12_id");
         _inventorySlot13.item = _loc1_.getItem("bag_item13_id");
         _inventorySlot14.item = _loc1_.getItem("bag_item14_id");
         _inventorySlot15.item = _loc1_.getItem("bag_item15_id");
         _inventorySlot16.item = _loc1_.getItem("bag_item16_id");
         _inventorySlot17.item = _loc1_.getItem("bag_item17_id");
         _inventorySlot18.item = _loc1_.getItem("bag_item18_id");
      }
      
      private function onClickTabBag1(param1:InteractionEvent) : void
      {
         switchBag(0);
      }
      
      private function onClickTabBag2(param1:InteractionEvent) : void
      {
         switchBag(1);
      }
      
      private function onClickTabBag3(param1:InteractionEvent) : void
      {
         switchBag(2);
      }
      
      private function switchBag(param1:int) : void
      {
         if(!_btnTabBag1)
         {
            return;
         }
         _bagIndex = param1;
         _btnTabBag1.tabbed = param1 == 0;
         _btnTabBag2.tabbed = param1 == 1;
         _btnTabBag3.tabbed = param1 == 2;
         _inventorySlot1.container.visible = param1 == 0;
         _inventorySlot2.container.visible = param1 == 0;
         _inventorySlot3.container.visible = param1 == 0;
         _inventorySlot4.container.visible = param1 == 0;
         _inventorySlot5.container.visible = param1 == 0;
         _inventorySlot6.container.visible = param1 == 0;
         _inventorySlot7.container.visible = param1 == 1;
         _inventorySlot8.container.visible = param1 == 1;
         _inventorySlot9.container.visible = param1 == 1;
         _inventorySlot10.container.visible = param1 == 1;
         _inventorySlot11.container.visible = param1 == 1;
         _inventorySlot12.container.visible = param1 == 1;
         _inventorySlot13.container.visible = param1 == 2;
         _inventorySlot14.container.visible = param1 == 2;
         _inventorySlot15.container.visible = param1 == 2;
         _inventorySlot16.container.visible = param1 == 2;
         _inventorySlot17.container.visible = param1 == 2;
         _inventorySlot18.container.visible = param1 == 2;
         if(User.current != null && User.current.character != null)
         {
            User.current.character.currentBag = param1;
         }
         refreshBag();
      }
      
      private function requestBag1Tooltip() : String
      {
         return LocText.current.text("inventory/info",1,GameUtil.getItemCountString(User.current.character.inventory.bag1ItemCount));
      }
      
      private function requestBag2Tooltip() : String
      {
         if(_btnTabBag2.buttonEnabled)
         {
            return LocText.current.text("inventory/info",2,GameUtil.getItemCountString(User.current.character.inventory.bag2ItemCount));
         }
         return LocText.current.text("inventory/locked",2,CConstant.inventory_bag2_unlock_level);
      }
      
      private function requestBag3Tooltip() : String
      {
         return LocText.current.text("inventory/info",3,GameUtil.getItemCountString(User.current.character.inventory.bag3ItemCount));
      }
      
      private function refreshBag() : void
      {
         if(User.current == null || User.current.character == null)
         {
            return;
         }
         var _loc1_:* = User.current.character.level >= CConstant.inventory_bag2_unlock_level;
         var _loc2_:* = User.current.character.level >= CConstant.inventory_bag3_unlock_level;
         _btnTabBag1.visible = _loc1_;
         _btnTabBag2.visible = _loc1_;
         _btnTabBag3.visible = _loc2_;
         if(_loc2_)
         {
            _btnTabBag1.content.x = -285;
            _btnTabBag2.content.x = -238;
            _btnTabBag3.content.x = -191;
         }
         else
         {
            _btnTabBag1.content.x = -257;
            _btnTabBag2.content.x = -208;
         }
      }
      
      private function onClickClose(param1:InteractionEvent) : void
      {
         close();
      }
      
      private function onClickUpgrade(param1:InteractionEvent) : void
      {
         Environment.application.sendActionRequest("upgradeBankInventory",{},handleRequests);
      }
      
      private function onClickSellAll(param1:InteractionEvent) : void
      {
         interactionEvent = param1;
         var itemsToSell:int = 0;
         var lockedItems:int = 0;
         var sellPrice:int = 0;
         var item:Item = null;
         var bankInventory:BankInventory = User.current.character.bankInventory;
         var i:int = 0;
         while(i < 18)
         {
            item = bankInventory.getItemByIndex(_bankIndex,i);
            if(item)
            {
               if(bankInventory.isItemLocked(item.id))
               {
                  lockedItems = lockedItems + 1;
               }
               else
               {
                  itemsToSell = itemsToSell + 1;
                  sellPrice = sellPrice + item.sellPrice;
               }
            }
            i = Number(i) + 1;
         }
         if(itemsToSell == 0 && lockedItems == 0)
         {
            Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/bank_inventory/err_sell_all_bank_items_no_items_title"),LocText.current.text("dialog/bank_inventory/err_sell_all_bank_items_no_items_text"),LocText.current.text("general/button_ok")));
            return;
         }
         if(itemsToSell == 0 && lockedItems > 0)
         {
            Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/bank_inventory/err_sell_all_bank_items_no_unlocked_items_title"),LocText.current.text("dialog/bank_inventory/err_sell_all_bank_items_no_unlocked_items_text"),LocText.current.text("general/button_ok")));
            return;
         }
         var sellCallback:Function = function():void
         {
            Environment.application.sendActionRequest("sellAllBankInventoryItems",{"bank_index":_bankIndex},handleRequests);
         };
         var message:String = LocText.current.text("dialog/bank_inventory/sell_all_bank_items/text",itemsToSell,GameUtil.getGameCurrencyString(sellPrice));
         if(lockedItems > 0)
         {
            message = message + ("\n\n" + LocText.current.text("dialog/bank_inventory/sell_all_bank_items/text_locked_items",lockedItems));
         }
         var outfits:Vector.<Outfit> = new Vector.<Outfit>();
         i = 0;
         while(i < 18)
         {
            item = bankInventory.getItemByIndex(_bankIndex,i);
            if(item)
            {
               if(!bankInventory.isItemLocked(item.id))
               {
                  itemsToSell = itemsToSell + 1;
                  sellPrice = sellPrice + item.sellPrice;
                  var outfitsOfItem:Vector.<Outfit> = User.current.character.outfits.getOutfitsWithItem(item);
                  var _loc4_:int = 0;
                  var _loc3_:* = outfitsOfItem;
                  for each(outfit in outfitsOfItem)
                  {
                     if(outfits.indexOf(outfit) < 0)
                     {
                        outfits.push(outfit);
                     }
                  }
               }
            }
            i = Number(i) + 1;
         }
         if(outfits.length > 0)
         {
            var outfitsText:String = "";
            var _loc6_:int = 0;
            var _loc5_:* = outfits;
            for each(outfit in outfits)
            {
               if(outfitsText != "")
               {
                  outfitsText = outfitsText + "\n";
               }
               outfitsText = outfitsText + (" - " + outfit.name);
            }
            if(itemsToSell == 1)
            {
               message = message + ("\n\n" + LocText.current.text("dialog/sell_outfit_item/text",outfitsText));
            }
            else
            {
               message = message + ("\n\n" + LocText.current.text("dialog/sell_all_bank_items_outfit/text",outfitsText));
            }
         }
         Environment.panelManager.showDialog(new UiTwoChoiceDialog(LocText.current.text("dialog/bank_inventory/sell_all_bank_items/title"),message,LocText.current.text("dialog/sell_item/button_sell"),LocText.current.text("general/button_cancel"),sellCallback,null));
      }
      
      private function lockItem(param1:Item) : void
      {
         Environment.application.sendActionRequest("lockBankItem",{"item_id":param1.id},handleRequests);
      }
      
      private function unlockItem(param1:Item) : void
      {
         Environment.application.sendActionRequest("unlockBankItem",{"item_id":param1.id},handleRequests);
      }
      
      private function handleMessages(param1:Message) : void
      {
         var _loc2_:* = param1.type;
         switch(_loc2_)
         {
            case "InventoryMessage.notifyDataUpdated":
               refreshInventory();
               switchBag(User.current.character.currentBag);
               break;
            case "BankInventoryMessage.notifyDataUpdated":
               if(_btnTabBank1)
               {
                  refreshUI();
               }
               break;
            case "BankInventoryMessage.notifyLockItem":
               if(_btnTabBank1)
               {
                  lockItem(param1.data as Item);
               }
               break;
            case "BankInventoryMessage.notifyUnlockItem":
               if(_btnTabBank1)
               {
                  unlockItem(param1.data as Item);
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
            case "upgradeBankInventory":
               if(param1.error == "")
               {
                  Environment.application.updateData(param1.data);
               }
               else if(param1.error == "errRemovePremiumCurrencyNotEnough")
               {
                  ViewManager.instance.showNotEnoughPremiumDialog(_btnUpgrade.premiumAmount);
               }
               else
               {
                  Environment.reportError(param1.error,param1.request);
               }
               break;
            case "lockBankItem":
               if(param1.error == "")
               {
                  Environment.application.updateData(param1.data);
                  refreshBank();
               }
               else
               {
                  Environment.reportError(param1.error,param1.request);
               }
               break;
            case "unlockBankItem":
               if(param1.error == "")
               {
                  Environment.application.updateData(param1.data);
                  refreshBank();
               }
               else
               {
                  Environment.reportError(param1.error,param1.request);
               }
               break;
            case "sellAllBankInventoryItems":
               if(param1.error == "")
               {
                  Environment.audio.playFX("item_sell.mp3");
                  Environment.application.updateData(param1.data);
                  refreshBank();
               }
               else
               {
                  Environment.reportError(param1.error,param1.request);
               }
               break;
            default:
               throw new Error("Unsupported request action \'" + param1.action + "\'!");
         }
         if(_btnTabBank1)
         {
            refreshUI();
         }
      }
      
      override public function get defaultButton() : Button
      {
         return _btnClose;
      }
      
      override public function onEscape() : void
      {
         close();
      }
   }
}
