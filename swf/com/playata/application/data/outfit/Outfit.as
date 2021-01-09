package com.playata.application.data.outfit
{
   import com.playata.application.data.character.Character;
   import com.playata.application.data.dataobject.DOOutfit;
   import com.playata.application.data.item.Item;
   import com.playata.application.data.user.User;
   import com.playata.framework.core.TypedObject;
   import com.playata.framework.core.util.JsonUtil;
   
   public class Outfit extends DOOutfit
   {
       
      
      private var _outfitSettings:Array = null;
      
      protected var _itemIds:Object = null;
      
      public function Outfit(param1:Object = null)
      {
         super(param1);
      }
      
      override public function update(param1:TypedObject) : void
      {
         super.update(param1);
         if(_itemIds)
         {
            _itemIds = null;
         }
         if(_outfitSettings)
         {
            _outfitSettings = null;
         }
      }
      
      public function get outfitSettings() : Array
      {
         if(!_outfitSettings)
         {
            _outfitSettings = JsonUtil.decode(settings);
         }
         return _outfitSettings;
      }
      
      public function hasSetting(param1:int) : Boolean
      {
         return outfitSettings.indexOf(param1) >= 0;
      }
      
      public function get itemIds() : Object
      {
         if(!_itemIds)
         {
            _itemIds = JsonUtil.decode(getString("items"));
         }
         return _itemIds;
      }
      
      public function hasItem(param1:Item) : Boolean
      {
         if(itemIds[param1.type] != null && itemIds[param1.type] !== undefined)
         {
            return itemIds[param1.type] == param1.id;
         }
         return false;
      }
      
      public function getItem(param1:int) : Item
      {
         if(itemIds[param1] != null && itemIds[param1] !== undefined)
         {
            if(isItemMissing(param1))
            {
               return User.current.character.getItemByType(param1);
            }
            return User.current.character.getItemById(itemIds[param1]);
         }
         return null;
      }
      
      public function isItemMissing(param1:int) : Boolean
      {
         var _loc2_:int = 0;
         var _loc3_:Character = User.current.character;
         if(itemIds[param1] != null && itemIds[param1] !== undefined)
         {
            _loc2_ = itemIds[param1];
            if(!_loc3_.hasItem(_loc2_))
            {
               return true;
            }
            if(!_loc3_.hasInventoryItem(_loc2_) && !_loc3_.hasBankItem(_loc2_))
            {
               return true;
            }
         }
         return false;
      }
      
      public function hasMissingItem() : Boolean
      {
         var _loc2_:Character = User.current.character;
         var _loc4_:int = 0;
         var _loc3_:* = itemIds;
         for each(var _loc1_ in itemIds)
         {
            if(!_loc2_.hasItem(_loc1_))
            {
               return true;
            }
            if(!_loc2_.hasInventoryItem(_loc1_) && !_loc2_.hasBankItem(_loc1_))
            {
               return true;
            }
         }
         return false;
      }
   }
}
