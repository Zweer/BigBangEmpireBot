package com.playata.application.data.dataobject
{
   import com.playata.framework.data.DataObject;
   
   public class DODatingLookup extends DataObject
   {
       
      
      public function DODatingLookup(param1:Object)
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
      
      public function get unlockedDatingPictures() : String
      {
         return getString("unlocked_dating_pictures");
      }
   }
}
