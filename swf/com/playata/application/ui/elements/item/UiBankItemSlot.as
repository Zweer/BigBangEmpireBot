package com.playata.application.ui.elements.item
{
   import com.playata.application.data.item.Item;
   import com.playata.application.data.user.User;
   import com.playata.application.messaging.Message;
   import com.playata.application.messaging.MessageRouter;
   import com.playata.framework.application.Environment;
   import com.playata.framework.input.InteractionEvent;
   import visuals.ui.elements.item.SymbolBankItemSlotGeneric;
   
   public class UiBankItemSlot extends UiItemSlot
   {
       
      
      private var _lockButton:UiBankItemLockButton = null;
      
      public function UiBankItemSlot(param1:SymbolBankItemSlotGeneric, param2:int)
      {
         super(param1.itemSlot,param2);
         _lockButton = new UiBankItemLockButton(param1.lock,onClickLock);
         if(!Environment.info.isTouchScreen)
         {
            onInteractionOver.add(handleInteractionOver);
            onInteractionOut.add(handleInteractionOut);
         }
         else
         {
            _lockButton.interactionEnabled = false;
         }
      }
      
      private function handleInteractionOver(param1:InteractionEvent) : void
      {
         if(item == null)
         {
            return;
         }
         if(!_lockButton.itemLocked)
         {
            _lockButton.tweenTo(0.2,{"alpha":1});
         }
      }
      
      private function handleInteractionOut(param1:InteractionEvent) : void
      {
         if(item == null)
         {
            return;
         }
         if(!_lockButton.itemLocked)
         {
            _lockButton.tweenTo(0.2,{"alpha":0});
         }
      }
      
      override public function dispose() : void
      {
         _lockButton.dispose();
         _lockButton = null;
         super.dispose();
      }
      
      override public function set item(param1:Item) : void
      {
         .super.item = param1;
         _lockButton.visible = param1 != null;
         if(param1)
         {
            _lockButton.itemLocked = User.current.character.bankInventory.isItemLocked(param1.id);
         }
      }
      
      private function onClickLock(param1:InteractionEvent) : void
      {
         if(_lockButton.itemLocked)
         {
            MessageRouter.dispatch(new Message("BankInventoryMessage.notifyUnlockItem",item,this));
         }
         else
         {
            MessageRouter.dispatch(new Message("BankInventoryMessage.notifyLockItem",item,this));
         }
      }
   }
}
