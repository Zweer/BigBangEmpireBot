package com.playata.application.ui.elements.resource
{
   import com.playata.application.AppEnvironment;
   import com.playata.application.data.dataobject.DOFriend;
   import com.playata.application.data.friend.Friend;
   import com.playata.application.data.resource.ResourceFeature;
   import com.playata.application.data.user.User;
   import com.playata.application.platform.ServerInfo;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.application.ui.elements.generic.button.UiTextButton;
   import com.playata.application.ui.elements.generic.checkbox.UiCheckBox;
   import com.playata.framework.application.Environment;
   import com.playata.framework.application.request.ActionRequestResponse;
   import com.playata.framework.core.Core;
   import com.playata.framework.core.util.AlphaNumericSortUtil;
   import com.playata.framework.core.util.StringUtil;
   import com.playata.framework.display.InteractiveDisplayObject;
   import com.playata.framework.display.ui.controls.ITextInput;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import com.playata.framework.network.request.RequestData;
   import com.playata.framework.platform.PlatformConfig;
   import visuals.ui.elements.resource_request.SymbolResourceRequestFriendContentGeneric;
   
   public class UiResourceRequestFriendContent extends InteractiveDisplayObject
   {
      
      private static const MAX_LINES:int = 10;
      
      private static const SCROLL_VALUE:int = 5;
       
      
      private var _friends:Vector.<Friend>;
      
      private var _selectedFriends:Vector.<Friend>;
      
      private var _currentFriends:Vector.<Friend>;
      
      private var _filter:String = "";
      
      private var _offset:int = 0;
      
      private var _btnSend:UiTextButton = null;
      
      private var _btnScrollUp:UiButton = null;
      
      private var _btnScrollDown:UiButton = null;
      
      private var _ckbSelectAll:UiCheckBox = null;
      
      private var _line1:UiResourceRequestFriendLine = null;
      
      private var _line2:UiResourceRequestFriendLine = null;
      
      private var _line3:UiResourceRequestFriendLine = null;
      
      private var _line4:UiResourceRequestFriendLine = null;
      
      private var _line5:UiResourceRequestFriendLine = null;
      
      private var _line6:UiResourceRequestFriendLine = null;
      
      private var _line7:UiResourceRequestFriendLine = null;
      
      private var _line8:UiResourceRequestFriendLine = null;
      
      private var _line9:UiResourceRequestFriendLine = null;
      
      private var _line10:UiResourceRequestFriendLine = null;
      
      private var _content:SymbolResourceRequestFriendContentGeneric = null;
      
      private var _featureType:int = 0;
      
      private var _onClose:Function = null;
      
      public function UiResourceRequestFriendContent(param1:SymbolResourceRequestFriendContentGeneric, param2:int, param3:Function)
      {
         _friends = new Vector.<Friend>();
         _selectedFriends = new Vector.<Friend>();
         _currentFriends = new Vector.<Friend>();
         _content = param1;
         super(_content);
         _featureType = param2;
         _onClose = param3;
         _content.txtSelectAll.text = LocText.current.text("dialog/request_resource/friend/select_all");
         _content.inputSearch.text = LocText.current.text("dialog/leaderboard/search_text");
         _content.inputSearch.onClick.add(handleSearchClick);
         _content.inputSearch.onChange.add(handleFilterChange);
         _filter = _content.inputSearch.text;
         _line1 = new UiResourceRequestFriendLine(_content.line1,1,onClickFriend);
         _line2 = new UiResourceRequestFriendLine(_content.line2,2,onClickFriend);
         _line3 = new UiResourceRequestFriendLine(_content.line3,3,onClickFriend);
         _line4 = new UiResourceRequestFriendLine(_content.line4,4,onClickFriend);
         _line5 = new UiResourceRequestFriendLine(_content.line5,5,onClickFriend);
         _line6 = new UiResourceRequestFriendLine(_content.line6,6,onClickFriend);
         _line7 = new UiResourceRequestFriendLine(_content.line7,7,onClickFriend);
         _line8 = new UiResourceRequestFriendLine(_content.line8,8,onClickFriend);
         _line9 = new UiResourceRequestFriendLine(_content.line9,9,onClickFriend);
         _line10 = new UiResourceRequestFriendLine(_content.line10,10,onClickFriend);
         _ckbSelectAll = new UiCheckBox(_content.ckbSelectAll,false,"",onSelectAllChange,null,_content.txtSelectAll);
         _btnSend = new UiTextButton(_content.btnSend,LocText.current.text("dialog/resource_request/friend/button_send"),"",onClickSend);
         _btnScrollUp = new UiButton(_content.btnUp,"",onClickScrollUp);
         _btnScrollDown = new UiButton(_content.btnDown,"",onClickScrollDown);
         _btnScrollUp.visible = false;
         _btnScrollDown.visible = false;
         _content.txtNoFriends.visible = false;
         _content.line1.visible = false;
         _content.line2.visible = false;
         _content.line3.visible = false;
         _content.line4.visible = false;
         _content.line5.visible = false;
         _content.line6.visible = false;
         _content.line7.visible = false;
         _content.line8.visible = false;
         _content.line9.visible = false;
         _content.line10.visible = false;
         onMouseWheel.add(handleMouseWheel);
      }
      
      override public function dispose() : void
      {
         _ckbSelectAll.dispose();
         _ckbSelectAll = null;
         _btnSend.dispose();
         _btnSend = null;
         _btnScrollUp.dispose();
         _btnScrollUp = null;
         _btnScrollDown.dispose();
         _btnScrollDown = null;
         _line1.dispose();
         _line1 = null;
         _line2.dispose();
         _line2 = null;
         _line3.dispose();
         _line3 = null;
         _line4.dispose();
         _line4 = null;
         _line5.dispose();
         _line5 = null;
         _line6.dispose();
         _line6 = null;
         _line7.dispose();
         _line7 = null;
         _line8.dispose();
         _line8 = null;
         _line9.dispose();
         _line9 = null;
         _line10.dispose();
         _line10 = null;
         super.dispose();
      }
      
      public function initialize() : void
      {
         var _loc1_:RequestData = new RequestData({
            "platform":AppEnvironment.appPlatform.id,
            "feature_type":_featureType
         });
         if(AppEnvironment.appPlatform.id == "facebook" && Core.config.hasCfg("facebook_access_token"))
         {
            _loc1_.setString("facebook_access_token",PlatformConfig.facebookAccessToken);
            _loc1_.setString("facebook_user_id",PlatformConfig.ssoInfo);
         }
         Environment.application.sendActionRequest("getAvailableResourceRequestFriends",_loc1_,handleRequests);
      }
      
      private function onSelectAllChange(param1:Boolean) : void
      {
         if(!param1)
         {
            _selectedFriends = new Vector.<Friend>();
         }
         else
         {
            _selectedFriends = new Vector.<Friend>();
            var _loc4_:int = 0;
            var _loc3_:* = _friends;
            for each(var _loc2_ in _friends)
            {
               _selectedFriends.push(_loc2_);
            }
         }
         refreshList();
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
      
      public function get content() : SymbolResourceRequestFriendContentGeneric
      {
         return _content;
      }
      
      private function onClickFriend(param1:UiResourceRequestFriendLine) : void
      {
         if(param1.checked && _selectedFriends.indexOf(param1.friend) == -1)
         {
            _selectedFriends.push(param1.friend);
         }
         else if(!param1.checked && _selectedFriends.indexOf(param1.friend) != -1)
         {
            _selectedFriends.splice(_selectedFriends.indexOf(param1.friend),1);
         }
         if(_selectedFriends.length < _friends.length)
         {
            _ckbSelectAll.checked = false;
         }
         refreshButton();
      }
      
      private function refreshButton() : void
      {
         _btnSend.buttonEnabled = _selectedFriends.length > 0;
      }
      
      private function onClickScrollUp(param1:InteractionEvent) : void
      {
         scrollUp(5,false);
      }
      
      private function onClickScrollDown(param1:InteractionEvent) : void
      {
         scrollDown(5,false);
      }
      
      private function scrollUp(param1:int, param2:Boolean) : void
      {
         if(!_btnScrollUp.visible)
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
         if(!_btnScrollDown.visible)
         {
            return;
         }
         _offset = _offset + param1;
         if(_offset > currentFriendCount - 10)
         {
            _offset = currentFriendCount - 10;
            param2 = false;
         }
         if(param2)
         {
            Environment.audio.playFX("ui_button_click.mp3");
         }
         refreshList();
      }
      
      private function get currentFriendCount() : int
      {
         return _currentFriends.length;
      }
      
      public function refreshList(param1:Boolean = false) : void
      {
         if(param1 || currentFilter.length > 0 && currentFilter != LocText.current.text("dialog/leaderboard/search_text"))
         {
            _content.txtNoFriends.text = LocText.current.text("dialog/invite_friends_platform/no_filtered_friends");
         }
         else
         {
            _content.txtNoFriends.text = LocText.current.text("dialog/invite_friends_platform/no_friends");
         }
         _currentFriends = getFilteredEntries(_friends);
         _content.txtNoFriends.visible = _currentFriends.length == 0;
         _content.line1.visible = !_content.txtNoFriends.visible;
         _content.line2.visible = !_content.txtNoFriends.visible;
         _content.line3.visible = !_content.txtNoFriends.visible;
         _content.line4.visible = !_content.txtNoFriends.visible;
         _content.line5.visible = !_content.txtNoFriends.visible;
         _content.line6.visible = !_content.txtNoFriends.visible;
         _content.line7.visible = !_content.txtNoFriends.visible;
         _content.line8.visible = !_content.txtNoFriends.visible;
         _content.line9.visible = !_content.txtNoFriends.visible;
         _content.line10.visible = !_content.txtNoFriends.visible;
         _btnScrollUp.visible = _currentFriends.length > 10;
         _btnScrollDown.visible = _currentFriends.length > 10;
         _btnScrollUp.buttonEnabled = _offset > 0;
         _btnScrollDown.buttonEnabled = _offset < currentFriendCount - 10;
         _line1.refresh(_currentFriends.length >= _offset + 1?_currentFriends[_offset + 0]:null,1,_currentFriends.length >= _offset + 1?_selectedFriends.indexOf(_currentFriends[_offset + 0]) != -1:false);
         _line2.refresh(_currentFriends.length >= _offset + 2?_currentFriends[_offset + 1]:null,2,_currentFriends.length >= _offset + 2?_selectedFriends.indexOf(_currentFriends[_offset + 1]) != -1:false);
         _line3.refresh(_currentFriends.length >= _offset + 3?_currentFriends[_offset + 2]:null,3,_currentFriends.length >= _offset + 3?_selectedFriends.indexOf(_currentFriends[_offset + 2]) != -1:false);
         _line4.refresh(_currentFriends.length >= _offset + 4?_currentFriends[_offset + 3]:null,4,_currentFriends.length >= _offset + 4?_selectedFriends.indexOf(_currentFriends[_offset + 3]) != -1:false);
         _line5.refresh(_currentFriends.length >= _offset + 5?_currentFriends[_offset + 4]:null,5,_currentFriends.length >= _offset + 5?_selectedFriends.indexOf(_currentFriends[_offset + 4]) != -1:false);
         _line6.refresh(_currentFriends.length >= _offset + 6?_currentFriends[_offset + 5]:null,6,_currentFriends.length >= _offset + 6?_selectedFriends.indexOf(_currentFriends[_offset + 5]) != -1:false);
         _line7.refresh(_currentFriends.length >= _offset + 7?_currentFriends[_offset + 6]:null,7,_currentFriends.length >= _offset + 7?_selectedFriends.indexOf(_currentFriends[_offset + 6]) != -1:false);
         _line8.refresh(_currentFriends.length >= _offset + 8?_currentFriends[_offset + 7]:null,8,_currentFriends.length >= _offset + 8?_selectedFriends.indexOf(_currentFriends[_offset + 7]) != -1:false);
         _line9.refresh(_currentFriends.length >= _offset + 9?_currentFriends[_offset + 8]:null,9,_currentFriends.length >= _offset + 9?_selectedFriends.indexOf(_currentFriends[_offset + 8]) != -1:false);
         _line10.refresh(_currentFriends.length >= _offset + 10?_currentFriends[_offset + 9]:null,10,_currentFriends.length >= _offset + 10?_selectedFriends.indexOf(_currentFriends[_offset + 9]) != -1:false);
         refreshButton();
      }
      
      private function getFilteredEntries(param1:Vector.<Friend>) : Vector.<Friend>
      {
         var _loc3_:* = false;
         if(StringUtil.isEmpty(currentFilter) || currentFilter == LocText.current.text("dialog/leaderboard/search_text"))
         {
            return param1;
         }
         var _loc2_:Vector.<Friend> = new Vector.<Friend>();
         var _loc5_:String = currentFilter.toLowerCase();
         var _loc7_:int = 0;
         var _loc6_:* = param1;
         for each(var _loc4_ in param1)
         {
            _loc3_ = _loc4_.characterName.toLowerCase().indexOf(_loc5_) != -1;
            if(_loc3_)
            {
               _loc2_.push(_loc4_);
            }
         }
         return _loc2_;
      }
      
      public function get currentFilter() : String
      {
         return _filter;
      }
      
      private function handleSearchClick(param1:InteractionEvent) : void
      {
         if(_content.inputSearch.text == LocText.current.text("dialog/leaderboard/search_text"))
         {
            _content.inputSearch.text = "";
            _filter = "";
         }
      }
      
      private function handleFilterChange(param1:ITextInput) : void
      {
         _filter = _content.inputSearch.text;
         _offset = 0;
         refreshList(true);
      }
      
      private function onClickSend(param1:InteractionEvent) : void
      {
         var _loc3_:* = null;
         var _loc2_:* = null;
         var _loc7_:int = 1;
         var _loc4_:String = "";
         var _loc6_:String = "";
         var _loc9_:int = 0;
         var _loc8_:* = _selectedFriends;
         for each(var _loc5_ in _selectedFriends)
         {
            _loc4_ = _loc4_ + _loc5_.userId.toString();
            if(_loc5_.platformUserId)
            {
               _loc6_ = _loc6_ + _loc5_.platformUserId.toString();
            }
            if(_loc7_ < _selectedFriends.length)
            {
               _loc4_ = _loc4_ + ";";
               if(_loc5_.platformUserId)
               {
                  _loc6_ = _loc6_ + ",";
               }
            }
            _loc7_++;
         }
         if(_loc6_)
         {
            _loc3_ = ServerInfo.serverId + "_" + User.current.id.toString() + ";resource_request=" + _featureType.toString();
            _loc2_ = new ResourceFeature(_featureType);
            AppEnvironment.appPlatform.sendRequest(_loc2_.getResourceRequestTitle(User.current.character.name),_loc2_.getResourceRequestMessage(User.current.character.name),_loc6_,_loc3_);
         }
         if(_loc4_)
         {
            Environment.application.sendActionRequest("createResourceRequest",{
               "feature_type":_featureType,
               "user_ids":_loc4_
            },handleRequests);
         }
      }
      
      private function sortByName(param1:Friend, param2:Friend) : int
      {
         return AlphaNumericSortUtil.compare(param1.characterName,param2.characterName);
      }
      
      private function handleRequests(param1:ActionRequestResponse) : void
      {
         var _loc2_:* = null;
         var _loc5_:* = param1.action;
         switch(_loc5_)
         {
            case "getAvailableResourceRequestFriends":
               if(param1.error == "")
               {
                  _friends = new Vector.<Friend>();
                  _loc5_ = 0;
                  var _loc4_:* = param1.appResponse.resource_request_friends;
                  for each(var _loc3_ in param1.appResponse.resource_request_friends)
                  {
                     _loc2_ = new Friend(_loc3_);
                     _friends.push(_loc2_);
                  }
                  _friends.sort(sortByName);
                  refreshList();
               }
               else
               {
                  Environment.reportError(param1.error,param1.request);
               }
               break;
            case "createResourceRequest":
               if(param1.error == "")
               {
                  Environment.application.updateData(param1.data);
                  _onClose();
               }
               else if(param1.error != "errInvalidArguments")
               {
                  if(param1.error != "errAcceptInvalidStatus")
                  {
                     Environment.reportError(param1.error,param1.request);
                  }
               }
               break;
            default:
               throw new Error("Unsupported request action \'" + param1.action + "\'!");
         }
      }
   }
}
