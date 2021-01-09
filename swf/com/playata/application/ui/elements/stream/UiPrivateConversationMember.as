package com.playata.application.ui.elements.stream
{
   import com.playata.application.AppEnvironment;
   import com.playata.application.data.stream.PrivateConversation;
   import com.playata.application.data.stream.PrivateConversationMember;
   import com.playata.application.ui.ViewManager;
   import com.playata.application.ui.dialogs.DialogReportUserStream;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.application.ui.elements.generic.dialog.UiInfoDialog;
   import com.playata.framework.application.Environment;
   import com.playata.framework.application.request.ActionRequestResponse;
   import com.playata.framework.display.InteractiveDisplayObject;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.elements.stream.SymbolPrivateConversationMemberGeneric;
   
   public class UiPrivateConversationMember extends InteractiveDisplayObject
   {
       
      
      private var _content:SymbolPrivateConversationMemberGeneric = null;
      
      private var _privateConversationMember:PrivateConversationMember = null;
      
      private var _privateConversation:PrivateConversation = null;
      
      private var _onActionBarOpen:Function = null;
      
      private var _btnShowSender:UiButton = null;
      
      private var _btnIgnore:UiButton = null;
      
      private var _btnReport:UiButton = null;
      
      public function UiPrivateConversationMember(param1:PrivateConversation, param2:PrivateConversationMember, param3:Function)
      {
         _content = new SymbolPrivateConversationMemberGeneric();
         _onActionBarOpen = param3;
         _btnShowSender = new UiButton(_content.btnShowSender,LocText.current.text("dialog/leaderboard/button_show_player"),onClickShowMember);
         _btnIgnore = new UiButton(_content.btnIgnore,LocText.current.text("dialog/mail_read/button_ignore"),onClickIgnore);
         _btnReport = new UiButton(_content.btnReport,"",onClickReport);
         super(_content);
         onClick.add(handleClick);
         closeActionBar();
         refresh(param1,param2);
      }
      
      override public function dispose() : void
      {
         _btnShowSender.dispose();
         _btnShowSender = null;
         _btnIgnore.dispose();
         _btnIgnore = null;
         _btnReport.dispose();
         _btnReport = null;
         super.dispose();
      }
      
      override public function get width() : Number
      {
         return _content.background.width;
      }
      
      public function refresh(param1:PrivateConversation, param2:PrivateConversationMember) : void
      {
         if(_privateConversation == param1 && _privateConversationMember == param2)
         {
            return;
         }
         _privateConversation = param1;
         _privateConversationMember = param2;
         _content.txtName.text = _privateConversationMember.name;
         _content.txtName.width = _content.txtName.textWidth + 5;
         _content.iconReceiverGenderMale.visible = _privateConversationMember.isMale;
         _content.iconReceiverGenderFemale.visible = _privateConversationMember.isFemale;
         _btnShowSender.buttonEnabled = !_privateConversationMember.isDeleted;
         _btnIgnore.buttonEnabled = !_privateConversationMember.isMe && !_privateConversationMember.isDeleted;
         _btnReport.buttonEnabled = !_privateConversationMember.isMe && !_privateConversationMember.isDeleted;
         if(_btnIgnore.buttonEnabled)
         {
            _btnIgnore.tooltip = LocText.current.text("dialog/mail_read/button_ignore_tooltip",_privateConversationMember.name);
         }
         else
         {
            _btnIgnore.tooltip = "";
         }
         if(_btnReport.buttonEnabled)
         {
            _btnReport.tooltip = LocText.current.text("dialog/mail_read/button_report_tooltip",_privateConversationMember.name);
         }
         else
         {
            _btnReport.tooltip = "";
         }
         _content.background.width = _content.txtName.y + _content.txtName.width + 30;
      }
      
      private function handleClick(param1:InteractionEvent) : void
      {
         if(_privateConversationMember.isDeleted)
         {
            return;
         }
         if(_content.actionBarBackground.visible)
         {
            closeActionBar();
         }
         else
         {
            showActionBar();
         }
      }
      
      private function showActionBar() : void
      {
         _content.bringToTop();
         if(_onActionBarOpen != null)
         {
            _onActionBarOpen(this);
         }
         _content.actionBarBackground.visible = true;
         _content.btnShowSender.visible = true;
         _content.btnIgnore.visible = true;
         _content.btnReport.visible = !AppEnvironment.appPlatform.isGamgos;
      }
      
      public function closeActionBar() : void
      {
         _content.actionBarBackground.visible = false;
         _content.btnShowSender.visible = false;
         _content.btnIgnore.visible = false;
         _content.btnReport.visible = false;
      }
      
      private function onClickShowMember(param1:InteractionEvent) : void
      {
         ViewManager.instance.loadCharacter(_privateConversationMember.id,onCharacterLoaded);
      }
      
      private function onClickIgnore(param1:InteractionEvent) : void
      {
         Environment.application.sendActionRequest("ignoreMessageCharacter",{"character_ignore_id":_privateConversationMember.id},handleRequests);
      }
      
      private function onClickReport(param1:InteractionEvent) : void
      {
         Environment.panelManager.showDialog(new DialogReportUserStream(_privateConversation.id,_privateConversationMember.name,_privateConversationMember.id));
      }
      
      private function onCharacterLoaded() : void
      {
         ViewManager.instance.baseUserPanel.streamsPanel.close();
      }
      
      private function handleRequests(param1:ActionRequestResponse) : void
      {
         var _loc2_:* = param1.action;
         if("ignoreMessageCharacter" !== _loc2_)
         {
            throw new Error("Unsupported request action \'" + param1.action + "\'!");
         }
         if(param1.error == "")
         {
            Environment.application.updateData(param1.data);
            Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/ignore_message_character/newly_ignored/title"),LocText.current.text("dialog/ignore_message_character/newly_ignored/text",_privateConversationMember.name),LocText.current.text("general/button_ok")));
         }
         else if(param1.error == "errAddRecordAlreadyIgnored")
         {
            Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/ignore_message_character/already_ignored/title"),LocText.current.text("dialog/ignore_message_character/already_ignored/text"),LocText.current.text("general/button_ok")));
         }
         else
         {
            Environment.reportError(param1.error,param1.request);
         }
      }
   }
}
