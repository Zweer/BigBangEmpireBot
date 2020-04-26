package com.playata.application.data.constants
{
   import com.playata.framework.core.TypedObject;
   import com.playata.framework.data.constants.ConstantsData;
   
   public class CLevel extends ConstantsData
   {
      
      public static const CONSTANTS_KEY:String = "levels";
      
      public static const ID_NAME:String = "level";
       
      
      public function CLevel(param1:TypedObject)
      {
         super(param1);
      }
      
      public static function get constantsData() : *
      {
         return ConstantsData.getConstantsData("levels");
      }
      
      public static function get count() : int
      {
         return ConstantsData.getCount("levels");
      }
      
      public static function get ids() : Vector.<int>
      {
         return ConstantsData.getIntVectorIds("levels");
      }
      
      public static function exists(param1:int) : Boolean
      {
         return ConstantsData.getIdExists("levels",param1);
      }
      
      public static function fromId(param1:int) : CLevel
      {
         return ConstantsData.getConstantsDataObject(param1,CLevel) as CLevel;
      }
      
      public function get level() : int
      {
         return getInt("level");
      }
      
      public function get xp() : int
      {
         return getInt("xp");
      }
   }
}
