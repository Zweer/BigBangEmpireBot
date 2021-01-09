package com.playata.application.ui.elements.stream
{
   import com.playata.application.AppEnvironment;
   import com.playata.application.data.resource.ResourceRequest;
   import com.playata.application.data.user.User;
   import com.playata.application.platform.ServerInfo;
   import com.playata.application.ui.ViewManager;
   import com.playata.application.ui.elements.generic.button.UiTextButton;
   import com.playata.application.ui.elements.generic.checkbox.UiCheckBox;
   import com.playata.framework.application.Environment;
   import com.playata.framework.application.request.ActionRequestResponse;
   import com.playata.framework.display.ui.controls.List;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import com.playata.framework.tween.Tween;
   import visuals.ui.elements.stream.SymbolResourceRequestContainerGeneric;
   
   public class UiResourceRequestContainer
   {
       
      
      private var _content:SymbolResourceRequestContainerGeneric = null;
      
      private var _btnInvite:UiTextButton = null;
      
      private var _btnAcceptAll:UiTextButton;
      
      private var _list:UiResourceRequestList = null;
      
      private var _offset:int = 0;
      
      private var _friendInviteImagesLoaded:Boolean = false;
      
      private var _resourceRequests:Vector.<ResourceRequest>;
      
      private var _initialized:Boolean = false;
      
      private var _listLocked:Boolean = false;
      
      private var _ckbFriendAndTeamRequestsOnly:UiCheckBox = null;
      
      public function UiResourceRequestContainer(param1:SymbolResourceRequestContainerGeneric)
      {
         _resourceRequests = new Vector.<ResourceRequest>();
         super();
         _content = param1;
         _content.txtTitle.text = LocText.current.text("panel_streams/tab_resource_request_tooltip");
         _content.txtFriendRequestsOnly.text = LocText.current.text("dialog/mailbox_requests/friend_requests_only");
         _btnInvite = new UiTextButton(_content.list.btnInvite,LocText.current.text("dialog/mailbox_requests/button_invite"),"",onClickInvite);
         _btnAcceptAll = new UiTextButton(_content.btnAcceptAll,LocText.current.text("dialog/mailbox_requests/button_accept_all"),"",onClickAcceptAll);
         _btnAcceptAll.visible = false;
         _list = new UiResourceRequestList(_content.list,onAcceptDecline);
         _list.onListUpdated.add(refreshUI);
         _ckbFriendAndTeamRequestsOnly = new UiCheckBox(_content.ckbFriendRequestsOnly,false,"",onFriendAndTeamRequestsOnlyChanged,null,_content.txtFriendRequestsOnly);
         _ckbFriendAndTeamRequestsOnly.content.visible = AppEnvironment.appPlatform.isFriendbarSupported;
         _content.txtFriendRequestsOnly.visible = AppEnvironment.appPlatform.isFriendbarSupported;
         _btnInvite.visible = AppEnvironment.appPlatform.isFriendbarSupported;
         _list.refreshList();
      }
      
      public function refreshLocalization() : void
      {
         _content.txtTitle.text = LocText.current.text("panel_streams/tab_resource_request_tooltip");
         _content.txtFriendRequestsOnly.text = LocText.current.text("dialog/mailbox_requests/friend_requests_only");
         _btnInvite.caption = LocText.current.text("dialog/mailbox_requests/button_invite");
         _btnAcceptAll.caption = LocText.current.text("dialog/mailbox_requests/button_accept_all");
         _list.refreshLocalization();
      }
      
      public function dispose() : void
      {
         _btnInvite.dispose();
         _btnInvite = null;
         _btnAcceptAll.dispose();
         _btnAcceptAll = null;
         _ckbFriendAndTeamRequestsOnly.dispose();
         _ckbFriendAndTeamRequestsOnly = null;
      }
      
      public function get content() : SymbolResourceRequestContainerGeneric
      {
         return _content;
      }
      
      public function init() : void
      {
         _ckbFriendAndTeamRequestsOnly.checked = User.current.friendRequestsOnly;
      }
      
      public function reset() : void
      {
         _content.visible = false;
         _list.clear();
         _offset = 0;
         _friendInviteImagesLoaded = false;
         _resourceRequests = new Vector.<ResourceRequest>();
         _initialized = false;
         _listLocked = false;
      }
      
      public function refresh() : void
      {
         if(!_content.visible)
         {
            return;
         }
         if(User.current.character.streams.resourceRequests.hasNewResourceRequests)
         {
            Environment.application.sendActionRequest("getStreamMessages",{
               "stream_type":"r",
               "stream_id":User.current.character.id,
               "start_message_id":0
            },handleRequests);
         }
         else
         {
            refreshResourceRequests();
         }
      }
      
      private function refreshUI(param1:List) : void
      {
         _content.list.txtNoRequests.visible = _list.currentItemCount == 0 && _initialized;
         _content.list.noRequestsBackground.visible = _list.currentItemCount == 0 && _initialized;
         if(_initialized && _content.list.txtNoRequests.visible)
         {
            if(!_friendInviteImagesLoaded)
            {
               _content.list.photo1.photo.setUriSprite(ServerInfo.assetURL("friend_invite/friend_invite_photo1","png"),115,115,true,2);
               _content.list.photo2.photo.setUriSprite(ServerInfo.assetURL("friend_invite/friend_invite_photo3","png"),115,115,true,2);
               _content.list.photo3.photo.setUriSprite(ServerInfo.assetURL("friend_invite/friend_invite_photo2","png"),115,115,true,2);
               _friendInviteImagesLoaded = true;
            }
            _content.list.photo1.visible = true;
            _content.list.photo2.visible = true;
            _content.list.photo3.visible = true;
            _btnInvite.visible = true;
            _btnAcceptAll.visible = false;
         }
         else
         {
            _content.list.photo1.visible = false;
            _content.list.photo2.visible = false;
            _content.list.photo3.visible = false;
            _btnInvite.visible = false;
            _btnAcceptAll.visible = _initialized;
         }
      }
      
      private function onAcceptDecline(param1:ResourceRequest, param2:Object = null) : void
      {
         resourceRequest = param1;
         data = param2;
         if(!resourceRequest)
         {
            return;
         }
         var currentLine:UiResourceRequestLine = _list.getLineForItem(resourceRequest) as UiResourceRequestLine;
         if(!currentLine)
         {
            return;
         }
         _listLocked = true;
         if(data)
         {
            Environment.application.updateData(data);
         }
         var refreshCallback:Function = function():void
         {
            currentLine.content.alpha = 1;
            _listLocked = false;
            refreshResourceRequests();
         };
         Tween.to(currentLine.content,0.5,{
            "alpha":0,
            "onComplete":refreshCallback
         });
      }
      
      private function onClickAcceptAll(param1:InteractionEvent) : void
      {
         Environment.application.sendActionRequest("acceptAllResourceRequests",{},handleRequests);
      }
      
      private function onFriendAndTeamRequestsOnlyChanged(param1:Boolean) : void
      {
         User.current.friendRequestsOnly = param1;
         refreshResourceRequests();
      }
      
      private function refreshResourceRequests() : void
      {
         var _loc1_:* = undefined;
         var _loc3_:* = undefined;
         if(_listLocked)
         {
            return;
         }
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
            try
            {
               _loc1_ = User.current.character.resourceRequests;
               _resourceRequests = new Vector.<ResourceRequest>();
               _loc3_ = User.current.character.friendUserIds;
               var _loc6_:int = 0;
               var _loc5_:* = _loc1_;
               for each(var _loc2_ in _loc1_)
               {
                  if(_loc2_)
                  {
                     if(_loc2_.isFromFriend(_loc3_) || _loc2_.isFromGuildMember)
                     {
                        _resourceRequests.push(_loc2_);
                     }
                  }
               }
            }
            catch(e:Error)
            {
            }
         }
         _list.update(_resourceRequests);
      }
      
      private function onClickInvite(param1:InteractionEvent) : void
      {
         ViewManager.instance.showFriendInvitationDialog();
      }
      
      private function handleRequests(param1:ActionRequestResponse) : void
      {
         var _loc2_:* = param1.action;
         switch(_loc2_)
         {
            case "getStreamMessages":
               if(param1.error == "")
               {
                  User.current.character.streams.resourceRequests.markAllAsRead();
                  Environment.application.updateData(param1.data);
                  _initialized = true;
                  refreshResourceRequests();
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
                  _initialized = true;
                  refreshResourceRequests();
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
