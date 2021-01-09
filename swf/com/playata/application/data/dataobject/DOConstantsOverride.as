package com.playata.application.data.dataobject
{
   import com.playata.framework.core.TypedObject;
   import com.playata.framework.data.DataObject;
   
   public class DOConstantsOverride extends DataObject
   {
       
      
      public function DOConstantsOverride(param1:Object)
      {
         super(param1);
      }
      
      public function get availableTimeStart() : String
      {
         return getString("available_time_start");
      }
      
      public function get availableTimeEnd() : String
      {
         return getString("available_time_end");
      }
      
      public function get constants() : TypedObject
      {
         return getTypedObject("constants");
      }
   }
}
