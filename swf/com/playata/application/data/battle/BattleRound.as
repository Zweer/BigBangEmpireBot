package com.playata.application.data.battle
{
   import com.playata.application.data.dataobject.DOBattleRound;
   
   public class BattleRound extends DOBattleRound
   {
       
      
      public function BattleRound(param1:Object = null)
      {
         super(param1);
      }
      
      public function get resultType() : int
      {
         return r;
      }
      
      public function get dodged() : Boolean
      {
         return resultType == 1;
      }
      
      public function get normalHit() : Boolean
      {
         return resultType == 2;
      }
      
      public function get criticalHit() : Boolean
      {
         return resultType == 3;
      }
      
      public function get damage() : int
      {
         if(!hasData("v"))
         {
            return 0;
         }
         var _loc1_:int = v;
         return _loc1_ - dotDamage;
      }
      
      public function get dotDamage() : int
      {
         if(!hasData("dt"))
         {
            return 0;
         }
         return dt;
      }
      
      public function get backfireDamage() : int
      {
         if(!hasData("bf"))
         {
            return 0;
         }
         return bf;
      }
      
      public function get missileUsed() : Boolean
      {
         if(!hasData("m"))
         {
            return false;
         }
         return m == 1;
      }
      
      public function get attackerEffects() : Vector.<int>
      {
         if(!hasData("ae"))
         {
            return null;
         }
         return getIntVector("ae");
      }
      
      public function get attackedEffects() : Vector.<int>
      {
         if(!hasData("de"))
         {
            return null;
         }
         return getIntVector("de");
      }
   }
}
