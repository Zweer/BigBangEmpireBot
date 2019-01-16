package com.playata.application.ui.elements.mailbox
{
   import com.playata.application.AppEnvironment;
   import com.playata.application.data.resource.ResourceRequest;
   import com.playata.application.data.user.User;
   import com.playata.application.platform.ServerInfo;
   import com.playata.application.ui.ViewManager;
   import com.playata.application.ui.dialogs.DialogMailbox;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.application.ui.elements.generic.button.UiTextButton;
   import com.playata.application.ui.elements.generic.checkbox.UiCheckBox;
   import com.playata.framework.application.Environment;
   import com.playata.framework.application.request.ActionRequestResponse;
   import com.playata.framework.display.InteractiveDisplayObject;
   import com.playata.framework.display.UriSprite;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.elements.mail.SymbolMailboxRequestContentGeneric;
   
   public class UiMailboxRequestsContent extends InteractiveDisplayObject
   {
      
      private static const MAX_LINES:int = 4;
      
      private static const SCROLL_VALUE:int = 1;
       
      
      private var _mailBox:DialogMailbox = null;
      
      private var _content:SymbolMailboxRequestContentGeneric = null;
      
      private var _btnInvite:UiTextButton = null;
      
      private var _btnScrollUp:UiButton = null;
      
      private var _btnScrollDown:UiButton = null;
      
      private var _btnAcceptAll:UiTextButton;
      
      private var _line1:UiMailboxRequestLine = null;
      
      private var _line2:UiMailboxRequestLine = null;
      
      private var _line3:UiMailboxRequestLine = null;
      
      private var _line4:UiMailboxRequestLine = null;
      
      private var _offset:int = 0;
      
      private var _friendInviteImagesLoaded:Boolean = false;
      
      private var _resourceRequests:Vector.<ResourceRequest>;
      
      private var _initialized:Boolean = false;
      
      private var _friendUserIds:Vector.<int>;
      
      private var _listLocked:Boolean = false;
      
      private var _currentPendingResourceRequests:int = 0;
      
      private var _ckbFriendAndTeamRequestsOnly:UiCheckBox = null;
      
      public function UiMailboxRequestsContent(param1:DialogMailbox, param2:SymbolMailboxRequestContentGeneric)
      {
         _resourceRequests = new Vector.<ResourceRequest>();
         _friendUserIds = new Vector.<int>();
         _mailBox = param1;
         _content = param2;
         super(_content);
         _content.txtFriendRequestsOnly.text = LocText.current.text("dialog/mailbox_requests/friend_requests_only");
         _content.txtNoRequests.text = LocText.current.text("dialog/mailbox_requests/no_requests");
         _btnInvite = new UiTextButton(_content.btnInvite,LocText.current.text("dialog/mailbox_requests/button_invite"),"",onClickInvite);
         _btnScrollUp = new UiButton(_content.btnUp,"",onClickScrollUp);
         _btnScrollDown = new UiButton(_content.btnDown,"",onClickScrollDown);
         _btnAcceptAll = new UiTextButton(_content.btnAcceptAll,LocText.current.text("dialog/mailbox_requests/button_accept_all"),"",onClickAcceptAll);
         _btnAcceptAll.visible = false;
         _line1 = new UiMailboxRequestLine(_content.line1,1,onAcceptDecline);
         _line2 = new UiMailboxRequestLine(_content.line2,2,onAcceptDecline);
         _line3 = new UiMailboxRequestLine(_content.line3,3,onAcceptDecline);
         _line4 = new UiMailboxRequestLine(_content.line4,4,onAcceptDecline);
         onMouseWheel.add(handleMouseWheel);
         _ckbFriendAndTeamRequestsOnly = new UiCheckBox(_content.ckbFriendRequestsOnly,User.current.getSettingValue("friend_requests_only") === true,"",onFriendAndTeamRequestsOnlyChanged,null,_content.txtFriendRequestsOnly);
         _ckbFriendAndTeamRequestsOnly.content.visible = AppEnvironment.appPlatform.isFriendbarSupported;
         _content.txtFriendRequestsOnly.visible = AppEnvironment.appPlatform.isFriendbarSupported;
         _btnInvite.visible = AppEnvironment.appPlatform.isFriendbarSupported;
         refreshList();
      }
      
      override public function dispose() : void
      {
         _btnInvite.dispose();
         _btnInvite = null;
         _btnScrollUp.dispose();
         _btnScrollUp = null;
         _btnScrollDown.dispose();
         _btnScrollDown = null;
         _btnAcceptAll.dispose();
         _btnAcceptAll = null;
         _line1.dispose();
         _line1 = null;
         _line2.dispose();
         _line2 = null;
         _line3.dispose();
         _line3 = null;
         _line4.dispose();
         _line4 = null;
         _ckbFriendAndTeamRequestsOnly.dispose();
         _ckbFriendAndTeamRequestsOnly = null;
         super.dispose();
      }
      
      public function loadRequests() : void
      {
         if(User.current.character.pendingResourceRequests == _currentPendingResourceRequests && _currentPendingResourceRequests > 0)
         {
            return;
         }
         _currentPendingResourceRequests = User.current.character.pendingResourceRequests;
         Environment.application.sendActionRequest("getPendingResourceRequests",{},handleRequests);
      }
      
      private function onAcceptDecline(param1:ResourceRequest) : void
      {
         resourceRequest = param1;
         if(!resourceRequest || !_line1)
         {
            return;
         }
         var currentLine:UiMailboxRequestLine = null;
         if(_line1.resourceRequest && _line1.resourceRequest.id == resourceRequest.id)
         {
            currentLine = _line1;
         }
         if(_line2.resourceRequest && _line2.resourceRequest.id == resourceRequest.id)
         {
            currentLine = _line2;
         }
         if(_line3.resourceRequest && _line3.resourceRequest.id == resourceRequest.id)
         {
            currentLine = _line3;
         }
         if(_line4.resourceRequest && _line4.resourceRequest.id == resourceRequest.id)
         {
            currentLine = _line4;
         }
         if(!currentLine)
         {
            return;
         }
         _listLocked = true;
         var refreshCallback:Function = function():void
         {
            currentLine.content.alpha = 1;
            if(_resourceRequests && _resourceRequests.indexOf(resourceRequest) != -1)
            {
               _resourceRequests.splice(_resourceRequests.indexOf(resourceRequest),1);
            }
            refreshList();
            _listLocked = false;
         };
         currentLine.content.tweenTo(0.5,{
            "alpha":0,
            "onComplete":refreshCallback
         });
      }
      
      private function onClickAcceptAll(param1:InteractionEvent) : void
      {
         Environment.application.sendActionRequest("acceptAllResourceRequests",{},handleRequests);
      }
      
      public function get content() : SymbolMailboxRequestContentGeneric
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
      
      private function onFriendAndTeamRequestsOnlyChanged(param1:Boolean) : void
      {
         User.current.setSettingValue("friend_requests_only",param1);
         refreshResourceRequests();
         refreshList();
      }
      
      private function refreshResourceRequests() : void
      {
         var _loc1_:* = undefined;
         if(!_ckbFriendAndTeamRequestsOnly)
         {
            return;
         }
         if(!_ckbFriendAndTeamRequestsOnly.checked)
         {
            if(!User.current || !User.current.character)
            {
               _resourceRequests = new Vector.<ResourceRequest>();
            }
            else
            {
               _resourceRequests = User.current.character.resourceRequests;
            }
         }
         else
         {
            _loc1_ = User.current.character.resourceRequests;
            _resourceRequests = new Vector.<ResourceRequest>();
            var _loc4_:int = 0;
            var _loc3_:* = _loc1_;
            for each(var _loc2_ in _loc1_)
            {
               if(_loc2_.isFromFriend(_friendUserIds) || _loc2_.isFromGuildMember)
               {
                  _resourceRequests.push(_loc2_);
               }
            }
         }
      }
      
      private function onClickInvite(param1:InteractionEvent) : void
      {
         _mailBox.close();
         ViewManager.instance.showFriendInvitationDialog();
      }
      
      private function onClickScrollUp(param1:InteractionEvent) : void
      {
         scrollUp(1,false);
      }
      
      private function onClickScrollDown(param1:InteractionEvent) : void
      {
         scrollDown(1,false);
      }
      
      private function scrollUp(param1:int, param2:Boolean) : void
      {
         if(!_btnScrollUp.visible || _listLocked)
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
         if(!_btnScrollDown.visible || _listLocked)
         {
            return;
         }
         _offset = _offset + param1;
         if(_offset > currentRequestCount - 4)
         {
            _offset = currentRequestCount - 4;
            param2 = false;
         }
         if(param2)
         {
            Environment.audio.playFX("ui_button_click.mp3");
         }
         refreshList();
      }
      
      private function get currentRequestCount() : int
      {
         return _resourceRequests.length;
      }
      
      public function refreshList() : void
      {
         if(!_btnInvite)
         {
            return;
         }
         _mailBox.refreshRequestTabButton();
         _content.txtNoRequests.visible = _resourceRequests.length == 0 && _initialized;
         if(_initialized && _content.txtNoRequests.visible)
         {
            if(!_friendInviteImagesLoaded)
            {
               _content.photo1.photo.removeAllChildren();
               _content.photo2.photo.removeAllChildren();
               _content.photo3.photo.removeAllChildren();
               _content.photo1.photo.addChild(UriSprite.load(ServerInfo.assetURL("friend_invite/friend_invite_photo1","png"),115,115,true,1));
               _content.photo2.photo.addChild(UriSprite.load(ServerInfo.assetURL("friend_invite/friend_invite_photo3","png"),115,115,true,1));
               _content.photo3.photo.addChild(UriSprite.load(ServerInfo.assetURL("friend_invite/friend_invite_photo2","png"),115,115,true,1));
               _friendInviteImagesLoaded = true;
            }
            _content.photo1.visible = true;
            _content.photo2.visible = true;
            _content.photo3.visible = true;
            _btnInvite.visible = true;
            _btnAcceptAll.visible = false;
         }
         else
         {
            _content.photo1.visible = false;
            _content.photo2.visible = false;
            _content.photo3.visible = false;
            _btnInvite.visible = false;
            _btnAcceptAll.visible = _initialized;
         }
         _btnScrollUp.visible = _resourceRequests.length > 4;
         _btnScrollDown.visible = _resourceRequests.length > 4;
         _btnScrollUp.buttonEnabled = _offset > 0;
         _btnScrollDown.buttonEnabled = _offset < currentRequestCount - 4;
         _line1.refresh(_resourceRequests.length >= _offset + 1?_resourceRequests[_offset + 0]:null,1);
         _line2.refresh(_resourceRequests.length >= _offset + 2?_resourceRequests[_offset + 1]:null,2);
         _line3.refresh(_resourceRequests.length >= _offset + 3?_resourceRequests[_offset + 2]:null,3);
         _line4.refresh(_resourceRequests.length >= _offset + 4?_resourceRequests[_offset + 3]:null,4);
      }
      
      public function resetPendingResourceRequests() : void
      {
         if(_currentPendingResourceRequests > 0)
         {
            Environment.application.sendActionRequest("resetPendingResourceRequests",{},handleRequests);
         }
      }
      
      private function handleRequests(param1:ActionRequestResponse) : void
      {
         var _loc4_:* = param1.action;
         switch(_loc4_)
         {
            case "getPendingResourceRequests":
               if(param1.error == "")
               {
                  Environment.application.updateData(param1.data);
                  if(param1.appResponse.friend_user_ids)
                  {
                     _loc4_ = 0;
                     var _loc3_:* = param1.appResponse.friend_user_ids;
                     for each(var _loc2_ in param1.appResponse.friend_user_ids)
                     {
                        _friendUserIds.push(_loc2_);
                     }
                  }
                  _initialized = true;
                  refreshResourceRequests();
                  refreshList();
               }
               else
               {
                  Environment.reportError(param1.error,param1.request);
               }
               break;
            case "resetPendingResourceRequests":
               if(param1.error == "")
               {
                  Environment.application.updateData(param1.data);
               }
               else
               {
                  Environment.reportError(param1.error,param1.request);
               }
               break;
            case "acceptAllResourceRequests":
               if(param1.error == "")
               {
                  Environment.application.updateData(param1.data);
                  if(param1.appResponse.friend_user_ids)
                  {
                     var _loc6_:int = 0;
                     var _loc5_:* = param1.appResponse.friend_user_ids;
                     for each(_loc2_ in param1.appResponse.friend_user_ids)
                     {
                        _friendUserIds.push(_loc2_);
                     }
                  }
                  _initialized = true;
                  refreshResourceRequests();
                  refreshList();
               }
               else if(param1.error != "errAcceptAllResourceRequestsNoValidResourceRequests")
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
