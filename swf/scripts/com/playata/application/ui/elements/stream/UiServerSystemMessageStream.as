package com.playata.application.ui.elements.stream
{
   import com.playata.application.data.user.User;
   import com.playata.application.platform.ServerInfo;
   import com.playata.application.ui.ViewManager;
   import com.playata.application.ui.elements.generic.UiCounterBubble;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.framework.application.Environment;
   import com.playata.framework.application.request.ActionRequestResponse;
   import com.playata.framework.display.InteractiveDisplayObject;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.elements.stream.SymbolServerMessageStreamGeneric;
   
   public class UiServerSystemMessageStream extends InteractiveDisplayObject
   {
       
      
      private var _content:SymbolServerMessageStreamGeneric = null;
      
      private var _btnOpen:UiButton = null;
      
      public function UiServerSystemMessageStream(param1:SymbolServerMessageStreamGeneric)
      {
         _content = param1;
         super(_content);
         _btnOpen = new UiButton(_content.btnOpen,LocText.current.text("panel_streams/server_system_message/show_tooltip"),openServerSystemMessages);
         _btnOpen.visible = false;
         _content.unreadCounter.bringToTop();
         onClick.add(openServerSystemMessages);
      }
      
      public function refreshLocalization() : void
      {
         _btnOpen.tooltip = LocText.current.text("panel_streams/server_system_message/show_tooltip");
      }
      
      public function refresh() : void
      {
         _content.teaser.setUriSprite(ServerInfo.assetURL("messages/" + User.current.character.streams.serverSystemMessageTeaserIdentifier,"png"),249,80);
         var _loc1_:int = User.current.character.streams.serverSystemMessages.unreadCount;
         _content.unreadCounter.visible = _loc1_ > 0;
         if(_content.unreadCounter.visible)
         {
            UiCounterBubble.setIntValue(_content.unreadCounter,_loc1_);
         }
      }
      
      private function openServerSystemMessages(param1:InteractionEvent) : void
      {
         if(User.current.character.streams.serverSystemMessages.hasNewMessages)
         {
            Environment.application.sendActionRequest("getStreamMessages",{
               "stream_type":"m",
               "stream_id":User.current.character.id,
               "start_message_id":0
            },handleRequests);
         }
         else
         {
            ViewManager.instance.baseUserPanel.streamsPanel.openServerSystemMessages();
         }
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
            User.current.character.streams.serverSystemMessages.hasNewMessages = false;
            Environment.application.updateData(param1.data);
            ViewManager.instance.baseUserPanel.streamsPanel.openServerSystemMessages();
         }
         else
         {
            Environment.reportError(param1.error,param1.request);
         }
      }
   }
}
