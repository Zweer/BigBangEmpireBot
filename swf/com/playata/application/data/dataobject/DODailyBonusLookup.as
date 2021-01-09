package com.playata.application.data.dataobject
{
   import com.playata.framework.data.DataObject;
   
   public class DODailyBonusLookup extends DataObject
   {
       
      
      public function DODailyBonusLookup(param1:Object)
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
      
      public function get tsLastReset() : int
      {
         return getInt("ts_last_reset");
      }
      
      public function get herobookDailyCompleted() : int
      {
         return getInt("herobook_daily_completed");
      }
      
      public function get duelBattleWon() : int
      {
         return getInt("duel_battle_won");
      }
      
      public function get questEnergySpent() : int
      {
         return getInt("quest_energy_spent");
      }
   }
}
