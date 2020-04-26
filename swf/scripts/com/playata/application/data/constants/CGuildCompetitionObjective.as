package com.playata.application.data.constants
{
   import com.playata.framework.core.TypedObject;
   import com.playata.framework.data.constants.ConstantsData;
   
   public class CGuildCompetitionObjective extends ConstantsData
   {
      
      public static const ID_NAME:String = "objective";
       
      
      public function CGuildCompetitionObjective(param1:TypedObject)
      {
         super(param1);
      }
      
      public function get objective() : int
      {
         return getInt("objective");
      }
      
      public function get objectiveIdentifier() : String
      {
         return getString("objective_identifier");
      }
      
      public function get type() : int
      {
         return getInt("type");
      }
      
      public function get reference() : String
      {
         return getString("reference");
      }
      
      public function get multiplier() : int
      {
         return getInt("multiplier");
      }
   }
}
