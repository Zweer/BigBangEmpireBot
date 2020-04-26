package com.playata.application.data.user_story
{
   import com.playata.framework.core.util.JsonUtil;
   
   public class UserStoryListContext
   {
       
      
      public var lastRefresh:int = 0;
      
      public var curentUserStory:UserStory = null;
      
      public var userStoryIds:Vector.<int>;
      
      public var maxUserStories:int = -1;
      
      public var offset:int = 0;
      
      public var locales:Array = null;
      
      public function UserStoryListContext()
      {
         userStoryIds = new Vector.<int>();
         super();
      }
      
      public function reset(param1:Boolean = true) : void
      {
         lastRefresh = 0;
         curentUserStory = null;
         userStoryIds = new Vector.<int>();
         maxUserStories = -1;
         offset = 0;
         if(param1)
         {
            locales = null;
         }
      }
      
      public function getJsonLocales() : String
      {
         if(!locales || locales.length == 0)
         {
            return "all";
         }
         return JsonUtil.encode(locales);
      }
   }
}
