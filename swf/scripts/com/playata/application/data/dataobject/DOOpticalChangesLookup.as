package com.playata.application.data.dataobject
{
   import com.playata.framework.data.DataObject;
   
   public class DOOpticalChangesLookup extends DataObject
   {
       
      
      public function DOOpticalChangesLookup(param1:Object)
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
      
      public function get resource() : int
      {
         return getInt("resource");
      }
      
      public function get availableChests() : String
      {
         return getString("available_chests");
      }
      
      public function get activeOptions() : String
      {
         return getString("active_options");
      }
      
      public function get unlockedOptions() : String
      {
         return getString("unlocked_options");
      }
      
      public function get useForQuest() : Boolean
      {
         return getBoolean("use_for_quest");
      }
      
      public function get useForDuel() : Boolean
      {
         return getBoolean("use_for_duel");
      }
   }
}
