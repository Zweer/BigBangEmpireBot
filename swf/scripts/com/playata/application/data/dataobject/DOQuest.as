package com.playata.application.data.dataobject
{
   import com.playata.framework.data.DataObject;
   
   public class DOQuest extends DataObject
   {
       
      
      public function DOQuest(param1:Object)
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
      
      public function get type() : int
      {
         return getInt("type");
      }
      
      public function get stat() : int
      {
         return getInt("stat");
      }
      
      public function get stage() : int
      {
         return getInt("stage");
      }
      
      public function get level() : int
      {
         return getInt("level");
      }
      
      public function get status() : int
      {
         return getInt("status");
      }
      
      public function get durationType() : int
      {
         return getInt("duration_type");
      }
      
      public function get durationRaw() : int
      {
         return getInt("duration_raw");
      }
      
      public function get duration() : int
      {
         return getInt("duration");
      }
      
      public function get tsComplete() : int
      {
         return getInt("ts_complete");
      }
      
      public function get energyCost() : int
      {
         return getInt("energy_cost");
      }
      
      public function get fightDifficulty() : int
      {
         return getInt("fight_difficulty");
      }
      
      public function get fightNpcIdentifier() : String
      {
         return getString("fight_npc_identifier");
      }
      
      public function get fightBattleId() : int
      {
         return getInt("fight_battle_id");
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
