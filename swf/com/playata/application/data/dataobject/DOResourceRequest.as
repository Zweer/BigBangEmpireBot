package com.playata.application.data.dataobject
{
   import com.playata.framework.data.DataObject;
   
   public class DOResourceRequest extends DataObject
   {
       
      
      public function DOResourceRequest(param1:Object)
      {
         super(param1);
      }
      
      public function get id() : int
      {
         return getInt("id");
      }
      
      public function get timestamp() : int
      {
         return getInt("timestamp");
      }
      
      public function get featureType() : int
      {
         return getInt("feature_type");
      }
      
      public function get sourceType() : int
      {
         return getInt("source_type");
      }
      
      public function get status() : int
      {
         return getInt("status");
      }
      
      public function get fromUserId() : int
      {
         return getInt("from_user_id");
      }
      
      public function get toUserId() : int
      {
         return getInt("to_user_id");
      }
      
      public function get fromCharacterName() : String
      {
         return getString("from_character_name");
      }
   }
}
