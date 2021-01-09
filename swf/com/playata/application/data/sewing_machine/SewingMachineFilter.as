package com.playata.application.data.sewing_machine
{
   import com.playata.framework.core.TypedObject;
   
   public class SewingMachineFilter extends TypedObject
   {
       
      
      public function SewingMachineFilter(param1:Object)
      {
         super(param1);
      }
      
      public function get showEventItem() : Boolean
      {
         return getBoolean("sei");
      }
      
      public function get showStoryDungeonItem() : Boolean
      {
         if(hasData("ssdi"))
         {
            return getBoolean("ssdi");
         }
         return true;
      }
      
      public function get showOtherItem() : Boolean
      {
         if(hasData("soi"))
         {
            return getBoolean("soi");
         }
         return true;
      }
      
      public function get showCommon() : Boolean
      {
         return getBoolean("srci");
      }
      
      public function get showRare() : Boolean
      {
         return getBoolean("srri");
      }
      
      public function get showEpic() : Boolean
      {
         return getBoolean("srei");
      }
   }
}
