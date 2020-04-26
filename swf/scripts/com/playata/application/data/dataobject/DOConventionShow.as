package com.playata.application.data.dataobject
{
   import com.playata.framework.data.DataObject;
   
   public class DOConventionShow extends DataObject
   {
       
      
      public function DOConventionShow(param1:Object)
      {
         super(param1);
      }
      
      public function get id() : int
      {
         return getInt("id");
      }
      
      public function get conventionId() : int
      {
         return getInt("convention_id");
      }
      
      public function get identifier() : String
      {
         return getString("identifier");
      }
      
      public function get characterId() : int
      {
         return getInt("character_id");
      }
      
      public function get status() : int
      {
         return getInt("status");
      }
      
      public function get durationRaw() : int
      {
         return getInt("duration_raw");
      }
      
      public function get duration() : int
      {
         return getInt("duration");
      }
      
      public function get tsComplete() : int
      {
         return getInt("ts_complete");
      }
      
      public function get level() : int
      {
         return getInt("level");
      }
      
      public function get fans() : int
      {
         return getInt("fans");
      }
      
      public function get iterations() : int
      {
         return getInt("iterations");
      }
      
      public function get reward() : int
      {
         return getInt("reward");
      }
   }
}
