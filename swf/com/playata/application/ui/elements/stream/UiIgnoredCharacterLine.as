package com.playata.application.ui.elements.stream
{
   import com.playata.application.data.stream.IgnoreMessageCharacter;
   import com.playata.application.ui.elements.generic.UiOnlinePoint;
   import com.playata.application.ui.elements.generic.textfield.UiTextTooltip;
   import com.playata.framework.application.Environment;
   import com.playata.framework.display.IDisplayObject;
   import com.playata.framework.display.ui.IListItem;
   import com.playata.framework.display.ui.controls.ListLine;
   import com.playata.framework.input.InteractionEvent;
   import visuals.ui.elements.stream.SymbolIgnoredCharacterLineGeneric;
   
   public class UiIgnoredCharacterLine extends ListLine
   {
       
      
      private var _rawContent:SymbolIgnoredCharacterLineGeneric = null;
      
      private var _character:IgnoreMessageCharacter = null;
      
      private var _tooltipLine:UiTextTooltip = null;
      
      private var _onlinePoint:UiOnlinePoint = null;
      
      public function UiIgnoredCharacterLine(param1:SymbolIgnoredCharacterLineGeneric, param2:int, param3:SymbolIgnoredCharacterLineGeneric = null)
      {
         if(!param3)
         {
            _rawContent = new SymbolIgnoredCharacterLineGeneric();
         }
         else
         {
            _rawContent = param3;
         }
         super(_rawContent,param2);
         _tooltipLine = new UiTextTooltip(_rawContent,"");
         _onlinePoint = new UiOnlinePoint(_rawContent.iconOnline,_rawContent.txtName);
         onClick.add(handleClick);
         onDoubleClick.add(handleDoubleClick);
      }
      
      public function get character() : IgnoreMessageCharacter
      {
         return _character;
      }
      
      override public function get backgroundHighlight() : IDisplayObject
      {
         return _rawContent.backgroundHighlight;
      }
      
      override public function get backgroundEven() : IDisplayObject
      {
         return _rawContent.backgroundEven;
      }
      
      override public function get backgroundOdd() : IDisplayObject
      {
         return _rawContent.backgroundOdd;
      }
      
      protected function handleClick(param1:InteractionEvent) : void
      {
         Environment.audio.playFX("ui_button_click.mp3");
      }
      
      protected function handleDoubleClick(param1:InteractionEvent) : void
      {
         Environment.audio.playFX("ui_button_click.mp3");
      }
      
      override public function refresh(param1:IListItem, param2:int) : void
      {
         super.refresh(param1,param2);
         if(!param1)
         {
            return;
         }
         _character = param1 as IgnoreMessageCharacter;
         _rawContent.visible = true;
         _rawContent.txtName.text = _character.name;
         _rawContent.txtName.textColor = !!_character.isMyGuildMember?16711908:16777215;
         _rawContent.txtIgnoreDate.text = _character.ignoreDateString;
         _rawContent.iconGenderMale.visible = _character.isMale;
         _rawContent.iconGenderFemale.visible = _character.isFemale;
         _onlinePoint.refresh(_character.isOnline,_character.name);
         _tooltipLine.text = "";
      }
   }
}
