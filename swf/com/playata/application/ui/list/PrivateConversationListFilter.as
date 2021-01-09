package com.playata.application.ui.list
{
   import com.playata.application.data.stream.PrivateConversation;
   import com.playata.framework.display.ui.IListFilter;
   import com.playata.framework.display.ui.IListItem;
   
   public class PrivateConversationListFilter implements IListFilter
   {
       
      
      private var _filterText:String = null;
      
      public function PrivateConversationListFilter(param1:String)
      {
         super();
         _filterText = param1;
      }
      
      public function get filterText() : String
      {
         return _filterText;
      }
      
      public function set filterText(param1:String) : void
      {
         _filterText = param1;
      }
      
      public function matches(param1:IListItem) : Boolean
      {
         if(!_filterText)
         {
            return true;
         }
         var _loc5_:PrivateConversation = param1 as PrivateConversation;
         if(_loc5_.isLoadingItem)
         {
            return false;
         }
         var _loc2_:String = _filterText.toLowerCase();
         var _loc4_:* = _loc5_.title.toLowerCase().indexOf(_loc2_) != -1;
         if(_loc4_)
         {
            return true;
         }
         var _loc3_:* = _loc5_.membersString.toLowerCase().indexOf(_loc2_) != -1;
         if(_loc3_)
         {
            return true;
         }
         return false;
      }
   }
}
