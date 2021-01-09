package com.playata.application.ui.elements.stream
{
   import com.playata.application.data.user.User;
   import com.playata.application.ui.ViewManager;
   import com.playata.application.ui.elements.generic.button.UiTextButton;
   import com.playata.application.ui.list.PrivateConversationListFilter;
   import com.playata.framework.application.Environment;
   import com.playata.framework.application.request.ActionRequestResponse;
   import com.playata.framework.display.ui.IListFilter;
   import com.playata.framework.display.ui.controls.ITextInput;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.elements.stream.SymbolPrivateConversationStreamContainerGeneric;
   
   public class UiPrivateConversationStreamContainer
   {
       
      
      private var _content:SymbolPrivateConversationStreamContainerGeneric = null;
      
      private var _list:UiPrivateConversationStreamList = null;
      
      private var _btnNew:UiTextButton = null;
      
      public function UiPrivateConversationStreamContainer(param1:SymbolPrivateConversationStreamContainerGeneric)
      {
         super();
         _content = param1;
         _btnNew = new UiTextButton(_content.btnNew,LocText.current.text("panel_streams/private_conversation/btn_new"),"",onClickNew);
         _content.inputFilter.text = LocText.current.text("dialog/mailbox/filter_text");
         _content.inputFilter.onClick.add(handleFilterClick);
         _content.inputFilter.onChange.add(handleFilterChange);
         _list = new UiPrivateConversationStreamList(_content.list);
      }
      
      public function refreshLocalization() : void
      {
         _btnNew.caption = LocText.current.text("panel_streams/private_conversation/btn_new");
         _list.refreshLocalization();
         _content.inputFilter.text = LocText.current.text("dialog/mailbox/filter_text");
         _list.currentFilter = currentFilter;
      }
      
      public function get content() : SymbolPrivateConversationStreamContainerGeneric
      {
         return _content;
      }
      
      public function get list() : UiPrivateConversationStreamList
      {
         return _list;
      }
      
      public function init() : void
      {
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
         if(User.current.character.streams.privateConversations.hasNewPrivateConversations)
         {
            Environment.application.sendActionRequest("getStreams",{
               "stream_type":"p",
               "start_stream_id":0
            },handleRequests);
         }
         else
         {
            _list.sync();
         }
      }
      
      public function loadMorePrivateConversations() : void
      {
         Environment.application.sendActionRequest("getStreams",{
            "stream_type":"p",
            "start_stream_id":User.current.character.streams.privateConversations.oldestStreamId
         },handleRequests);
      }
      
      private function onClickNew(param1:InteractionEvent) : void
      {
         ViewManager.instance.baseUserPanel.streamsPanel.createPrivateConversation();
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
      
      private function get currentFilter() : IListFilter
      {
         if(!currentTextFilter)
         {
            return null;
         }
         return new PrivateConversationListFilter(currentTextFilter);
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
         if("getStreams" !== _loc2_)
         {
            throw new Error("Unsupported request action \'" + param1.action + "\'!");
         }
         if(param1.error == "")
         {
            User.current.character.streams.privateConversations.hasNewPrivateConversations = false;
            _list.allLoaded = param1.data && param1.appResponse.all_loaded === true;
            Environment.application.updateData(param1.data);
            _list.sync();
         }
         else
         {
            Environment.reportError(param1.error,param1.request);
         }
      }
   }
}
