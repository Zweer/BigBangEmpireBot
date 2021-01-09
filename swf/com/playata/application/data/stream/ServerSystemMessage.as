package com.playata.application.data.stream
{
   import com.playata.framework.display.ui.IListItem;
   
   public class ServerSystemMessage extends SystemMessage implements IListItem
   {
       
      
      public function ServerSystemMessage(param1:Object = null)
      {
         super(param1);
      }
      
      public function get itemId() : String
      {
         return id.toString();
      }
   }
}
