package com.playata.application.data.dataobject
{
   import com.playata.framework.data.DataObject;
   
   public class DOIgnoredCharacter extends DataObject
   {
       
      
      public function DOIgnoredCharacter(param1:Object)
      {
         super(param1);
      }
      
      public function get id() : int
      {
         return getInt("id");
      }
      
      public function get name() : String
      {
         return getString("name");
      }
      
      public function get gender() : String
      {
         return getString("gender");
      }
      
      public function get onlineStatus() : int
      {
         return getInt("online_status");
      }
      
      public function get tsIgnoreDate() : int
      {
         return getInt("ts_ignore_date");
      }
   }
}
