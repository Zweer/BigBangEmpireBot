package com.playata.application.ui.elements.stream
{
   import com.playata.application.ui.elements.generic.UiCounterBubble;
   import com.playata.application.ui.elements.generic.textfield.UiTextTooltip;
   import com.playata.framework.display.ui.controls.Tab;
   import com.playata.framework.display.ui.controls.TextTooltip;
   import visuals.ui.elements.stream.SymbolTabStreamGeneric;
   
   public class UiStreamTabButton extends Tab
   {
      
      public static const SYSTEM:String = "system";
      
      public static const PRIVATE_CONVERSATION:String = "privateConversation";
      
      public static const RESOURCE_REQUEST:String = "resourceRequest";
      
      public static const IGNORED_CHARACTER:String = "ignoredCharacter";
      
      public static const USER_VOUCHER:String = "userVoucher";
       
      
      private var _content:SymbolTabStreamGeneric = null;
      
      private var _systemMailIcon:UiSystemStreamIcon = null;
      
      private var _activeIcon:String = null;
      
      public function UiStreamTabButton(param1:SymbolTabStreamGeneric, param2:String, param3:String)
      {
         _content = param1;
         _activeIcon = param3;
         super(_content);
         assignTooltip(new UiTextTooltip(this,param2));
         _content.iconPrivateConversations.visible = _activeIcon == "privateConversation";
         _content.iconResourceRequests.visible = _activeIcon == "resourceRequest";
         _content.iconIgnoredCharacters.visible = _activeIcon == "ignoredCharacter";
         _content.iconUserVouchers.visible = _activeIcon == "userVoucher";
         _systemMailIcon = new UiSystemStreamIcon(_content.iconSystem);
         onDeselected();
      }
      
      public function set unreadCount(param1:int) : void
      {
         _content.unreadCounter.visible = param1 > 0;
         if(_content.unreadCounter.visible)
         {
            UiCounterBubble.setIntValue(_content.unreadCounter,param1);
         }
      }
      
      override protected function onSelected() : void
      {
         _content.backgroundActive.visible = true;
         _content.backgroundInactive.visible = false;
      }
      
      override protected function onDeselected() : void
      {
         _content.backgroundActive.visible = false;
         _content.backgroundInactive.visible = true;
      }
      
      public function set tooltip(param1:String) : void
      {
         if(!_tooltip || !(_tooltip is TextTooltip))
         {
            assignTooltip(new UiTextTooltip(this,param1));
            return;
         }
         (_tooltip as TextTooltip).text = param1;
      }
      
      public function refresh() : void
      {
         _systemMailIcon.refresh(_activeIcon == "system");
      }
   }
}
