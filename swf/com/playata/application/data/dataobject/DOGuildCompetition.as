package com.playata.application.data.dataobject
{
   import com.playata.framework.data.DataObject;
   
   public class DOGuildCompetition extends DataObject
   {
       
      
      public function DOGuildCompetition(param1:Object)
      {
         super(param1);
      }
      
      public function get id() : int
      {
         return getInt("id");
      }
      
      public function get status() : int
      {
         return getInt("status");
      }
      
      public function get identifier() : String
      {
         return getString("identifier");
      }
      
      public function get tsStarted() : int
      {
         return getInt("ts_started");
      }
      
      public function get tsEnd() : int
      {
         return getInt("ts_end");
      }
   }
}
