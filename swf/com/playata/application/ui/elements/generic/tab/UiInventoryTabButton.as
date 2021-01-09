package com.playata.application.ui.elements.generic.tab
{
   import com.playata.application.data.user.User;
   import com.playata.application.messaging.Message;
   import com.playata.application.messaging.MessageRouter;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.application.ui.elements.item.UiItemGraphic;
   import com.playata.framework.display.ui.IDragSource;
   import com.playata.framework.display.ui.IDropTarget;
   import com.playata.framework.display.ui.TooltipLayer;
   import com.playata.framework.localization.LocText;
   import visuals.ui.elements.buttons.SymbolButtonNarrowTabGeneric;
   
   public class UiInventoryTabButton extends UiButton implements IDropTarget
   {
       
      
      private var _tabButton:SymbolButtonNarrowTabGeneric = null;
      
      private var _bagIndex:int = 0;
      
      public function UiInventoryTabButton(param1:SymbolButtonNarrowTabGeneric, param2:int, param3:String, param4:String, param5:Function)
      {
         _tabButton = param1;
         _bagIndex = param2;
         super(param1,param4,param5);
         this.caption = param3;
      }
      
      public function set tabbed(param1:Boolean) : void
      {
         _tabButton.tabbed.visible = param1;
         _tabButton.clear.visible = !param1;
      }
      
      public function get tabbed() : Boolean
      {
         return _tabButton.tabbed.visible;
      }
      
      public function set caption(param1:String) : void
      {
         _tabButton.tabbed.caption.autoFontSize = true;
         _tabButton.clear.caption.autoFontSize = true;
         _tabButton.tabbed.caption.text = param1;
         _tabButton.clear.caption.text = param1;
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
         var _loc3_:* = false;
         switch(int(_bagIndex))
         {
            case 0:
               _loc3_ = User.current.character.inventory.bag1ItemCount < 6;
               break;
            case 1:
               _loc3_ = User.current.character.inventory.bag2ItemCount < 6;
               break;
            case 2:
               _loc3_ = User.current.character.inventory.bag3ItemCount < 6;
         }
         if(isSameBag(_loc2_.itemSlot.itemSlotType))
         {
            tooltip = LocText.current.text("inventory/move_same_bag");
         }
         else if(_loc3_)
         {
            tooltip = LocText.current.text("inventory/move_here");
         }
         else
         {
            tooltip = LocText.current.text("inventory/bag_full");
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
      }
      
      public function onDrop(param1:IDragSource) : Boolean
      {
         if(!(param1 is UiItemGraphic))
         {
            return false;
         }
         var _loc2_:UiItemGraphic = param1 as UiItemGraphic;
         if(isSameBag(_loc2_.itemSlot.itemSlotType))
         {
            return false;
         }
         var _loc3_:* = false;
         switch(int(_bagIndex))
         {
            case 0:
               _loc3_ = User.current.character.inventory.bag1ItemCount < 6;
               break;
            case 1:
               _loc3_ = User.current.character.inventory.bag2ItemCount < 6;
               break;
            case 2:
               _loc3_ = User.current.character.inventory.bag3ItemCount < 6;
         }
         if(!_loc3_)
         {
            return false;
         }
         var _loc4_:int = User.current.character.inventory.getFreeSlotType(_bagIndex);
         if(_loc2_.itemSlot.itemSlotType == 100)
         {
            MessageRouter.dispatch(new Message("BankInventoryMessage.notifyRemoveItem",{
               "item":_loc2_.item.id,
               "targetSlot":_loc4_
            },this));
         }
         else
         {
            MessageRouter.dispatch(new Message("InventoryMessage.notifyMoveItem",{
               "item":_loc2_.item.id,
               "sourceSlot":_loc2_.item.itemSlotType,
               "targetSlot":_loc4_
            },this));
         }
         return true;
      }
      
      private function isSameBag(param1:int) : Boolean
      {
         var _loc2_:Boolean = false;
         switch(int(_bagIndex))
         {
            case 0:
               if(param1 == 20 || param1 == 21 || param1 == 22 || param1 == 23 || param1 == 24 || param1 == 25)
               {
                  _loc2_ = true;
               }
               break;
            case 1:
               if(param1 == 26 || param1 == 27 || param1 == 28 || param1 == 29 || param1 == 30 || param1 == 31)
               {
                  _loc2_ = true;
               }
               break;
            case 2:
               if(param1 == 32 || param1 == 33 || param1 == 34 || param1 == 35 || param1 == 36 || param1 == 37)
               {
                  _loc2_ = true;
                  break;
               }
         }
         return _loc2_;
      }
   }
}
