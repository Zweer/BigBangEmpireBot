package com.playata.application.data.quest
{
   public class QuestStatus
   {
      
      public static const Unknown:int = 0;
      
      public static const Created:int = 1;
      
      public static const Started:int = 2;
      
      public static const Aborted:int = 3;
      
      public static const Finished:int = 4;
      
      public static const RewardsProcessed:int = 5;
       
      
      public function QuestStatus()
      {
         super();
      }
   }
}
