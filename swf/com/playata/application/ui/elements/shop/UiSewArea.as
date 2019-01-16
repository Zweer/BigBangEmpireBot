package com.playata.application.ui.elements.shop
{
   import com.playata.application.data.constants.CConstant;
   import com.playata.application.data.user.User;
   import com.playata.application.ui.ViewManager;
   import com.playata.application.ui.dialogs.DialogSewingMachine;
   import com.playata.application.ui.effects.HighlightEffect;
   import com.playata.application.ui.elements.generic.dialog.UiInfoDialog;
   import com.playata.application.ui.elements.generic.textfield.UiTextTooltip;
   import com.playata.application.ui.elements.item.UiItemGraphic;
   import com.playata.framework.application.Environment;
   import com.playata.framework.display.IDisplayObject;
   import com.playata.framework.display.InteractiveDisplayObject;
   import com.playata.framework.display.ui.IDragSource;
   import com.playata.framework.display.ui.IDropTarget;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import flash.geom.Rectangle;
   import visuals.ui.elements.icons.SymbolIconLockGeneric;
   import visuals.ui.elements.shop.SymbolShopSewAreaGeneric;
   
   public class UiSewArea extends InteractiveDisplayObject implements IDropTarget
   {
       
      
      private var _content:SymbolShopSewAreaGeneric = null;
      
      private var _lockIcon:SymbolIconLockGeneric = null;
      
      private var _sewTooltip:UiTextTooltip = null;
      
      private var _highlight:HighlightEffect = null;
      
      public function UiSewArea(param1:SymbolShopSewAreaGeneric, param2:SymbolIconLockGeneric)
      {
         _content = param1;
         super(_content);
         _highlight = new HighlightEffect(_content.highlight,0.2,0.2,false);
         _lockIcon = param2;
         _sewTooltip = new UiTextTooltip(_content,LocText.current.text("screen/item_shop/sewing_machine_locked_tooltip"));
         onClick.add(handleSewAreaClick);
      }
      
      public static function openSewingMachine(param1:UiItemGraphic) : void
      {
         if(param1.item.type == 9)
         {
            Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/sewing_machine_invalid_item/title"),LocText.current.text("dialog/sewing_machine_invalid_item/text"),LocText.current.text("general/button_ok")));
            return;
         }
         if(param1.item.type == 11)
         {
            Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/sewing_machine_invalid_item/title"),LocText.current.text("dialog/sewing_machine_invalid_item_surprise_box/text"),LocText.current.text("general/button_ok")));
            return;
         }
         if(param1.item.type == 12)
         {
            Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/sewing_machine_invalid_item/title"),LocText.current.text("dialog/sewing_machine_invalid_item_shop_title/text"),LocText.current.text("general/button_ok")));
            return;
         }
         if(param1.item.type == 13)
         {
            Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/sewing_machine_invalid_item/title"),LocText.current.text("dialog/sewing_machine_invalid_item_reskill/text"),LocText.current.text("general/button_ok")));
            return;
         }
         if(param1.item.type == 14)
         {
            Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/sewing_machine_invalid_item/title"),LocText.current.text("dialog/sewing_machine_invalid_item_wedding_ring/text"),LocText.current.text("general/button_ok")));
            return;
         }
         if(param1.item.type == 15)
         {
            Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/sewing_machine_invalid_item/title"),LocText.current.text("dialog/sewing_machine_invalid_item_divorce_item/text"),LocText.current.text("general/button_ok")));
            return;
         }
         if(param1.item.itemSetIdentifier)
         {
            Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/sewing_machine_invalid_item/title"),LocText.current.text("dialog/sewing_machine_invalid_item_setitem/text"),LocText.current.text("general/button_ok")));
            return;
         }
         ViewManager.instance.tutorialArrow.hide();
         User.current.character.setTutorialFlag("sewing_machine_unlocked");
         Environment.panelManager.showDialog(new DialogSewingMachine(param1.item));
      }
      
      override public function dispose() : void
      {
         _highlight.dispose();
         _sewTooltip.dispose();
         _sewTooltip = null;
         super.dispose();
      }
      
      public function refreshUI() : void
      {
         if(_lockIcon.visible)
         {
            _sewTooltip.text = LocText.current.text("screen/item_shop/sewing_machine_locked_tooltip",CConstant.sewing_machine_req_level);
         }
         else
         {
            _sewTooltip.text = LocText.current.text("screen/item_shop/sewing_machine_tooltip");
         }
         _lockIcon.visible = visible && !User.current.character.sewingMachineAvailable;
         useHandCursor = !_lockIcon.visible && User.current.character.sewingMachineAvailable;
      }
      
      private function handleSewAreaClick(param1:InteractionEvent) : void
      {
         if(!User.current.character.sewingMachineAvailable)
         {
            return;
         }
         ViewManager.instance.tutorialArrow.hide();
         User.current.character.setTutorialFlag("sewing_machine_unlocked");
         Environment.panelManager.showDialog(new DialogSewingMachine());
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
         openSewingMachine(_loc2_);
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
