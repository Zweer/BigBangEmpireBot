package com.playata.application.data.movie
{
   import com.playata.application.data.AppDateTime;
   import com.playata.application.data.constants.CMovieRating;
   import com.playata.application.data.constants.CMovieSetting;
   import com.playata.application.data.dataobject.DOMovie;
   import com.playata.application.data.dataobject.DOMovieQuest;
   import com.playata.application.data.reward.Reward;
   import com.playata.application.platform.ServerInfo;
   import com.playata.framework.core.TypedObject;
   import com.playata.framework.core.collection.IntMap;
   import com.playata.framework.core.util.JsonUtil;
   import com.playata.framework.core.util.NumberUtil;
   import com.playata.framework.core.util.TimeUtil;
   import com.playata.framework.data.DataObjectArray;
   import com.playata.framework.localization.LocText;
   
   public class Movie extends DOMovie
   {
       
      
      private var _rewards:Reward = null;
      
      private var _starRewards:IntMap;
      
      private var _movieQuests:IntMap;
      
      public function Movie(param1:Object = null)
      {
         _starRewards = new IntMap();
         _movieQuests = new IntMap();
         super(param1);
      }
      
      override public function update(param1:TypedObject) : void
      {
         super.update(param1);
         if(_rewards)
         {
            _rewards = new Reward(getString("rewards"));
         }
      }
      
      public function get rewards() : Reward
      {
         if(_rewards)
         {
            return _rewards;
         }
         _rewards = new Reward(getString("rewards"));
         return _rewards;
      }
      
      public function get setIdentifier() : String
      {
         return super.set;
      }
      
      public function get isCustomTitle() : Boolean
      {
         return !hasData("custom_title") || getData("custom_title") == "1";
      }
      
      public function get progressValue() : int
      {
         var _loc1_:Number = NumberUtil.clampf(energy / neededEnergy * 100,0,100);
         return Math.floor(_loc1_);
      }
      
      public function get hasClaimableStars() : Boolean
      {
         return claimableStar > 0;
      }
      
      public function get claimableStar() : int
      {
         var _loc2_:* = null;
         var _loc3_:int = 0;
         var _loc5_:int = 0;
         var _loc4_:* = CMovieRating.ids;
         for each(var _loc1_ in CMovieRating.ids)
         {
            _loc2_ = CMovieRating.fromId(_loc1_);
            if(progressValue >= _loc2_.neededProgress)
            {
               _loc3_ = _loc2_.stars;
            }
         }
         if(_loc3_ > claimedStars)
         {
            return claimedStars + 1;
         }
         return 0;
      }
      
      public function get claimableReward() : Reward
      {
         return getRewardForStars(claimableStar);
      }
      
      public function getRewardForStars(param1:int) : Reward
      {
         if(_starRewards.exists(param1))
         {
            return _starRewards.getData(param1);
         }
         var _loc3_:String = "rewards_star_" + param1;
         var _loc2_:Reward = new Reward(getData(_loc3_) as String);
         _starRewards.setData(param1,_loc2_);
         return _loc2_;
      }
      
      public function get getRemainingEnergyForNextStar() : int
      {
         var _loc4_:* = null;
         var _loc5_:int = 0;
         var _loc1_:int = 0;
         var _loc2_:int = claimedStars + 1;
         var _loc7_:int = 0;
         var _loc6_:* = CMovieRating.ids;
         for each(var _loc3_ in CMovieRating.ids)
         {
            _loc4_ = CMovieRating.fromId(_loc3_);
            if(_loc4_.stars == _loc2_)
            {
               _loc5_ = _loc4_.neededProgress;
               _loc1_ = Math.floor(_loc5_ / 100 * neededEnergy);
               return _loc1_ - energy;
            }
         }
         return 0;
      }
      
      public function get coverSettings() : String
      {
         return getString("cover");
      }
      
      public function get tsCompleted() : int
      {
         return getInt("ts_completed");
      }
      
      public function get dateTime() : String
      {
         return AppDateTime.getPassedShortFormattedTimestamp(tsCompleted);
      }
      
      public function get guildName() : String
      {
         var _loc1_:String = getString("guild_name");
         if(_loc1_.indexOf("___") != -1)
         {
            _loc1_ = _loc1_.substr(_loc1_.indexOf("___") + 3) + " " + LocText.current.text("general/character_deleted");
         }
         return _loc1_;
      }
      
      public function get characterName() : String
      {
         var _loc1_:String = getString("character_name");
         if(_loc1_.indexOf("___") != -1)
         {
            _loc1_ = LocText.current.text("general/character_deleted");
         }
         return _loc1_;
      }
      
      public function get movieQuestIds() : Array
      {
         var _loc1_:String = getString("movie_quest_pool");
         return JsonUtil.decode(_loc1_);
      }
      
      public function get hasMovieQuests() : Boolean
      {
         if(getData("movie_quest_pool") == "")
         {
            return false;
         }
         return true;
      }
      
      public function get backgroundLayerMovieUrls() : Vector.<String>
      {
         return ServerInfo.movieSettingBackgroundLayerUrlsByList(CMovieSetting.fromId(setIdentifier).layers);
      }
      
      public function get remainingSeconds() : int
      {
         var _loc1_:int = getInt("ts_end");
         var _loc2_:int = _loc1_ - TimeUtil.now;
         return NumberUtil.clamp(_loc2_,0,duration);
      }
      
      public function refreshMovieQuests(param1:DataObjectArray) : void
      {
         _movieQuests = new IntMap();
         var _loc4_:int = 0;
         var _loc3_:* = param1;
         for each(var _loc2_ in param1)
         {
            _movieQuests.setData(_loc2_.id,new MovieQuest(_loc2_));
         }
      }
      
      public function refreshMovieQuest(param1:DOMovieQuest) : MovieQuest
      {
         if(!param1.id)
         {
            return null;
         }
         _movieQuests.getData(param1.id).update(param1);
         return _movieQuests.getData(param1.id);
      }
      
      public function get movieQuests() : IntMap
      {
         return _movieQuests;
      }
      
      public function get isOpen() : Boolean
      {
         return status == 7;
      }
      
      public function get isComplete() : Boolean
      {
         return !hasClaimableStars && (status == 12 || status == 13);
      }
      
      public function get activeMovieQuest() : MovieQuest
      {
         var _loc1_:int = getInt("movie_quest_id");
         if(_loc1_ == 0)
         {
            return null;
         }
         return _movieQuests.getData(_loc1_);
      }
      
      public function get starsBasedOnRating() : int
      {
         var _loc2_:* = null;
         var _loc3_:int = 0;
         var _loc5_:int = 0;
         var _loc4_:* = CMovieRating.ids;
         for each(var _loc1_ in CMovieRating.ids)
         {
            _loc2_ = CMovieRating.fromId(_loc1_);
            if(_loc2_.neededProgress <= this.rating)
            {
               _loc3_++;
               continue;
            }
            break;
         }
         return _loc3_;
      }
      
      public function get offerImageUrl() : String
      {
         return ServerInfo.assetURL("movie_offers/" + setIdentifier,"png");
      }
   }
}
