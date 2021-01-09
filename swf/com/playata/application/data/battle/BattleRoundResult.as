package com.playata.application.data.battle
{
   public class BattleRoundResult
   {
      
      public static const Unknown:int = 0;
      
      public static const Dodged:int = 1;
      
      public static const NormalHit:int = 2;
      
      public static const CriticalHit:int = 3;
      
      public static const GuildMissileNormalHit:int = 4;
      
      public static const GuildMissileCriticalHit:int = 5;
       
      
      public function BattleRoundResult()
      {
         super();
      }
   }
}
