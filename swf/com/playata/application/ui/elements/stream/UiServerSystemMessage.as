package com.playata.application.ui.elements.stream
{
   import com.playata.application.data.stream.ServerSystemMessage;
   import com.playata.application.ui.ViewManager;
   import com.playata.application.ui.elements.generic.button.UiTextButton;
   import com.playata.framework.application.Environment;
   import com.playata.framework.core.Runtime;
   import com.playata.framework.display.ui.IListItem;
   import com.playata.framework.display.ui.controls.ListLine;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.elements.stream.SymbolServerSystemMessageGeneric;
   
   public class UiServerSystemMessage extends ListLine
   {
       
      
      private var _serverSystemMessage:ServerSystemMessage = null;
      
      private var _rawContent:SymbolServerSystemMessageGeneric = null;
      
      private var _btnLink:UiTextButton = null;
      
      public function UiServerSystemMessage(param1:ServerSystemMessage, param2:int)
      {
         _serverSystemMessage = param1;
         _rawContent = new SymbolServerSystemMessageGeneric();
         _rawContent.txtMessage.selectable = true;
         _btnLink = new UiTextButton(_rawContent.btnGeneric,"","",onClickLink);
         super(_rawContent,param2);
      }
      
      override public function refresh(param1:IListItem, param2:int) : void
      {
         super.refresh(param1,param2);
         if(!param1)
         {
            return;
         }
         _serverSystemMessage = param1 as ServerSystemMessage;
         _rawContent.txtSubject.text = _serverSystemMessage.subject;
         _rawContent.txtDate.text = _serverSystemMessage.dateTime;
         if(_serverSystemMessage.isHtml)
         {
            _rawContent.txtMessage.htmlText = _serverSystemMessage.formattedMessage;
         }
         else
         {
            _rawContent.txtMessage.text = _serverSystemMessage.formattedMessage;
         }
         _rawContent.txtMessage.height = _rawContent.txtMessage.textHeight + 10;
         _rawContent.btnGeneric.visible = _serverSystemMessage.isLinkMessage;
         if(_rawContent.btnGeneric.visible)
         {
            _rawContent.btnGeneric.y = _rawContent.txtMessage.y + _rawContent.txtMessage.height + 20;
            _rawContent.background.height = _rawContent.btnGeneric.y - _rawContent.txtSubject.y + _rawContent.btnGeneric.height + 5;
         }
         else
         {
            _rawContent.background.height = _rawContent.txtMessage.y - _rawContent.txtSubject.y + _rawContent.txtMessage.height + 15;
         }
         _rawContent.txtDate.y = _rawContent.background.y + _rawContent.background.height + 5;
         _rawContent.txtDate.height = 40;
         if(_rawContent.btnGeneric.visible)
         {
            _btnLink.caption = _serverSystemMessage.buttonLabel != null && _serverSystemMessage.buttonLabel != ""?_serverSystemMessage.buttonLabel:LocText.current.text("dialog/mail_read/partner_ad/button_participate");
         }
      }
      
      private function onClickLink(param1:InteractionEvent) : void
      {
         _serverSystemMessage.openLink();
         if(!_serverSystemMessage.isExternalLink)
         {
            Runtime.delayFunction(ViewManager.instance.baseUserPanel.streamsPanel.close,0.6);
         }
         else
         {
            Environment.application.sendActionRequest("trackAdvertisment",{
               "type":1,
               "value1":_serverSystemMessage.linkUrl,
               "value2":"",
               "value3":""
            },null,false);
         }
         Environment.application.sendActionRequest("trackServerSystemMessageLinkClick",{"message_id":_serverSystemMessage.id},null,false);
      }
   }
}
