package com.playata.application.data.dataobject
{
   import com.playata.framework.data.DataObject;
   
   public class DOHerobookObjective extends DataObject
   {
       
      
      public function DOHerobookObjective(param1:Object)
      {
         super(param1);
      }
      
      public function get id() : int
      {
         return getInt("id");
      }
      
      public function get tsEnd() : int
      {
         return getInt("ts_end");
      }
      
      public function get characterId() : int
      {
         return getInt("character_id");
      }
      
      public function get identifier() : String
      {
         return getString("identifier");
      }
      
      public function get status() : int
      {
         return getInt("status");
      }
      
      public function get durationType() : int
      {
         return getInt("duration_type");
      }
      
      public function get type() : int
      {
         return getInt("type");
      }
      
      public function get currentValue() : int
      {
         return getInt("current_value");
      }
      
      public function get maxValue() : int
      {
         return getInt("max_value");
      }
      
      public function get rewards() : String
      {
         return getString("rewards");
      }
   }
}
