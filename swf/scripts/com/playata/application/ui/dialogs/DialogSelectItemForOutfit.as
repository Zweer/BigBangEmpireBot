package com.playata.application.ui.dialogs
{
   import com.playata.application.data.character.AppearanceSettings;
   import com.playata.application.data.character.Character;
   import com.playata.application.data.item.Item;
   import com.playata.application.data.outfit.Outfit;
   import com.playata.application.data.user.User;
   import com.playata.application.messaging.Message;
   import com.playata.application.messaging.MessageRouter;
   import com.playata.application.ui.elements.avatar.UiAvatarPreview;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.application.ui.elements.generic.button.UiTextButton;
   import com.playata.application.ui.elements.generic.dialog.UiDialog;
   import com.playata.application.ui.elements.item.UiItemGraphic;
   import com.playata.application.ui.elements.item.UiItemSlot;
   import com.playata.application.ui.elements.item.UiItemTooltip;
   import com.playata.framework.application.Environment;
   import com.playata.framework.display.InteractiveDisplayObject;
   import com.playata.framework.display.ui.TooltipLayer;
   import com.playata.framework.display.ui.controls.Button;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.dialogs.SymbolDialogSelectItemForOutfitGeneric;
   import visuals.ui.elements.item.SymbolItemSlotGeneric;
   
   public class DialogSelectItemForOutfit extends UiDialog
   {
      
      private static const MAX_ITEMS:int = 10;
      
      private static const SCROLL_VALUE:int = 5;
       
      
      private var _btnClose:UiButton = null;
      
      private var _btnChange:UiTextButton = null;
      
      private var _btnScrollUp:UiButton = null;
      
      private var _btnScrollDown:UiButton = null;
      
      private var _currentItemSlot:UiItemSlot = null;
      
      private var _itemSlots:Vector.<UiItemSlot> = null;
      
      private var _selectedItem:Item = null;
      
      private var _possibleItems:Vector.<Item> = null;
      
      private var _currentScrollIndex:int = 0;
      
      private var _outfit:Outfit;
      
      private var _itemType:int;
      
      private var _onSetItemFuntion:Function;
      
      private var _previewAvatar:UiAvatarPreview = null;
      
      private var _previewAvatarClickLayer:InteractiveDisplayObject = null;
      
      public function DialogSelectItemForOutfit(param1:Outfit, param2:int, param3:Function)
      {
         var _loc5_:int = 0;
         var _loc6_:* = null;
         var _loc8_:* = null;
         var _loc4_:SymbolDialogSelectItemForOutfitGeneric = new SymbolDialogSelectItemForOutfitGeneric();
         super(_loc4_);
         _queued = false;
         _outfit = param1;
         _itemType = param2;
         _onSetItemFuntion = param3;
         UiItemTooltip.compareOutfit = _outfit;
         _loc4_.txtDialogTitle.text = LocText.current.text("dialog/select_item_for_outfit/title",typeName);
         _loc4_.txtInfo.text = LocText.current.text("dialog/select_item_for_outfit/info",typeName,_outfit.name);
         _loc4_.txtItemCaption.text = LocText.current.text("dialog/select_item_for_outfit/current_item_caption");
         _loc4_.txtItemsCaption.text = LocText.current.text("dialog/select_item_for_outfit/items_caption");
         _btnClose = new UiButton(_loc4_.btnClose,"",onClickClose);
         _btnChange = new UiTextButton(_loc4_.btnChange,LocText.current.text("dialog/select_item_for_outfit/btn_change"),"",onClickSelect);
         _btnScrollUp = new UiButton(_loc4_.btnScrollUp,"",onClickScrollUp);
         _btnScrollDown = new UiButton(_loc4_.btnScrollDown,"",onClickScrollDown);
         _previewAvatar = new UiAvatarPreview(_loc4_.avatarPreview);
         _loc4_.avatarPreview.bringToTop();
         _previewAvatarClickLayer = new InteractiveDisplayObject(_loc4_.avatarPreview);
         _previewAvatarClickLayer.onClick.add(hideAvatarPreview);
         MessageRouter.addListener("ItemMessage.notifyItemInteractionOver",handleMessages);
         MessageRouter.addListener("ItemMessage.notifyItemInteractionOut",handleMessages);
         var _loc7_:Item = null;
         if(!_outfit.isItemMissing(param2))
         {
            _loc7_ = _outfit.getItem(param2);
         }
         _currentItemSlot = new UiItemSlot(_loc4_.currentItemSlot,param2);
         _currentItemSlot.locked = true;
         _currentItemSlot.onClick.add(showCurrentItemTooltip);
         _currentItemSlot.useHandCursor = true;
         _currentItemSlot.item = _loc7_;
         _itemSlots = new Vector.<UiItemSlot>();
         _loc5_ = 1;
         while(_loc5_ <= 10)
         {
            _loc6_ = _loc4_.getChildByName("itemSlot" + _loc5_) as SymbolItemSlotGeneric;
            _loc8_ = new UiItemSlot(_loc6_,param2);
            _loc8_.locked = true;
            _loc8_.onClick.add(handleItemSlotClick);
            _loc8_.useHandCursor = true;
            _itemSlots.push(_loc8_);
            _loc5_++;
         }
         updatePossibleItems(_loc7_);
         _btnScrollUp.visible = _possibleItems.length > 10;
         _btnScrollDown.visible = _possibleItems.length > 10;
         onMouseWheel.add(handleMouseWheel);
         refresh();
      }
      
      private function updatePossibleItems(param1:Item) : void
      {
         var _loc5_:int = 0;
         var _loc4_:int = 0;
         _possibleItems = new Vector.<Item>();
         var _loc2_:Character = User.current.character;
         _possibleItems.push(null);
         var _loc3_:Item = _loc2_.getItemByType(_itemType);
         if(_loc3_ && _loc3_ != param1)
         {
            _possibleItems.push(_loc3_);
         }
         _loc5_ = 1;
         while(_loc5_ <= 18)
         {
            _loc3_ = _loc2_.getItem("bag_item" + _loc5_ + "_id");
            if(_loc3_ && _loc3_ != param1 && _loc3_.type == _itemType)
            {
               _possibleItems.push(_loc3_);
            }
            _loc5_++;
         }
         if(_loc2_.bankInventory)
         {
            _loc4_ = 0;
            while(_loc4_ <= _loc2_.bankInventory.maxBankIndex)
            {
               _loc5_ = 0;
               while(_loc5_ < 18)
               {
                  _loc3_ = _loc2_.bankInventory.getItemByIndex(_loc4_,_loc5_);
                  if(_loc3_ && _loc3_ != param1 && _loc3_.type == _itemType)
                  {
                     _possibleItems.push(_loc3_);
                  }
                  _loc5_++;
               }
               _loc4_++;
            }
         }
      }
      
      private function get typeName() : String
      {
         var _loc1_:String = null;
         switch(int(_itemType) - 1)
         {
            case 0:
               _loc1_ = LocText.current.text("general/item_head");
               break;
            case 1:
               _loc1_ = LocText.current.text("general/item_chest");
               break;
            case 2:
               _loc1_ = LocText.current.text("general/item_belt");
               break;
            case 3:
               _loc1_ = LocText.current.text("general/item_legs");
               break;
            case 4:
               _loc1_ = LocText.current.text("general/item_boots");
               break;
            case 5:
               _loc1_ = LocText.current.text("general/item_necklace");
               break;
            case 6:
               _loc1_ = LocText.current.text("general/item_ring");
               break;
            case 7:
               _loc1_ = LocText.current.text("general/item_gadget");
               break;
            default:
               _loc1_ = LocText.current.text("general/item_gadget");
               break;
            case 9:
               _loc1_ = LocText.current.text("general/item_piercing");
         }
         return _loc1_;
      }
      
      override public function dispose() : void
      {
         var _loc1_:int = 0;
         if(_btnClose == null)
         {
            return;
         }
         UiItemTooltip.compareOutfit = null;
         _btnClose.dispose();
         _btnChange.dispose();
         _btnScrollUp.dispose();
         _btnScrollDown.dispose();
         _btnClose = null;
         _btnChange = null;
         _btnScrollUp = null;
         _btnScrollDown = null;
         _currentItemSlot.dispose();
         _currentItemSlot = null;
         _previewAvatar.dispose();
         _previewAvatar = null;
         MessageRouter.removeAllListeners(handleMessages);
         _loc1_ = 1;
         while(_loc1_ < 10)
         {
            _itemSlots[_loc1_].dispose();
            _loc1_++;
         }
         _itemSlots = null;
         _previewAvatarClickLayer.dispose();
         _previewAvatarClickLayer = null;
         super.dispose();
      }
      
      private function refresh() : void
      {
         var _loc1_:int = 0;
         _loc1_ = 0;
         while(_loc1_ < 10)
         {
            if(_possibleItems.length > _currentScrollIndex + _loc1_)
            {
               _itemSlots[_loc1_].item = _possibleItems[_currentScrollIndex + _loc1_];
               _itemSlots[_loc1_].container.visible = true;
               _itemSlots[_loc1_].check = _itemSlots[_loc1_].item == _selectedItem;
            }
            else
            {
               _itemSlots[_loc1_].item = null;
               _itemSlots[_loc1_].container.visible = false;
            }
            _loc1_++;
         }
         _btnScrollUp.buttonEnabled = _currentScrollIndex > 0;
         _btnScrollDown.buttonEnabled = _possibleItems.length > _currentScrollIndex + 10;
      }
      
      private function handleMouseWheel(param1:InteractionEvent) : void
      {
         if(param1.mouseWheelDelta > 0)
         {
            onClickScrollUp(null);
         }
         else
         {
            onClickScrollDown(null);
         }
      }
      
      private function onClickScrollUp(param1:InteractionEvent) : void
      {
         if(!_btnScrollUp.visible)
         {
            return;
         }
         _currentScrollIndex = _currentScrollIndex - 5;
         if(_currentScrollIndex < 0)
         {
            _currentScrollIndex = 0;
         }
         refresh();
      }
      
      private function onClickScrollDown(param1:InteractionEvent) : void
      {
         if(!_btnScrollDown.visible)
         {
            return;
         }
         if(_currentScrollIndex > _possibleItems.length - 10)
         {
            return;
         }
         _currentScrollIndex = _currentScrollIndex + 5;
         refresh();
      }
      
      private function handleItemSlotClick(param1:InteractionEvent) : void
      {
         var _loc2_:int = 0;
         Environment.audio.playFX("ui_button_click.mp3");
         _selectedItem = null;
         _loc2_ = 0;
         while(_loc2_ < 10)
         {
            _itemSlots[_loc2_].check = param1.target == _itemSlots[_loc2_];
            if(_itemSlots[_loc2_].isChecked)
            {
               _selectedItem = _itemSlots[_loc2_].item;
               if(Environment.info.isTouchScreen && _selectedItem)
               {
                  TooltipLayer.instance.tooltip = _itemSlots[_loc2_].itemGraphic.tooltip;
                  TooltipLayer.instance.tooltipVisible = true;
                  MessageRouter.dispatch(new Message("ItemMessage.notifyItemInteractionOver",_itemSlots[_loc2_].itemGraphic,_itemSlots[_loc2_].itemGraphic));
               }
            }
            _loc2_++;
         }
      }
      
      private function showCurrentItemTooltip(param1:InteractionEvent) : void
      {
         if(Environment.info.isTouchScreen)
         {
            TooltipLayer.instance.tooltip = _currentItemSlot.itemGraphic.tooltip;
            TooltipLayer.instance.tooltipVisible = true;
            MessageRouter.dispatch(new Message("ItemMessage.notifyItemInteractionOver",_currentItemSlot.itemGraphic,_currentItemSlot.itemGraphic));
         }
      }
      
      private function hideAvatarPreview(param1:InteractionEvent) : void
      {
         if(Environment.info.isTouchScreen)
         {
            MessageRouter.dispatch(new Message("ItemMessage.notifyItemInteractionOut",_currentItemSlot.itemGraphic,_currentItemSlot.itemGraphic));
            TooltipLayer.instance.tooltipVisible = false;
         }
      }
      
      private function onClickClose(param1:InteractionEvent) : void
      {
         close();
      }
      
      private function onClickSelect(param1:InteractionEvent) : void
      {
         var _loc2_:int = 0;
         if(_selectedItem)
         {
            _loc2_ = _selectedItem.id;
         }
         _onSetItemFuntion(_loc2_,_itemType);
         close();
      }
      
      private function handleMessages(param1:Message) : void
      {
         var _loc3_:* = null;
         var _loc2_:* = null;
         if(!_previewAvatar)
         {
            return;
         }
         var _loc4_:* = param1.type;
         switch(_loc4_)
         {
            case "ItemMessage.notifyItemInteractionOver":
               _loc3_ = param1.data as UiItemGraphic;
               if(!_loc3_)
               {
                  return;
               }
               _loc2_ = _loc3_.item;
               if(_loc2_ && (_loc2_.type == 1 || _loc2_.type == 3 || _loc2_.type == 2 || _loc2_.type == 4 || _loc2_.type == 5))
               {
                  _previewAvatar.show(getCharacterSettings(_loc2_));
               }
               break;
            case "ItemMessage.notifyItemInteractionOut":
               _previewAvatar.hide();
               break;
            default:
               throw new Error("Encountered unknown message type! type=" + param1.type);
         }
      }
      
      private function getCharacterSettings(param1:Item) : AppearanceSettings
      {
         var _loc2_:AppearanceSettings = User.current.character.getCurrentSettings(0,_outfit);
         if(param1.type == 1)
         {
            _loc2_.head = param1.identifier;
            _loc2_.show_head_item = true;
         }
         else if(param1.type == 2)
         {
            _loc2_.chest = param1.identifier;
            _loc2_.show_chest_item = true;
         }
         else if(param1.type == 3)
         {
            _loc2_.belt = param1.identifier;
            _loc2_.show_belt_item = true;
         }
         else if(param1.type == 4)
         {
            _loc2_.legs = param1.identifier;
            _loc2_.show_legs_item = true;
         }
         else if(param1.type == 5)
         {
            _loc2_.boots = param1.identifier;
            _loc2_.show_boots_item = true;
         }
         if(param1.type == 4 && _loc2_.chest && _outfit.getItem(2).isOutfitItem)
         {
            _loc2_.chest = null;
         }
         return _loc2_;
      }
      
      override public function get defaultButton() : Button
      {
         return _btnClose;
      }
   }
}
