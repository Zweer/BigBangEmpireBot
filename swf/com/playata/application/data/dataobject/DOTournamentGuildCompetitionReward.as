package com.playata.application.data.dataobject
{
   import com.playata.framework.data.DataObject;
   
   public class DOTournamentGuildCompetitionReward extends DataObject
   {
       
      
      public function DOTournamentGuildCompetitionReward(param1:Object)
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
      
      public function get status() : int
      {
         return getInt("status");
      }
      
      public function get week() : int
      {
         return getInt("week");
      }
      
      public function get guildCompetition() : int
      {
         return getInt("guild_competition");
      }
      
      public function get rewards() : String
      {
         return getString("rewards");
      }
   }
}
