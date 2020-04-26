package com.playata.application.data.dataobject
{
   import com.playata.framework.data.DataObject;
   
   public class DOGuildBattleReward extends DataObject
   {
       
      
      public function DOGuildBattleReward(param1:Object)
      {
         super(param1);
      }
      
      public function get id() : int
      {
         return getInt("id");
      }
      
      public function get guildBattleId() : int
      {
         return getInt("guild_battle_id");
      }
      
      public function get characterId() : int
      {
         return getInt("character_id");
      }
      
      public function get gameCurrency() : int
      {
         return getInt("game_currency");
      }
      
      public function get itemId() : int
      {
         return getInt("item_id");
      }
      
      public function get status() : int
      {
         return getInt("status");
      }
   }
}
