package com.playata.application.data.dataobject
{
   import com.playata.framework.data.DataObject;
   
   public class DOWork extends DataObject
   {
       
      
      public function DOWork(param1:Object)
      {
         super(param1);
      }
      
      public function get id() : int
      {
         return getInt("id");
      }
      
      public function get characterId() : int
      {
         return getInt("character_id");
      }
      
      public function get workOfferId() : String
      {
         return getString("work_offer_id");
      }
      
      public function get status() : int
      {
         return getInt("status");
      }
      
      public function get duration() : int
      {
         return getInt("duration");
      }
      
      public function get tsComplete() : int
      {
         return getInt("ts_complete");
      }
      
      public function get rewards() : String
      {
         return getString("rewards");
      }
   }
}
