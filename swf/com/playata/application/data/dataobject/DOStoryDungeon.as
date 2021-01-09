package com.playata.application.data.dataobject
{
   import com.playata.framework.data.DataObject;
   
   public class DOStoryDungeon extends DataObject
   {
       
      
      public function DOStoryDungeon(param1:Object)
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
      
      public function get storyDungeonIndex() : int
      {
         return getInt("story_dungeon_index");
      }
      
      public function get status() : int
      {
         return getInt("status");
      }
      
      public function get repeat() : Boolean
      {
         return getBoolean("repeat");
      }
      
      public function get pointsCollected() : int
      {
         return getInt("points_collected");
      }
      
      public function get tsComplete() : int
      {
         return getInt("ts_complete");
      }
      
      public function get tsLastAttack() : int
      {
         return getInt("ts_last_attack");
      }
      
      public function get battleIds() : String
      {
         return getString("battle_ids");
      }
      
      public function get rewards() : String
      {
         return getString("rewards");
      }
   }
}
