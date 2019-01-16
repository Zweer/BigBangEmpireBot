package com.playata.application.data.friendbar
{
   import com.playata.application.data.dataobject.DOFriend;
   import com.playata.framework.core.TypedObject;
   import com.playata.framework.core.logging.Logger;
   import com.playata.framework.core.util.AlphaNumericSortUtil;
   import com.playata.framework.data.DataObjectArray;
   import com.playata.framework.display.IImage;
   
   public class FriendBarFriends
   {
       
      
      private var _friends:Vector.<FriendBarFriend>;
      
      private var _filteredFriends:Vector.<FriendBarFriend>;
      
      private var _showOnlineOnly:Boolean = false;
      
      private var _showGuildMembers:Boolean = true;
      
      public function FriendBarFriends()
      {
         _friends = new Vector.<FriendBarFriend>();
         _filteredFriends = new Vector.<FriendBarFriend>();
         super();
      }
      
      public function dispose() : void
      {
         Logger.debug("[Friendbar] Destroying friends...");
         _filteredFriends.length = 0;
         var _loc3_:int = 0;
         var _loc2_:* = _friends;
         for each(var _loc1_ in _friends)
         {
            _loc1_.dispose();
         }
      }
      
      public function updateFriendData(param1:DataObjectArray) : void
      {
         var _loc7_:Boolean = false;
         var _loc6_:Boolean = false;
         if(!param1)
         {
            _friends = new Vector.<FriendBarFriend>();
            updateFilter();
            return;
         }
         var _loc4_:Vector.<FriendBarFriend> = new Vector.<FriendBarFriend>();
         var _loc11_:int = 0;
         var _loc10_:* = _friends;
         for each(var _loc3_ in _friends)
         {
            _loc7_ = false;
            var _loc9_:int = 0;
            var _loc8_:* = param1;
            for each(var _loc5_ in param1)
            {
               if(_loc5_.userId == _loc3_.userId)
               {
                  _loc7_ = true;
                  _loc3_.update(_loc5_);
                  break;
               }
            }
            if(!_loc7_)
            {
               _loc4_.push(_loc3_);
            }
         }
         var _loc13_:int = 0;
         var _loc12_:* = _loc4_;
         for each(var _loc2_ in _loc4_)
         {
            _friends.splice(_friends.indexOf(_loc2_),1);
         }
         var _loc17_:int = 0;
         var _loc16_:* = param1;
         for each(_loc5_ in param1)
         {
            _loc6_ = false;
            var _loc15_:int = 0;
            var _loc14_:* = _friends;
            for each(_loc3_ in _friends)
            {
               if(_loc5_.userId == _loc3_.userId)
               {
                  _loc6_ = true;
                  break;
               }
            }
            if(!_loc6_)
            {
               _friends.push(new FriendBarFriend(_loc5_));
            }
         }
         _friends.sort(sortByLevelName);
         updateFilter();
      }
      
      public function addFriend(param1:int, param2:int, param3:String, param4:int, param5:Boolean, param6:IImage) : void
      {
         var _loc10_:int = 0;
         var _loc9_:* = _friends;
         for each(var _loc8_ in _friends)
         {
            if(_loc8_.userId == param1)
            {
               return;
            }
         }
         var _loc7_:FriendBarFriend = new FriendBarFriend(new DOFriend({
            "user_id":param1,
            "character_id":param2,
            "character_name":param3,
            "character_level":param4,
            "character_online":param5,
            "is_friend":true
         }));
         _loc7_.setImage(param6);
         _friends.push(_loc7_);
         _friends.sort(sortByLevelName);
         updateFilter();
      }
      
      public function removeFriend(param1:int, param2:Boolean) : void
      {
         var _loc5_:int = 0;
         var _loc4_:* = _friends;
         for each(var _loc3_ in _friends)
         {
            if(_loc3_.userId == param1)
            {
               if(param2)
               {
                  _loc3_.update(new TypedObject({"is_guild_member":false}));
               }
               else
               {
                  _loc3_.update(new TypedObject({"is_friend":false}));
               }
               if(!_loc3_.isGuildMember && !_loc3_.isFriend)
               {
                  _friends.splice(_friends.indexOf(_loc3_),1);
               }
               updateFilter();
               return;
            }
         }
         _friends.sort(sortByLevelName);
         updateFilter();
      }
      
      public function leaveGuild() : void
      {
         var _loc2_:int = 0;
         var _loc1_:* = null;
         _loc2_ = _friends.length - 1;
         while(_loc2_ >= 0)
         {
            _loc1_ = _friends[_loc2_];
            removeFriend(_loc1_.userId,true);
            _loc2_--;
         }
      }
      
      public function updateFriend(param1:int, param2:int, param3:Boolean, param4:IImage) : void
      {
         var _loc7_:int = 0;
         var _loc6_:* = _friends;
         for each(var _loc5_ in _friends)
         {
            if(_loc5_.userId == param1)
            {
               if(param2 > 0)
               {
                  _loc5_.update(new TypedObject({
                     "character_level":param2,
                     "character_online":param3
                  }));
               }
               if(param4)
               {
                  _loc5_.setImage(param4);
               }
               updateFilter();
               return;
            }
         }
      }
      
      public function getFriend(param1:int) : FriendBarFriend
      {
         var _loc4_:int = 0;
         var _loc3_:* = _friends;
         for each(var _loc2_ in _friends)
         {
            if(_loc2_.userId == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      public function getFriendByName(param1:String) : FriendBarFriend
      {
         var _loc4_:int = 0;
         var _loc3_:* = _friends;
         for each(var _loc2_ in _friends)
         {
            if(_loc2_.characterName == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      public function get count() : int
      {
         if(filterActive)
         {
            return _filteredFriends.length;
         }
         return _friends.length;
      }
      
      public function get allFriendsCount() : int
      {
         return _friends.length;
      }
      
      public function get friends() : Vector.<FriendBarFriend>
      {
         if(filterActive)
         {
            return _filteredFriends;
         }
         return _friends;
      }
      
      private function sortByLevelName(param1:FriendBarFriend, param2:FriendBarFriend) : int
      {
         if(param1.characterLevel < param2.characterLevel)
         {
            return 1;
         }
         if(param1.characterLevel > param2.characterLevel)
         {
            return -1;
         }
         return AlphaNumericSortUtil.compare(param1.characterName,param2.characterName);
      }
      
      public function showOnlineFriendsOnly(param1:Boolean) : void
      {
         if(_showOnlineOnly != param1)
         {
            _showOnlineOnly = param1;
            updateFilter();
         }
      }
      
      public function showGuildMembers(param1:Boolean) : void
      {
         if(_showGuildMembers != param1)
         {
            _showGuildMembers = param1;
            updateFilter();
         }
      }
      
      private function updateFilter() : void
      {
         if(!filterActive)
         {
            return;
         }
         _filteredFriends.length = 0;
         var _loc3_:int = 0;
         var _loc2_:* = _friends;
         for each(var _loc1_ in _friends)
         {
            if(!(_showOnlineOnly && !_loc1_.isCharacterOnline))
            {
               if(!(!_showGuildMembers && !_loc1_.isFriend))
               {
                  _filteredFriends.push(_loc1_);
               }
            }
         }
      }
      
      private function get filterActive() : Boolean
      {
         return _showOnlineOnly || !_showGuildMembers;
      }
   }
}
