package com.playata.application.ui.elements.shop
{
   import com.playata.application.ui.dialogs.DialogSewingMachine;
   import com.playata.application.ui.elements.item.UiItemGraphic;
   import com.playata.framework.application.Environment;
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.ui.IDragSource;
   import com.playata.framework.display.ui.IDropTarget;
   
   public class UiShopSellLayer extends Sprite implements IDropTarget
   {
       
      
      private var _content:Sprite = null;
      
      public function UiShopSellLayer(param1:Sprite)
      {
         _content = param1;
         super(null,_content);
      }
      
      public function acceptsDragSource(param1:IDragSource) : Boolean
      {
         if(!(param1 is UiItemGraphic))
         {
            return false;
         }
         if(Environment.panelManager.dialogManager.getVisibleDialog(DialogSewingMachine) != null)
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
      }
      
      public function onDragOut(param1:IDragSource) : void
      {
      }
      
      public function onDrop(param1:IDragSource) : Boolean
      {
         var _loc2_:UiItemGraphic = param1 as UiItemGraphic;
         UiSellArea.sellItem(_loc2_);
         return false;
      }
   }
}
