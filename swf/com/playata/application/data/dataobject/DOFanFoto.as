package com.playata.application.data.dataobject
{
   import com.playata.framework.data.DataObject;
   
   public class DOFanFoto extends DataObject
   {
       
      
      public function DOFanFoto(param1:Object)
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
      
      public function get currentResources() : int
      {
         return getInt("current_resources");
      }
      
      public function get selectedTags() : String
      {
         return getString("selected_tags");
      }
      
      public function get maxSelectableTags() : int
      {
         return getInt("max_selectable_tags");
      }
      
      public function get tsLastTagRemoved() : int
      {
         return getInt("ts_last_tag_removed");
      }
      
      public function get unlockedFotos() : String
      {
         return getString("unlocked_fotos");
      }
   }
}
