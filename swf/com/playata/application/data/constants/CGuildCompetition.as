package com.playata.application.data.constants
{
   import com.playata.framework.core.TypedObject;
   import com.playata.framework.data.constants.ConstantsData;
   
   public class CGuildCompetition extends ConstantsData
   {
      
      public static const CONSTANTS_KEY:String = "guild_competitions";
      
      public static const ID_NAME:String = "identifier";
       
      
      public function CGuildCompetition(param1:TypedObject)
      {
         super(param1);
      }
      
      public static function get constantsData() : *
      {
         return ConstantsData.getConstantsData("guild_competitions");
      }
      
      public static function get count() : int
      {
         return ConstantsData.getCount("guild_competitions");
      }
      
      public static function get ids() : Vector.<String>
      {
         return ConstantsData.getStringVectorIds("guild_competitions");
      }
      
      public static function exists(param1:String) : Boolean
      {
         return ConstantsData.getIdExists("guild_competitions",param1);
      }
      
      public static function fromId(param1:String) : CGuildCompetition
      {
         return ConstantsData.getConstantsDataObject(param1,CGuildCompetition) as CGuildCompetition;
      }
      
      public function get identifier() : String
      {
         return getString("identifier");
      }
      
      public function get objectiveIds() : Vector.<int>
      {
         return getSubIntVectorIds("objectives");
      }
      
      public function hasObjectiveId(param1:int) : Boolean
      {
         return objectiveIds.indexOf(param1) != -1;
      }
      
      public function getObjective(param1:int) : CGuildCompetitionObjective
      {
         return getSubData("objectives",identifier,param1,CGuildCompetitionObjective) as CGuildCompetitionObjective;
      }
   }
}
