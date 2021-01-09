package com.playata.application.data.constants
{
   import com.playata.framework.core.TypedObject;
   import com.playata.framework.data.constants.ConstantsData;
   
   public class CNPC extends ConstantsData
   {
      
      public static const CONSTANTS_KEY:String = "npcs";
      
      public static const ID_NAME:String = "identifier";
       
      
      public function CNPC(param1:TypedObject)
      {
         super(param1);
      }
      
      public static function get constantsData() : *
      {
         return ConstantsData.getConstantsData("npcs");
      }
      
      public static function get count() : int
      {
         return ConstantsData.getCount("npcs");
      }
      
      public static function get ids() : Vector.<String>
      {
         return ConstantsData.getStringVectorIds("npcs");
      }
      
      public static function exists(param1:String) : Boolean
      {
         return ConstantsData.getIdExists("npcs",param1);
      }
      
      public static function fromId(param1:String) : CNPC
      {
         return ConstantsData.getConstantsDataObject(param1,CNPC) as CNPC;
      }
      
      public function get identifier() : String
      {
         return getString("identifier");
      }
      
      public function get voice() : int
      {
         return getInt("voice");
      }
      
      public function get type() : int
      {
         return getInt("type");
      }
   }
}
