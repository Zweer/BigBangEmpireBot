package com.playata.application.data.outfit
{
   import com.playata.application.data.character.Character;
   import com.playata.application.data.user.User;
   import com.playata.framework.localization.LocText;
   
   public class DefaultOutfit extends Outfit
   {
       
      
      public function DefaultOutfit()
      {
         super({});
      }
      
      override public function get id() : int
      {
         return 0;
      }
      
      override public function get characterId() : int
      {
         return User.current.character.id;
      }
      
      override public function get name() : String
      {
         return LocText.current.text("outfits/default_outfit/name");
      }
      
      override public function get index() : int
      {
         return 0;
      }
      
      override public function get outfitSettings() : Array
      {
         return [];
      }
      
      override public function hasSetting(param1:int) : Boolean
      {
         return false;
      }
      
      override public function get itemIds() : Object
      {
         _itemIds = {};
         var _loc1_:Character = User.current.character;
         var _loc4_:int = 0;
         var _loc3_:* = Outfits.ITEM_TYPES;
         for each(var _loc2_ in Outfits.ITEM_TYPES)
         {
            if(_loc1_.getItemByType(_loc2_))
            {
               _itemIds[_loc2_] = _loc1_.getItemByType(_loc2_).id;
            }
         }
         return _itemIds;
      }
   }
}
