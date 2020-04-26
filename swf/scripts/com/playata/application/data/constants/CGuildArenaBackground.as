package com.playata.application.data.constants
{
   import com.playata.framework.core.TypedObject;
   import com.playata.framework.data.constants.ConstantsData;
   
   public class CGuildArenaBackground extends ConstantsData
   {
      
      public static const CONSTANTS_KEY:String = "guild_arena_backgrounds";
      
      public static const ID_NAME:String = "id";
       
      
      public function CGuildArenaBackground(param1:TypedObject)
      {
         super(param1);
      }
      
      public static function get constantsData() : *
      {
         return ConstantsData.getConstantsData("guild_arena_backgrounds");
      }
      
      public static function get count() : int
      {
         return ConstantsData.getCount("guild_arena_backgrounds");
      }
      
      public static function get ids() : Vector.<int>
      {
         return ConstantsData.getIntVectorIds("guild_arena_backgrounds");
      }
      
      public static function exists(param1:int) : Boolean
      {
         return ConstantsData.getIdExists("guild_arena_backgrounds",param1);
      }
      
      public static function fromId(param1:int) : CGuildArenaBackground
      {
         return ConstantsData.getConstantsDataObject(param1,CGuildArenaBackground) as CGuildArenaBackground;
      }
      
      public function get id() : int
      {
         return getInt("id");
      }
      
      public function get index() : int
      {
         return getInt("index");
      }
      
      public function get assetIdentifier() : String
      {
         return getString("asset_identifier");
      }
      
      public function get gameCurrencyCost() : int
      {
         return getInt("game_currency_cost");
      }
      
      public function get premiumCurrencyCost() : int
      {
         return getInt("premium_currency_cost");
      }
   }
}
