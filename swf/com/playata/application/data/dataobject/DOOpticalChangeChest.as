package com.playata.application.data.dataobject
{
   import com.playata.framework.data.DataObject;
   
   public class DOOpticalChangeChest extends DataObject
   {
       
      
      public function DOOpticalChangeChest(param1:Object)
      {
         super(param1);
      }
      
      public function get newOpticalChangeId() : int
      {
         return getInt("new_optical_change_id");
      }
      
      public function get itemId() : int
      {
         return getInt("item_id");
      }
      
      public function get id() : int
      {
         return getInt("id");
      }
   }
}
