package com.playata.application.ui.elements.stream
{
   import com.playata.application.data.user.User;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.application.ui.list.PrivateSystemMessageListFilter;
   import com.playata.framework.application.Environment;
   import com.playata.framework.application.request.ActionRequestResponse;
   import com.playata.framework.display.ui.controls.ITextInput;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.elements.stream.SymbolSystemMessageStreamContainerGeneric;
   
   public class UiSystemMessageStreamContainer
   {
       
      
      private var _content:SymbolSystemMessageStreamContainerGeneric = null;
      
      private var _serverMessageStream:UiServerSystemMessageStream = null;
      
      private var _btnFilter:UiButton = null;
      
      private var _mailFilter:UiPrivateSystemMessageFilter = null;
      
      private var _list:UiPrivateSystemMessageStreamList = null;
      
      private var _isLoadingMore:Boolean = false;
      
      public function UiSystemMessageStreamContainer(param1:SymbolSystemMessageStreamContainerGeneric)
      {
         super();
         _content = param1;
         _serverMessageStream = new UiServerSystemMessageStream(_content.serverMessageStream);
         _btnFilter = new UiButton(_content.btnFilter,"",onClickFilter);
         _content.inputFilter.text = LocText.current.text("dialog/mailbox/filter_text");
         _content.inputFilter.onClick.add(handleFilterClick);
         _content.inputFilter.onChange.add(handleFilterChange);
         _list = new UiPrivateSystemMessageStreamList(_content.list);
      }
      
      public function refreshLocalization() : void
      {
         _list.refreshLocalization();
         _serverMessageStream.refreshLocalization();
         if(_mailFilter)
         {
            _mailFilter.refreshLocalization();
         }
         _content.inputFilter.text = LocText.current.text("dialog/mailbox/filter_text");
         _list.currentFilter = currentFilter;
      }
      
      public function get content() : SymbolSystemMessageStreamContainerGeneric
      {
         return _content;
      }
      
      public function get list() : UiPrivateSystemMessageStreamList
      {
         return _list;
      }
      
      public function init() : void
      {
         _mailFilter = new UiPrivateSystemMessageFilter(_content.mailFilter,onFilterChanged);
         _mailFilter.content.x = _btnFilter.content.x + 16;
         _list.currentFilter = currentFilter;
         _content.btnFilter.iconExclamationMark.visible = UiPrivateSystemMessageFilter.isFilterActive;
      }
      
      public function reset() : void
      {
         _content.visible = false;
         _list.clear();
         _content.inputFilter.text = LocText.current.text("dialog/mailbox/filter_text");
      }
      
      public function refresh() : void
      {
         if(!_content.visible)
         {
            return;
         }
         _serverMessageStream.refresh();
         if(User.current.character.streams.privateSystemMessages.hasNewMessages)
         {
            Environment.application.sendActionRequest("getStreamMessages",{
               "stream_type":"s",
               "stream_id":User.current.character.id,
               "start_message_id":0
            },handleRequests);
         }
         else
         {
            _list.sync();
         }
      }
      
      public function loadMorePrivateSystemMessages() : void
      {
         if(_isLoadingMore)
         {
            return;
         }
         _isLoadingMore = true;
         Environment.application.sendActionRequest("getStreamMessages",{
            "stream_type":"s",
            "stream_id":User.current.character.id,
            "start_message_id":User.current.character.streams.privateSystemMessages.minMessageId - 1
         },handleRequests);
      }
      
      private function onClickFilter(param1:InteractionEvent) : void
      {
         _mailFilter.toggle();
      }
      
      private function onFilterChanged() : void
      {
         _list.currentFilter = currentFilter;
         _content.btnFilter.iconExclamationMark.visible = UiPrivateSystemMessageFilter.isFilterActive;
      }
      
      private function handleFilterClick(param1:InteractionEvent) : void
      {
         if(_content.inputFilter.text == LocText.current.text("dialog/mailbox/filter_text"))
         {
            _content.inputFilter.text = "";
         }
      }
      
      private function handleFilterChange(param1:ITextInput) : void
      {
         _list.currentFilter = currentFilter;
      }
      
      private function get currentFilter() : PrivateSystemMessageListFilter
      {
         if(!currentTextFilter && !UiPrivateSystemMessageFilter.isFilterActive)
         {
            return null;
         }
         return new PrivateSystemMessageListFilter(currentTextFilter,UiPrivateSystemMessageFilter.filterSettings);
      }
      
      private function get currentTextFilter() : String
      {
         if(_content.inputFilter.text == LocText.current.text("dialog/mailbox/filter_text"))
         {
            return "";
         }
         return _content.inputFilter.text;
      }
      
      private function handleRequests(param1:ActionRequestResponse) : void
      {
         var _loc2_:* = param1.action;
         if("getStreamMessages" !== _loc2_)
         {
            throw new Error("Unsupported request action \'" + param1.action + "\'!");
         }
         if(param1.error == "")
         {
            User.current.character.streams.privateSystemMessages.hasNewMessages = false;
            Environment.application.updateData(param1.data);
            _list.allLoaded = param1.data && param1.appResponse.all_loaded === true;
            _list.sync();
         }
         else
         {
            Environment.reportError(param1.error,param1.request);
         }
         _isLoadingMore = false;
      }
   }
}
