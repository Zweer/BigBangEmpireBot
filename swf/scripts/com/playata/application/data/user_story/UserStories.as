package com.playata.application.data.user_story
{
   import com.playata.application.data.dataobject.DOUserStory;
   import com.playata.framework.core.collection.IntMap;
   import com.playata.framework.data.DataObjectArray;
   
   public class UserStories
   {
      
      private static var _userStories:IntMap = new IntMap();
      
      private static var _reportedUserStories:Vector.<int> = null;
       
      
      public function UserStories()
      {
         super();
      }
      
      public static function refreshUserStories(param1:DataObjectArray) : void
      {
         var _loc4_:int = 0;
         var _loc3_:* = param1;
         for each(var _loc2_ in param1)
         {
            refreshUserStory(_loc2_);
         }
      }
      
      public static function refreshUserStory(param1:DOUserStory) : void
      {
         if(_userStories.exists(param1.id))
         {
            (_userStories.getData(param1.id) as UserStory).update(param1);
         }
         else
         {
            _userStories.setData(param1.id,new UserStory(param1));
         }
      }
      
      public static function getUserStory(param1:int) : UserStory
      {
         if(_userStories.exists(param1))
         {
            return _userStories.getData(param1);
         }
         return null;
      }
      
      public static function refreshReportedUserStories(param1:Vector.<int>) : void
      {
         _reportedUserStories = param1;
      }
      
      public static function isUserStoryReported(param1:int) : Boolean
      {
         return _reportedUserStories != null && _reportedUserStories.indexOf(param1) >= 0;
      }
      
      public static function getActiveUserStory() : UserStory
      {
         var _loc3_:int = 0;
         var _loc2_:* = _userStories;
         for each(var _loc1_ in _userStories)
         {
            if(_loc1_.isMe && _loc1_.status == 1)
            {
               return _loc1_;
            }
         }
         return null;
      }
   }
}
