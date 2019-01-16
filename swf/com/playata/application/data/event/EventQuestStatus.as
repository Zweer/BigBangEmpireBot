package com.playata.application.data.event
{
   public class EventQuestStatus
   {
      
      public static const Unknown:int = 0;
      
      public static const Started:int = 1;
      
      public static const Finished:int = 2;
      
      public static const Aborted:int = 3;
      
      public static const AbortedRewardsCollected:int = 4;
      
      public static const AbortedButFinished:int = 5;
       
      
      public function EventQuestStatus()
      {
         super();
      }
   }
}
