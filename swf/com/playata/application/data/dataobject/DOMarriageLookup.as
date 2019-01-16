package com.playata.application.data.dataobject
{
   import com.playata.framework.data.DataObject;
   
   public class DOMarriageLookup extends DataObject
   {
       
      
      public function DOMarriageLookup(param1:Object)
      {
         super(param1);
      }
      
      public function get id() : int
      {
         return getInt("id");
      }
      
      public function get characterId() : int
      {
         return getInt("character_id");
      }
      
      public function get tsCreation() : int
      {
         return getInt("ts_creation");
      }
      
      public function get otherCharacterId() : int
      {
         return getInt("other_character_id");
      }
      
      public function get otherCharacterName() : String
      {
         return getString("other_character_name");
      }
      
      public function get status() : int
      {
         return getInt("status");
      }
      
      public function get isNew() : Boolean
      {
         return getBoolean("is_new");
      }
      
      public function get weddingItemId() : int
      {
         return getInt("wedding_item_id");
      }
   }
}
