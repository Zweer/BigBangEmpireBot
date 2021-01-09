package com.playata.application.ui.list
{
   import com.playata.application.data.stream.PrivateSystemMessage;
   import com.playata.framework.core.TypedObject;
   import com.playata.framework.display.ui.IListFilter;
   import com.playata.framework.display.ui.IListItem;
   
   public class PrivateSystemMessageListFilter implements IListFilter
   {
       
      
      private var _filterText:String = null;
      
      private var _filterOptions:TypedObject = null;
      
      public function PrivateSystemMessageListFilter(param1:String, param2:TypedObject)
      {
         super();
         _filterText = param1;
         _filterOptions = param2;
      }
      
      public function matches(param1:IListItem) : Boolean
      {
         var _loc2_:* = null;
         var _loc3_:* = false;
         var _loc5_:* = false;
         var _loc4_:PrivateSystemMessage = param1 as PrivateSystemMessage;
         if(_loc4_.isLoadingItem)
         {
            return true;
         }
         if(!§§pop())
         {
            if(_filterOptions.getBoolean("stm") === false && _loc4_.isGuildMessage)
            {
               return false;
            }
            if(_filterOptions.getBoolean("sim") === false && _loc4_.isItemMessage)
            {
               return false;
            }
            if(_filterOptions.getBoolean("ssm") === false && _loc4_.isSystemMessage)
            {
               return false;
            }
            if(_filterOptions.getBoolean("smm") === false && _loc4_.isPrivateConversationMarriageProposal)
            {
               return false;
            }
         }
         if(_filterText)
         {
            _loc2_ = _filterText.toLowerCase();
            _loc3_ = _loc4_.subject.toLowerCase().indexOf(_loc2_) != -1;
            if(_loc3_)
            {
               return true;
            }
            _loc5_ = _loc4_.message.toLowerCase().indexOf(_loc2_) != -1;
            if(_loc5_)
            {
               return true;
            }
            return false;
         }
         return true;
      }
   }
}
