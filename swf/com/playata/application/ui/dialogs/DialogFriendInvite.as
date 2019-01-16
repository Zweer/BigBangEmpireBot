package com.playata.application.ui.dialogs
{
   import com.playata.application.data.constants.CConstant;
   import com.playata.application.ui.elements.friend.UiFriendInviteLinkContent;
   import com.playata.application.ui.elements.friend.UiFriendInviteMailContent;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.application.ui.elements.generic.dialog.UiDialog;
   import com.playata.application.ui.elements.generic.tab.UiTabButton;
   import com.playata.framework.input.IInteractionTarget;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.dialogs.SymbolDialogFriendInviteGeneric;
   
   public class DialogFriendInvite extends UiDialog
   {
      
      private static var _isOpen:Boolean = false;
       
      
      private var _btnClose:UiButton = null;
      
      private var _mailContent:UiFriendInviteMailContent = null;
      
      private var _linkContent:UiFriendInviteLinkContent = null;
      
      private var _tabMail:UiTabButton = null;
      
      private var _tabLink:UiTabButton = null;
      
      public function DialogFriendInvite()
      {
         _isOpen = true;
         var _loc1_:SymbolDialogFriendInviteGeneric = new SymbolDialogFriendInviteGeneric();
         super(_loc1_);
         _queued = false;
         _loc1_.txtDialogTitle.text = LocText.current.text("dialog/friend_invite/title");
         _loc1_.txtInfo.text = LocText.current.text("dialog/friend_invite/header_info",CConstant.friend_invite_reward_premium_currency_amount,CConstant.friend_invite_reward_level);
         _mailContent = new UiFriendInviteMailContent(_loc1_.mailContent,close);
         _linkContent = new UiFriendInviteLinkContent(_loc1_.linkContent);
         _tabMail = new UiTabButton(_loc1_.tabMail,LocText.current.text("dialog/friend_invite/category_mail"),"",onSwitchTabs);
         _tabLink = new UiTabButton(_loc1_.tabLink,LocText.current.text("dialog/friend_invite/category_link"),"",onSwitchTabs);
         _btnClose = new UiButton(_loc1_.btnClose,"",onClickClose);
         switchTabs(_tabMail);
      }
      
      public static function get isOpen() : Boolean
      {
         return _isOpen;
      }
      
      override public function dispose() : void
      {
         _btnClose.dispose();
         _btnClose = null;
         _tabMail.dispose();
         _tabMail = null;
         _tabLink.dispose();
         _tabLink = null;
         super.dispose();
      }
      
      override public function close(param1:Function = null) : void
      {
         _isOpen = false;
         super.close(param1);
      }
      
      private function onSwitchTabs(param1:InteractionEvent) : void
      {
         switchTabs(param1.target);
      }
      
      private function switchTabs(param1:IInteractionTarget) : void
      {
         _mailContent.content.visible = param1 == _tabMail;
         _linkContent.content.visible = param1 == _tabLink;
         _tabMail.tabbed = _mailContent.content.visible;
         _tabLink.tabbed = _linkContent.content.visible;
      }
      
      private function onClickClose(param1:InteractionEvent) : void
      {
         close();
      }
      
      override public function onEscape() : void
      {
         close();
      }
   }
}
