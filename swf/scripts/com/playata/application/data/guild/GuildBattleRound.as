package com.playata.application.data.guild
{
   import com.playata.application.data.battle.BattleRound;
   
   public class GuildBattleRound extends BattleRound
   {
       
      
      public function GuildBattleRound(param1:Object = null)
      {
         super(param1);
      }
      
      public function get attacker() : int
      {
         return parseInt(a);
      }
      
      public function get attacked() : int
      {
         return parseInt(d);
      }
      
      public function get guildMissileNormalHit() : Boolean
      {
         return resultType == 4;
      }
      
      public function get guildMissileCriticalHit() : Boolean
      {
         return resultType == 5;
      }
   }
}
