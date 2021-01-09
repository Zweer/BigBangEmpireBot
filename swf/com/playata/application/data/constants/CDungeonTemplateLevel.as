package com.playata.application.data.constants
{
   import com.playata.framework.core.TypedObject;
   import com.playata.framework.data.constants.ConstantsData;
   
   public class CDungeonTemplateLevel extends ConstantsData
   {
      
      public static const ID_NAME:String = "level";
       
      
      public function CDungeonTemplateLevel(param1:TypedObject)
      {
         super(param1);
      }
      
      public function get level() : int
      {
         return getInt("level");
      }
      
      public function get minFans() : int
      {
         return getInt("min_fans");
      }
      
      public function get unlockNpcIdentifier() : String
      {
         return getString("unlock_npc_identifier");
      }
      
      public function get rewardItemIdentifier() : String
      {
         return getString("reward_item_identifier");
      }
      
      public function get rewardItemLevelOffset() : int
      {
         return getInt("reward_item_level_offset");
      }
   }
}
