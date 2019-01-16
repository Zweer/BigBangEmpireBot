package com.playata.application.data.dataobject
{
   import com.playata.framework.data.DataObject;
   
   public class DOTitle extends DataObject
   {
       
      
      public function DOTitle(param1:Object)
      {
         super(param1);
      }
      
      public function get identifier() : String
      {
         return getString("identifier");
      }
      
      public function get date() : String
      {
         return getString("date");
      }
   }
}
