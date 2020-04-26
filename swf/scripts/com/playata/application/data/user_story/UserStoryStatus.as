package com.playata.application.data.user_story
{
   public class UserStoryStatus
   {
      
      public static const Unknown:int = 0;
      
      public static const Created:int = 1;
      
      public static const Voting:int = 2;
      
      public static const HallOfFame:int = 3;
      
      public static const Out:int = 4;
      
      public static const Reported:int = 5;
      
      public static const Deleted:int = 6;
       
      
      public function UserStoryStatus()
      {
         super();
      }
   }
}
