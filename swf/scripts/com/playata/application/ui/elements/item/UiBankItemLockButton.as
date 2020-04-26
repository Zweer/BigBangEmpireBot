package com.playata.application.ui.elements.item
{
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.framework.application.Environment;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.elements.item.SymboBankInventoryItemIconLockGeneric;
   
   public class UiBankItemLockButton extends UiButton
   {
       
      
      private var _lock:SymboBankInventoryItemIconLockGeneric = null;
      
      private var _itemLocked:Boolean = false;
      
      public function UiBankItemLockButton(param1:SymboBankInventoryItemIconLockGeneric, param2:Function)
      {
         _lock = param1;
         super(param1,null,param2);
         _lock.locked.visible = true;
         _lock.unlocked.visible = false;
         tooltip = LocText.current.text("dialog/bank_inventory/lock_item_tooltip");
         alpha = 0;
      }
      
      override public function dispose() : void
      {
         super.dispose();
         _lock = null;
      }
      
      override protected function handleInteractionOver(param1:InteractionEvent) : void
      {
         if(!_itemLocked && !Environment.info.isTouchScreen)
         {
            killTweens();
            tweenTo(0.2,{"alpha":1});
         }
         super.handleInteractionOver(param1);
      }
      
      override protected function handleInteractionOut(param1:InteractionEvent) : void
      {
         if(!_itemLocked && !Environment.info.isTouchScreen)
         {
            tweenTo(0.2,{"alpha":0});
         }
         super.handleInteractionOut(param1);
      }
      
      public function set itemLocked(param1:Boolean) : void
      {
         _itemLocked = param1;
         killTweens();
         _lock.locked.visible = _itemLocked;
         _lock.unlocked.visible = !_itemLocked;
         if(_itemLocked)
         {
            alpha = 1;
            tooltip = LocText.current.text("dialog/bank_inventory/unlock_item_tooltip");
            if(Environment.info.isTouchScreen)
            {
               visible = true;
            }
         }
         else
         {
            alpha = 0;
            tooltip = LocText.current.text("dialog/bank_inventory/lock_item_tooltip");
            if(Environment.info.isTouchScreen)
            {
               visible = false;
            }
         }
      }
      
      public function get itemLocked() : Boolean
      {
         return _itemLocked;
      }
   }
}
