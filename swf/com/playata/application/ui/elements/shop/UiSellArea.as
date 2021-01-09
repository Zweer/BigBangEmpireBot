package com.playata.application.ui.elements.shop
{
   import com.playata.application.data.GameUtil;
   import com.playata.application.data.outfit.Outfit;
   import com.playata.application.data.user.User;
   import com.playata.application.messaging.Message;
   import com.playata.application.messaging.MessageRouter;
   import com.playata.application.ui.effects.HighlightEffect;
   import com.playata.application.ui.elements.generic.dialog.UiInfoDialog;
   import com.playata.application.ui.elements.generic.dialog.UiTwoChoiceDialog;
   import com.playata.application.ui.elements.generic.textfield.UiTextTooltip;
   import com.playata.application.ui.elements.item.UiItemGraphic;
   import com.playata.framework.application.Environment;
   import com.playata.framework.display.IDisplayObject;
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.ui.IDragSource;
   import com.playata.framework.display.ui.IDropTarget;
   import com.playata.framework.localization.LocText;
   import flash.geom.Rectangle;
   import visuals.ui.elements.shop.SymbolShopSellAreaGeneric;
   
   public class UiSellArea extends Sprite implements IDropTarget
   {
       
      
      private var _content:SymbolShopSellAreaGeneric = null;
      
      private var _sellTooltip:UiTextTooltip = null;
      
      private var _highlight:HighlightEffect = null;
      
      public function UiSellArea(param1:SymbolShopSellAreaGeneric)
      {
         _content = param1;
         super(null,_content);
         _highlight = new HighlightEffect(_content.highlight,0.2,0.2,false);
         _sellTooltip = new UiTextTooltip(_content,LocText.current.text("screen/item_shop/cash_register_tooltip"));
      }
      
      public static function sellItem(param1:UiItemGraphic) : void
      {
         itemGraphic = param1;
         if(!itemGraphic || !itemGraphic.itemSlot || !itemGraphic.item)
         {
            return;
         }
         if(itemGraphic.itemSlot.itemSlotType == 100 && User.current.character.bankInventory.isItemLocked(itemGraphic.item.id))
         {
            Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/bank_inventory/err_sell_item_item_is_locked_title"),LocText.current.text("dialog/bank_inventory/err_sell_item_item_is_locked_text"),LocText.current.text("general/button_ok")));
            return;
         }
         var sellCallback:Function = function():void
         {
            if(itemGraphic.itemSlot.itemSlotType == 100)
            {
               MessageRouter.dispatch(new Message("BankInventoryMessage.notifySellItem",{"item":itemGraphic.item.id},this));
            }
            else
            {
               MessageRouter.dispatch(new Message("InventoryMessage.notifySellItem",{"item":itemGraphic.item.id},this));
            }
         };
         var message:String = LocText.current.text("dialog/sell_item/text",GameUtil.getGameCurrencyString(itemGraphic.item.sellPrice));
         var outfits:Vector.<Outfit> = User.current.character.outfits.getOutfitsWithItem(itemGraphic.item);
         if(outfits.length > 0)
         {
            var outfitsText:String = "";
            var _loc4_:int = 0;
            var _loc3_:* = outfits;
            for each(outfit in outfits)
            {
               if(outfitsText != "")
               {
                  outfitsText = outfitsText + "\n";
               }
               outfitsText = outfitsText + (" - " + outfit.name);
            }
            message = message + ("\n\n" + LocText.current.text("dialog/sell_outfit_item/text",outfitsText));
         }
         Environment.panelManager.showDialog(new UiTwoChoiceDialog(LocText.current.text("dialog/sell_item/title"),message,LocText.current.text("dialog/sell_item/button_sell"),LocText.current.text("general/button_cancel"),sellCallback,null));
      }
      
      override public function dispose() : void
      {
         _highlight.dispose();
         _sellTooltip.dispose();
         _sellTooltip = null;
         super.dispose();
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
         sellItem(_loc2_);
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
      
      public function refreshLocalization() : void
      {
         _sellTooltip.text = LocText.current.text("screen/item_shop/cash_register_tooltip");
      }
   }
}
