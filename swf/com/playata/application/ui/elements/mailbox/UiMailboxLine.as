package com.playata.application.ui.elements.mailbox
{
   import com.playata.application.AppConfig;
   import com.playata.application.data.mailbox.Message;
   import com.playata.application.data.mailbox.MessageCharacter;
   import com.playata.application.ui.elements.generic.UiOnlinePoint;
   import com.playata.application.ui.elements.generic.textfield.UiTextTooltip;
   import com.playata.framework.application.Environment;
   import com.playata.framework.core.util.StringUtil;
   import com.playata.framework.display.InteractiveDisplayObject;
   import com.playata.framework.input.InteractionEvent;
   import visuals.ui.elements.mail.SymbolMailboxLineGeneric;
   
   public class UiMailboxLine extends InteractiveDisplayObject
   {
       
      
      private var _content:SymbolMailboxLineGeneric = null;
      
      private var _index:int = 0;
      
      private var _message:Message = null;
      
      private var _tooltipLine:UiTextTooltip = null;
      
      private var _onlinePoint:UiOnlinePoint = null;
      
      private var _systemMailIcon:UiSystemMailIcon = null;
      
      private var _onClickFunction:Function = null;
      
      private var _onDoubleClickFunction:Function = null;
      
      public function UiMailboxLine(param1:SymbolMailboxLineGeneric, param2:int, param3:Function, param4:Function)
      {
         _content = param1;
         super(_content);
         _index = param2;
         _onClickFunction = param3;
         _onDoubleClickFunction = param4;
         _tooltipLine = new UiTextTooltip(_content,"");
         _onlinePoint = new UiOnlinePoint(_content.iconOnline,_content.txtName);
         _systemMailIcon = new UiSystemMailIcon(_content.iconSystemMail);
         onClick.add(handleClick);
         onDoubleClick.add(handleDoubleClick);
      }
      
      public function get index() : int
      {
         return _index;
      }
      
      public function get message() : Message
      {
         return _message;
      }
      
      private function handleClick(param1:InteractionEvent) : void
      {
         Environment.audio.playFX("ui_button_click.mp3");
      }
      
      private function handleDoubleClick(param1:InteractionEvent) : void
      {
         Environment.audio.playFX("ui_button_click.mp3");
      }
      
      public function highlight(param1:Boolean) : void
      {
         if(!_content.visible)
         {
            return;
         }
         _content.backgroundHighlight.visible = param1;
         _content.backgroundEven.visible = !param1 && _index % 2 == 0;
         _content.backgroundOdd.visible = !param1 && _index % 2 != 0;
      }
      
      public function refresh(param1:Message, param2:int) : void
      {
         _index = param2;
         _message = param1;
         if(_message == null)
         {
            _content.visible = false;
            return;
         }
         _content.visible = true;
         _content.txtDate.text = _message.dateTime;
         var _loc3_:Vector.<MessageCharacter> = _message.recipients;
         var _loc4_:String = _message.subject;
         if(_message.sender.isSystem)
         {
            _loc4_ = StringUtil.replace(_loc4_,"[APPLICATION_NAME]",AppConfig.appName);
         }
         _content.txtSubject.text = StringUtil.cutLength(_loc4_,30);
         _content.iconUnread.visible = !_message.isRead;
         _content.txtName.textColor = 14342874;
         if(_message.isSent)
         {
            _content.txtName.text = StringUtil.cutLength(_message.recipientNames,20);
            if(_loc3_.length == 1)
            {
               _content.iconGenderMale.visible = _loc3_[0].isMale;
               _content.iconGenderFemale.visible = _loc3_[0].isFemale;
               _content.iconGuild.visible = false;
               _content.txtName.textColor = !!_loc3_[0].isMyGuildMember?16711908:14342874;
               _onlinePoint.refresh(_loc3_[0].isOnline,StringUtil.cutLength(_loc3_[0].name,20));
               _systemMailIcon.refresh(_loc3_[0].isSystem);
            }
            else
            {
               _content.iconGenderMale.visible = false;
               _content.iconGenderFemale.visible = false;
               _content.iconGuild.visible = _message.isTeamMail;
               _onlinePoint.refresh(false,"");
               _systemMailIcon.refresh(false);
            }
         }
         else
         {
            _content.txtName.text = StringUtil.cutLength(_message.sender.name,20);
            _content.txtName.textColor = !!_message.sender.isMyGuildMember?16711908:14342874;
            _content.iconGenderMale.visible = _message.sender.isMale;
            _content.iconGenderFemale.visible = _message.sender.isFemale;
            _content.iconGuild.visible = false;
            _onlinePoint.refresh(_message.sender.isOnline,_message.sender.name);
            _systemMailIcon.refresh(_message.sender.isSystem);
         }
         _content.backgroundHighlight.visible = false;
         _content.backgroundEven.visible = _index % 2 == 0;
         _content.backgroundOdd.visible = _index % 2 != 0;
         _tooltipLine.text = "";
      }
   }
}
