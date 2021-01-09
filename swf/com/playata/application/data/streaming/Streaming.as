package com.playata.application.data.streaming
{
   import com.playata.application.data.constants.CStreamingActor;
   import com.playata.application.data.dataobject.DOStreaming;
   import com.playata.application.data.dataobject.DOStreamingShow;
   import com.playata.framework.core.TypedObject;
   import com.playata.framework.core.collection.IntMap;
   import com.playata.framework.core.util.JsonUtil;
   import com.playata.framework.data.DataObjectArray;
   
   public class Streaming extends DOStreaming
   {
      
      public static var ROOMS_COUNT:int = 6;
       
      
      private var _streamingShows:IntMap;
      
      private var _streamingShowsInPool:Vector.<StreamingShow> = null;
      
      private var _unlockedActors:IntMap = null;
      
      private var _unlockedSettings:IntMap = null;
      
      public function Streaming(param1:Object)
      {
         _streamingShows = new IntMap();
         super(param1);
      }
      
      override public function update(param1:TypedObject) : void
      {
         super.update(param1);
         if(_unlockedActors)
         {
            _unlockedActors = null;
         }
         if(_unlockedSettings)
         {
            _unlockedSettings = null;
         }
         if(_streamingShowsInPool)
         {
            _streamingShowsInPool = null;
         }
      }
      
      public function refreshStreamingShows(param1:DataObjectArray) : void
      {
         var _loc4_:int = 0;
         var _loc3_:* = param1;
         for(var _loc2_ in param1)
         {
            refreshStreamingShow(param1[_loc2_]);
         }
      }
      
      public function refreshStreamingShow(param1:DOStreamingShow) : void
      {
         if(hasStreamingShow(param1.id))
         {
            getStreamingShow(param1.id).update(param1);
            return;
         }
         _streamingShows.setData(param1.id,new StreamingShow(param1));
      }
      
      public function get streamingShows() : IntMap
      {
         return _streamingShows;
      }
      
      public function get streamingShowsInPool() : Vector.<StreamingShow>
      {
         var _loc2_:* = null;
         var _loc1_:int = 0;
         if(!_streamingShowsInPool)
         {
            _streamingShowsInPool = new Vector.<StreamingShow>();
            if(hasData("streaming_show_pool") && getData("streaming_show_pool") != "" && getData("streaming_show_pool") != [])
            {
               _loc2_ = JsonUtil.decode(getString("streaming_show_pool"));
               _loc1_ = 0;
               while(_loc1_ < _loc2_.length)
               {
                  if(hasStreamingShow(_loc2_[_loc1_]))
                  {
                     _streamingShowsInPool.push(getStreamingShow(_loc2_[_loc1_]));
                  }
                  _loc1_++;
               }
            }
         }
         return _streamingShowsInPool;
      }
      
      public function isRoomUnlocked(param1:int) : Boolean
      {
         return getRoomShowId(param1) >= 0;
      }
      
      public function hasRoomActiveShow(param1:int) : Boolean
      {
         return getRoomShowId(param1) > 0;
      }
      
      public function getRoomShowId(param1:int) : int
      {
         return getInt("room_" + param1 + "_show");
      }
      
      public function getShowOfRoom(param1:int) : StreamingShow
      {
         if(hasRoomActiveShow(param1))
         {
            return getStreamingShow(getRoomShowId(param1));
         }
         return null;
      }
      
      public function hasStreamingShow(param1:int) : Boolean
      {
         return _streamingShows.exists(param1);
      }
      
      public function getStreamingShow(param1:int) : StreamingShow
      {
         if(hasStreamingShow(param1))
         {
            return _streamingShows.getData(param1);
         }
         return null;
      }
      
      public function getNextFinishedStreamingShow() : StreamingShow
      {
         var _loc1_:int = 0;
         var _loc2_:StreamingShow = null;
         _loc1_ = 1;
         while(_loc1_ <= Streaming.ROOMS_COUNT)
         {
            if(hasRoomActiveShow(_loc1_) && (_loc2_ == null || getShowOfRoom(_loc1_).remainingSeconds < _loc2_.remainingSeconds))
            {
               _loc2_ = getShowOfRoom(_loc1_);
            }
            _loc1_++;
         }
         return _loc2_;
      }
      
      public function hasRoomWithoutShow() : Boolean
      {
         var _loc1_:int = 0;
         _loc1_ = 1;
         while(_loc1_ <= Streaming.ROOMS_COUNT)
         {
            if(isRoomUnlocked(_loc1_) && !hasRoomActiveShow(_loc1_))
            {
               return true;
            }
            _loc1_++;
         }
         return false;
      }
      
      public function getUnlockedActors() : IntMap
      {
         var _loc2_:* = null;
         if(!_unlockedActors)
         {
            _unlockedActors = new IntMap();
            if(hasData("unlocked_actors") && getData("unlocked_actors") != "" && getData("unlocked_actors") != [])
            {
               _loc2_ = JsonUtil.decode(getString("unlocked_actors"));
               var _loc4_:int = 0;
               var _loc3_:* = _loc2_;
               for(var _loc1_ in _loc2_)
               {
                  _unlockedActors.setData(_loc1_,new StreamingActor(_loc1_,_loc2_[_loc1_]));
               }
            }
         }
         return _unlockedActors;
      }
      
      public function getUnlockedSettings() : IntMap
      {
         var _loc1_:* = null;
         if(!_unlockedSettings)
         {
            _unlockedSettings = new IntMap();
            if(hasData("unlocked_settings") && getData("unlocked_settings") != "" && getData("unlocked_settings") != [])
            {
               _loc1_ = JsonUtil.decode(getString("unlocked_settings"));
               var _loc4_:int = 0;
               var _loc3_:* = _loc1_;
               for(var _loc2_ in _loc1_)
               {
                  _unlockedSettings.setData(_loc2_,_loc1_[_loc2_]);
               }
            }
         }
         return _unlockedSettings;
      }
      
      public function hasNewPose() : Boolean
      {
         var _loc6_:int = 0;
         var _loc5_:* = getUnlockedActors();
         for each(var _loc2_ in getUnlockedActors())
         {
            var _loc4_:int = 0;
            var _loc3_:* = _loc2_.unlockedAnimations;
            for each(var _loc1_ in _loc2_.unlockedAnimations)
            {
               if(_loc1_)
               {
                  return true;
               }
            }
         }
         return false;
      }
      
      public function hasNewSetting() : Boolean
      {
         var _loc3_:int = 0;
         var _loc2_:* = getUnlockedSettings();
         for each(var _loc1_ in getUnlockedSettings())
         {
            if(_loc1_)
            {
               return true;
            }
         }
         return false;
      }
      
      public function hasPoseToUnlock() : Boolean
      {
         var _loc3_:int = 0;
         var _loc2_:* = CStreamingActor.ids;
         for each(var _loc1_ in CStreamingActor.ids)
         {
            if(hasActorPoseToUnlock(_loc1_))
            {
               return true;
            }
         }
         return false;
      }
      
      public function hasActorPoseToUnlock(param1:int) : Boolean
      {
         var _loc4_:Boolean = false;
         var _loc2_:CStreamingActor = CStreamingActor.fromId(param1);
         var _loc6_:int = 0;
         var _loc5_:* = _loc2_.animationIds;
         for each(var _loc3_ in _loc2_.animationIds)
         {
            _loc4_ = getUnlockedActors().exists(param1) && (getUnlockedActors().getData(param1) as StreamingActor).unlockedAnimations.exists(_loc3_);
            if(!_loc4_ && _loc2_.getAnimation(_loc3_).unlockType == 4 && _loc2_.getAnimation(_loc3_).unlockValue <= streamingResource)
            {
               return true;
            }
         }
         return false;
      }
   }
}
