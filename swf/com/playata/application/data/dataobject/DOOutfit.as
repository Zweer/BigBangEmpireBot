package com.playata.application.data.dataobject
{
   import com.playata.framework.data.DataObject;
   
   public class DOOutfit extends DataObject
   {
       
      
      public function DOOutfit(param1:Object)
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
      
      public function get name() : String
      {
         return getString("name");
      }
      
      public function get settings() : String
      {
         return getString("settings");
      }
      
      public function get items() : String
      {
         return getString("items");
      }
      
      public function get index() : int
      {
         return getInt("index");
      }
   }
}
