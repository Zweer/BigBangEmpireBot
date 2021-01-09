package com.playata.application.ui.elements.bank
{
   import com.playata.application.data.user.User;
   import com.playata.application.messaging.Message;
   import com.playata.application.messaging.MessageRouter;
   import com.playata.application.ui.elements.generic.tab.UiHighlightTabButton;
   import com.playata.application.ui.elements.item.UiItemGraphic;
   import com.playata.framework.display.ui.IDragSource;
   import com.playata.framework.display.ui.IDropTarget;
   import com.playata.framework.display.ui.TooltipLayer;
   import com.playata.framework.localization.LocText;
   import visuals.ui.elements.buttons.SymbolButtonNarrowTabGeneric;
   
   public class UiBankInventoryTabButton extends UiHighlightTabButton implements IDropTarget
   {
       
      
      private var _bankIndex:int = 0;
      
      public function UiBankInventoryTabButton(param1:SymbolButtonNarrowTabGeneric, param2:int, param3:String, param4:String, param5:Function)
      {
         _bankIndex = param2;
         super(param1,param3,param4,param5);
         this.caption = param3;
      }
      
      override public function set buttonEnabled(param1:Boolean) : void
      {
         .super.enabled = param1;
         if(enabled)
         {
            content.alpha = 1;
         }
         else
         {
            content.alpha = 0.8;
         }
      }
      
      public function acceptsDragSource(param1:IDragSource) : Boolean
      {
         if(!(param1 is UiItemGraphic))
         {
            return false;
         }
         var _loc2_:UiItemGraphic = param1 as UiItemGraphic;
         if(_loc2_.itemSlot.itemSlotType == 99)
         {
            return false;
         }
         if(_loc2_.item == null)
         {
            return false;
         }
         return true;
      }
      
      public function onDragIn(param1:IDragSource) : void
      {
         if(!(param1 is UiItemGraphic))
         {
            return;
         }
         var _loc2_:UiItemGraphic = param1 as UiItemGraphic;
         var _loc3_:* = User.current.character.bankInventory.getBankItemCount(_bankIndex) < 18;
         if(isLocked)
         {
            tooltip = LocText.current.text("inventory/bank_locked");
         }
         else if(isSameBank(_loc2_.item.id))
         {
            tooltip = LocText.current.text("inventory/move_same_bank");
         }
         else if(_loc3_)
         {
            tooltip = LocText.current.text("inventory/move_here");
            highlight();
         }
         else
         {
            tooltip = LocText.current.text("inventory/bank_full");
         }
         TooltipLayer.instance.showTooltips = true;
      }
      
      public function onDragOut(param1:IDragSource) : void
      {
         if(!(param1 is UiItemGraphic))
         {
            return;
         }
         var _loc2_:UiItemGraphic = param1 as UiItemGraphic;
         TooltipLayer.instance.showTooltips = false;
         unhighlight();
      }
      
      public function onDrop(param1:IDragSource) : Boolean
      {
         if(!(param1 is UiItemGraphic))
         {
            return false;
         }
         var _loc2_:UiItemGraphic = param1 as UiItemGraphic;
         if(isLocked)
         {
            return false;
         }
         if(isSameBank(_loc2_.item.id))
         {
            return false;
         }
         var _loc3_:* = User.current.character.bankInventory.getBankItemCount(_bankIndex) < 18;
         if(!_loc3_)
         {
            return false;
         }
         if(_loc2_.itemSlot.isBagSlotType)
         {
            MessageRouter.dispatch(new Message("BankInventoryMessage.notifyAddItem",{
               "item":_loc2_.item.id,
               "bankIndex":_bankIndex,
               "targetSlotIndex":-1
            },this));
         }
         else
         {
            MessageRouter.dispatch(new Message("BankInventoryMessage.notifyMoveItem",{
               "item":_loc2_.item.id,
               "bankIndex":_bankIndex,
               "targetSlotIndex":-1
            },this));
         }
         unhighlight();
         return true;
      }
      
      private function get isLocked() : Boolean
      {
         return _bankIndex > User.current.character.maxBankIndex;
      }
      
      private function isSameBank(param1:int) : Boolean
      {
         var _loc2_:int = User.current.character.bankInventory.getBankIndex(param1);
         return _bankIndex == _loc2_;
      }
   }
}
