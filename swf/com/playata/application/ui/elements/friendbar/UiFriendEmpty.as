package com.playata.application.ui.elements.friendbar
{
   import com.playata.application.AppEnvironment;
   import com.playata.framework.application.Environment;
   import com.playata.framework.display.InteractiveDisplayObject;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.elements.friendbar.FriendbarSymbolFriendEmptyGeneric;
   
   public class UiFriendEmpty
   {
       
      
      private var _content:FriendbarSymbolFriendEmptyGeneric = null;
      
      private var _mouseLayer:InteractiveDisplayObject = null;
      
      public function UiFriendEmpty(param1:FriendbarSymbolFriendEmptyGeneric)
      {
         super();
         _content = param1;
         _mouseLayer = new InteractiveDisplayObject(_content.mouseLayer);
         _mouseLayer.onClick.add(handleClick);
         _mouseLayer.onInteractionOut.add(handleInteractionOut);
         _mouseLayer.onInteractionOver.add(handleInteractionOver);
         _content.txtAddFriend.text = LocText.current.text("friendbar/add_friend");
      }
      
      public function dispose() : void
      {
         _mouseLayer.dispose();
      }
      
      public function refreshLocalization() : void
      {
         _content.txtAddFriend.text = LocText.current.text("friendbar/add_friend");
      }
      
      private function handleClick(param1:InteractionEvent) : void
      {
         Environment.audio.playFX("ui_button_click.mp3");
         AppEnvironment.friendBar.inviteFriends();
      }
      
      private function handleInteractionOver(param1:InteractionEvent) : void
      {
         _content.plus.scaleX = 1.1;
         _content.plus.scaleY = 1.1;
      }
      
      private function handleInteractionOut(param1:InteractionEvent) : void
      {
         _content.plus.scaleX = 1;
         _content.plus.scaleY = 1;
      }
      
      public function set visible(param1:Boolean) : void
      {
         _content.visible = param1;
      }
      
      public function get visible() : Boolean
      {
         return _content.visible;
      }
      
      public function refresh(param1:Boolean) : void
      {
         _content.mouseLayer.visible = param1;
         _content.plus.visible = param1;
         _content.txtAddFriend.visible = param1;
      }
   }
}
