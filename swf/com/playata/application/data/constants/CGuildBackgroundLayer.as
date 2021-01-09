package com.playata.application.data.constants
{
   import com.playata.framework.core.TypedObject;
   import com.playata.framework.data.constants.ConstantsData;
   
   public class CGuildBackgroundLayer extends ConstantsData
   {
      
      public static const CONSTANTS_KEY:String = "guild_background_layers";
      
      public static const ID_NAME:String = "index";
       
      
      public function CGuildBackgroundLayer(param1:TypedObject)
      {
         super(param1);
      }
      
      public static function get constantsData() : *
      {
         return ConstantsData.getConstantsData("guild_background_layers");
      }
      
      public static function get count() : int
      {
         return ConstantsData.getCount("guild_background_layers");
      }
      
      public static function get ids() : Vector.<int>
      {
         return ConstantsData.getIntVectorIds("guild_background_layers");
      }
      
      public static function exists(param1:int) : Boolean
      {
         return ConstantsData.getIdExists("guild_background_layers",param1);
      }
      
      public static function fromId(param1:int) : CGuildBackgroundLayer
      {
         return ConstantsData.getConstantsDataObject(param1,CGuildBackgroundLayer) as CGuildBackgroundLayer;
      }
      
      public function get index() : int
      {
         return getInt("index");
      }
      
      public function get type() : String
      {
         return getString("type");
      }
      
      public function get value() : int
      {
         return getInt("value");
      }
      
      public function get assetIdentifier() : String
      {
         return getString("asset_identifier");
      }
      
      public function get isDefault() : Boolean
      {
         return getBoolean("is_default");
      }
      
      public function get costPremiumCurrency() : int
      {
         return getInt("cost_premium_currency");
      }
      
      public function get gameCurrencyCost() : int
      {
         return getInt("game_currency_cost");
      }
   }
}
