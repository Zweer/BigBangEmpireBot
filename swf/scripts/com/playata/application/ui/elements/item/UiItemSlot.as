package com.playata.application.ui.elements.item
{
   import com.playata.application.data.constants.CConstant;
   import com.playata.application.data.constants.CItemTemplate;
   import com.playata.application.data.dataobject.DOItem;
   import com.playata.application.data.item.Item;
   import com.playata.application.data.item_pattern.ItemPattern;
   import com.playata.application.data.item_pattern.ItemPatterns;
   import com.playata.application.data.user.User;
   import com.playata.application.ui.dialogs.DialogSewingMachine;
   import com.playata.application.ui.effects.HighlightEffect;
   import com.playata.framework.application.Environment;
   import com.playata.framework.display.IDisplayObject;
   import com.playata.framework.display.InteractiveDisplayObject;
   import com.playata.framework.display.lib.flash.FlashDisplayObject;
   import com.playata.framework.display.ui.IDragSource;
   import com.playata.framework.display.ui.IDropTarget;
   import com.playata.framework.display.ui.dialogs.Dialog;
   import flash.display.Sprite;
   import flash.geom.Rectangle;
   import visuals.ui.elements.item.SymbolItemSlotGeneric;
   
   public class UiItemSlot extends InteractiveDisplayObject implements IDropTarget
   {
      
      private static var _enableAnimations:Boolean = true;
       
      
      private var _container:SymbolItemSlotGeneric = null;
      
      protected var _itemGraphic:UiItemGraphic = null;
      
      private var _type:int = 0;
      
      private var _locked:Boolean = false;
      
      private var _data:Object = null;
      
      private var _id:int;
      
      private var _highlightedOnDragIn:Boolean = false;
      
      private var _highlightNormal:HighlightEffect = null;
      
      private var _highlightWarforged:HighlightEffect = null;
      
      public function UiItemSlot(param1:SymbolItemSlotGeneric, param2:int, param3:int = -1)
      {
         _container = param1;
         _type = param2;
         _id = param3 == -1?param2:int(param3);
         _container.itemPos.removeAllChildren();
         _container.iconPremiumCurrency.visible = false;
         _container.iconLock.visible = false;
         _container.iconCheckmark.visible = false;
         _container.iconOutfit.visible = false;
         _container.betterItem.visible = false;
         _container.iconEventItem.visible = false;
         _container.iconItemPattern.visible = false;
         _container.iconEffect.visible = false;
         _container.iconUsedInOutfit.visible = false;
         super(_container);
         (FlashDisplayObject.getNativeDisplayObject(_container) as Sprite).mouseChildren = false;
         _highlightNormal = new HighlightEffect(_container.highlightNormal,0.2,0.2,false);
         _highlightWarforged = new HighlightEffect(_container.highlightWarforged,0.2,0.2,false);
      }
      
      public static function get enableAnimations() : Boolean
      {
         return _enableAnimations;
      }
      
      public static function set enableAnimations(param1:Boolean) : void
      {
         _enableAnimations = param1;
      }
      
      override public function dispose() : void
      {
         stopAnimations();
         _highlightNormal.dispose();
         _highlightWarforged.dispose();
         if(_itemGraphic != null)
         {
            _container.betterItem.visible = false;
            _itemGraphic.dispose();
            _itemGraphic = null;
         }
         super.dispose();
      }
      
      public function stopAnimations() : void
      {
      }
      
      public function set locked(param1:Boolean) : void
      {
         _locked = param1;
      }
      
      public function get locked() : Boolean
      {
         return _locked;
      }
      
      public function set data(param1:Object) : void
      {
         _data = param1;
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function get data() : Object
      {
         return _data;
      }
      
      public function set item(param1:Item) : void
      {
         var _loc2_:IDisplayObject = _container.itemPos;
         var _loc3_:ItemPattern = null;
         if(this.item != null && this.item == param1)
         {
            if(_itemGraphic != null && _itemGraphic.itemIdentifier == param1.identifier)
            {
               if(_itemGraphic != null && !UiItemGraphic.draggedItem)
               {
                  _itemGraphic.x = _loc2_.x;
                  _itemGraphic.y = _loc2_.y;
                  _itemGraphic.refresh();
                  _container.betterItem.visible = _itemGraphic.isUpgrade;
               }
               _container.iconItemPattern.visible = false;
               if(User.current.character.sewingMachineAvailable && User.current.showItemPattern && (_itemGraphic.itemSlot.itemSlotType == 0 || _itemGraphic.itemSlot.itemSlotType == 99) && param1.itemPattern)
               {
                  _loc3_ = ItemPatterns.instance.itemPattern(param1.itemPattern);
                  if(_loc3_ && !_loc3_.isItemCollected(param1.identifier))
                  {
                     _container.iconItemPattern.visible = true;
                  }
               }
               _container.iconUsedInOutfit.visible = param1 != null && _type != 0 && _type != 101 && param1.isItemUsedInOutfit;
               return;
            }
         }
         if(_itemGraphic == null)
         {
            _itemGraphic = new UiItemGraphic(this,param1,_locked);
         }
         else
         {
            _itemGraphic.setItem(param1);
         }
         _itemGraphic.x = _loc2_.x;
         _itemGraphic.y = _loc2_.y;
         _container.iconPremiumCurrency.visible = param1 != null && itemSlotType == 99 && param1.isPremium;
         _container.iconOutfit.visible = param1 != null && itemSlotType != 2 && param1.isOutfitItem;
         _container.itemPos.addChild(_itemGraphic);
         _container.betterItem.visible = _itemGraphic.isUpgrade;
         if(param1 != null && itemSlotType == 99)
         {
            _container.iconEventItem.visible = param1.isEventItem;
         }
         else
         {
            _container.iconEventItem.visible = false;
         }
         _container.iconItemPattern.visible = false;
         if(param1 != null && User.current.character.sewingMachineAvailable && User.current.showItemPattern && (_itemGraphic.itemSlot.itemSlotType == 0 || _itemGraphic.itemSlot.itemSlotType == 99) && param1.itemPattern)
         {
            _loc3_ = ItemPatterns.instance.itemPattern(param1.itemPattern);
            if(_loc3_ && !_loc3_.isItemCollected(param1.identifier))
            {
               _container.iconItemPattern.visible = true;
            }
         }
         _container.iconEffect.visible = param1 != null && param1.hasAnimation;
         if(_container.iconEffect.visible)
         {
            _container.iconEffect.setUriSprite(param1.animationIconUrl,30,30,false,-1);
         }
         _container.iconUsedInOutfit.visible = param1 != null && _type != 0 && _type != 101 && param1.isItemUsedInOutfit;
         if(param1 != null && param1.plusItemlevel >= CConstant.warforged_effect_min_level)
         {
            _container.border.gotoAndStop("warforged");
         }
         else
         {
            _container.border.gotoAndStop("normal");
         }
         _container.itemPos.addChild(_itemGraphic);
      }
      
      public function refresh() : void
      {
         if(_itemGraphic == null)
         {
            return;
         }
         _itemGraphic.refresh();
         _container.betterItem.visible = _itemGraphic.isUpgrade;
      }
      
      public function get item() : Item
      {
         if(_itemGraphic == null)
         {
            return null;
         }
         return _itemGraphic.item;
      }
      
      public function get container() : SymbolItemSlotGeneric
      {
         return _container;
      }
      
      public function get itemSlotType() : int
      {
         return _type;
      }
      
      public function get isBagSlotType() : Boolean
      {
         return _type == 20 || _type == 21 || _type == 22 || _type == 23 || _type == 24 || _type == 25 || _type == 26 || _type == 27 || _type == 28 || _type == 29 || _type == 30 || _type == 31 || _type == 32 || _type == 33 || _type == 34 || _type == 35 || _type == 36 || _type == 37;
      }
      
      public function get isEquippedSlotType() : Boolean
      {
         return _type == 1 || _type == 2 || _type == 3 || _type == 4 || _type == 5 || _type == 6 || _type == 7 || _type == 8 || _type == 9 || _type == 10;
      }
      
      public function set sewingMachinePattern(param1:String) : void
      {
         var _loc4_:IDisplayObject = _container.itemPos;
         if(!CItemTemplate.exists(param1))
         {
            return;
         }
         var _loc2_:CItemTemplate = CItemTemplate.fromId(param1);
         var _loc8_:int = _loc2_.quality;
         var _loc6_:int = _loc2_.type;
         var _loc7_:int = _loc2_.sewPrice;
         var _loc5_:DOItem = new DOItem({
            "sewing_pattern":true,
            "identifier":param1,
            "quality":_loc8_,
            "type":_loc6_,
            "premium_item":false,
            "charges":0,
            "sew_price":_loc7_,
            "character_id":User.current.character.id
         });
         var _loc3_:Item = new Item(_loc5_);
         if(_itemGraphic != null)
         {
            _container.itemPos.removeChild(_itemGraphic);
            _itemGraphic.dispose();
            _itemGraphic = null;
         }
         _itemGraphic = new UiItemGraphic(this,_loc3_,_locked);
         _itemGraphic.x = _loc4_.x;
         _itemGraphic.y = _loc4_.y;
         _container.iconPremiumCurrency.visible = false;
         _container.itemPos.addChild(_itemGraphic);
         _container.iconEffect.visible = _loc3_ != null && _loc3_.hasAnimation;
         if(_container.iconEffect.visible)
         {
            _container.iconEffect.setUriSprite(_loc3_.animationIconUrl,30,30,false,-1);
         }
         _container.iconUsedInOutfit.visible = false;
         _container.border.visible = false;
      }
      
      public function set itemPattern(param1:String) : void
      {
         var _loc5_:IDisplayObject = _container.itemPos;
         var _loc2_:CItemTemplate = CItemTemplate.fromId(param1);
         var _loc9_:int = _loc2_.quality;
         var _loc8_:int = _loc2_.type;
         var _loc3_:String = _loc2_.itemPatternId;
         var _loc7_:int = _loc2_.requiredLevel;
         var _loc6_:DOItem = new DOItem({
            "is_item_pattern":true,
            "item_pattern":_loc3_,
            "identifier":param1,
            "quality":_loc9_,
            "type":_loc8_,
            "premium_item":false,
            "charges":0,
            "required_level":_loc7_,
            "character_id":User.current.character.id
         });
         var _loc4_:Item = new Item(_loc6_);
         if(_itemGraphic != null)
         {
            _container.itemPos.removeChild(_itemGraphic);
            _itemGraphic.dispose();
            _itemGraphic = null;
         }
         _itemGraphic = new UiItemGraphic(this,_loc4_,_locked);
         _itemGraphic.x = _loc5_.x;
         _itemGraphic.y = _loc5_.y;
         _container.iconPremiumCurrency.visible = false;
         _container.itemPos.addChild(_itemGraphic);
         _container.iconEffect.visible = _loc4_ != null && _loc4_.hasAnimation;
         if(_container.iconEffect.visible)
         {
            _container.iconEffect.setUriSprite(_loc4_.animationIconUrl,30,30,false,-1);
         }
         _container.iconUsedInOutfit.visible = false;
         _container.border.visible = false;
      }
      
      public function showBackground(param1:Boolean) : void
      {
         _container.border.visible = param1;
      }
      
      public function set check(param1:Boolean) : void
      {
         _container.iconCheckmark.visible = param1;
      }
      
      public function get isChecked() : Boolean
      {
         return _container.iconCheckmark.visible;
      }
      
      public function set eventItem(param1:Boolean) : void
      {
         _container.iconEventItem.visible = param1;
      }
      
      public function get itemGraphic() : UiItemGraphic
      {
         return _itemGraphic;
      }
      
      public function get highlightEffect() : HighlightEffect
      {
         return !!isWarforged?_highlightWarforged:_highlightNormal;
      }
      
      public function get isWarforged() : Boolean
      {
         return _container.border.currentLabel == "warforged";
      }
      
      public function highlight() : void
      {
         highlightEffect.highlight();
      }
      
      public function unhighlight() : void
      {
         highlightEffect.unhighlight();
      }
      
      public function acceptsDragSource(param1:IDragSource) : Boolean
      {
         if(!(param1 is UiItemGraphic))
         {
            return false;
         }
         var _loc2_:UiItemGraphic = param1 as UiItemGraphic;
         if(!container.visible)
         {
            return false;
         }
         if(item == _loc2_.item)
         {
            return false;
         }
         if(locked)
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
         if(isEquippedSlotType)
         {
            _highlightedOnDragIn = highlightEffect.highlightDisplayObject.visible && highlightEffect.highlightDisplayObject.alpha == 1;
         }
         else
         {
            _highlightedOnDragIn = false;
         }
         var _loc2_:UiItemGraphic = param1 as UiItemGraphic;
         if(isBagSlotType || itemSlotType == 100)
         {
            highlight();
         }
      }
      
      public function onDragOut(param1:IDragSource) : void
      {
         if(!(param1 is UiItemGraphic))
         {
            return;
         }
         var _loc2_:UiItemGraphic = param1 as UiItemGraphic;
         if(!_highlightedOnDragIn)
         {
            unhighlight();
         }
      }
      
      public function onDrop(param1:IDragSource) : Boolean
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         unhighlight();
         try
         {
            if(!(param1 is UiItemGraphic))
            {
               var _loc5_:Boolean = false;
               return _loc5_;
            }
            _loc2_ = param1 as UiItemGraphic;
            if(_loc2_.item.isSewPattern)
            {
               _loc3_ = Environment.panelManager.dialogManager.getVisibleDialog(DialogSewingMachine);
               if(_loc3_)
               {
                  sewingMachinePattern = _loc2_.item.identifier;
                  (_loc3_ as DialogSewingMachine).refreshUI();
                  var _loc6_:Boolean = true;
                  return _loc6_;
               }
            }
            if(!_loc2_.item.isSewPattern && this != _loc2_.itemSlot && (this.itemSlotType == _loc2_.item.itemSlotType || this.isBagSlotType || this.itemSlotType == 100))
            {
               _loc2_.handleItemChange(itemSlotType,_data);
               var _loc7_:Boolean = true;
               return _loc7_;
            }
            var _loc8_:Boolean = false;
            return _loc8_;
         }
         catch(e:Error)
         {
         }
         return false;
      }
      
      override public function get bounds() : Rectangle
      {
         _displayObject = _container.border;
         var _loc1_:Rectangle = super.bounds;
         _displayObject = _container;
         return _loc1_;
      }
      
      override public function getBounds(param1:IDisplayObject, param2:Rectangle = null) : Rectangle
      {
         _displayObject = _container.border;
         var _loc3_:Rectangle = super.getBounds(param1,param2);
         _displayObject = _container;
         return _loc3_;
      }
   }
}
