package com.playata.application.data.constants
{
   import com.playata.framework.core.TypedObject;
   import com.playata.framework.data.constants.ConstantsData;
   
   public class COpticalChange extends ConstantsData
   {
      
      public static const CONSTANTS_KEY:String = "optical_changes";
      
      public static const ID_NAME:String = "id";
       
      
      public function COpticalChange(param1:TypedObject)
      {
         super(param1);
      }
      
      public static function get constantsData() : *
      {
         return ConstantsData.getConstantsData("optical_changes");
      }
      
      public static function get count() : int
      {
         return ConstantsData.getCount("optical_changes");
      }
      
      public static function get ids() : Vector.<int>
      {
         return ConstantsData.getIntVectorIds("optical_changes");
      }
      
      public static function exists(param1:int) : Boolean
      {
         return ConstantsData.getIdExists("optical_changes",param1);
      }
      
      public static function fromId(param1:int) : COpticalChange
      {
         return ConstantsData.getConstantsDataObject(param1,COpticalChange) as COpticalChange;
      }
      
      public function get id() : int
      {
         return getInt("id");
      }
      
      public function get identifier() : String
      {
         return getString("identifier");
      }
      
      public function get type() : int
      {
         return getInt("type");
      }
      
      public function get rarity() : int
      {
         return getInt("rarity");
      }
      
      public function get defaultValue() : Boolean
      {
         return getBoolean("default");
      }
      
      public function get effect() : String
      {
         return getString("effect");
      }
      
      public function get tsAvailabilityStart() : String
      {
         return getString("ts_availability_start");
      }
      
      public function get tsAvailabilityEnd() : String
      {
         return getString("ts_availability_end");
      }
      
      public function get event() : String
      {
         return getString("event");
      }
   }
}
