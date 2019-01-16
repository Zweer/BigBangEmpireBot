package com.playata.application.data.constants
{
   import com.playata.framework.core.TypedObject;
   import com.playata.framework.data.constants.ConstantsData;
   
   public class CItemTemplate extends ConstantsData
   {
      
      public static const CONSTANTS_KEY:String = "item_templates";
      
      public static const ID_NAME:String = "identifier";
       
      
      public function CItemTemplate(param1:TypedObject)
      {
         super(param1);
      }
      
      public static function get constantsData() : *
      {
         return ConstantsData.getConstantsData("item_templates");
      }
      
      public static function get count() : int
      {
         return ConstantsData.getCount("item_templates");
      }
      
      public static function get ids() : Vector.<String>
      {
         return ConstantsData.getStringVectorIds("item_templates");
      }
      
      public static function exists(param1:String) : Boolean
      {
         return ConstantsData.getIdExists("item_templates",param1);
      }
      
      public static function fromId(param1:String) : CItemTemplate
      {
         return ConstantsData.getConstantsDataObject(param1,CItemTemplate) as CItemTemplate;
      }
      
      public function get identifier() : String
      {
         return getString("identifier");
      }
      
      public function get type() : int
      {
         return getInt("type");
      }
      
      public function get gender() : String
      {
         return getString("gender");
      }
      
      public function get quality() : int
      {
         return getInt("quality");
      }
      
      public function get pool() : int
      {
         return getInt("pool");
      }
      
      public function get requiredLevel() : int
      {
         return getInt("required_level");
      }
      
      public function get charges() : int
      {
         return getInt("charges");
      }
      
      public function get tsAvailabilityStart() : String
      {
         return getString("ts_availability_start");
      }
      
      public function get tsAvailabilityEnd() : String
      {
         return getString("ts_availability_end");
      }
      
      public function get displayOptions() : int
      {
         return getInt("display_options");
      }
      
      public function get premiumOnly() : Boolean
      {
         return getBoolean("premium_only");
      }
      
      public function get sewPrice() : int
      {
         return getInt("sew_price");
      }
      
      public function get langRestrictions() : String
      {
         return getString("lang_restrictions");
      }
      
      public function get itemSetIdentifier() : String
      {
         return getString("item_set_identifier");
      }
      
      public function get fixedPremiumPrice() : int
      {
         return getInt("fixed_premium_price");
      }
      
      public function get nonSetIdentifier() : String
      {
         return getString("non_set_identifier");
      }
      
      public function get itemPatternId() : String
      {
         return getString("item_pattern");
      }
      
      public function get itemPattern() : CItemPattern
      {
         return CItemPattern.fromId(getId("item_pattern"));
      }
      
      public function get isEvent() : Boolean
      {
         return getBoolean("is_event");
      }
      
      public function get effectChance() : int
      {
         return getInt("effect_chance");
      }
      
      public function get effects() : String
      {
         return getString("effects");
      }
      
      public function get assetBundleId() : int
      {
         return getInt("asset_bundle_id");
      }
   }
}
