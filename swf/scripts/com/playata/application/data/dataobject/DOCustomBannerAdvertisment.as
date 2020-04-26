package com.playata.application.data.dataobject
{
   import com.playata.framework.core.TypedObject;
   import com.playata.framework.data.DataObject;
   
   public class DOCustomBannerAdvertisment extends DataObject
   {
       
      
      public function DOCustomBannerAdvertisment(param1:Object)
      {
         super(param1);
      }
      
      public function get identifier() : String
      {
         return getString("identifier");
      }
      
      public function get test() : Boolean
      {
         return getBoolean("test");
      }
      
      public function get active() : Boolean
      {
         return getBoolean("active");
      }
      
      public function get index() : int
      {
         return getInt("index");
      }
      
      public function get availableTimeStart() : String
      {
         return getString("available_time_start");
      }
      
      public function get availableTimeEnd() : String
      {
         return getString("available_time_end");
      }
      
      public function get clickLimit() : int
      {
         return getInt("click_limit");
      }
      
      public function get url() : String
      {
         return getString("url");
      }
      
      public function get displayInterval() : int
      {
         return getInt("display_interval");
      }
      
      public function get locales() : Array
      {
         return getArray("locales");
      }
      
      public function get rewards() : TypedObject
      {
         return getTypedObject("rewards");
      }
   }
}
