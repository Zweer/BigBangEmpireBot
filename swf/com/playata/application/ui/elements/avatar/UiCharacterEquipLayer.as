package com.playata.application.ui.elements.avatar
{
   import com.playata.application.data.item.Item;
   import com.playata.application.data.user.User;
   import com.playata.application.ui.dialogs.DialogSewingMachine;
   import com.playata.application.ui.elements.item.UiItemGraphic;
   import com.playata.framework.application.Environment;
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.ui.IDragSource;
   import com.playata.framework.display.ui.IDropTarget;
   
   public class UiCharacterEquipLayer extends Sprite implements IDropTarget
   {
       
      
      private var _content:Sprite = null;
      
      public function UiCharacterEquipLayer(param1:Sprite)
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
         if(_loc2_.item == null)
         {
            return false;
         }
         if(!_loc2_.itemSlot || !_loc2_.itemSlot.itemGraphic)
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
         var _loc3_:UiItemGraphic = param1 as UiItemGraphic;
         if(_loc3_.item.isUsable)
         {
            _loc3_.useItem();
            return true;
         }
         var _loc2_:Item = User.current.character.getItemByType(_loc3_.item.type);
         if(_loc2_ && _loc2_.id == _loc3_.item.id)
         {
            return false;
         }
         _loc3_.itemSlot.itemGraphic.handleItemChange(_loc3_.item.itemSlotType,null);
         return true;
      }
   }
}
