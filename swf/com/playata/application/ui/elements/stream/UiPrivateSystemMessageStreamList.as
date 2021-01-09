package com.playata.application.ui.elements.stream
{
   import com.playata.application.data.dataobject.DOPrivateSystemMessage;
   import com.playata.application.data.stream.PrivateSystemMessage;
   import com.playata.application.data.stream.PrivateSystemMessages;
   import com.playata.application.data.user.User;
   import com.playata.application.ui.ViewManager;
   import com.playata.application.ui.elements.generic.scrollbar.UiScrollBar;
   import com.playata.framework.display.ui.Direction;
   import com.playata.framework.display.ui.IListFilter;
   import com.playata.framework.display.ui.controls.List;
   import com.playata.framework.display.ui.controls.ListLine;
   import com.playata.framework.display.ui.controls.ScrollList;
   import com.playata.framework.localization.LocText;
   import visuals.ui.elements.stream.SymbolPrivateSystemMessageStreamListGeneric;
   
   public class UiPrivateSystemMessageStreamList extends ScrollList
   {
       
      
      private var _content:SymbolPrivateSystemMessageStreamListGeneric = null;
      
      private var _loadMoreItem:PrivateSystemMessage = null;
      
      private var _allLoaded:Boolean = false;
      
      private var _initialized:Boolean = false;
      
      public function UiPrivateSystemMessageStreamList(param1:SymbolPrivateSystemMessageStreamListGeneric)
      {
         _content = param1;
         _content.txtNoMessages.visible = false;
         _loadMoreItem = new PrivateSystemMessage(new DOPrivateSystemMessage({"id":-1}));
         super(_content.listContainer,UiPrivateSystemMessageStream,Direction.VERTICAL,new UiScrollBar(_content.scrollBarKnob,_content.scrollBarLine,this),null,null,false,false,sortById);
         onListUpdated.add(refreshUI);
         onSelectionChanged.add(selectionChanged);
      }
      
      public function refreshLocalization() : void
      {
         var _loc3_:int = 0;
         var _loc2_:* = _lines;
         for each(var _loc1_ in _lines)
         {
            _loc1_.refreshLocalization();
         }
      }
      
      public function get allLoaded() : Boolean
      {
         return _allLoaded;
      }
      
      public function set allLoaded(param1:Boolean) : void
      {
         _allLoaded = param1;
      }
      
      public function sync() : void
      {
         _initialized = true;
         var _loc1_:PrivateSystemMessages = User.current.character.streams.privateSystemMessages;
         syncItemsFromCollection(_loc1_.messages);
         if(!allLoaded)
         {
            addItem(_loadMoreItem);
         }
         if(!selectedItem && _lines.length > 0 && !ViewManager.instance.baseUserPanel.streamsPanel.isServerSystemMessagesOpen)
         {
            selectLine(_lines[0]);
         }
      }
      
      private function refreshUI(param1:List) : void
      {
         _content.txtNoMessages.visible = currentItemCount == 0 && _initialized;
         if(currentItemCount == 0)
         {
            if(currentFilter == null)
            {
               _content.txtNoMessages.text = LocText.current.text("panel_streams/server_messages/no_messages");
            }
            else
            {
               _content.txtNoMessages.text = LocText.current.text("dialog/mailbox/no_filtered_messages");
            }
         }
      }
      
      override public function set currentFilter(param1:IListFilter) : void
      {
         _filter = param1;
         _selectedLine = null;
         refreshList(false);
      }
      
      override protected function selectLine(param1:ListLine) : void
      {
         try
         {
            if(param1 && param1 is UiPrivateSystemMessageStream)
            {
               if(((param1 as UiPrivateSystemMessageStream).item as PrivateSystemMessage).isLoadingItem)
               {
                  return;
               }
            }
         }
         catch(e:Error)
         {
         }
         super.selectLine(param1);
      }
      
      private function selectionChanged(param1:ListLine) : void
      {
         if(!param1)
         {
            return;
         }
         if(!(param1 is UiPrivateSystemMessageStream))
         {
            return;
         }
         (param1 as UiPrivateSystemMessageStream).loadPrivateSystemMessage(null);
      }
      
      private function sortById(param1:PrivateSystemMessage, param2:PrivateSystemMessage) : int
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
