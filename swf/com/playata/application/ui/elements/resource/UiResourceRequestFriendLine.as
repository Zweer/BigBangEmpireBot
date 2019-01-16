package com.playata.application.ui.elements.resource
{
   import com.playata.application.data.friend.Friend;
   import com.playata.application.ui.elements.generic.checkbox.UiCheckBox;
   import com.playata.framework.application.Environment;
   import com.playata.framework.display.InteractiveDisplayObject;
   import com.playata.framework.input.InteractionEvent;
   import visuals.ui.elements.resource_request.SymbolResourceRequestFriendLineGeneric;
   
   public class UiResourceRequestFriendLine extends InteractiveDisplayObject
   {
       
      
      private var _content:SymbolResourceRequestFriendLineGeneric = null;
      
      private var _index:int = 0;
      
      private var _friend:Friend = null;
      
      private var _ckbSend:UiCheckBox = null;
      
      private var _onClickFunction:Function = null;
      
      public function UiResourceRequestFriendLine(param1:SymbolResourceRequestFriendLineGeneric, param2:int, param3:Function)
      {
         _content = param1;
         super(_content);
         _index = param2;
         _onClickFunction = param3;
         _ckbSend = new UiCheckBox(_content.ckbSend,false,"",onCheckedValueChanged,null,_content.txtName);
         onClick.add(handleClick);
         _content.backgroundHighlight.visible = false;
         useHandCursor = false;
      }
      
      private function onCheckedValueChanged(param1:Boolean) : void
      {
      }
      
      public function get index() : int
      {
         return _index;
      }
      
      public function get checked() : Boolean
      {
         return _ckbSend.checked;
      }
      
      public function get friend() : Friend
      {
         return _friend;
      }
      
      private function handleClick(param1:InteractionEvent) : void
      {
         Environment.audio.playFX("ui_button_click.mp3");
      }
      
      public function refresh(param1:Friend, param2:int, param3:Boolean) : void
      {
         _index = param2;
         _friend = param1;
         _content.backgroundEven.visible = _index % 2 == 0;
         _content.backgroundOdd.visible = _index % 2 != 0;
         if(_friend == null)
         {
            _ckbSend.content.visible = false;
            _content.txtName.visible = false;
            return;
         }
         _ckbSend.content.visible = true;
         _ckbSend.checked = param3;
         _content.txtName.visible = true;
         _content.txtName.text = _friend.characterName;
      }
   }
}
