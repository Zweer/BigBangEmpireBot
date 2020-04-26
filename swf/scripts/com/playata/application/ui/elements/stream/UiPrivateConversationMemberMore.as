package com.playata.application.ui.elements.stream
{
   import com.playata.framework.application.Environment;
   import com.playata.framework.display.InteractiveDisplayObject;
   import com.playata.framework.input.InteractionEvent;
   import visuals.ui.elements.stream.SymbolPrivateConversationMemberMoreGeneric;
   
   public class UiPrivateConversationMemberMore extends InteractiveDisplayObject
   {
       
      
      private var _content:SymbolPrivateConversationMemberMoreGeneric = null;
      
      public function UiPrivateConversationMemberMore(param1:SymbolPrivateConversationMemberMoreGeneric)
      {
         _content = param1;
         super(_content);
         _content.txtMore.text = "...";
         if(Environment.info.isTouchScreen)
         {
            _content.txtMore.x = _content.txtMore.x + 3;
         }
         clear();
         closeMembers();
         onClick.add(handleClick);
         visible = false;
      }
      
      override public function get width() : Number
      {
         return _content.background.width;
      }
      
      public function addMember(param1:UiPrivateConversationMember) : void
      {
         param1.x = 0;
         param1.y = _content.members.numChildren * 30;
         _content.members.addChild(param1);
         if(param1.width > _content.memberBackground.width)
         {
            _content.memberBackground.width = param1.width + 5;
         }
         _content.memberBackground.height = _content.members.y + _content.members.numChildren * 30 + 5;
      }
      
      public function clear() : void
      {
         _content.members.removeAllChildren();
      }
      
      private function handleClick(param1:InteractionEvent) : void
      {
         if(param1.rawEvent.target is SymbolPrivateConversationMember)
         {
            return;
         }
         if(_content.memberBackground.visible)
         {
            closeMembers();
         }
         else
         {
            showMembers();
         }
      }
      
      private function showMembers() : void
      {
         _content.memberBackground.visible = true;
         _content.members.visible = true;
      }
      
      public function closeMembers() : void
      {
         _content.memberBackground.visible = false;
         _content.members.visible = false;
      }
   }
}
