package com.playata.application.data.friendbar
{
   import com.playata.application.AppEnvironment;
   import com.playata.application.data.user.User;
   import com.playata.framework.core.Core;
   import com.playata.framework.core.TypedObject;
   import com.playata.framework.platform.PlatformConfig;
   
   public class FriendBarSyncStates
   {
      
      private static var _data:TypedObject = TypedObject.empty;
      
      private static var _pendingSyncFriendBar:Boolean = false;
      
      private static var _pendingForceSyncFriendBar:Boolean = false;
       
      
      public function FriendBarSyncStates()
      {
         super();
      }
      
      public static function set pendingSyncFriendBar(param1:Boolean) : void
      {
         _pendingSyncFriendBar = param1;
      }
      
      public static function set pendingForceSyncFriendBar(param1:Boolean) : void
      {
         _pendingForceSyncFriendBar = param1;
      }
      
      public static function get pendingForceSyncFriendBar() : Boolean
      {
         return _pendingForceSyncFriendBar;
      }
      
      public static function refresh(param1:TypedObject) : void
      {
         _data.extend(param1);
      }
      
      public static function getData(param1:String) : int
      {
         return _data.getInt(param1);
      }
      
      public static function reset() : void
      {
         _data = TypedObject.empty;
      }
      
      public static function get syncFriendbarData() : TypedObject
      {
         var _loc6_:* = undefined;
         var _loc3_:* = undefined;
         var _loc2_:int = 0;
         var _loc5_:String = PlatformConfig.platform;
         var _loc1_:TypedObject = new TypedObject({"platform":_loc5_});
         if(_loc5_ == "facebook" && Core.config.hasCfg("facebook_access_token"))
         {
            _loc1_.setString("facebook_access_token",PlatformConfig.facebookAccessToken);
         }
         if(!User.current)
         {
            return _loc1_;
         }
         if(_pendingForceSyncFriendBar)
         {
            _pendingForceSyncFriendBar = false;
         }
         else
         {
            _loc6_ = AppEnvironment.friendBar.friends.friends;
            _loc3_ = new Vector.<int>();
            var _loc8_:int = 0;
            var _loc7_:* = _loc6_;
            for each(var _loc4_ in _loc6_)
            {
               _loc3_.push(_loc4_.characterId);
            }
            if(_loc3_.length > 0)
            {
               _loc1_.setString("friend_character_ids",_loc3_.join(","));
            }
            var _loc10_:int = 0;
            var _loc9_:* = _loc6_;
            for each(_loc4_ in _loc6_)
            {
               _loc2_ = getData("friend" + _loc4_.characterId);
               if(_loc2_)
               {
                  _loc1_.setInt("sync_friend" + _loc4_.characterId,_loc2_);
               }
            }
         }
         return _loc1_;
      }
      
      public static function get isSyncFriendbarDataSynced() : Boolean
      {
         var _loc1_:int = 0;
         if(!User.current)
         {
            return true;
         }
         var _loc3_:Vector.<FriendBarFriend> = AppEnvironment.friendBar.friends.friends;
         if(!_loc3_ || _loc3_.length == 0)
         {
            return true;
         }
         if(_pendingSyncFriendBar || _pendingForceSyncFriendBar)
         {
            _pendingSyncFriendBar = false;
            return false;
         }
         var _loc5_:int = 0;
         var _loc4_:* = _loc3_;
         for each(var _loc2_ in _loc3_)
         {
            _loc1_ = getData("friend" + _loc2_.characterId);
            if(!_loc1_)
            {
               return false;
            }
         }
         return true;
      }
   }
}
