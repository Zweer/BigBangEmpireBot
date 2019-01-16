package com.playata.application.ui.elements.mailbox
{
   import com.playata.application.data.mailbox.MessageCharacter;
   import com.playata.application.ui.elements.generic.UiOnlinePoint;
   import com.playata.application.ui.elements.generic.textfield.UiTextTooltip;
   import com.playata.framework.application.Environment;
   import com.playata.framework.display.InteractiveDisplayObject;
   import com.playata.framework.input.InteractionEvent;
   import visuals.ui.elements.mail.SymbolMailboxIgnoreLineGeneric;
   
   public class UiMailboxIgnoreLine extends InteractiveDisplayObject
   {
       
      
      private var _content:SymbolMailboxIgnoreLineGeneric = null;
      
      private var _index:int = 0;
      
      private var _character:MessageCharacter = null;
      
      private var _tooltipLine:UiTextTooltip = null;
      
      private var _onlinePoint:UiOnlinePoint = null;
      
      private var _onClickFunction:Function = null;
      
      private var _onDoubleClickFunction:Function = null;
      
      public function UiMailboxIgnoreLine(param1:SymbolMailboxIgnoreLineGeneric, param2:int, param3:Function, param4:Function)
      {
         _content = param1;
         super(_content);
         _index = param2;
         _onClickFunction = param3;
         _onDoubleClickFunction = param4;
         _tooltipLine = new UiTextTooltip(_content,"");
         _onlinePoint = new UiOnlinePoint(_content.iconOnline,_content.txtName);
         onClick.add(handleClick);
         onDoubleClick.add(handleDoubleClick);
      }
      
      public function get index() : int
      {
         return _index;
      }
      
      public function get character() : MessageCharacter
      {
         return _character;
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
      
      public function refresh(param1:MessageCharacter, param2:int) : void
      {
         _index = param2;
         _character = param1;
         if(_character == null)
         {
            _content.visible = false;
            return;
         }
         _content.visible = true;
         _content.txtName.text = _character.name;
         _content.txtName.textColor = !!_character.isMyGuildMember?16711908:14342874;
         _content.txtIgnoreDate.text = _character.ignoreDateString;
         _content.iconGenderMale.visible = _character.isMale;
         _content.iconGenderFemale.visible = _character.isFemale;
         _onlinePoint.refresh(_character.isOnline,_character.name);
         _content.backgroundEven.visible = _index % 2 == 0;
         _content.backgroundOdd.visible = _index % 2 != 0;
         _tooltipLine.text = "";
      }
   }
}
