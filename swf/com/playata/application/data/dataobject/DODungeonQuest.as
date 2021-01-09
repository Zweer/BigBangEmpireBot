package com.playata.application.data.dataobject
{
   import com.playata.framework.data.DataObject;
   
   public class DODungeonQuest extends DataObject
   {
       
      
      public function DODungeonQuest(param1:Object)
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
      
      public function get characterLevel() : int
      {
         return getInt("character_level");
      }
      
      public function get characterXp() : int
      {
         return getInt("character_xp");
      }
      
      public function get identifier() : String
      {
         return getString("identifier");
      }
      
      public function get level() : int
      {
         return getInt("level");
      }
      
      public function get type() : int
      {
         return getInt("type");
      }
      
      public function get stat() : int
      {
         return getInt("stat");
      }
      
      public function get status() : int
      {
         return getInt("status");
      }
      
      public function get battleId() : int
      {
         return getInt("battle_id");
      }
      
      public function get won() : Boolean
      {
         return getBoolean("won");
      }
      
      public function get rewards() : String
      {
         return getString("rewards");
      }
   }
}
