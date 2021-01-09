package com.playata.application.ui.elements.shop
{
   import com.playata.application.data.constants.CConstant;
   import com.playata.application.data.user.User;
   import com.playata.application.ui.dialogs.DialogWashingMachine;
   import com.playata.application.ui.effects.HighlightEffect;
   import com.playata.application.ui.elements.generic.dialog.UiInfoDialog;
   import com.playata.application.ui.elements.generic.textfield.UiTextTooltip;
   import com.playata.application.ui.elements.item.UiItemGraphic;
   import com.playata.framework.application.Environment;
   import com.playata.framework.display.IDisplayObject;
   import com.playata.framework.display.InteractiveDisplayObject;
   import com.playata.framework.display.ui.IDragSource;
   import com.playata.framework.display.ui.IDropTarget;
   import com.playata.framework.localization.LocText;
   import flash.geom.Rectangle;
   import visuals.ui.elements.icons.SymbolIconLockGeneric;
   import visuals.ui.elements.shop.SymbolShopWashAreaGeneric;
   
   public class UiWashArea extends InteractiveDisplayObject implements IDropTarget
   {
       
      
      private var _content:SymbolShopWashAreaGeneric = null;
      
      private var _lockIcon:SymbolIconLockGeneric = null;
      
      private var _washTooltip:UiTextTooltip = null;
      
      private var _highlight:HighlightEffect = null;
      
      public function UiWashArea(param1:SymbolShopWashAreaGeneric, param2:SymbolIconLockGeneric)
      {
         _content = param1;
         super(_content);
         _highlight = new HighlightEffect(_content.highlight,0.2,0.2,false);
         _lockIcon = param2;
         _washTooltip = new UiTextTooltip(_content,LocText.current.text("screen/item_shop/washing_machine_locked_tooltip"));
      }
      
      public static function openWashingMachine(param1:UiItemGraphic) : void
      {
         if(param1.item.type == 9)
         {
            Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/washing_machine_invalid_item/title"),LocText.current.text("dialog/washing_machine_invalid_item/text"),LocText.current.text("general/button_ok")));
            return;
         }
         if(param1.item.type == 11)
         {
            Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/washing_machine_invalid_item/title"),LocText.current.text("dialog/washing_machine_invalid_item_surprise_box/text"),LocText.current.text("general/button_ok")));
            return;
         }
         if(param1.item.type == 12)
         {
            Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/washing_machine_invalid_item/title"),LocText.current.text("dialog/washing_machine_invalid_item_shop_title/text"),LocText.current.text("general/button_ok")));
            return;
         }
         if(param1.item.type == 13)
         {
            Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/washing_machine_invalid_item/title"),LocText.current.text("dialog/washing_machine_invalid_item_reskill/text"),LocText.current.text("general/button_ok")));
            return;
         }
         if(param1.item.type == 14)
         {
            Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/washing_machine_invalid_item/title"),LocText.current.text("dialog/washing_machine_invalid_item_wedding_ring/text"),LocText.current.text("general/button_ok")));
            return;
         }
         if(param1.item.type == 15)
         {
            Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/washing_machine_invalid_item/title"),LocText.current.text("dialog/washing_machine_invalid_item_divorce_item/text"),LocText.current.text("general/button_ok")));
            return;
         }
         Environment.panelManager.showDialog(new DialogWashingMachine(param1.item));
      }
      
      override public function dispose() : void
      {
         _highlight.dispose();
         _washTooltip.dispose();
         _washTooltip = null;
         super.dispose();
      }
      
      public function refreshUI() : void
      {
         if(_lockIcon.visible)
         {
            _washTooltip.text = LocText.current.text("screen/item_shop/washing_machine_locked_tooltip",CConstant.washing_machine_req_level);
         }
         else
         {
            _washTooltip.text = LocText.current.text("screen/item_shop/washing_machine_tooltip");
         }
         _lockIcon.visible = visible && !User.current.character.washingMachineAvailable;
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
         if(_lockIcon.visible)
         {
            return false;
         }
         return true;
      }
      
      public function onDragIn(param1:IDragSource) : void
      {
         highlight();
      }
      
      public function onDragOut(param1:IDragSource) : void
      {
         unhighlight();
      }
      
      public function onDrop(param1:IDragSource) : Boolean
      {
         unhighlight();
         var _loc2_:UiItemGraphic = param1 as UiItemGraphic;
         openWashingMachine(_loc2_);
         return false;
      }
      
      private function highlight() : void
      {
         _highlight.highlight();
      }
      
      private function unhighlight() : void
      {
         _highlight.unhighlight();
      }
      
      override public function get bounds() : Rectangle
      {
         _displayObject = _content.graphic;
         var _loc1_:Rectangle = super.bounds;
         _displayObject = _content;
         return _loc1_;
      }
      
      override public function getBounds(param1:IDisplayObject, param2:Rectangle = null) : Rectangle
      {
         _displayObject = _content.graphic;
         var _loc3_:Rectangle = super.getBounds(param1,param2);
         _displayObject = _content;
         return _loc3_;
      }
   }
}
