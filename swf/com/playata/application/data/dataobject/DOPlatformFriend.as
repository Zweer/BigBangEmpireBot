package com.playata.application.data.dataobject
{
   import com.playata.framework.data.DataObject;
   
   public class DOPlatformFriend extends DataObject
   {
       
      
      public function DOPlatformFriend(param1:Object)
      {
         super(param1);
      }
      
      public function get platformUserId() : String
      {
         return getString("platform_user_id");
      }
      
      public function get platformName() : String
      {
         return getString("platform_name");
      }
      
      public function get platformImageUrl() : String
      {
         return getString("platform_image_url");
      }
   }
}
