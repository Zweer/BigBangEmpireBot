package com.playata.application.ui.elements.stream
{
   import com.playata.application.data.stream.PrivateSystemMessage;
   import com.playata.application.ui.ViewManager;
   import com.playata.application.ui.effects.ScaleInOutEffect;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.framework.display.IDisplayObject;
   import com.playata.framework.display.ui.IListItem;
   import com.playata.framework.display.ui.controls.ListLine;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.elements.stream.SymbolPrivateSystemMessageStreamGeneric;
   
   public class UiPrivateSystemMessageStream extends ListLine
   {
       
      
      private var _privateSystemMessage:PrivateSystemMessage = null;
      
      private var _rawContent:SymbolPrivateSystemMessageStreamGeneric = null;
      
      private var _btnLoadMore:UiButton = null;
      
      private var _loading:Boolean = false;
      
      private var _loadingEffect:ScaleInOutEffect = null;
      
      private var _systemMailIcon:UiSystemStreamIcon = null;
      
      public function UiPrivateSystemMessageStream(param1:PrivateSystemMessage, param2:int)
      {
         _privateSystemMessage = param1;
         _rawContent = new SymbolPrivateSystemMessageStreamGeneric();
         super(_rawContent,param2);
         _btnLoadMore = new UiButton(_rawContent.btnLoadMore,LocText.current.text("panel_streams/private_system_message/load_more_tooltip"),handleClickLoadMore);
         _rawContent.txtSubject.autoFontSize = true;
         _loadingEffect = new ScaleInOutEffect(_rawContent.iconLoading,0.5,1.2);
         _systemMailIcon = new UiSystemStreamIcon(_rawContent.iconSenderSystemMail);
      }
      
      public function refreshLocalization() : void
      {
         _btnLoadMore.tooltip = LocText.current.text("panel_streams/private_system_message/load_more_tooltip");
      }
      
      override public function get backgroundHighlight() : IDisplayObject
      {
         return _rawContent.backgroundHighlight;
      }
      
      override public function get backgroundOdd() : IDisplayObject
      {
         return _rawContent.backgroundOdd;
      }
      
      override public function get backgroundEven() : IDisplayObject
      {
         return _rawContent.backgroundEven;
      }
      
      override public function refresh(param1:IListItem, param2:int) : void
      {
         super.refresh(param1,param2);
         if(!param1)
         {
            return;
         }
         _privateSystemMessage = param1 as PrivateSystemMessage;
         _loadingEffect.stop();
         if(_privateSystemMessage.isLoadingItem)
         {
            _rawContent.btnLoadMore.visible = !_loading;
            _rawContent.iconLoading.visible = _loading;
            if(_loading)
            {
               _loadingEffect.play();
            }
            _rawContent.txtSubject.visible = false;
            _rawContent.txtCreation.visible = false;
            _rawContent.backgroundIcon.visible = false;
            _rawContent.iconUnread.visible = false;
            _rawContent.iconItem.visible = false;
            _rawContent.iconGuild.visible = false;
            _systemMailIcon.refresh(false);
            _rawContent.iconProposeMarriage.visible = false;
         }
         else
         {
            _rawContent.btnLoadMore.visible = false;
            _rawContent.iconLoading.visible = false;
            _loadingEffect.stop();
            _rawContent.txtSubject.visible = true;
            _rawContent.txtCreation.visible = true;
            _rawContent.txtSubject.text = _privateSystemMessage.subject;
            _rawContent.txtCreation.text = _privateSystemMessage.dateTime;
            _rawContent.iconUnread.visible = !_privateSystemMessage.isRead;
            _rawContent.backgroundIcon.visible = true;
            _rawContent.iconItem.visible = _privateSystemMessage.isItemMessage;
            _rawContent.iconGuild.visible = _privateSystemMessage.isGuildMessage;
            _systemMailIcon.refresh(_privateSystemMessage.isSystemMessage);
            _rawContent.iconProposeMarriage.visible = _privateSystemMessage.isPrivateConversationMarriageProposal;
         }
      }
      
      public function loadPrivateSystemMessage(param1:InteractionEvent) : void
      {
         if(_privateSystemMessage.isLoadingItem)
         {
            return;
         }
         if(!_privateSystemMessage.isRead)
         {
            _rawContent.iconUnread.visible = false;
         }
         ViewManager.instance.baseUserPanel.streamsPanel.openPrivateSystemMessage(_privateSystemMessage);
      }
      
      private function handleClickLoadMore(param1:InteractionEvent) : void
      {
         if(!_privateSystemMessage.isLoadingItem)
         {
            return;
         }
         if(_loading)
         {
            return;
         }
         _btnLoadMore.visible = false;
         _rawContent.iconLoading.visible = true;
         _loadingEffect.play();
         ViewManager.instance.baseUserPanel.streamsPanel.loadMorePrivateSystemMessages();
      }
   }
}
