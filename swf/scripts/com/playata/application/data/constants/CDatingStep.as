package com.playata.application.data.constants
{
   import com.playata.framework.core.TypedObject;
   import com.playata.framework.data.constants.ConstantsData;
   
   public class CDatingStep extends ConstantsData
   {
      
      public static const ID_NAME:String = "step";
       
      
      public function CDatingStep(param1:TypedObject)
      {
         super(param1);
      }
      
      public function get step() : int
      {
         return getInt("step");
      }
      
      public function get genderedImage() : Boolean
      {
         return getBoolean("gendered_image");
      }
      
      public function get usk16Image() : Boolean
      {
         return getBoolean("usk16_image");
      }
      
      public function get usk16GenderedImage() : Boolean
      {
         return getBoolean("usk16_gendered_image");
      }
      
      public function get unlockPointsNeeded() : int
      {
         return getInt("unlock_points_needed");
      }
      
      public function get type() : int
      {
         return getInt("type");
      }
      
      public function get reference() : String
      {
         return getString("reference");
      }
      
      public function get statType() : int
      {
         return getInt("stat_type");
      }
      
      public function get statValue() : int
      {
         return getInt("stat_value");
      }
      
      public function get rewardStatPoints() : int
      {
         return getInt("reward_stat_points");
      }
      
      public function get rewardItemIdentifierM() : String
      {
         return getString("reward_item_identifier_m");
      }
      
      public function get rewardItemIdentifierF() : String
      {
         return getString("reward_item_identifier_f");
      }
      
      public function get rewardItemLevelOffset() : int
      {
         return getInt("reward_item_level_offset");
      }
      
      public function get skipPrice() : int
      {
         return getInt("skip_price");
      }
      
      public function get unlockPointsNeededRepeat() : int
      {
         return getInt("unlock_points_needed_repeat");
      }
      
      public function get rewardStatPointsRepeat() : int
      {
         return getInt("reward_stat_points_repeat");
      }
      
      public function get rewardItemIdentifierMRepeat() : String
      {
         return getString("reward_item_identifier_m_repeat");
      }
      
      public function get rewardItemIdentifierFRepeat() : String
      {
         return getString("reward_item_identifier_f_repeat");
      }
      
      public function get rewardItemLevelOffsetRepeat() : int
      {
         return getInt("reward_item_level_offset_repeat");
      }
      
      public function get skipPriceRepeat() : int
      {
         return getInt("skip_price_repeat");
      }
   }
}
