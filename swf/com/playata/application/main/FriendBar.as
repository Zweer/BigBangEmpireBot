package com.playata.application.main
{
   import com.playata.application.AppConfig;
   import com.playata.application.data.character.Character;
   import com.playata.application.data.friend.FriendBarImage;
   import com.playata.application.data.friendbar.FriendBarFriend;
   import com.playata.application.data.friendbar.FriendBarFriends;
   import com.playata.application.data.friendbar.FriendBarSyncStates;
   import com.playata.application.data.user.User;
   import com.playata.application.ui.ViewManager;
   import com.playata.application.ui.elements.friendbar.UiMainFriendBar;
   import com.playata.application.ui.panels.PanelBattle;
   import com.playata.application.ui.panels.PanelCharacter;
   import com.playata.framework.application.Environment;
   import com.playata.framework.application.request.ActionRequestResponse;
   import com.playata.framework.core.Core;
   import com.playata.framework.core.collection.IntMap;
   import com.playata.framework.core.logging.Logger;
   import com.playata.framework.core.timer.ITimer;
   import com.playata.framework.core.util.TimeUtil;
   import com.playata.framework.display.IImage;
   import com.playata.framework.network.request.RequestData;
   import com.playata.framework.platform.PlatformConfig;
   import visuals.ui.elements.friendbar.FriendbarSymbolApplicationGeneric;
   
   public class FriendBar
   {
      
      public static const MAX_CACHE_DURATION:int = 10;
      
      public static const SYNC_INTERVAL:int = 300000;
       
      
      private var _friendBarUI:UiMainFriendBar = null;
      
      private var _initiated:Boolean = false;
      
      private var _socketConnection:Boolean = false;
      
      private var _syncTimer:ITimer = null;
      
      private var _characterCache:IntMap;
      
      private var _characterCacheTimes:IntMap;
      
      private var _characterCheckCache:IntMap;
      
      private var _pendingImageRequests:IntMap;
      
      public function FriendBar(param1:FriendbarSymbolApplicationGeneric)
      {
         _characterCache = new IntMap();
         _characterCacheTimes = new IntMap();
         _characterCheckCache = new IntMap();
         _pendingImageRequests = new IntMap();
         super();
         _friendBarUI = new UiMainFriendBar(param1);
      }
      
      public function get isAllowed() : Boolean
      {
         return AppConfig.isFriendbarSupported;
      }
      
      public function get ui() : FriendbarSymbolApplicationGeneric
      {
         return _friendBarUI.content;
      }
      
      public function get friends() : FriendBarFriends
      {
         return _friendBarUI.friends;
      }
      
      public function dispose() : void
      {
         Logger.debug("[Friendbar] FriendBar:: Destroying...");
         if(_friendBarUI)
         {
            _friendBarUI.dispose();
            _friendBarUI = null;
         }
         if(_syncTimer != null)
         {
            _syncTimer.dispose();
            _syncTimer = null;
         }
      }
      
      public function set socketConnection(param1:Boolean) : void
      {
         _socketConnection = param1;
      }
      
      public function reset() : void
      {
         _characterCache = new IntMap();
         _characterCacheTimes = new IntMap();
         _characterCheckCache = new IntMap();
      }
      
      public function get platform() : String
      {
         return PlatformConfig.platform;
      }
      
      public function refreshLocalization() : void
      {
         if(!isAllowed)
         {
            return;
         }
         _friendBarUI.refreshLocalization();
      }
      
      public function login(param1:int, param2:String) : void
      {
         if(!isAllowed)
         {
            return;
         }
         show();
         if(!Environment.info.isNativeMobile)
         {
            initFriends(param1,param2);
         }
         if(User.current)
         {
            updateSetting("friendbar_settings",User.current.getSettingValue("friendbar_settings"));
         }
      }
      
      public function initFriends(param1:int, param2:String) : void
      {
         if(_initiated)
         {
            return;
         }
         _initiated = true;
         var _loc3_:RequestData = new RequestData({
            "existing_user_id":param1,
            "existing_session_id":param2,
            "platform":platform
         });
         if(platform == "facebook" && Core.config.hasCfg("facebook_access_token"))
         {
            _loc3_.setString("facebook_access_token",PlatformConfig.facebookAccessToken);
            _loc3_.setString("facebook_user_id",PlatformConfig.ssoInfo);
         }
         Environment.application.sendActionRequest("loginFriendBar",_loc3_,handleRequestResponse,false);
      }
      
      public function logout() : void
      {
         if(!isAllowed)
         {
            return;
         }
         _initiated = false;
         _friendBarUI.updateFriendData(null);
         hide();
      }
      
      public function show() : void
      {
         if(!isAllowed)
         {
            return;
         }
         _friendBarUI.show();
      }
      
      public function hide() : void
      {
         if(!isAllowed)
         {
            return;
         }
         _friendBarUI.hide();
      }
      
      public function updateFriendBarData() : void
      {
         if(!isAllowed)
         {
            return;
         }
         _friendBarUI.refreshUI();
      }
      
      public function syncFriendBar(param1:Boolean = false) : void
      {
         if(!isAllowed)
         {
            return;
         }
         if(param1)
         {
            FriendBarSyncStates.pendingForceSyncFriendBar = true;
         }
         onSyncFriendBar();
      }
      
      public function syncFriendBarCharacter(param1:Character) : void
      {
         character = param1;
         if(!isAllowed)
         {
            return;
         }
         var imageHash:String = character.avatarImage;
         var fullHash:String = imageHash + "|" + character.level + "|" + character.isOnline.toString();
         if(!needsCharacterUpdate(character.userId,fullHash))
         {
            return;
         }
         var onFriendBarImageComplete:Function = function(param1:IImage):void
         {
            updateFriend(character.userId,character.level,character.isOnline,param1);
         };
         FriendBarImage.buildFromHash(imageHash,onFriendBarImageComplete,0.5);
      }
      
      public function addFriend(param1:Character) : void
      {
         character = param1;
         if(!isAllowed)
         {
            return;
         }
         if(!character)
         {
            return;
         }
         var imageHash:String = character.avatarImage;
         var fullHash:String = imageHash + "|" + character.level + "|" + character.isOnline.toString();
         _characterCheckCache.setData(character.userId,fullHash);
         var onFriendBarImageComplete:Function = function(param1:IImage):void
         {
            _friendBarUI.addFriend(character.userId,character.id,character.name,character.level,character.isOnline,param1);
            syncFriendBar();
         };
         FriendBarImage.buildFromHash(imageHash,onFriendBarImageComplete,0.5);
      }
      
      public function removeFriend(param1:int, param2:Boolean = false) : void
      {
         if(!isAllowed)
         {
            return;
         }
         _characterCheckCache.remove(param1);
         _friendBarUI.removeFriend(param1,param2);
      }
      
      public function updateFriend(param1:int, param2:int, param3:Boolean, param4:IImage) : void
      {
         if(!isAllowed)
         {
            return;
         }
         _friendBarUI.updateFriend(param1,param2,param3,param4);
      }
      
      public function updateFriendData(param1:int, param2:String, param3:Object) : void
      {
         if(!isAllowed)
         {
            return;
         }
         var _loc4_:FriendBarFriend = _friendBarUI.friends.getFriend(param1);
         if(!_loc4_)
         {
            return;
         }
         var _loc5_:* = param2;
         switch(_loc5_)
         {
            case "level":
               _friendBarUI.updateFriend(param1,param3 as int,_loc4_.isCharacterOnline,null);
               break;
            case "online_status":
               _friendBarUI.updateFriend(param1,_loc4_.characterLevel,param3 == 1,null);
         }
      }
      
      public function updateFriendByName(param1:String, param2:int, param3:Boolean) : void
      {
         if(!isAllowed)
         {
            return;
         }
         var _loc4_:FriendBarFriend = _friendBarUI.friends.getFriendByName(param1);
         if(_loc4_)
         {
            _friendBarUI.updateFriend(_loc4_.userId,param2,param3,null);
         }
      }
      
      public function updateSetting(param1:String, param2:Object) : void
      {
         if(!isAllowed)
         {
            return;
         }
         if(param1 == "socket_connection")
         {
            if(param2 === true)
            {
               socketConnection = true;
            }
            else
            {
               socketConnection = false;
            }
         }
         else if(param1 == "sync_friendbar")
         {
            FriendBarSyncStates.pendingSyncFriendBar = true;
         }
         else if(param1 == "tutorial_finished")
         {
            _friendBarUI.refreshUI();
         }
         else if(param1 == "friendbar_settings" && param2 != null)
         {
            _friendBarUI.updateSettings(param2);
         }
      }
      
      public function leaveGuild() : void
      {
         if(!isAllowed)
         {
            return;
         }
         _friendBarUI.leaveGuild();
         syncFriendBar();
      }
      
      public function inviteFriends() : void
      {
         if(!isAllowed)
         {
            return;
         }
         ViewManager.instance.showFriendInvitationDialog();
      }
      
      public function loadCharacter(param1:int) : void
      {
         if(!isAllowed)
         {
            return;
         }
         if(!User.current)
         {
            return;
         }
         if(!User.current.character.hasTutorialFlag("tutorial_finished"))
         {
            return;
         }
         if(ViewManager.instance.activePanelInstance is PanelBattle)
         {
            return;
         }
         if(ViewManager.instance.activePanelInstance is PanelCharacter)
         {
            if((ViewManager.instance.activePanelInstance as PanelCharacter).customCharacter)
            {
               if((ViewManager.instance.activePanelInstance as PanelCharacter).customCharacter.id == param1)
               {
                  return;
               }
            }
         }
         if(param1 == User.current.character.id)
         {
            ViewManager.instance.showPanel("character");
            return;
         }
         if(_characterCache.exists(param1) && _characterCacheTimes.exists(param1))
         {
            if(_characterCacheTimes.getData(param1) + 10 >= TimeUtil.now)
            {
               _characterCacheTimes.setData(param1,TimeUtil.now);
               ViewManager.instance.showCharacter(_characterCache.getData(param1));
               return;
            }
         }
         Environment.application.sendActionRequest("getCharacter",{"character_id":param1},handleRequestResponse);
      }
      
      public function requestFriendBarImage(param1:int, param2:int, param3:Boolean, param4:String) : void
      {
         userId = param1;
         level = param2;
         onlineStatus = param3;
         hash = param4;
         if(!isAllowed)
         {
            return;
         }
         if(!hash)
         {
            return;
         }
         if(_pendingImageRequests.exists(userId))
         {
            return;
         }
         _pendingImageRequests.setData(userId,true);
         if(!User.current)
         {
            return;
         }
         Logger.info("[Friendbar] Requesting Friendbar Image. User: " + userId);
         var imageHash:String = hash;
         var fullHash:String = imageHash + "|" + level + "|" + onlineStatus.toString();
         _characterCheckCache.setData(userId,fullHash);
         var onFriendBarImageComplete:Function = function(param1:IImage):void
         {
            if(userId && param1)
            {
               _friendBarUI.updateFriend(userId,0,false,param1);
            }
            _pendingImageRequests.remove(userId);
         };
         FriendBarImage.buildFromHash(imageHash,onFriendBarImageComplete,0.5);
      }
      
      public function saveSetting(param1:Object) : void
      {
         if(!isAllowed)
         {
            return;
         }
         if(!User.current)
         {
            return;
         }
         User.current.setSettingValue("friendbar_settings",param1);
      }
      
      private function onSyncFriendBar() : void
      {
         if(!User.current)
         {
            if(_syncTimer)
            {
               _syncTimer.stop();
            }
            return;
         }
         if(_socketConnection && FriendBarSyncStates.isSyncFriendbarDataSynced)
         {
            return;
         }
         if(_friendBarUI.friendCount <= 1 && !FriendBarSyncStates.pendingForceSyncFriendBar)
         {
            return;
         }
         Environment.application.sendActionRequest("syncFriendBar",FriendBarSyncStates.syncFriendbarData.rawData,handleRequestResponse,false);
      }
      
      private function needsCharacterUpdate(param1:int, param2:String) : Boolean
      {
         var _loc3_:Boolean = false;
         if(_characterCheckCache.getData(param1) != param2)
         {
            _characterCheckCache.setData(param1,param2);
            _loc3_ = true;
         }
         return _loc3_;
      }
      
      private function handleRequestResponse(param1:ActionRequestResponse) : void
      {
         var _loc2_:* = null;
         Logger.debug("[Friendbar] Handling request response for: " + param1.action);
         var _loc3_:* = param1.action;
         switch(_loc3_)
         {
            case "loginFriendBar":
               if(param1.error == "")
               {
                  if(param1.appResponse.hasData("friend_data"))
                  {
                     _friendBarUI.updateFriendData(param1.appResponse.friend_data);
                  }
                  if(_syncTimer == null)
                  {
                     _syncTimer = Environment.createTimer("FriendBar::sync",300000,onSyncFriendBar);
                  }
                  _syncTimer.start();
                  _friendBarUI.refreshUI();
               }
               else
               {
                  Environment.reportError(param1.error,param1.request,false,true);
               }
               break;
            case "syncFriendBar":
               if(param1.error == "")
               {
                  if(param1.appResponse.hasData("sync_states",true))
                  {
                     FriendBarSyncStates.refresh(param1.appResponse.sync_states);
                  }
                  if(param1.appResponse.hasData("friend_data"))
                  {
                     _friendBarUI.updateFriendData(param1.appResponse.friend_data);
                  }
               }
               else if(param1.error == "errorIO 2032")
               {
                  Environment.reportError("syncFriendBarErrorIO",param1.request,false,true);
               }
               else
               {
                  Environment.reportError(param1.error,param1.request,false,true);
               }
               break;
            case "getCharacter":
               if(param1.error == "")
               {
                  Environment.application.updateData(param1.data);
                  _loc2_ = Character.fromData(param1.data);
                  _characterCache.setData(_loc2_.id,_loc2_);
                  _characterCacheTimes.setData(_loc2_.id,TimeUtil.now);
                  ViewManager.instance.showCharacter(_loc2_);
               }
               else if(param1.error != "errGetCharacterInvalidCharacter")
               {
                  Environment.reportError(param1.error,param1.request);
               }
               break;
            default:
               throw new Error("Failure handling response to action \'" + param1.action + "\'. Action not supported");
         }
      }
   }
}
