package com.playata.application.data.constants
{
   import com.playata.framework.core.TypedObject;
   import com.playata.framework.data.constants.ConstantsData;
   
   public class CGuildArtifact extends ConstantsData
   {
      
      public static const CONSTANTS_KEY:String = "guild_artifacts";
      
      public static const ID_NAME:String = "id";
       
      
      public function CGuildArtifact(param1:TypedObject)
      {
         super(param1);
      }
      
      public static function get constantsData() : *
      {
         return ConstantsData.getConstantsData("guild_artifacts");
      }
      
      public static function get count() : int
      {
         return ConstantsData.getCount("guild_artifacts");
      }
      
      public static function get ids() : Vector.<int>
      {
         return ConstantsData.getIntVectorIds("guild_artifacts");
      }
      
      public static function exists(param1:int) : Boolean
      {
         return ConstantsData.getIdExists("guild_artifacts",param1);
      }
      
      public static function fromId(param1:int) : CGuildArtifact
      {
         return ConstantsData.getConstantsDataObject(param1,CGuildArtifact) as CGuildArtifact;
      }
      
      public function get id() : int
      {
         return getInt("id");
      }
      
      public function get assetIdentifier() : String
      {
         return getString("asset_identifier");
      }
      
      public function get type() : int
      {
         return getInt("type");
      }
      
      public function get value() : int
      {
         return getInt("value");
      }
      
      public function get attributeReduction() : Number
      {
         return getNumber("attribute_reduction");
      }
   }
}
