package com.playata.application.data.dataobject
{
   import com.playata.framework.data.DataObject;
   
   public class DOStreaming extends DataObject
   {
       
      
      public function DOStreaming(param1:Object)
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
      
      public function get unlockedActors() : String
      {
         return getString("unlocked_actors");
      }
      
      public function get unlockedSettings() : String
      {
         return getString("unlocked_settings");
      }
      
      public function get tsLastOfferRefresh() : int
      {
         return getInt("ts_last_offer_refresh");
      }
      
      public function get streamingShowPool() : String
      {
         return getString("streaming_show_pool");
      }
      
      public function get streamingResource() : int
      {
         return getInt("streaming_resource");
      }
      
      public function get room1Show() : int
      {
         return getInt("room_1_show");
      }
      
      public function get room2Show() : int
      {
         return getInt("room_2_show");
      }
      
      public function get room3Show() : int
      {
         return getInt("room_3_show");
      }
      
      public function get room4Show() : int
      {
         return getInt("room_4_show");
      }
      
      public function get room5Show() : int
      {
         return getInt("room_5_show");
      }
      
      public function get room6Show() : int
      {
         return getInt("room_6_show");
      }
   }
}
