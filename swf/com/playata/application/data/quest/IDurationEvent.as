package com.playata.application.data.quest
{
   public interface IDurationEvent
   {
       
      
      function get id() : int;
      
      function get remainingSeconds() : int;
      
      function get progress() : Number;
      
      function get remainingSecondsNonBoosted() : int;
      
      function get isStarted() : Boolean;
      
      function get isFinished() : Boolean;
      
      function get instantFinishPremiumAmount() : int;
      
      function get progressText() : String;
      
      function get duration() : int;
      
      function get isTimeQuest() : Boolean;
      
      function get isFightQuest() : Boolean;
      
      function get isStatQuest() : Boolean;
      
      function get isConventionShow() : Boolean;
   }
}
