package com.playata.application.ui.elements.stream
{
   import com.playata.application.data.resource.ResourceRequest;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.application.ui.elements.generic.list.UiList;
   import com.playata.application.ui.list.ResourceRequestListFilter;
   import com.playata.framework.localization.LocText;
   import visuals.ui.elements.stream.SymbolResourceRequestListGeneric;
   
   public class UiResourceRequestList extends UiList
   {
       
      
      private var _content:SymbolResourceRequestListGeneric = null;
      
      private var _onAcceptDecline:Function = null;
      
      public function UiResourceRequestList(param1:SymbolResourceRequestListGeneric, param2:Function)
      {
         _content = param1;
         _onAcceptDecline = param2;
         _content.txtNoRequests.text = LocText.current.text("dialog/mailbox_requests/no_requests");
         super(_content,UiResourceRequestLine,5,new UiButton(_content.btnUp,null,null),new UiButton(_content.btnDown,null,null),true,false,sortById,"line");
         currentFilter = new ResourceRequestListFilter();
      }
      
      public function refreshLocalization() : void
      {
         _content.txtNoRequests.text = LocText.current.text("dialog/mailbox_requests/no_requests");
         var _loc3_:int = 0;
         var _loc2_:* = _lines;
         for each(var _loc1_ in _lines)
         {
            _loc1_.refreshLocalization();
         }
      }
      
      public function update(param1:Vector.<ResourceRequest>) : void
      {
         syncItemsFromVector(param1);
         var _loc4_:int = 0;
         var _loc3_:* = _lines;
         for each(var _loc2_ in _lines)
         {
            _loc2_.onAcceptDecline = _onAcceptDecline;
         }
      }
      
      private function sortById(param1:ResourceRequest, param2:ResourceRequest) : int
      {
         if(param1.id < param2.id)
         {
            return 1;
         }
         if(param1.id > param2.id)
         {
            return -1;
         }
         return 0;
      }
   }
}
