package com.playata.application.data.dataobject
{
   import com.playata.framework.data.DataObject;
   
   public class DOCharacterSelectionEntry extends DataObject
   {
       
      
      public function DOCharacterSelectionEntry(param1:Object)
      {
         super(param1);
      }
      
      public function get userId() : int
      {
         return getInt("user_id");
      }
      
      public function get name() : String
      {
         return getString("name");
      }
      
      public function get stage() : int
      {
         return getInt("stage");
      }
      
      public function get level() : int
      {
         return getInt("level");
      }
      
      public function get locale() : String
      {
         return getString("locale");
      }
      
      public function get platform() : String
      {
         return getString("platform");
      }
      
      public function get platformUserId() : String
      {
         return getString("platform_user_id");
      }
      
      public function get email() : String
      {
         return getString("email");
      }
      
      public function get password() : String
      {
         return getString("password");
      }
      
      public function get avatarImage() : String
      {
         return getString("avatar_image");
      }
   }
}
