package com.playata.application.data.dataobject
{
   import com.playata.framework.data.DataObject;
   
   public class DOStreamingShow extends DataObject
   {
       
      
      public function DOStreamingShow(param1:Object)
      {
         super(param1);
      }
      
      public function get id() : int
      {
         return getInt("id");
      }
      
      public function get streamingId() : int
      {
         return getInt("streaming_id");
      }
      
      public function get tsCreation() : int
      {
         return getInt("ts_creation");
      }
      
      public function get tsStart() : int
      {
         return getInt("ts_start");
      }
      
      public function get status() : int
      {
         return getInt("status");
      }
      
      public function get actorId() : int
      {
         return getInt("actor_id");
      }
      
      public function get animationId() : int
      {
         return getInt("animation_id");
      }
      
      public function get settingId() : int
      {
         return getInt("setting_id");
      }
      
      public function get duration() : int
      {
         return getInt("duration");
      }
      
      public function get rewards() : String
      {
         return getString("rewards");
      }
   }
}
