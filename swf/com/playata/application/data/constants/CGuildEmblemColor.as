package com.playata.application.data.constants
{
   import com.playata.framework.core.TypedObject;
   import com.playata.framework.data.constants.ConstantsData;
   
   public class CGuildEmblemColor extends ConstantsData
   {
      
      public static const CONSTANTS_KEY:String = "guild_emblem_colors";
      
      public static const ID_NAME:String = "color";
       
      
      public function CGuildEmblemColor(param1:TypedObject)
      {
         super(param1);
      }
      
      public static function get constantsData() : *
      {
         return ConstantsData.getConstantsData("guild_emblem_colors");
      }
      
      public static function get count() : int
      {
         return ConstantsData.getCount("guild_emblem_colors");
      }
      
      public static function get ids() : Vector.<String>
      {
         return ConstantsData.getStringVectorIds("guild_emblem_colors");
      }
      
      public static function exists(param1:String) : Boolean
      {
         return ConstantsData.getIdExists("guild_emblem_colors",param1);
      }
      
      public static function fromId(param1:String) : CGuildEmblemColor
      {
         return ConstantsData.getConstantsDataObject(param1,CGuildEmblemColor) as CGuildEmblemColor;
      }
      
      public function get color() : String
      {
         return getString("color");
      }
   }
}
