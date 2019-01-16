package com.playata.application.ui.dialogs
{
   import com.playata.application.AppEnvironment;
   import com.playata.application.data.user.User;
   import com.playata.application.ui.ViewManager;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.application.ui.elements.generic.dialog.UiDialog;
   import com.playata.application.ui.elements.generic.tab.UiTabButton;
   import com.playata.application.ui.elements.mailbox.UiMailboxIgnoreContent;
   import com.playata.application.ui.elements.mailbox.UiMailboxMailContent;
   import com.playata.application.ui.elements.mailbox.UiMailboxRequestsContent;
   import com.playata.framework.application.Environment;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.dialogs.SymbolDialogMailboxGeneric;
   
   public class DialogMailbox extends UiDialog
   {
       
      
      private var _btnHelp:UiButton = null;
      
      private var _btnClose:UiButton = null;
      
      private var _btnTabReceived:UiTabButton = null;
      
      private var _btnTabSent:UiTabButton = null;
      
      private var _btnTabRequests:UiTabButton = null;
      
      private var _btnTabIgnored:UiTabButton = null;
      
      private var _mailContent:UiMailboxMailContent = null;
      
      private var _requestsContent:UiMailboxRequestsContent = null;
      
      private var _ignoreContent:UiMailboxIgnoreContent = null;
      
      private var _requestsShown:Boolean = false;
      
      public function DialogMailbox(param1:Boolean = false)
      {
         var _loc2_:SymbolDialogMailboxGeneric = new SymbolDialogMailboxGeneric();
         super(_loc2_);
         _queued = false;
         _loc2_.txtDialogTitle.text = LocText.current.text("dialog/mailbox/title");
         _btnClose = new UiButton(_loc2_.btnClose,"",onClickClose);
         _btnHelp = new UiButton(_loc2_.btnHelp,LocText.current.text("general/button_help"),onClickHelp);
         _btnTabReceived = new UiTabButton(_loc2_.btnTabReceived,LocText.current.text("dialog/mailbox/button_tab_received",""),"",onClickTabReceived);
         _btnTabSent = new UiTabButton(_loc2_.btnTabSent,LocText.current.text("dialog/mailbox/button_tab_sent"),"",onClickTabSent);
         _btnTabRequests = new UiTabButton(_loc2_.btnTabRequests,LocText.current.text("dialog/mailbox/button_tab_requests"),"",onClickTabRequests);
         _btnTabIgnored = new UiTabButton(_loc2_.btnTabIgnored,LocText.current.text("dialog/mailbox/button_tab_ignored"),"",onClickTabIgnored);
         refreshRequestTabButton();
         _btnTabReceived.tabbed = true;
         _btnTabSent.tabbed = false;
         _btnTabRequests.tabbed = false;
         _btnTabIgnored.tabbed = false;
         if(!AppEnvironment.appPlatform.isResourceRequestAllowed)
         {
            _btnTabRequests.visible = false;
            _loc2_.btnTabIgnored.x = _loc2_.btnTabIgnored.x - 95;
            _loc2_.btnTabReceived.x = _loc2_.btnTabReceived.x + 95;
            _loc2_.btnTabSent.x = _loc2_.btnTabSent.x + 95;
         }
         _ignoreContent = new UiMailboxIgnoreContent(this,_loc2_.ignoreContent);
         _mailContent = new UiMailboxMailContent(this,_loc2_.mailContent);
         _requestsContent = new UiMailboxRequestsContent(this,_loc2_.requestContent);
         mailContent.content.visible = true;
         requestsContent.content.visible = false;
         ignoreContent.content.visible = false;
         if(param1 || User.current.character.newMessages <= 0 && User.current.character.pendingResourceRequests > 0)
         {
            onClickTabRequests(null);
         }
         else
         {
            mailContent.loadMessages();
         }
      }
      
      override public function dispose() : void
      {
         if(_btnClose == null)
         {
            return;
         }
         _mailContent.dispose();
         _mailContent = null;
         _requestsContent.dispose();
         _requestsContent = null;
         _ignoreContent.dispose();
         _ignoreContent = null;
         _btnClose.dispose();
         _btnClose = null;
         _btnHelp.dispose();
         _btnHelp = null;
         _btnTabReceived.dispose();
         _btnTabReceived = null;
         _btnTabSent.dispose();
         _btnTabSent = null;
         _btnTabRequests.dispose();
         _btnTabRequests = null;
         _btnTabIgnored.dispose();
         _btnTabIgnored = null;
         super.dispose();
      }
      
      public function get mailContent() : UiMailboxMailContent
      {
         return _mailContent;
      }
      
      public function get requestsContent() : UiMailboxRequestsContent
      {
         return _requestsContent;
      }
      
      public function get ignoreContent() : UiMailboxIgnoreContent
      {
         return _ignoreContent;
      }
      
      private function onClickClose(param1:InteractionEvent) : void
      {
         mailContent.closeDialog();
      }
      
      private function onClickTabReceived(param1:InteractionEvent) : void
      {
         if(_btnTabReceived.tabbed == true)
         {
            return;
         }
         var _loc2_:SymbolDialogMailboxGeneric = _vo as SymbolDialogMailboxGeneric;
         _btnTabReceived.tabbed = true;
         _btnTabSent.tabbed = false;
         _btnTabRequests.tabbed = false;
         _btnTabIgnored.tabbed = false;
         mailContent.loadMessages();
         mailContent.resetList();
         mailContent.refreshList(true);
         mailContent.content.visible = true;
         requestsContent.content.visible = false;
         ignoreContent.content.visible = false;
      }
      
      private function onClickTabSent(param1:InteractionEvent) : void
      {
         if(_btnTabSent.tabbed == true)
         {
            return;
         }
         var _loc2_:SymbolDialogMailboxGeneric = _vo as SymbolDialogMailboxGeneric;
         _btnTabReceived.tabbed = false;
         _btnTabSent.tabbed = true;
         _btnTabRequests.tabbed = false;
         _btnTabIgnored.tabbed = false;
         mailContent.resetList();
         mailContent.refreshList(true);
         mailContent.content.visible = true;
         requestsContent.content.visible = false;
         ignoreContent.content.visible = false;
      }
      
      private function onClickTabRequests(param1:InteractionEvent) : void
      {
         var _loc2_:SymbolDialogMailboxGeneric = _vo as SymbolDialogMailboxGeneric;
         _btnTabReceived.tabbed = false;
         _btnTabSent.tabbed = false;
         _btnTabRequests.tabbed = true;
         _btnTabIgnored.tabbed = false;
         mailContent.content.visible = false;
         requestsContent.content.visible = true;
         ignoreContent.content.visible = false;
         requestsContent.loadRequests();
         _requestsShown = true;
      }
      
      private function onClickTabIgnored(param1:InteractionEvent) : void
      {
         var _loc2_:SymbolDialogMailboxGeneric = _vo as SymbolDialogMailboxGeneric;
         _btnTabReceived.tabbed = false;
         _btnTabSent.tabbed = false;
         _btnTabRequests.tabbed = false;
         _btnTabIgnored.tabbed = true;
         mailContent.content.visible = false;
         requestsContent.content.visible = false;
         ignoreContent.content.visible = true;
      }
      
      public function get isOpen() : Boolean
      {
         return _btnTabSent != null;
      }
      
      public function get isReceivedTabbed() : Boolean
      {
         return _btnTabReceived.tabbed;
      }
      
      public function get isSentTabbed() : Boolean
      {
         return _btnTabSent.tabbed;
      }
      
      public function refreshReceivedTabButton() : void
      {
         if(_btnTabReceived == null)
         {
            return;
         }
         if(User.current.character.newMessages == 0)
         {
            _btnTabReceived.caption = LocText.current.text("dialog/mailbox/button_tab_received","");
         }
         else
         {
            _btnTabReceived.caption = LocText.current.text("dialog/mailbox/button_tab_received"," (" + User.current.character.newMessages.toString() + ")");
         }
      }
      
      public function refreshRequestTabButton() : void
      {
         if(_btnTabRequests == null)
         {
            return;
         }
         if(User.current.character.pendingResourceRequests == 0)
         {
            _btnTabRequests.caption = LocText.current.text("dialog/mailbox/button_tab_requests");
         }
         else
         {
            _btnTabRequests.caption = LocText.current.text("dialog/mailbox/button_tab_requests") + " (" + User.current.character.pendingResourceRequests.toString() + ")";
         }
      }
      
      public function refreshIgnoreContent() : void
      {
         if(_ignoreContent)
         {
            _ignoreContent.refreshList(true);
         }
      }
      
      private function onClickHelp(param1:InteractionEvent) : void
      {
         showTutorialDialog();
      }
      
      private function showTutorialDialog() : void
      {
         Environment.panelManager.showDialog(new DialogTutorialPopup(LocText.current.text("dialog/tutorial/mailbox/title"),LocText.current.text("dialog/tutorial/mailbox/text"),onTutorialDialogClosed));
      }
      
      private function onTutorialDialogClosed() : void
      {
         User.current.character.setTutorialFlag("mailbox");
      }
      
      override public function close(param1:Function = null) : void
      {
         ViewManager.instance.baseUserPanel.resetCurrentMailboxDialog();
         super.close(param1);
         if(_requestsShown && _requestsContent)
         {
            _requestsContent.resetPendingResourceRequests();
         }
      }
      
      override public function onEscape() : void
      {
         if(mailContent)
         {
            mailContent.closeDialog();
         }
      }
   }
}
