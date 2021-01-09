package com.playata.application.data.stream
{
   import com.playata.framework.core.TypedObject;
   
   public class SystemMessageFilter extends TypedObject
   {
       
      
      public function SystemMessageFilter(param1:Object)
      {
         super(param1);
      }
      
      public function get showSystemMails() : Boolean
      {
         return getBoolean("ssm");
      }
      
      public function get showItemMails() : Boolean
      {
         return getBoolean("sim");
      }
      
      public function get showGuildMails() : Boolean
      {
         return getBoolean("stm");
      }
      
      public function get showProposeMarriageMails() : Boolean
      {
         return getBoolean("smm",true);
      }
   }
}
