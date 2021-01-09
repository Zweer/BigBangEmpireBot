package com.playata.application.data.constants
{
   import com.playata.framework.core.TypedObject;
   import com.playata.framework.data.constants.ConstantsData;
   
   public class CEventQuest extends ConstantsData
   {
      
      public static const CONSTANTS_KEY:String = "event_quests";
      
      public static const ID_NAME:String = "event_identifier";
       
      
      public function CEventQuest(param1:TypedObject)
      {
         super(param1);
      }
      
      public static function get constantsData() : *
      {
         return ConstantsData.getConstantsData("event_quests");
      }
      
      public static function get count() : int
      {
         return ConstantsData.getCount("event_quests");
      }
      
      public static function get ids() : Vector.<String>
      {
         return ConstantsData.getStringVectorIds("event_quests");
      }
      
      public static function exists(param1:String) : Boolean
      {
         return ConstantsData.getIdExists("event_quests",param1);
      }
      
      public static function fromId(param1:String) : CEventQuest
      {
         return ConstantsData.getConstantsDataObject(param1,CEventQuest) as CEventQuest;
      }
      
      public function get eventIdentifier() : String
      {
         return getString("event_identifier");
      }
      
      public function get startDate() : String
      {
         return getString("start_date");
      }
      
      public function get endDate() : String
      {
         return getString("end_date");
      }
      
      public function get reward1Type() : int
      {
         return getInt("reward1_type");
      }
      
      public function get reward1Factor() : int
      {
         return getInt("reward1_factor");
      }
      
      public function get reward1Flag() : String
      {
         return getString("reward1_flag");
      }
      
      public function get reward2Type() : int
      {
         return getInt("reward2_type");
      }
      
      public function get reward2Factor() : int
      {
         return getInt("reward2_factor");
      }
      
      public function get reward2Flag() : String
      {
         return getString("reward2_flag");
      }
      
      public function get rewardItem1Id() : String
      {
         return getString("reward_item1");
      }
      
      public function get rewardItem1() : CItemTemplate
      {
         return CItemTemplate.fromId(getId("reward_item1"));
      }
      
      public function get rewardItem2Id() : String
      {
         return getString("reward_item2");
      }
      
      public function get rewardItem2() : CItemTemplate
      {
         return CItemTemplate.fromId(getId("reward_item2"));
      }
      
      public function get rewardItem3Id() : String
      {
         return getString("reward_item3");
      }
      
      public function get rewardItem3() : CItemTemplate
      {
         return CItemTemplate.fromId(getId("reward_item3"));
      }
      
      public function get rewardItem1LevelPlus() : int
      {
         return getInt("reward_item1_level_plus");
      }
      
      public function get rewardItem2LevelPlus() : int
      {
         return getInt("reward_item2_level_plus");
      }
      
      public function get rewardItem3LevelPlus() : int
      {
         return getInt("reward_item3_level_plus");
      }
      
      public function get rewardTitleId() : String
      {
         return getString("reward_title");
      }
      
      public function get rewardTitle() : CTitle
      {
         return CTitle.fromId(getId("reward_title"));
      }
      
      public function get objectiveIds() : Vector.<String>
      {
         return getSubStringVectorIds("objectives");
      }
      
      public function hasObjectiveId(param1:String) : Boolean
      {
         return objectiveIds.indexOf(param1) != -1;
      }
      
      public function getObjective(param1:String) : CEventQuestObjective
      {
         return getSubData("objectives",eventIdentifier,param1,CEventQuestObjective) as CEventQuestObjective;
      }
   }
}
