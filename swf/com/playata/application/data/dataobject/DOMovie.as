package com.playata.application.data.dataobject
{
   import com.playata.framework.data.DataObject;
   
   public class DOMovie extends DataObject
   {
       
      
      public function DOMovie(param1:Object)
      {
         super(param1);
      }
      
      public function get id() : int
      {
         return getInt("id");
      }
      
      public function get characterId() : int
      {
         return getInt("character_id");
      }
      
      public function get characterLevel() : int
      {
         return getInt("character_level");
      }
      
      public function get guildId() : int
      {
         return getInt("guild_id");
      }
      
      public function get set() : String
      {
         return getString("set");
      }
      
      public function get title() : String
      {
         return getString("title");
      }
      
      public function get customTitle() : Boolean
      {
         return getBoolean("custom_title");
      }
      
      public function get coverRectType() : int
      {
         return getInt("cover_rect_type");
      }
      
      public function get coverBackgroundType() : int
      {
         return getInt("cover_background_type");
      }
      
      public function get coverBorderType() : int
      {
         return getInt("cover_border_type");
      }
      
      public function get coverLayoutType() : int
      {
         return getInt("cover_layout_type");
      }
      
      public function get coverLayoutNewType() : int
      {
         return getInt("cover_layout_new_type");
      }
      
      public function get coverFontType() : int
      {
         return getInt("cover_font_type");
      }
      
      public function get coverActorType() : int
      {
         return getInt("cover_actor_type");
      }
      
      public function get coverFilterType() : int
      {
         return getInt("cover_filter_type");
      }
      
      public function get cover() : String
      {
         return getString("cover");
      }
      
      public function get status() : int
      {
         return getInt("status");
      }
      
      public function get rating() : int
      {
         return getInt("rating");
      }
      
      public function get fans() : int
      {
         return getInt("fans");
      }
      
      public function get energy() : int
      {
         return getInt("energy");
      }
      
      public function get stat() : int
      {
         return getInt("stat");
      }
      
      public function get neededEnergy() : int
      {
         return getInt("needed_energy");
      }
      
      public function get duration() : int
      {
         return getInt("duration");
      }
      
      public function get tsEnd() : int
      {
         return getInt("ts_end");
      }
      
      public function get movieQuestId() : int
      {
         return getInt("movie_quest_id");
      }
      
      public function get movieQuestPool() : String
      {
         return getString("movie_quest_pool");
      }
      
      public function get claimedStars() : int
      {
         return getInt("claimed_stars");
      }
      
      public function get rewardsStar1() : String
      {
         return getString("rewards_star_1");
      }
      
      public function get rewardsStar2() : String
      {
         return getString("rewards_star_2");
      }
      
      public function get rewardsStar3() : String
      {
         return getString("rewards_star_3");
      }
      
      public function get votes() : int
      {
         return getInt("votes");
      }
      
      public function get rank() : int
      {
         return getInt("rank");
      }
   }
}
