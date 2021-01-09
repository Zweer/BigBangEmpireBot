package com.playata.application.data.battle
{
   public class BattleEffect
   {
      
      public static const Unknown:int = 0;
      
      public static const ChanceFirstStrike:int = 1;
      
      public static const ChanceStunEnemy:int = 2;
      
      public static const ChanceReduceEnemyCriticalFactor:int = 3;
      
      public static const ChanceStunEnemyAfterCrit:int = 4;
      
      public static const ChanceSurviveDeadlyStrike:int = 5;
      
      public static const ChanceDodgeAttack:int = 6;
      
      public static const ChanceNormalHitDamageBackfire:int = 7;
      
      public static const ChanceCriticalHitDamageBackfire:int = 8;
      
      public static const ChanceIncreasedCriticalFactor:int = 9;
      
      public static const ChanceActivateDoT:int = 10;
      
      public static const ChanceDoubleAttack:int = 11;
      
      public static const ChanceReduceEnemyMissileDamage:int = 13;
      
      public static const ChanceReduceEnemyDamage:int = 14;
      
      public static const PassiveReduceEnemyCriticalRating:int = 101;
      
      public static const PassiveReduceEnemyDodgeRating:int = 102;
      
      public static const MissileDamageFactor:int = 103;
      
      public static const PassiveReduceGuildArtifactPenalty:int = 105;
      
      public static const StatBonusStrength:int = 201;
      
      public static const StatBonusStamina:int = 202;
      
      public static const StatBonusCriticalHitRating:int = 203;
      
      public static const StatBonusDodgeRating:int = 204;
      
      public static const StatBonusAllStats:int = 205;
      
      private static var ROUND_START_EFFECTS:Vector.<int> = new <int>[1,3,6,9];
      
      private static var AFTER_HIT_EFFECTS:Vector.<int> = new <int>[2,4,5,7,8,10,11,13,14];
      
      private static var SINGLE_EVENT_SKILLS:Vector.<int> = new <int>[101,102,103,105,1,2,3,4,5,6,7,8,9,11];
      
      private static var MULTI_USAGES:Vector.<int> = new <int>[7,10,13,14];
       
      
      public function BattleEffect()
      {
         super();
      }
      
      public static function getBattleSkillId(param1:int) : int
      {
         var _loc2_:* = param1;
         switch(_loc2_)
         {
            case 2:
               return 1;
            case 3:
               return 2;
            case 1:
               return 3;
            case 4:
               return 4;
            case 10:
               return 5;
            case 13:
               return 24;
            case 103:
               return 10;
            case 102:
               return 11;
            case 101:
               return 12;
            case 105:
               return 25;
            case 5:
               return 15;
            case 11:
               return 16;
            case 6:
               return 17;
            case 8:
               return 18;
            case 7:
               return 20;
            case 9:
               return 21;
            case 14:
               return 26;
            case 201:
               return 6;
            case 202:
               return 7;
            case 203:
               return 8;
            case 204:
               return 9;
            case 205:
               return 27;
            default:
               return 0;
         }
      }
      
      public static function isRoundStartEffect(param1:int) : Boolean
      {
         return ROUND_START_EFFECTS.indexOf(param1) >= 0;
      }
      
      public static function isAfterHitEffect(param1:int) : Boolean
      {
         return AFTER_HIT_EFFECTS.indexOf(param1) >= 0;
      }
      
      public static function isSingleEvent(param1:int) : Boolean
      {
         return SINGLE_EVENT_SKILLS.indexOf(param1) >= 0;
      }
      
      public static function multiUsePossible(param1:int) : Boolean
      {
         return MULTI_USAGES.indexOf(param1) >= 0;
      }
   }
}
