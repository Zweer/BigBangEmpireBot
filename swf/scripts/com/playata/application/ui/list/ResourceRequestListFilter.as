package com.playata.application.ui.list
{
   import com.playata.application.data.resource.ResourceRequest;
   import com.playata.framework.display.ui.IListFilter;
   import com.playata.framework.display.ui.IListItem;
   
   public class ResourceRequestListFilter implements IListFilter
   {
       
      
      public function ResourceRequestListFilter()
      {
         super();
      }
      
      public function matches(param1:IListItem) : Boolean
      {
         var _loc2_:ResourceRequest = param1 as ResourceRequest;
         if(_loc2_.hasData("status") && _loc2_.status > 1)
         {
            return false;
         }
         return true;
      }
   }
}
