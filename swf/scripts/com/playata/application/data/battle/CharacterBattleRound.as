package com.playata.application.data.battle
{
   public class CharacterBattleRound extends BattleRound
   {
       
      
      public function CharacterBattleRound(param1:Object = null)
      {
         super(param1);
      }
      
      public function get attackerA() : Boolean
      {
         return attacker == "a";
      }
      
      public function get attackerB() : Boolean
      {
         return attacker == "b";
      }
      
      public function get attacker() : String
      {
         return a;
      }
      
      public function get attacked() : String
      {
         return d;
      }
   }
}
