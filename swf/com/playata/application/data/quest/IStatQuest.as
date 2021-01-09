package com.playata.application.data.quest
{
   public interface IStatQuest
   {
       
      
      function get difficulty() : int;
      
      function get statQuestStat() : int;
      
      function get npcIdentifier() : String;
      
      function get npcImageUrlHD() : String;
      
      function get isWon() : Boolean;
      
      function get winChance() : Number;
      
      function get neededStat() : Number;
   }
}
