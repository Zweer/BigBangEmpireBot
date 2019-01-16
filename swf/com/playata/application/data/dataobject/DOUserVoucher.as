package com.playata.application.data.dataobject
{
   import com.playata.framework.data.DataObject;
   
   public class DOUserVoucher extends DataObject
   {
       
      
      public function DOUserVoucher(param1:Object)
      {
         super(param1);
      }
      
      public function get id() : int
      {
         return getInt("id");
      }
      
      public function get userId() : int
      {
         return getInt("user_id");
      }
      
      public function get tsCreation() : int
      {
         return getInt("ts_creation");
      }
      
      public function get tsClaim() : int
      {
         return getInt("ts_claim");
      }
      
      public function get code() : String
      {
         return getString("code");
      }
      
      public function get status() : int
      {
         return getInt("status");
      }
      
      public function get rewards() : String
      {
         return getString("rewards");
      }
      
      public function get tsEnd() : int
      {
         return getInt("ts_end");
      }
      
      public function get category() : String
      {
         return getString("category");
      }
   }
}
