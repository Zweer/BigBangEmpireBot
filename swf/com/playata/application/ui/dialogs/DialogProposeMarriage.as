package com.playata.application.ui.dialogs
{
   import com.playata.application.data.item.Item;
   import com.playata.application.data.mailbox.Mailbox;
   import com.playata.application.data.user.User;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.application.ui.elements.generic.button.UiTextButton;
   import com.playata.application.ui.elements.generic.dialog.UiDialog;
   import com.playata.application.ui.elements.generic.dialog.UiInfoDialog;
   import com.playata.application.ui.elements.generic.dialog.UiTwoChoiceDialog;
   import com.playata.application.ui.elements.generic.scrollbar.UiScrollBar;
   import com.playata.framework.application.Environment;
   import com.playata.framework.application.request.ActionRequestResponse;
   import com.playata.framework.core.util.StringUtil;
   import com.playata.framework.display.ui.dialogs.Dialog;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.dialogs.SymbolDialogProposeMarriageGeneric;
   
   public class DialogProposeMarriage extends UiDialog
   {
       
      
      private var _btnClose:UiButton = null;
      
      private var _btnSend:UiTextButton = null;
      
      private var _scrollBar:UiScrollBar = null;
      
      private var _item:Item = null;
      
      public function DialogProposeMarriage(param1:Item)
      {
         var _loc2_:SymbolDialogProposeMarriageGeneric = new SymbolDialogProposeMarriageGeneric();
         super(_loc2_);
         _queued = false;
         _item = param1;
         _loc2_.txtDialogTitle.text = LocText.current.text("dialog/propose_marriage/title");
         _loc2_.txtReceiverCaption.text = LocText.current.text("dialog/propose_marriage/receiver_caption");
         _loc2_.txtMessageCaption.text = LocText.current.text("dialog/propose_marriage/message_caption");
         _loc2_.txtInfo.text = LocText.current.text("dialog/propose_marriage/info");
         _loc2_.txtInfo.autoFontSize = true;
         _loc2_.inputMessage.text = "";
         _loc2_.inputReceiver.text = "";
         _btnClose = new UiButton(_loc2_.btnClose,"",onClickClose);
         _btnSend = new UiTextButton(_loc2_.btnSend,LocText.current.text("dialog/propose_marriage/button_send"),"",onClickSend);
         _tabObjects.push(_loc2_.inputReceiver);
         _tabObjects.push(_loc2_.inputMessage);
         _scrollBar = new UiScrollBar(_loc2_.scrollKnob,_loc2_.scrollLine,_loc2_.inputMessage);
         _loc2_.inputMessage.verticalScrollBar = _scrollBar;
         setFocus();
      }
      
      override public function dispose() : void
      {
         _btnClose.dispose();
         _btnClose = null;
         _btnSend.dispose();
         _btnSend = null;
         _scrollBar.dispose();
         _scrollBar = null;
         super.dispose();
      }
      
      private function setFocus() : void
      {
         var _loc1_:SymbolDialogProposeMarriageGeneric = _vo as SymbolDialogProposeMarriageGeneric;
         if(StringUtil.isEmpty(_loc1_.inputReceiver.text))
         {
            Dialog.focus = _loc1_.inputReceiver;
         }
         else if(StringUtil.isEmpty(_loc1_.inputMessage.text))
         {
            Dialog.focus = _loc1_.inputMessage;
         }
      }
      
      private function onClickClose(param1:InteractionEvent) : void
      {
         close();
      }
      
      private function onClickSend(param1:InteractionEvent) : void
      {
         var _loc3_:SymbolDialogProposeMarriageGeneric = _vo as SymbolDialogProposeMarriageGeneric;
         var _loc2_:String = StringUtil.remove(StringUtil.remove(_loc3_.inputReceiver.text,",")," ");
         if(StringUtil.isEmpty(_loc3_.inputReceiver.text) || _loc2_.length == 0)
         {
            Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/propose_marriage/receiver_empty_title"),LocText.current.text("dialog/propose_marriage/receiver_empty_text"),LocText.current.text("general/button_ok"),setFocus));
         }
         else if(StringUtil.isEmpty(_loc3_.inputMessage.text))
         {
            Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/propose_marriage/message_empty_title"),LocText.current.text("dialog/propose_marriage/message_empty_text"),LocText.current.text("general/button_ok"),setFocus));
         }
         else
         {
            Environment.application.sendActionRequest("sendMarriageProposal",{
               "message":_loc3_.inputMessage.text,
               "to":_loc3_.inputReceiver.text,
               "item_id":_item.id,
               "renew_own_marriage":false
            },handleRequests);
         }
      }
      
      private function renewMarriage() : void
      {
         var _loc1_:SymbolDialogProposeMarriageGeneric = _vo as SymbolDialogProposeMarriageGeneric;
         Environment.application.sendActionRequest("sendMarriageProposal",{
            "message":_loc1_.inputMessage.text,
            "to":_loc1_.inputReceiver.text,
            "item_id":_item.id,
            "renew_own_marriage":true
         },handleRequests);
      }
      
      private function handleRequests(param1:ActionRequestResponse) : void
      {
         var _loc3_:* = null;
         var _loc2_:* = null;
         var _loc4_:* = param1.action;
         if("sendMarriageProposal" !== _loc4_)
         {
            throw new Error("Unsupported request action \'" + param1.action + "\'!");
         }
         _loc3_ = null;
         _loc2_ = null;
         if(param1.error == "")
         {
            if(param1.appResponse.marriage)
            {
               User.current.character.newMessages++;
               Mailbox.reload = true;
            }
            else
            {
               Mailbox.addSentMessage(param1.appResponse.message,param1.data.messages_character_info);
            }
            Environment.application.updateData(param1.data);
            close();
         }
         else if(param1.error == "errCreateMarriageProposalSelfRecipient")
         {
            Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/propose_marriage/self_recipient_title"),LocText.current.text("dialog/propose_marriage/self_recipient_text"),LocText.current.text("general/button_ok")));
         }
         else if(param1.error == "errCreateMarriageProposalInvalidRecipient")
         {
            _loc3_ = _vo as SymbolDialogProposeMarriageGeneric;
            _loc2_ = _loc3_.inputReceiver.text;
            Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/propose_marriage/invalid_recipient_title"),LocText.current.text("dialog/propose_marriage/invalid_recipient_text",_loc2_),LocText.current.text("general/button_ok")));
         }
         else if(param1.error == "errCreateMarriageProposalSelfAlreadyMarried")
         {
            _loc3_ = _vo as SymbolDialogProposeMarriageGeneric;
            _loc2_ = _loc3_.inputReceiver.text;
            Environment.panelManager.showDialog(new UiTwoChoiceDialog(LocText.current.text("dialog/propose_marriage/already_married_with_recipient_title"),LocText.current.text("dialog/propose_marriage/already_married_with_recipient_text",_loc2_),LocText.current.text("general/button_yes"),LocText.current.text("general/button_no"),renewMarriage));
         }
         else if(param1.error == "errCreateMarriageProposalInvalidRecipientLevel")
         {
            _loc3_ = _vo as SymbolDialogProposeMarriageGeneric;
            _loc2_ = _loc3_.inputReceiver.text;
            Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/propose_marriage/recipient_invalid_level_title"),LocText.current.text("dialog/propose_marriage/recipient_invalid_level_text",_loc2_),LocText.current.text("general/button_ok")));
         }
         else if(param1.error == "errCreateMarriageProposalSelfToManyMarriages")
         {
            Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/propose_marriage/to_many_marriages_title"),LocText.current.text("dialog/propose_marriage/to_many_marriages_text"),LocText.current.text("general/button_ok")));
         }
         else if(param1.error == "errCreateMarriageProposalRecipientToManyMarriages")
         {
            _loc3_ = _vo as SymbolDialogProposeMarriageGeneric;
            _loc2_ = _loc3_.inputReceiver.text;
            Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/propose_marriage/recipient_to_many_marriages_title"),LocText.current.text("dialog/propose_marriage/recipient_to_many_marriages_text",_loc2_),LocText.current.text("general/button_ok")));
         }
         else if(param1.error == "errCreateMarriageOwnCharacterIsIgnored")
         {
            _loc3_ = _vo as SymbolDialogProposeMarriageGeneric;
            _loc2_ = _loc3_.inputReceiver.text;
            Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/propose_marriage/recipient_ignores_self_title"),LocText.current.text("dialog/propose_marriage/recipient_ignores_self_text",_loc2_),LocText.current.text("general/button_ok")));
         }
         else if(param1.error == "errCreateMarriageOtherCharacterIsIgnored")
         {
            _loc3_ = _vo as SymbolDialogProposeMarriageGeneric;
            _loc2_ = _loc3_.inputReceiver.text;
            Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/propose_marriage/recipient_is_ignored_title"),LocText.current.text("dialog/propose_marriage/recipient_is_ignored_text",_loc2_),LocText.current.text("general/button_ok")));
         }
         else
         {
            Environment.reportError(param1.error,param1.request);
         }
      }
      
      override public function onEscape() : void
      {
         onClickClose(null);
      }
   }
}
