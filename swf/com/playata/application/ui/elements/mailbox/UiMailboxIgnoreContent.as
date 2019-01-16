package com.playata.application.ui.elements.mailbox
{
   import com.playata.application.data.character.Character;
   import com.playata.application.data.mailbox.Mailbox;
   import com.playata.application.data.mailbox.MessageCharacter;
   import com.playata.application.data.user.User;
   import com.playata.application.ui.ViewManager;
   import com.playata.application.ui.dialogs.DialogMailbox;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.application.ui.elements.generic.button.UiTextButton;
   import com.playata.application.ui.elements.generic.checkbox.UiCheckBox;
   import com.playata.framework.application.Environment;
   import com.playata.framework.application.request.ActionRequestResponse;
   import com.playata.framework.display.InteractiveDisplayObject;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.elements.mail.SymbolMailboxIgnoreContentGeneric;
   
   public class UiMailboxIgnoreContent extends InteractiveDisplayObject
   {
      
      private static const MAX_LINES:int = 9;
      
      private static const SCROLL_VALUE:int = 5;
      
      private static var _selectedLine:UiMailboxIgnoreLine = null;
       
      
      private var _mailBox:DialogMailbox = null;
      
      private var _content:SymbolMailboxIgnoreContentGeneric = null;
      
      private var _btnShow:UiButton = null;
      
      private var _btnUnignore:UiTextButton = null;
      
      private var _btnScrollUp:UiButton = null;
      
      private var _btnScrollDown:UiButton = null;
      
      private var _line1:UiMailboxIgnoreLine = null;
      
      private var _line2:UiMailboxIgnoreLine = null;
      
      private var _line3:UiMailboxIgnoreLine = null;
      
      private var _line4:UiMailboxIgnoreLine = null;
      
      private var _line5:UiMailboxIgnoreLine = null;
      
      private var _line6:UiMailboxIgnoreLine = null;
      
      private var _line7:UiMailboxIgnoreLine = null;
      
      private var _line8:UiMailboxIgnoreLine = null;
      
      private var _line9:UiMailboxIgnoreLine = null;
      
      private var _currentCharacter:MessageCharacter = null;
      
      private var _offset:int = 0;
      
      private var _ckbIgnoreGuildInvites:UiCheckBox = null;
      
      public function UiMailboxIgnoreContent(param1:DialogMailbox, param2:SymbolMailboxIgnoreContentGeneric)
      {
         _mailBox = param1;
         _content = param2;
         super(_content);
         _content.txtNameCaption.text = LocText.current.text("dialog/mailbox_ignore/name_caption");
         _content.txtIgnoreDateCaption.text = LocText.current.text("dialog/mailbox_ignore/ignore_date_caption");
         _content.txtNoIgnores.text = LocText.current.text("dialog/mailbox_ignore/no_ignores");
         _content.txtIgnoreGuildInvites.text = LocText.current.text("dialog/mailbox_ignore/ignore_guild_invites");
         _btnShow = new UiButton(_content.btnViewPlayer,LocText.current.text("dialog/mailbox_ignore/button_show"),onClickShow);
         _btnUnignore = new UiTextButton(_content.btnUnignore,LocText.current.text("dialog/mailbox_ignore/button_unignore"),LocText.current.text("dialog/mailbox_ignore/button_unignore_tooltip"),onClickUnignore);
         _btnScrollUp = new UiButton(_content.btnUp,"",onClickScrollUp);
         _btnScrollDown = new UiButton(_content.btnDown,"",onClickScrollDown);
         _line1 = new UiMailboxIgnoreLine(_content.line1,1,selectLine,doubleClickLine);
         _line2 = new UiMailboxIgnoreLine(_content.line2,2,selectLine,doubleClickLine);
         _line3 = new UiMailboxIgnoreLine(_content.line3,3,selectLine,doubleClickLine);
         _line4 = new UiMailboxIgnoreLine(_content.line4,4,selectLine,doubleClickLine);
         _line5 = new UiMailboxIgnoreLine(_content.line5,5,selectLine,doubleClickLine);
         _line6 = new UiMailboxIgnoreLine(_content.line6,6,selectLine,doubleClickLine);
         _line7 = new UiMailboxIgnoreLine(_content.line7,7,selectLine,doubleClickLine);
         _line8 = new UiMailboxIgnoreLine(_content.line8,8,selectLine,doubleClickLine);
         _line9 = new UiMailboxIgnoreLine(_content.line9,9,selectLine,doubleClickLine);
         onMouseWheel.add(handleMouseWheel);
         _ckbIgnoreGuildInvites = new UiCheckBox(_content.checkboxIgnoreGuildInvites,User.current.getSettingValue("ignore_guild_invites") === true,"",onIngoreGuildInvitesChanged,null,_content.txtIgnoreGuildInvites);
         refreshList();
      }
      
      override public function dispose() : void
      {
         _btnShow.dispose();
         _btnShow = null;
         _btnUnignore.dispose();
         _btnUnignore = null;
         _btnScrollUp.dispose();
         _btnScrollUp = null;
         _btnScrollDown.dispose();
         _btnScrollDown = null;
         _line1.dispose();
         _line1 = null;
         _line2.dispose();
         _line2 = null;
         _line3.dispose();
         _line3 = null;
         _line4.dispose();
         _line4 = null;
         _line5.dispose();
         _line5 = null;
         _line6.dispose();
         _line6 = null;
         _line7.dispose();
         _line7 = null;
         _line8.dispose();
         _line8 = null;
         _line9.dispose();
         _line9 = null;
         _ckbIgnoreGuildInvites.dispose();
         _ckbIgnoreGuildInvites = null;
      }
      
      public function get content() : SymbolMailboxIgnoreContentGeneric
      {
         return _content;
      }
      
      private function handleMouseWheel(param1:InteractionEvent) : void
      {
         if(param1.mouseWheelDelta > 0)
         {
            scrollUp(1,true);
         }
         else
         {
            scrollDown(1,true);
         }
      }
      
      private function onIngoreGuildInvitesChanged(param1:Boolean) : void
      {
         User.current.setSettingValue("ignore_guild_invites",param1);
      }
      
      private function onClickShow(param1:InteractionEvent) : void
      {
         if(_selectedLine.character.id == -1)
         {
            return;
         }
         Environment.application.sendActionRequest("getCharacter",{"character_id":_selectedLine.character.id},handleRequests);
      }
      
      private function onClickUnignore(param1:InteractionEvent) : void
      {
         Environment.application.sendActionRequest("unignoreMessageCharacter",{"character_unignore_id":_selectedLine.character.id},handleRequests);
      }
      
      private function onClickScrollUp(param1:InteractionEvent) : void
      {
         scrollUp(5,false);
      }
      
      private function onClickScrollDown(param1:InteractionEvent) : void
      {
         scrollDown(5,false);
      }
      
      private function scrollUp(param1:int, param2:Boolean) : void
      {
         if(!_btnScrollUp.visible)
         {
            return;
         }
         _offset = _offset - param1;
         if(_offset < 0)
         {
            _offset = 0;
            param2 = false;
         }
         if(param2)
         {
            Environment.audio.playFX("ui_button_click.mp3");
         }
         refreshList();
      }
      
      private function scrollDown(param1:int, param2:Boolean) : void
      {
         if(!_btnScrollDown.visible)
         {
            return;
         }
         _offset = _offset + param1;
         if(_offset > currentCharacterCount - 9)
         {
            _offset = currentCharacterCount - 9;
            param2 = false;
         }
         if(param2)
         {
            Environment.audio.playFX("ui_button_click.mp3");
         }
         refreshList();
      }
      
      private function get currentCharacterCount() : int
      {
         return Mailbox.ignoredCharacters.length;
      }
      
      public function resetList() : void
      {
         _offset = 0;
         _selectedLine = null;
      }
      
      public function refreshList(param1:Boolean = false) : void
      {
         if(_selectedLine != null)
         {
            _currentCharacter = _selectedLine.character;
         }
         var _loc2_:Vector.<MessageCharacter> = Mailbox.ignoredCharacters;
         _content.txtNoIgnores.visible = _loc2_.length == 0;
         if(_loc2_.length == 0)
         {
            _selectedLine = null;
            _currentCharacter = null;
         }
         _btnScrollUp.visible = _loc2_.length > 9;
         _btnScrollDown.visible = _loc2_.length > 9;
         _btnScrollUp.buttonEnabled = _offset > 0;
         _btnScrollDown.buttonEnabled = _offset < currentCharacterCount - 9;
         _line1.refresh(_loc2_.length >= _offset + 1?_loc2_[_offset + 0]:null,1);
         _line2.refresh(_loc2_.length >= _offset + 2?_loc2_[_offset + 1]:null,2);
         _line3.refresh(_loc2_.length >= _offset + 3?_loc2_[_offset + 2]:null,3);
         _line4.refresh(_loc2_.length >= _offset + 4?_loc2_[_offset + 3]:null,4);
         _line5.refresh(_loc2_.length >= _offset + 5?_loc2_[_offset + 4]:null,5);
         _line6.refresh(_loc2_.length >= _offset + 6?_loc2_[_offset + 5]:null,6);
         _line7.refresh(_loc2_.length >= _offset + 7?_loc2_[_offset + 6]:null,7);
         _line8.refresh(_loc2_.length >= _offset + 8?_loc2_[_offset + 7]:null,8);
         _line9.refresh(_loc2_.length >= _offset + 9?_loc2_[_offset + 8]:null,9);
         if(_currentCharacter != null && !param1)
         {
            if(_line1.character == _currentCharacter)
            {
               selectLine(_line1);
            }
            else if(_line2.character == _currentCharacter)
            {
               selectLine(_line2);
            }
            else if(_line3.character == _currentCharacter)
            {
               selectLine(_line3);
            }
            else if(_line4.character == _currentCharacter)
            {
               selectLine(_line4);
            }
            else if(_line5.character == _currentCharacter)
            {
               selectLine(_line5);
            }
            else if(_line6.character == _currentCharacter)
            {
               selectLine(_line6);
            }
            else if(_line7.character == _currentCharacter)
            {
               selectLine(_line7);
            }
            else if(_line8.character == _currentCharacter)
            {
               selectLine(_line8);
            }
            else if(_line9.character == _currentCharacter)
            {
               selectLine(_line9);
            }
            else
            {
               selectLine(_line1);
            }
         }
         else if(_line1.character != null && param1)
         {
            selectLine(_line1);
         }
         refreshButtons();
      }
      
      private function selectLine(param1:UiMailboxIgnoreLine) : void
      {
         _selectedLine = param1;
         _line1.highlight(_line1 == _selectedLine);
         _line2.highlight(_line2 == _selectedLine);
         _line3.highlight(_line3 == _selectedLine);
         _line4.highlight(_line4 == _selectedLine);
         _line5.highlight(_line5 == _selectedLine);
         _line6.highlight(_line6 == _selectedLine);
         _line7.highlight(_line7 == _selectedLine);
         _line8.highlight(_line8 == _selectedLine);
         _line9.highlight(_line9 == _selectedLine);
         refreshButtons();
      }
      
      private function refreshButtons() : void
      {
         _btnShow.buttonEnabled = _selectedLine != null;
         _btnUnignore.buttonEnabled = _selectedLine != null;
      }
      
      private function doubleClickLine(param1:UiMailboxIgnoreLine) : void
      {
         selectLine(param1);
         onClickShow(null);
      }
      
      private function handleRequests(param1:ActionRequestResponse) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = param1.action;
         switch(_loc3_)
         {
            case "unignoreMessageCharacter":
               if(param1.error == "")
               {
                  Mailbox.updateMessageData(null,null,null,null,param1.appResponse.messages_ignored_character_info);
                  _mailBox.refreshIgnoreContent();
               }
               else
               {
                  Environment.reportError(param1.error,param1.request);
               }
               break;
            case "getCharacter":
               if(param1.error == "")
               {
                  Environment.application.updateData(param1.data);
                  _loc2_ = Character.fromData(param1.data);
                  ViewManager.instance.showCharacter(_loc2_);
                  _mailBox.close();
               }
               else
               {
                  Environment.reportError(param1.error,param1.request);
               }
               break;
            default:
               throw new Error("Unsupported request action \'" + param1.action + "\'!");
         }
      }
   }
}
