package com.playata.application.data.dataobject
{
   import com.playata.framework.data.DataObject;
   
   public class DOUser extends DataObject
   {
       
      
      public function DOUser(param1:Object)
      {
         super(param1);
      }
      
      public function get id() : int
      {
         return getInt("id");
      }
      
      public function get registrationSource() : String
      {
         return getString("registration_source");
      }
      
      public function get tsCreation() : int
      {
         return getInt("ts_creation");
      }
      
      public function get network() : String
      {
         return getString("network");
      }
      
      public function get appVersion() : String
      {
         return getString("app_version");
      }
      
      public function get appVersionRegistration() : String
      {
         return getString("app_version_registration");
      }
      
      public function get deviceType() : int
      {
         return getInt("device_type");
      }
      
      public function get confirmed() : Boolean
      {
         return getBoolean("confirmed");
      }
      
      public function get email() : String
      {
         return getString("email");
      }
      
      public function get sessionId() : String
      {
         return getString("session_id");
      }
      
      public function get locale() : String
      {
         return getString("locale");
      }
      
      public function get premiumCurrency() : int
      {
         return getInt("premium_currency");
      }
      
      public function get settings() : String
      {
         return getString("settings");
      }
      
      public function get trusted() : Boolean
      {
         return getBoolean("trusted");
      }
   }
}
