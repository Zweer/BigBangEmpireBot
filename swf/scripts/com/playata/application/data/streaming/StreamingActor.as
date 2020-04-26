package com.playata.application.data.streaming
{
   import com.playata.application.data.constants.CStreamingActor;
   import com.playata.application.data.constants.CStreamingSetting;
   import com.playata.application.platform.ServerInfo;
   import com.playata.framework.core.collection.IntMap;
   
   public class StreamingActor
   {
       
      
      private var _actorId:int = 0;
      
      private var _unlockedAnimations:IntMap;
      
      public function StreamingActor(param1:int, param2:Object)
      {
         _unlockedAnimations = new IntMap();
         super();
         _actorId = param1;
         var _loc5_:int = 0;
         var _loc4_:* = param2;
         for(var _loc3_ in param2)
         {
            _unlockedAnimations.setData(_loc3_,param2[_loc3_]);
         }
      }
      
      public static function getActorIconUrl(param1:int) : String
      {
         return ServerInfo.assetURL("streaming_actors/" + CStreamingActor.fromId(param1).identifier + "_i","png");
      }
      
      public static function getActorIconUrlBig(param1:int) : String
      {
         return ServerInfo.assetURL("streaming_actors/" + CStreamingActor.fromId(param1).identifier + "_i_2","png");
      }
      
      public static function getSettingIconUrl(param1:int) : String
      {
         return ServerInfo.assetURL("streaming_settings/" + CStreamingSetting.fromId(param1).identifier + "_i","png");
      }
      
      public function get unlockedAnimations() : IntMap
      {
         return _unlockedAnimations;
      }
   }
}
