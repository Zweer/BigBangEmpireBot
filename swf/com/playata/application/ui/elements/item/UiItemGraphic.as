package com.playata.application.ui.elements.item
{
   import com.playata.application.data.constants.CConstant;
   import com.playata.application.data.inventory.Inventory;
   import com.playata.application.data.item.Item;
   import com.playata.application.data.item.ItemSet;
   import com.playata.application.data.user.User;
   import com.playata.application.messaging.Message;
   import com.playata.application.messaging.MessageRouter;
   import com.playata.application.ui.ViewManager;
   import com.playata.application.ui.dialogs.DialogDivorceMarriages;
   import com.playata.application.ui.dialogs.DialogProposeMarriage;
   import com.playata.application.ui.dialogs.DialogReskillStats;
   import com.playata.application.ui.dialogs.DialogSurpriseBoxContent;
   import com.playata.application.ui.dialogs.DialogTitles;
   import com.playata.application.ui.effects.GlowFilterEffect;
   import com.playata.application.ui.elements.action_bar.ActionBarLayer;
   import com.playata.application.ui.elements.generic.dialog.UiInfoDialog;
   import com.playata.application.ui.elements.generic.textfield.UiTextTooltip;
   import com.playata.application.ui.elements.shop.UiCustomizeItemArea;
   import com.playata.application.ui.elements.shop.UiSellArea;
   import com.playata.application.ui.elements.shop.UiSewArea;
   import com.playata.application.ui.elements.shop.UiWashArea;
   import com.playata.framework.application.Environment;
   import com.playata.framework.application.request.ActionRequestResponse;
   import com.playata.framework.core.Runtime;
   import com.playata.framework.core.collection.IntMap;
   import com.playata.framework.display.IDisplayObject;
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.filter.GlowFilter;
   import com.playata.framework.display.ui.IDragSource;
   import com.playata.framework.display.ui.IDropTarget;
   import com.playata.framework.display.ui.TooltipLayer;
   import com.playata.framework.display.ui.controls.Tooltip;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.elements.item.SymbolItemGraphicGeneric;
   
   public class UiItemGraphic extends Sprite implements IDragSource
   {
       
      
      private var _itemSlot:UiItemSlot = null;
      
      private var _item:Item = null;
      
      private var _itemIdentifier:String = null;
      
      private var _tooltip:Tooltip = null;
      
      private var _content:SymbolItemGraphicGeneric = null;
      
      private var _locked:Boolean = false;
      
      private var _glowFilterRare:GlowFilterEffect = null;
      
      private var _glowFilterEpic:GlowFilterEffect = null;
      
      private var _equippedStamina:int;
      
      private var _equippedStrength:int;
      
      private var _equippedCriticalRating:int;
      
      private var _equippedDodgeRating:int;
      
      private var _equippedWeaponDamage:int;
      
      private var _equippedMissileDamage:int;
      
      private var _isUpgrade:Boolean;
      
      public function UiItemGraphic(param1:UiItemSlot, param2:Item, param3:Boolean = false)
      {
         super();
         _locked = param3;
         _itemSlot = param1;
         if(!Environment.info.isTouchScreen)
         {
            _itemSlot.onInteractionOver.add(handleInteractionOver);
            _itemSlot.onInteractionOut.add(handleInteractionOut);
         }
         _itemSlot.onInteractionDown.add(handleInteractionDown);
         _itemSlot.onInteractionUp.add(handleInteractionUp);
         _itemSlot.onDoubleClick.add(handleDoubleClick);
         _itemSlot.useHandCursor = false;
         _glowFilterRare = getItemGlowEffect(2);
         _glowFilterEpic = getItemGlowEffect(3);
         setItem(param2);
      }
      
      public static function getItemGlowEffect(param1:int, param2:IDisplayObject = null) : GlowFilterEffect
      {
         if(param1 == 1)
         {
            return new GlowFilterEffect(param2,2.7,new GlowFilter(16777215,1,7,374),new GlowFilter(16777215,1,7,100),true);
         }
         if(param1 == 2)
         {
            return new GlowFilterEffect(param2,2.7,new GlowFilter(52479,1,7,374),new GlowFilter(52479,1,7,100),true);
         }
         return new GlowFilterEffect(param2,2.7,new GlowFilter(10040319,1,7,374),new GlowFilter(10040319,1,7,100),true);
      }
      
      public static function get draggedItem() : UiItemGraphic
      {
         if(!Environment.panelManager.dragDropManager.currentDragSource)
         {
            return null;
         }
         if(Environment.panelManager.dragDropManager.currentDragSource is UiItemGraphic)
         {
            return Environment.panelManager.dragDropManager.currentDragSource as UiItemGraphic;
         }
         return null;
      }
      
      override public function dispose() : void
      {
         if(!Environment.info.isTouchScreen)
         {
            if(_itemSlot.hasInteractionOver)
            {
               _itemSlot.onInteractionOver.remove(handleInteractionOver);
            }
            if(_itemSlot.hasInteractionOut)
            {
               _itemSlot.onInteractionOut.remove(handleInteractionOut);
            }
         }
         if(_itemSlot.hasInteractionDown)
         {
            _itemSlot.onInteractionDown.remove(handleInteractionDown);
         }
         if(_itemSlot.hasInteractionUp)
         {
            _itemSlot.onInteractionUp.remove(handleInteractionUp);
         }
         if(_itemSlot.hasDoubleClick)
         {
            _itemSlot.onDoubleClick.remove(handleDoubleClick);
         }
         _glowFilterRare.dispose();
         _glowFilterEpic.dispose();
         if(_tooltip)
         {
            _tooltip.dispose();
            _tooltip = null;
         }
         super.dispose();
      }
      
      public function setItem(param1:Item) : void
      {
         var _loc2_:* = null;
         _item = param1;
         if(_item)
         {
            _itemIdentifier = _item.identifier;
         }
         if(_item == null)
         {
            if(_content)
            {
               _content.visible = false;
            }
            _loc2_ = "";
            var _loc3_:* = _itemSlot.itemSlotType;
            switch(_loc3_)
            {
               case 99:
                  _loc2_ = LocText.current.text("general/items/shop_empty_tooltip");
                  break;
               case 1:
                  _loc2_ = LocText.current.text("general/items/head_empty_tooltip");
                  break;
               case 2:
                  _loc2_ = LocText.current.text("general/items/chest_empty_tooltip");
                  break;
               case 3:
                  _loc2_ = LocText.current.text("general/items/belt_empty_tooltip");
                  break;
               case 4:
                  _loc2_ = LocText.current.text("general/items/legs_empty_tooltip");
                  break;
               case 5:
                  _loc2_ = LocText.current.text("general/items/boot_empty_tooltip");
                  break;
               case 6:
                  _loc2_ = LocText.current.text("general/items/necklace_empty_tooltip");
                  break;
               case 7:
                  _loc2_ = LocText.current.text("general/items/ring_empty_tooltip");
                  break;
               case 10:
                  _loc2_ = LocText.current.text("general/items/piercing_empty_tooltip");
                  break;
               case 8:
                  _loc2_ = LocText.current.text("general/items/gadget_empty_tooltip");
                  break;
               case 9:
                  _loc2_ = LocText.current.text("general/items/missiles_empty_tooltip");
            }
            if(User.current.character.level < 10 && _itemSlot.itemSlotType == 9)
            {
               _loc2_ = LocText.current.text("general/items/missiles_locked_tooltip");
               _itemSlot.container.iconLock.visible = true;
            }
            if(_itemSlot.isBagSlotType)
            {
               _loc2_ = LocText.current.text("general/items/bag_empty_tooltip");
            }
            if(_tooltip == null || !(_tooltip is UiTextTooltip))
            {
               if(_tooltip != null)
               {
                  _tooltip.dispose();
                  _tooltip = null;
               }
               _tooltip = new UiTextTooltip(_itemSlot.container,_loc2_);
            }
            else
            {
               (_tooltip as UiTextTooltip).text = _loc2_;
            }
         }
         else
         {
            _itemSlot.container.iconLock.visible = false;
            if(_tooltip == null || !(_tooltip is UiItemTooltip))
            {
               if(_tooltip != null)
               {
                  _tooltip.dispose();
                  _tooltip = null;
               }
               _tooltip = new UiItemTooltip(this,_item);
            }
            else
            {
               (_tooltip as UiItemTooltip).item = _item;
            }
            if(_content == null)
            {
               _content = new SymbolItemGraphicGeneric();
               _glowFilterRare.displayObject = _content.container;
               _glowFilterEpic.displayObject = _content.container;
               addChild(_content);
            }
            else
            {
               _content.visible = true;
            }
            if(_item.isSewPattern || _item.isItemPattern)
            {
               _content.txtAmount.visible = false;
               _content.container.setUriSprite(_item.iconImageUrl,60,60,true,-1,null,true);
            }
            else
            {
               _content.txtAmount.visible = _item.itemSlotType == 9 && User.current.character.hasItem(_item.id);
               _content.txtAmount.text = _item.charges.toString();
               _content.container.setUriSprite(_item.iconImageUrl,60,60,true,-1,null,true);
            }
         }
         refresh();
      }
      
      public function get tooltip() : Tooltip
      {
         return _tooltip;
      }
      
      public function get isUpgrade() : Boolean
      {
         return _isUpgrade;
      }
      
      public function set customTooltip(param1:String) : void
      {
         _tooltip = new UiTextTooltip(_itemSlot.container,param1);
      }
      
      public function onDragStart() : void
      {
         MessageRouter.dispatch(new Message("ItemMessage.notifyItemDragged",{"item":_item},this));
      }
      
      public function onDragComplete(param1:IDropTarget) : void
      {
      }
      
      public function handleInteractionDown(param1:InteractionEvent) : void
      {
         if(_item == null || _itemSlot.itemSlotType == 0 || _itemSlot.locked)
         {
            return;
         }
         Environment.panelManager.dragDropManager.startDrag(this,5,5);
         if(_tooltip)
         {
            _tooltip.visible = false;
         }
         if(Environment.info.isTouchScreen)
         {
            highlightDropTargets();
         }
      }
      
      private function handleInteractionOver(param1:InteractionEvent) : void
      {
         selectAsActive();
      }
      
      private function handleInteractionOut(param1:InteractionEvent) : void
      {
         deselectAsActive();
      }
      
      public function handleInteractionUp(param1:InteractionEvent) : void
      {
         interactionEvent = param1;
         if(Environment.info.isTouchScreen)
         {
            if(!_item || Environment.panelManager.dragDropManager.isDragged || _itemSlot.name.indexOf("itemSlotPattern") != -1)
            {
               if(_itemSlot.name != "itemSlotTarget")
               {
                  endDrag();
               }
               deselectAsActive();
               return;
            }
            Environment.panelManager.dragDropManager.endDrag(this);
            if(!_item.isOwnItem)
            {
               Runtime.delayFunction(function():void
               {
                  TooltipLayer.instance.tooltip = _tooltip;
                  TooltipLayer.instance.tooltipVisible = true;
               },0.05);
               deselectAsActive();
               return;
            }
            selectAsActive();
            if(_itemSlot.itemSlotType == 99)
            {
               if(!_itemSlot.locked)
               {
                  ActionBarLayer.instance.open(this,1,onItemAction,_item,-7,-5,_tooltip,onActionBarClose);
               }
               MessageRouter.dispatch(new Message("ItemMessage.notifyItemInteractionOver",this,this));
            }
            else if(_itemSlot.isEquippedSlotType)
            {
               if(!_itemSlot.locked)
               {
                  ActionBarLayer.instance.open(this,2,onItemAction,_item,-7,-5,_tooltip,onActionBarClose);
               }
            }
            else if(_itemSlot.isBagSlotType)
            {
               if(!_itemSlot.locked)
               {
                  ActionBarLayer.instance.open(this,3,onItemAction,_item,-7,-5,_tooltip,onActionBarClose);
               }
            }
            else if(_itemSlot.itemSlotType == 100)
            {
               if(!_itemSlot.locked)
               {
                  ActionBarLayer.instance.open(this,4,onItemAction,_item,-7,-5,_tooltip,onActionBarClose);
               }
            }
            else if(_itemSlot.itemSlotType == 0 || _itemSlot.itemSlotType == 101)
            {
               Runtime.delayFunction(function():void
               {
                  TooltipLayer.instance.tooltip = _tooltip;
                  TooltipLayer.instance.tooltipVisible = true;
               },0.05);
               return;
            }
            return;
         }
         endDrag();
      }
      
      private function selectAsActive() : void
      {
         if(_item == null || Environment.panelManager.dragDropManager.currentDragSource)
         {
            return;
         }
         if(_item && _item.isOwnItem && !Environment.info.isTouchScreen)
         {
            MessageRouter.dispatch(new Message("ItemMessage.notifyItemInteractionOver",this,this));
         }
         if(_item.isSewPattern || _item.isItemPattern)
         {
            return;
         }
         updateEquippedStats();
         if(_item && _item.isOwnItem)
         {
            MessageRouter.dispatch(new Message("UiStatBarMessage.notifyHighlight",{
               "stamina":_item.statStamina,
               "minus_stamina":_equippedStamina,
               "strength":_item.statStrength,
               "minus_strength":_equippedStrength,
               "critical_rating":_item.statCriticalRating,
               "minus_critical_rating":_equippedCriticalRating,
               "dodge_rating":_item.statDodgeRating,
               "minus_dodge_rating":_equippedDodgeRating,
               "equipped":!_itemSlot.isBagSlotType && _itemSlot.itemSlotType != 99
            },this));
         }
         if(_tooltip is UiItemTooltip)
         {
            (_tooltip as UiItemTooltip).refresh();
         }
         highlightDropTargets();
      }
      
      private function updateEquippedStats() : void
      {
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc2_:int = 0;
         var _loc4_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc1_:Item = null;
         var _loc9_:IntMap = null;
         UiItemTooltip.compareItem = null;
         if(_itemSlot.isBagSlotType || _itemSlot.itemSlotType == 99 || _itemSlot.itemSlotType == 0 || _itemSlot.itemSlotType == 100)
         {
            if(_itemSlot.isBagSlotType || _itemSlot.itemSlotType == 0 || _itemSlot.itemSlotType == 100)
            {
               _loc1_ = User.current.character.getItemByType(_item.type);
               UiItemTooltip.compareItem = _loc1_;
               if(_loc1_ != null)
               {
                  _loc5_ = _loc1_.statStamina;
                  _loc6_ = _loc1_.statStrength;
                  _loc2_ = _loc1_.statCriticalRating;
                  _loc4_ = _loc1_.statDodgeRating;
                  _loc7_ = _loc1_.statWeaponDamage;
                  _loc8_ = _loc1_.missileDamage;
                  _loc9_ = ItemSet.getStatValueDiff(UiItemTooltip.compareItem,item);
                  if(_loc9_.exists(1))
                  {
                     _loc5_ = _loc5_ - _loc9_.getData(1);
                  }
                  if(_loc9_.exists(2))
                  {
                     _loc6_ = _loc6_ - _loc9_.getData(2);
                  }
                  if(_loc9_.exists(3))
                  {
                     _loc2_ = _loc2_ - _loc9_.getData(3);
                  }
                  if(_loc9_.exists(4))
                  {
                     _loc4_ = _loc4_ - _loc9_.getData(4);
                  }
                  if(_loc9_.exists(5))
                  {
                     _loc7_ = _loc7_ - _loc9_.getData(5);
                  }
                  if(_loc9_.exists(6))
                  {
                     _loc8_ = _loc8_ - _loc9_.getData(6);
                  }
               }
            }
            else
            {
               var _loc11_:int = 0;
               var _loc10_:* = availableItemSlots;
               for each(var _loc3_ in availableItemSlots)
               {
                  if(_loc3_.container.visible && _loc3_.itemSlotType == _item.itemSlotType && _loc3_.item != null)
                  {
                     UiItemTooltip.compareItem = _loc3_.item;
                     _loc5_ = _loc3_.item.statStamina;
                     _loc6_ = _loc3_.item.statStrength;
                     _loc2_ = _loc3_.item.statCriticalRating;
                     _loc4_ = _loc3_.item.statDodgeRating;
                     _loc7_ = _loc3_.item.statWeaponDamage;
                     _loc8_ = _loc3_.item.missileDamage;
                     _loc9_ = ItemSet.getStatValueDiff(UiItemTooltip.compareItem,item);
                     if(_loc9_.exists(1))
                     {
                        _loc5_ = _loc5_ - _loc9_.getData(1);
                     }
                     if(_loc9_.exists(2))
                     {
                        _loc6_ = _loc6_ - _loc9_.getData(2);
                     }
                     if(_loc9_.exists(3))
                     {
                        _loc2_ = _loc2_ - _loc9_.getData(3);
                     }
                     if(_loc9_.exists(4))
                     {
                        _loc4_ = _loc4_ - _loc9_.getData(4);
                     }
                     if(_loc9_.exists(5))
                     {
                        _loc7_ = _loc7_ - _loc9_.getData(5);
                     }
                     if(_loc9_.exists(6))
                     {
                        _loc8_ = _loc8_ - _loc9_.getData(6);
                     }
                     break;
                  }
               }
            }
         }
         else
         {
            _loc5_ = item.statStamina;
            _loc6_ = item.statStrength;
            _loc2_ = item.statCriticalRating;
            _loc4_ = item.statDodgeRating;
            _loc7_ = item.statWeaponDamage;
            _loc8_ = item.missileDamage;
         }
         _equippedStamina = _loc5_;
         _equippedStrength = _loc6_;
         _equippedCriticalRating = _loc2_;
         _equippedDodgeRating = _loc4_;
         _equippedWeaponDamage = _loc7_;
         _equippedMissileDamage = _loc8_;
      }
      
      private function deselectAsActive() : void
      {
         if(_item == null || Environment.panelManager.dragDropManager.currentDragSource)
         {
            return;
         }
         MessageRouter.dispatch(new Message("UiStatBarMessage.notifyUnhighlight",{},this));
         if(User.current && _item && _item.isOwnItem && !Environment.info.isTouchScreen)
         {
            MessageRouter.dispatch(new Message("ItemMessage.notifyItemInteractionOut",this,this));
         }
         unhighlightDropTargets();
      }
      
      private function highlightDropTargets() : void
      {
         if(_item != null && (Environment.info.isTouchScreen || Environment.panelManager.dragDropManager.currentDragSource == null || this != Environment.panelManager.dragDropManager.currentDragSource))
         {
            var _loc3_:int = 0;
            var _loc2_:* = availableItemSlots;
            for each(var _loc1_ in availableItemSlots)
            {
               if(_loc1_.container.visible)
               {
                  if(_loc1_.item != _item)
                  {
                     if(_loc1_.itemSlotType == _item.itemSlotType)
                     {
                        _loc1_.highlight();
                     }
                  }
               }
            }
         }
      }
      
      private function unhighlightDropTargets() : void
      {
         var _loc3_:int = 0;
         var _loc2_:* = availableItemSlots;
         for each(var _loc1_ in availableItemSlots)
         {
            if(_loc1_.container.visible)
            {
               _loc1_.unhighlight();
            }
         }
      }
      
      private function endDrag() : void
      {
         Environment.panelManager.dragDropManager.endDrag(this);
         if(!Environment.info.isTouchScreen)
         {
            TooltipLayer.instance.tooltipVisible = true;
         }
         MessageRouter.dispatch(new Message("UiStatBarMessage.notifyUnhighlight",{},this));
         var _loc2_:UiItemSlot = null;
         var _loc4_:int = 0;
         var _loc3_:* = availableItemSlots;
         for each(var _loc1_ in availableItemSlots)
         {
            if(_loc1_.container.visible)
            {
               _loc1_.unhighlight();
            }
         }
      }
      
      private function handleDoubleClick(param1:InteractionEvent) : void
      {
         useItem();
      }
      
      private function onActionBarClose(param1:int) : void
      {
         deselectAsActive();
         if(param1 == 1)
         {
            MessageRouter.dispatch(new Message("ItemMessage.notifyItemInteractionOut",this,this));
         }
      }
      
      private function onItemAction(param1:String) : Boolean
      {
         var _loc3_:int = 0;
         var _loc2_:int = 0;
         var _loc4_:* = param1;
         switch(_loc4_)
         {
            case "sell":
               UiSellArea.sellItem(this);
               break;
            case "buyEquip":
               if(item.isUsable)
               {
                  _loc2_ = User.current.character.inventory.getFreeSlotType(-1);
                  if(_loc2_ == 0)
                  {
                     _loc2_ = 20;
                  }
                  handleItemChange(_loc2_,null);
               }
               else
               {
                  handleItemChange(item.itemSlotType,null);
               }
               break;
            case "washingMachine":
               UiWashArea.openWashingMachine(this);
               break;
            case "sewingMachine":
               UiSewArea.openSewingMachine(this);
               break;
            case "equip":
               handleItemChange(item.itemSlotType,null);
               break;
            case "unequip":
               _loc2_ = User.current.character.inventory.getFreeSlotType(-1);
               if(_loc2_ == 0)
               {
                  _loc2_ = 20;
               }
               handleItemChange(_loc2_,null);
               break;
            case "moveToInventory":
               _loc2_ = User.current.character.inventory.getFreeSlotType(-1);
               if(_loc2_ == 0)
               {
                  _loc2_ = 20;
               }
               handleItemChange(_loc2_,null);
               break;
            case "moveToBankInventory":
               _loc3_ = User.current.character.bankInventory.getFreeBankIndex();
               if(_loc3_ != -1)
               {
                  handleItemChange(100,{
                     "bankIndex":_loc3_,
                     "targetSlotIndex":User.current.character.bankInventory.getFreeBankSlotIndex(_loc3_)
                  });
               }
               break;
            case "useItem":
               useItem();
               break;
            case "lockBankItem":
               MessageRouter.dispatch(new Message("BankInventoryMessage.notifyLockItem",item,this));
               break;
            case "unlockBankItem":
               MessageRouter.dispatch(new Message("BankInventoryMessage.notifyUnlockItem",item,this));
               break;
            case "customizeItem":
               UiCustomizeItemArea.openCustomizeItem(this);
         }
         return true;
      }
      
      private function get availableItemSlots() : Vector.<UiItemSlot>
      {
         var _loc1_:Vector.<UiItemSlot> = new Vector.<UiItemSlot>(0);
         var _loc4_:int = 0;
         var _loc3_:* = Environment.panelManager.dragDropManager.dropTargets;
         for each(var _loc2_ in Environment.panelManager.dragDropManager.dropTargets)
         {
            if(_loc2_ is UiItemSlot)
            {
               _loc1_.push(_loc2_);
            }
         }
         return _loc1_;
      }
      
      public function useItem() : void
      {
         if(!_item)
         {
            return;
         }
         if(!_item.isUsable)
         {
            return;
         }
         if(!_itemSlot.isBagSlotType)
         {
            return;
         }
         if(_item.type == 13)
         {
            Environment.panelManager.showDialog(new DialogReskillStats(_item));
            return;
         }
         if(_item.type == 14)
         {
            Environment.panelManager.showDialog(new DialogProposeMarriage(_item));
            return;
         }
         if(_item.type == 15)
         {
            Environment.panelManager.showDialog(new DialogDivorceMarriages(_item));
            return;
         }
         Environment.application.sendActionRequest("useInventoryItem",{"item_id":_item.id},handleRequests);
      }
      
      public function handleItemChange(param1:int, param2:Object) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = param1;
         if(_itemSlot.itemSlotType == 99)
         {
            if(Inventory.isBagSlot(param1))
            {
               if(User.current.character.inventory.isBagFull(User.current.character.currentBag))
               {
                  param1 = int(User.current.character.inventory.getFreeSlotType(-1));
               }
               if(param1 == 0)
               {
                  param1 = _loc4_;
               }
            }
            MessageRouter.dispatch(new Message("InventoryMessage.notifyBuyItem",{
               "item":item.id,
               "targetSlot":param1,
               "buyPrice":item.buyPrice
            },this));
         }
         else if(_itemSlot.itemSlotType == 100 && param1 == 100)
         {
            MessageRouter.dispatch(new Message("BankInventoryMessage.notifyMoveItem",{
               "item":item.id,
               "bankIndex":param2.bankIndex,
               "targetSlotIndex":param2.targetSlotIndex
            },this));
         }
         else if(param1 == 100 && Inventory.isBagSlot(_itemSlot.itemSlotType))
         {
            MessageRouter.dispatch(new Message("BankInventoryMessage.notifyAddItem",{
               "item":item.id,
               "bankIndex":param2.bankIndex,
               "targetSlotIndex":param2.targetSlotIndex
            },this));
         }
         else if(param1 == 100 && _itemSlot.isEquippedSlotType)
         {
            MessageRouter.dispatch(new Message("BankInventoryMessage.notifyAddItem",{
               "item":item.id,
               "bankIndex":param2.bankIndex,
               "targetSlotIndex":param2.targetSlotIndex
            },this));
         }
         else if(_itemSlot.itemSlotType == 100 && Inventory.isBagSlot(param1))
         {
            MessageRouter.dispatch(new Message("BankInventoryMessage.notifyRemoveItem",{
               "item":item.id,
               "targetSlot":param1
            },this));
         }
         else
         {
            if(Inventory.isBagSlot(param1))
            {
               if(Inventory.getBagIndex(param1) != Inventory.getBagIndex(_itemSlot.itemSlotType))
               {
                  if(User.current.character.inventory.isBagFull(User.current.character.currentBag))
                  {
                     _loc3_ = User.current.character.getBagItem(param1);
                     if(!(_loc3_ && _itemSlot.item.type == _loc3_.type))
                     {
                        param1 = int(User.current.character.inventory.getFreeSlotType(-1));
                     }
                  }
               }
               if(param1 == 0)
               {
                  param1 = _loc4_;
               }
            }
            else if(param1 == 9 && Inventory.isBagSlot(_itemSlot.itemSlotType))
            {
               if(CConstant.item_missile_min_required_level > User.current.character.level)
               {
                  Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("general/error"),LocText.current.text("general/item_required_level",CConstant.item_missile_min_required_level),LocText.current.text("general/button_ok")));
                  ViewManager.instance.refresh();
                  return;
               }
            }
            MessageRouter.dispatch(new Message("InventoryMessage.notifyMoveItem",{
               "item":item.id,
               "sourceSlot":_itemSlot.itemSlotType,
               "targetSlot":param1
            },this));
         }
      }
      
      public function get item() : Item
      {
         return _item;
      }
      
      public function get itemIdentifier() : String
      {
         return _itemIdentifier;
      }
      
      public function get itemSlot() : UiItemSlot
      {
         return _itemSlot;
      }
      
      public function refresh() : void
      {
         if(_item == null)
         {
            _glowFilterRare.stop();
            _glowFilterEpic.stop();
            _isUpgrade = false;
            return;
         }
         switch(int(_item.quality) - 1)
         {
            case 0:
               _glowFilterRare.stop();
               _glowFilterEpic.stop();
               break;
            case 1:
               _glowFilterEpic.stop();
               _glowFilterRare.play();
               break;
            case 2:
               _glowFilterRare.stop();
               _glowFilterEpic.play();
         }
         _content.txtAmount.visible = _item.itemSlotType == 9 && User.current.character.hasItem(_item.id);
         _content.txtAmount.text = _item.charges.toString();
         refreshItemCompare();
      }
      
      public function refreshItemCompare() : void
      {
         if(_item.isSewPattern || _item.isItemPattern || _item.type == 11 || _item.type == 12)
         {
            return;
         }
         updateEquippedStats();
         var _loc2_:int = _equippedCriticalRating + _equippedDodgeRating + _equippedStamina + _equippedStrength + _equippedWeaponDamage + _equippedMissileDamage;
         var _loc1_:int = _item.statCriticalRating + _item.statDodgeRating + _item.statStamina + _item.statStrength + _item.statWeaponDamage + _item.missileDamage;
         _isUpgrade = _loc2_ < _loc1_;
      }
      
      private function handleRequests(param1:ActionRequestResponse) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = param1.action;
         if("useInventoryItem" !== _loc3_)
         {
            throw new Error("Unsupported request action \'" + param1.action + "\'!");
         }
         _loc2_ = null;
         if(param1.error == "")
         {
            Environment.application.updateData(param1.data);
            if(param1.request.hasData("item_id"))
            {
               _loc2_ = User.current.character.getItemById(param1.request.getInt("item_id"));
               if(_loc2_.type == 11)
               {
                  Environment.panelManager.showDialog(new DialogSurpriseBoxContent(param1.data));
               }
               else if(_loc2_.type == 12)
               {
                  ViewManager.instance.showPanel("character");
                  if(User.current.character.hasTutorialFlag("titles"))
                  {
                     Environment.panelManager.showDialog(new DialogTitles(User.current.character));
                  }
               }
            }
         }
         else if(param1.error == "errUseItemItemReqLevel")
         {
            Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/use_item/error_req_item_level/title"),LocText.current.text("dialog/use_item/error_req_item_level/text",_item.requiredLevel),LocText.current.text("general/button_ok")));
         }
         else if(param1.error == "errInventoryNoEmptySlot")
         {
            Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/no_empty_slot/title"),LocText.current.text("dialog/no_empty_slot_surprise_box/text"),LocText.current.text("general/button_ok")));
         }
         else if(param1.error != "errUseItemNoMoreCharges")
         {
            Environment.reportError(param1.error,param1.request);
         }
      }
   }
}
