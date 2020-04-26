package com.playata.application.data.dataobject
{
   import com.playata.framework.data.DataObject;
   
   public class DOMovieHistory extends DataObject
   {
       
      
      public function DOMovieHistory(param1:Object)
      {
         super(param1);
      }
      
      public function get id() : int
      {
         return getInt("id");
      }
      
      public function get guildName() : String
      {
         return getString("guild_name");
      }
      
      public function get set() : String
      {
         return getString("set");
      }
      
      public function get title() : String
      {
         return getString("title");
      }
      
      public function get cover() : String
      {
         return getString("cover");
      }
      
      public function get rating() : int
      {
         return getInt("rating");
      }
      
      public function get fans() : int
      {
         return getInt("fans");
      }
      
      public function get rank() : int
      {
         return getInt("rank");
      }
      
      public function get tsCompleted() : int
      {
         return getInt("ts_completed");
      }
   }
}
