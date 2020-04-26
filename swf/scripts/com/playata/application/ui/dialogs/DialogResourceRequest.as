package com.playata.application.ui.dialogs
{
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.application.ui.elements.generic.dialog.UiDialog;
   import com.playata.application.ui.elements.generic.tab.UiTabButton;
   import com.playata.application.ui.elements.resource.UiResourceRequestFriendContent;
   import com.playata.application.ui.elements.resource.UiResourceRequestLinkContent;
   import com.playata.framework.input.IInteractionTarget;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.dialogs.SymbolDialogResourceRequestGeneric;
   
   public class DialogResourceRequest extends UiDialog
   {
       
      
      private var _btnClose:UiButton = null;
      
      private var _friendContent:UiResourceRequestFriendContent = null;
      
      private var _linkContent:UiResourceRequestLinkContent = null;
      
      private var _tabFriends:UiTabButton = null;
      
      private var _tabLink:UiTabButton = null;
      
      private var _featureType:int = 0;
      
      public function DialogResourceRequest(param1:int)
      {
         _featureType = param1;
         var _loc2_:SymbolDialogResourceRequestGeneric = new SymbolDialogResourceRequestGeneric();
         super(_loc2_);
         _queued = false;
         _loc2_.txtDialogTitle.text = LocText.current.text("dialog/resource_request/title");
         _friendContent = new UiResourceRequestFriendContent(_loc2_.friendContent,_featureType,onCloseDialog);
         _linkContent = new UiResourceRequestLinkContent(_loc2_.linkContent,_featureType);
         _tabFriends = new UiTabButton(_loc2_.tabFriends,LocText.current.text("dialog/resource_request/category_friends"),"",onSwitchTabs);
         _tabLink = new UiTabButton(_loc2_.tabLink,LocText.current.text("dialog/resource_request/category_link"),"",onSwitchTabs);
         _btnClose = new UiButton(_loc2_.btnClose,"",onClickClose);
         if(platform.isFriendbarSupported)
         {
            _friendContent.initialize();
            switchTabs(_tabFriends);
            if(!platform.isResourceRequestViaLinkAllowed)
            {
               _tabFriends.visible = false;
               _tabLink.visible = false;
            }
         }
         else
         {
            _tabFriends.visible = false;
            _tabLink.visible = false;
            switchTabs(_tabLink);
         }
      }
      
      override public function dispose() : void
      {
         _btnClose.dispose();
         _btnClose = null;
         _tabFriends.dispose();
         _tabFriends = null;
         _tabLink.dispose();
         _tabLink = null;
         super.dispose();
      }
      
      private function onCloseDialog() : void
      {
         close();
      }
      
      private function onSwitchTabs(param1:InteractionEvent) : void
      {
         switchTabs(param1.target);
      }
      
      private function switchTabs(param1:IInteractionTarget) : void
      {
         _friendContent.content.visible = param1 == _tabFriends;
         _linkContent.content.visible = param1 == _tabLink;
         _tabFriends.tabbed = _friendContent.content.visible;
         _tabLink.tabbed = _linkContent.content.visible;
         var _loc2_:SymbolDialogResourceRequestGeneric = _vo as SymbolDialogResourceRequestGeneric;
         if(_tabFriends.tabbed)
         {
            _loc2_.txtInfo.text = LocText.current.text("dialog/resource_request/friend/header_info");
         }
         else
         {
            _loc2_.txtInfo.text = LocText.current.text("dialog/resource_request/link/header_info") + " " + LocText.current.text("dialog/resource_request/link_info");
            _linkContent.refreshAdvertisment();
            platform.trackPageView("/dialog/DialogResourceRequest/tab_link");
         }
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
