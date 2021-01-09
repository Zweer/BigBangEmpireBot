package com.playata.application.data.convention
{
   import com.playata.application.data.constants.CConstant;
   import com.playata.application.data.constants.CItemTemplate;
   import com.playata.application.data.dataobject.DOConvention;
   import com.playata.application.data.item.Item;
   import com.playata.application.data.user.User;
   import com.playata.application.platform.ServerInfo;
   import com.playata.framework.core.util.TimeUtil;
   import com.playata.framework.localization.LocText;
   
   public class Convention extends DOConvention
   {
      
      public static const BANNER_WIDTH:int = 130;
      
      public static const BANNER_HEIGHT:int = 290;
       
      
      public function Convention(param1:Object = null)
      {
         super(param1);
      }
      
      public function get name() : String
      {
         return LocText.current.text("convention/" + identifier + "/name");
      }
      
      public function get callerName() : String
      {
         return LocText.current.text("convention/" + identifier + "/caller");
      }
      
      public function get logoImageUrl() : String
      {
         return ServerInfo.assetURL("conventions_new/" + identifier + "_l","png");
      }
      
      public function get questButtonImageUrl() : String
      {
         return ServerInfo.assetURL("conventions_new/" + identifier + "_i","png");
      }
      
      public function get stageOverlayUrl() : String
      {
         return ServerInfo.assetURL("conventions_new/" + identifier + "_o","swf");
      }
      
      public function get bannerLeftUrl() : String
      {
         return ServerInfo.assetURL("conventions_new/" + identifier + "_bl","png");
      }
      
      public function get bannerRightUrl() : String
      {
         return ServerInfo.assetURL("conventions_new/" + identifier + "_br","png");
      }
      
      public function get ownShowCount() : int
      {
         return User.current.character.getConventionShowCount(id);
      }
      
      public function get briefingText() : String
      {
         var _loc1_:String = LocText.current.text("convention/" + identifier + "/briefing_text");
         return _loc1_.replace("[name]",User.current.character.name);
      }
      
      public function get descriptionText() : String
      {
         return LocText.current.text("convention/" + identifier + "/description_text");
      }
      
      public function get successfulText() : String
      {
         var _loc2_:Number = fansCurrent / fansTotal;
         var _loc1_:String = _loc2_ > CConstant.convention_perfect_ratio?"super_successful_text":"successful_text";
         return LocText.current.text("convention/" + identifier + "/" + _loc1_);
      }
      
      public function get failedText() : String
      {
         return LocText.current.text("convention/" + identifier + "/failed_text");
      }
      
      public function get rewardTopRankItemName() : String
      {
         return LocText.current.text("item/" + rewardTopRankItemIdentifier + "/name");
      }
      
      public function get rewardTopRankItemIconImageUrl() : String
      {
         var _loc1_:String = rewardTopRankItemIdentifier;
         var _loc2_:String = CItemTemplate.fromId(_loc1_).gender == "u"?"":!!User.current.character.isMale?"_m":"_f";
         return ServerInfo.assetURL(Item.itemAssetPath + _loc1_ + _loc2_ + "_i","png");
      }
      
      public function get rewardTopRankItemQuality() : int
      {
         return CItemTemplate.fromId(rewardTopRankItemIdentifier).quality;
      }
      
      public function get rewardTopPoolItemName() : String
      {
         return LocText.current.text("item/" + rewardTopPoolItemIdentifier + "/name");
      }
      
      public function get rewardTopPoolItemIconImageUrl() : String
      {
         var _loc1_:String = rewardTopPoolItemIdentifier;
         var _loc2_:String = CItemTemplate.fromId(_loc1_).gender == "u"?"":!!User.current.character.isMale?"_m":"_f";
         return ServerInfo.assetURL(Item.itemAssetPath + _loc1_ + _loc2_ + "_i","png");
      }
      
      public function get rewardTopPoolItemQuality() : int
      {
         return CItemTemplate.fromId(rewardTopPoolItemIdentifier).quality;
      }
      
      public function get isValid() : Boolean
      {
         return User.current.character.getData("convention_id") == id;
      }
      
      public function get isRunning() : Boolean
      {
         return status == 1 && remainingSeconds > 0;
      }
      
      public function get isPending() : Boolean
      {
         return status == 2 || status == 1 && remainingSeconds <= 0;
      }
      
      public function get isFinished() : Boolean
      {
         return status == 4;
      }
      
      public function get isSuccessful() : Boolean
      {
         return (status == 4 || status == 2 || status == 1 && remainingSeconds <= 0) && fansCurrent >= fansTotal;
      }
      
      public function get remainingSeconds() : int
      {
         var _loc1_:int = tsEnd - TimeUtil.now;
         if(_loc1_ < 0)
         {
            return 0;
         }
         return _loc1_;
      }
      
      public function get reward() : ConventionReward
      {
         return User.current.character.getConventionReward(id);
      }
      
      public function get ownRanking() : int
      {
         return getInt("ranking");
      }
      
      public function get ownXpRewardTotal() : int
      {
         return getInt("xp_reward_total");
      }
      
      public function get ownXpRewardNextShow() : int
      {
         return getInt("xp_reward_next_show");
      }
      
      public function get ownXpRewardTotalNextShow() : int
      {
         return ownXpRewardTotal + ownXpRewardNextShow;
      }
      
      public function get nextShowBriefing() : String
      {
         return LocText.current.text("convention/" + identifier + "/quest/" + User.current.character.getData("convention_show_identifier") + "/briefing");
      }
      
      public function get nextShowReward() : String
      {
         return LocText.current.text("general/reward/coins_name",User.current.character.getInt("convention_show_reward"));
      }
   }
}
