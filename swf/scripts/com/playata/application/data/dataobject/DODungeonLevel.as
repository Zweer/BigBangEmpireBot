package com.playata.application.data.dataobject
{
   import com.playata.framework.data.DataObject;
   
   public class DODungeonLevel extends DataObject
   {
       
      
      public function DODungeonLevel(param1:Object)
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
      
      public function get dungeonId() : int
      {
         return getInt("dungeon_id");
      }
      
      public function get dungeonIdentifier() : String
      {
         return getString("dungeon_identifier");
      }
      
      public function get level() : int
      {
         return getInt("level");
      }
      
      public function get fansNeeded() : int
      {
         return getInt("fans_needed");
      }
      
      public function get currentDungeonQuestId() : int
      {
         return getInt("current_dungeon_quest_id");
      }
      
      public function get progressIndex() : int
      {
         return getInt("progress_index");
      }
      
      public function get status() : int
      {
         return getInt("status");
      }
      
      public function get rewardItemId() : int
      {
         return getInt("reward_item_id");
      }
   }
}
