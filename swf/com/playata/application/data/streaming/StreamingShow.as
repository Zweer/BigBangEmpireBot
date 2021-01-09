package com.playata.application.data.streaming
{
   import com.playata.application.AppEnvironment;
   import com.playata.application.data.constants.CStreamingActor;
   import com.playata.application.data.constants.CStreamingSetting;
   import com.playata.application.data.dataobject.DOStreamingShow;
   import com.playata.application.data.reward.Reward;
   import com.playata.application.platform.ServerInfo;
   import com.playata.framework.core.TypedObject;
   import com.playata.framework.core.util.TimeUtil;
   
   public class StreamingShow extends DOStreamingShow
   {
       
      
      private var _rewards:Reward = null;
      
      public function StreamingShow(param1:Object = null)
      {
         super(param1);
      }
      
      public static function getSettingImageUrl(param1:int) : String
      {
         return ServerInfo.assetURL("streaming_settings/" + CStreamingSetting.fromId(param1).identifier + "_background","png");
      }
      
      public static function getSettingBannerImageUrl(param1:int) : String
      {
         return ServerInfo.assetURL("streaming_settings/" + CStreamingSetting.fromId(param1).identifier + "_background_banner","png");
      }
      
      public static function getActorImageUrl(param1:int, param2:int) : String
      {
         var _loc3_:String = CStreamingActor.fromId(param1).identifier + "_streaming_pose_" + param2;
         if(AppEnvironment.appPlatform.isHidePantiesAllowed)
         {
            _loc3_ = _loc3_ + "_ad";
         }
         else
         {
            _loc3_ = _loc3_ + "_nad";
         }
         return ServerInfo.assetURL("streaming_actors/" + _loc3_,"png");
      }
      
      override public function update(param1:TypedObject) : void
      {
         super.update(param1);
         if(_rewards)
         {
            _rewards = null;
         }
      }
      
      public function get reward() : Reward
      {
         if(_rewards)
         {
            return _rewards;
         }
         _rewards = new Reward(rewards);
         return _rewards;
      }
      
      public function get remainingSeconds() : int
      {
         var _loc2_:int = tsStart + this.duration;
         var _loc1_:int = _loc2_ - TimeUtil.now;
         if(_loc1_ < 0)
         {
            _loc1_ = 0;
         }
         return _loc1_;
      }
      
      public function get progress() : Number
      {
         return (1 - remainingSeconds / duration) * 100;
      }
      
      public function get settingImageUrl() : String
      {
         return getSettingImageUrl(settingId);
      }
      
      public function get actorOfferImageUrl() : String
      {
         return ServerInfo.assetURL("streaming_actors/" + CStreamingActor.fromId(actorId).identifier + "_offer","png");
      }
      
      public function get actorPoseImageUrl() : String
      {
         return getActorImageUrl(actorId,animationId);
      }
   }
}
