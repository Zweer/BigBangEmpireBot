package com.playata.application.data.constants
{
   import com.playata.framework.core.TypedObject;
   import com.playata.framework.data.constants.ConstantsData;
   
   public class CGuildEmblemIcon extends ConstantsData
   {
      
      public static const CONSTANTS_KEY:String = "guild_emblem_icons";
      
      public static const ID_NAME:String = "id";
       
      
      public function CGuildEmblemIcon(param1:TypedObject)
      {
         super(param1);
      }
      
      public static function get constantsData() : *
      {
         return ConstantsData.getConstantsData("guild_emblem_icons");
      }
      
      public static function get count() : int
      {
         return ConstantsData.getCount("guild_emblem_icons");
      }
      
      public static function get ids() : Vector.<int>
      {
         return ConstantsData.getIntVectorIds("guild_emblem_icons");
      }
      
      public static function exists(param1:int) : Boolean
      {
         return ConstantsData.getIdExists("guild_emblem_icons",param1);
      }
      
      public static function fromId(param1:int) : CGuildEmblemIcon
      {
         return ConstantsData.getConstantsDataObject(param1,CGuildEmblemIcon) as CGuildEmblemIcon;
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
