package com.playata.application.ui.elements.stream
{
   import com.playata.application.data.dataobject.DOPrivateConversation;
   import com.playata.application.data.stream.PrivateConversation;
   import com.playata.application.data.stream.PrivateConversations;
   import com.playata.application.data.user.User;
   import com.playata.application.ui.dialogs.DialogCreatePrivateConversation;
   import com.playata.application.ui.elements.generic.scrollbar.UiScrollBar;
   import com.playata.framework.application.Environment;
   import com.playata.framework.display.ui.Direction;
   import com.playata.framework.display.ui.IListItem;
   import com.playata.framework.display.ui.controls.List;
   import com.playata.framework.display.ui.controls.ListLine;
   import com.playata.framework.display.ui.controls.ScrollList;
   import com.playata.framework.localization.LocText;
   import visuals.ui.elements.stream.SymbolPrivateConversationStreamListGeneric;
   
   public class UiPrivateConversationStreamList extends ScrollList
   {
      
      private static var _pendingCreatePrivateConversationCharacter:String = null;
       
      
      private var _content:SymbolPrivateConversationStreamListGeneric = null;
      
      private var _loadMoreItem:PrivateConversation = null;
      
      private var _allLoaded:Boolean = false;
      
      private var _initialized:Boolean = false;
      
      public function UiPrivateConversationStreamList(param1:SymbolPrivateConversationStreamListGeneric)
      {
         _content = param1;
         _content.txtNoMessages.visible = false;
         _loadMoreItem = new PrivateConversation(new DOPrivateConversation({"id":-1}));
         super(_content.listContainer,UiPrivateConversationStream,Direction.VERTICAL,new UiScrollBar(_content.scrollBarKnob,_content.scrollBarLine,this),null,null,false,false,PrivateConversations.sortByLastAction);
         onListUpdated.add(refreshUI);
         onSelectionChanged.add(selectionChanged);
      }
      
      public static function set pendingCreatePrivateConversationCharacter(param1:String) : void
      {
         _pendingCreatePrivateConversationCharacter = param1;
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
         var _loc1_:PrivateConversations = User.current.character.streams.privateConversations;
         if(!_loc1_.hasUpdates)
         {
            checkPendingCreatePrivateConversation(false);
            if(_selectedLine && selectedItem && (selectedItem as PrivateConversation).hasNewMessages)
            {
               (_selectedLine as UiPrivateConversationStream).openPrivateConversation(null);
            }
            return;
         }
         _loc1_.hasUpdates = false;
         syncItemsFromCollection(_loc1_.privateConversations);
         if(!allLoaded)
         {
            addItem(_loadMoreItem);
         }
         checkPendingCreatePrivateConversation(true);
         if(_selectedLine && selectedItem && (selectedItem as PrivateConversation).hasNewMessages)
         {
            (_selectedLine as UiPrivateConversationStream).openPrivateConversation(null);
         }
      }
      
      protected function checkPendingCreatePrivateConversation(param1:Boolean) : void
      {
         var _loc4_:* = null;
         var _loc3_:* = null;
         try
         {
            _loc4_ = null;
            if(_pendingCreatePrivateConversationCharacter)
            {
               if(_currentListItems)
               {
                  var _loc7_:int = 0;
                  var _loc6_:* = _currentListItems;
                  for each(var _loc2_ in _currentListItems)
                  {
                     if(!_loc2_.isLoadingItem)
                     {
                        if(!_loc2_.isGroup)
                        {
                           if(_loc2_.singleConversationMember)
                           {
                              if(_loc2_.singleConversationMember.name == _pendingCreatePrivateConversationCharacter)
                              {
                                 _loc4_ = _loc2_;
                                 break;
                              }
                           }
                        }
                     }
                  }
               }
               if(!_loc4_)
               {
                  Environment.panelManager.showDialog(new DialogCreatePrivateConversation(_pendingCreatePrivateConversationCharacter));
               }
               _pendingCreatePrivateConversationCharacter = null;
            }
            if(_loc4_)
            {
               _loc3_ = getLineForItem(_loc4_);
               if(_loc3_)
               {
                  selectLine(_loc3_);
               }
            }
            else if(param1)
            {
               if(!selectedItem && _lines.length > 0)
               {
                  selectLine(_lines[0]);
               }
            }
            return;
         }
         catch(e:Error)
         {
            return;
         }
      }
      
      override protected function selectLine(param1:ListLine) : void
      {
         try
         {
            if(param1 && param1 is UiPrivateConversationStream)
            {
               if(((param1 as UiPrivateConversationStream).item as PrivateConversation).isLoadingItem)
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
         if(!(param1 is UiPrivateConversationStream))
         {
            return;
         }
         (param1 as UiPrivateConversationStream).openPrivateConversation(null);
      }
      
      private function refreshUI(param1:List) : void
      {
         _content.txtNoMessages.visible = currentItemCount == 0 && _initialized;
         if(currentItemCount == 0)
         {
            if(currentFilter == null)
            {
               _content.txtNoMessages.text = LocText.current.text("panel_streams/private_conversations/no_conversations");
            }
            else
            {
               _content.txtNoMessages.text = LocText.current.text("panel_streams/private_conversations/no_filtered_conversations");
            }
         }
      }
   }
}
