package com.playata.application.data.dataobject
{
   import com.playata.framework.data.DataObject;
   
   public class DODungeon extends DataObject
   {
       
      
      public function DODungeon(param1:Object)
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
      
      public function get identifier() : String
      {
         return getString("identifier");
      }
      
      public function get status() : int
      {
         return getInt("status");
      }
      
      public function get currentLevelId() : int
      {
         return getInt("current_level_id");
      }
      
      public function get unlockedLevel() : int
      {
         return getInt("unlocked_level");
      }
      
      public function get tsEnd() : int
      {
         return getInt("ts_end");
      }
   }
}
