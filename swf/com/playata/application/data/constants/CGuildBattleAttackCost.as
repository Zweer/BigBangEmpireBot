package com.playata.application.data.constants
{
   import com.playata.framework.core.TypedObject;
   import com.playata.framework.data.constants.ConstantsData;
   
   public class CGuildBattleAttackCost extends ConstantsData
   {
      
      public static const CONSTANTS_KEY:String = "guild_battle_attack_cost";
      
      public static const ID_NAME:String = "percentage";
       
      
      public function CGuildBattleAttackCost(param1:TypedObject)
      {
         super(param1);
      }
      
      public static function get constantsData() : *
      {
         return ConstantsData.getConstantsData("guild_battle_attack_cost");
      }
      
      public static function get count() : int
      {
         return ConstantsData.getCount("guild_battle_attack_cost");
      }
      
      public static function get ids() : Vector.<int>
      {
         return ConstantsData.getIntVectorIds("guild_battle_attack_cost");
      }
      
      public static function exists(param1:int) : Boolean
      {
         return ConstantsData.getIdExists("guild_battle_attack_cost",param1);
      }
      
      public static function fromId(param1:int) : CGuildBattleAttackCost
      {
         return ConstantsData.getConstantsDataObject(param1,CGuildBattleAttackCost) as CGuildBattleAttackCost;
      }
      
      public function get percentage() : int
      {
         return getInt("percentage");
      }
      
      public function get gameCurrencyCost() : int
      {
         return getInt("game_currency_cost");
      }
   }
}
