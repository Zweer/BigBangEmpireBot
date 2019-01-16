package com.playata.application.data.dataobject
{
   import com.playata.framework.data.DataObject;
   
   public class DOMessageIgnore extends DataObject
   {
       
      
      public function DOMessageIgnore(param1:Object)
      {
         super(param1);
      }
      
      public function get id() : int
      {
         return getInt("id");
      }
      
      public function get tsCreation() : int
      {
         return getInt("ts_creation");
      }
      
      public function get characterId() : int
      {
         return getInt("character_id");
      }
      
      public function get characterIgnoreId() : int
      {
         return getInt("character_ignore_id");
      }
   }
}
