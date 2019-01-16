package com.playata.application.data.dataobject
{
   import com.playata.framework.data.DataObject;
   
   public class DOBonusInfoDay extends DataObject
   {
       
      
      public function DOBonusInfoDay(param1:Object)
      {
         super(param1);
      }
      
      public function get eventId() : String
      {
         return getString("event_id");
      }
      
      public function get type() : int
      {
         return getInt("type");
      }
      
      public function get date() : int
      {
         return getInt("date");
      }
      
      public function get value() : Number
      {
         return getNumber("value");
      }
   }
}
