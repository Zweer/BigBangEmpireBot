package com.playata.application.request
{
   import com.playata.application.AppEnvironment;
   import com.playata.application.data.convention.Convention;
   import com.playata.application.data.guild.GuildLogMessage;
   import com.playata.application.data.guild.GuildMember;
   import com.playata.application.data.server.SyncStates;
   import com.playata.application.data.user.User;
   import com.playata.application.platform.ServerInfo;
   import com.playata.application.ui.ViewManager;
   import com.playata.application.ui.dialogs.DialogQuestBriefing;
   import com.playata.application.ui.elements.guild.UiGuildChatTab;
   import com.playata.application.ui.elements.guild.UiGuildMemberInfoTab;
   import com.playata.application.ui.elements.slotmachine.UiSlotmachineChat;
   import com.playata.application.ui.panels.PanelGuild;
   import com.playata.application.ui.panels.PanelQuests;
   import com.playata.framework.application.Environment;
   import com.playata.framework.application.request.ActionRequestResponse;
   import com.playata.framework.core.TypedObject;
   import com.playata.framework.network.request.socket.ISocketHandler;
   import com.playata.framework.network.request.socket.SocketTransportLayer;
   
   public class ApplicationSocketHandler implements ISocketHandler
   {
       
      
      public function ApplicationSocketHandler()
      {
         super();
      }
      
      public function onConnect() : void
      {
      }
      
      public function onDisconnect(param1:Boolean) : void
      {
         AppEnvironment.appPlatform.enableInfoMessageSync(true);
         AppEnvironment.friendBar.updateSetting("socket_connection",false);
         if(param1)
         {
            Environment.application.sendActionRequest("updateGameSession",{"connection_type":1},handleRequestResponse,false);
         }
      }
      
      public function handleMessage(param1:SocketTransportLayer, param2:String, param3:Object) : void
      {
         var _loc13_:* = null;
         var _loc6_:int = 0;
         var _loc11_:int = 0;
         var _loc4_:* = null;
         var _loc9_:* = null;
         var _loc17_:* = null;
         var _loc15_:* = null;
         var _loc5_:* = null;
         var _loc14_:* = null;
         var _loc8_:int = 0;
         var _loc12_:* = null;
         var _loc7_:* = null;
         var _loc16_:int = 0;
         if(!User.current)
         {
            return;
         }
         var _loc10_:TypedObject = new TypedObject(param3);
         var _loc18_:* = param2;
         switch(_loc18_)
         {
            case "requestClientInfo":
               _loc13_ = {
                  "game_id":ServerInfo.gameId,
                  "server_id":ServerInfo.serverId,
                  "user_id":User.current.id,
                  "session_id":User.current.sessionId
               };
               param1.sendMessage("requestClientInfoResponse",_loc13_);
               break;
            case "clientRegistered":
               AppEnvironment.appPlatform.enableInfoMessageSync(false);
               AppEnvironment.friendBar.updateSetting("socket_connection",true);
               UiSlotmachineChat.instance.socketConnectionEnabled();
               Environment.application.sendActionRequest("updateGameSession",{"connection_type":2},handleRequestResponse,false);
               break;
            case "refreshInfoMessage":
               AppEnvironment.appPlatform.refreshInfoMessage();
               break;
            case "syncGame":
               SyncStates.pendingSyncGame = true;
               break;
            case "syncGameAndGuild":
               SyncStates.pendingSyncGame = true;
               SyncStates.pendingGetGuildLog = true;
               UiGuildChatTab.instance.refreshGuildLog(true);
               ViewManager.instance.baseUserPanel.syncGame();
               break;
            case "syncFriendBar":
               AppEnvironment.friendBar.updateSetting("sync_friendbar",true);
               break;
            case "syncConvention":
               if(param3.convention_id !== undefined && param3.fans_current !== undefined && User.current && User.current.character)
               {
                  _loc6_ = param3.convention_id as int;
                  _loc11_ = param3.fans_current as int;
                  if(User.current.character.conventionId == _loc6_)
                  {
                     _loc4_ = User.current.character.getConvention(_loc6_);
                     if(_loc4_)
                     {
                        _loc4_.update(new TypedObject({"fans_current":_loc11_}));
                        if(ViewManager.instance.activePanel == "quests")
                        {
                           _loc9_ = ViewManager.instance.activePanelInstance as PanelQuests;
                           _loc9_.conventionButton.refreshFans();
                           _loc17_ = Environment.panelManager.dialogManager.getVisibleDialog(DialogQuestBriefing) as DialogQuestBriefing;
                           if(_loc17_)
                           {
                              _loc17_.refreshConventionFans();
                           }
                        }
                     }
                  }
               }
               break;
            case "syncGuildLog":
               SyncStates.pendingGetGuildLog = true;
               if(_loc10_.hasData("chatMessage") && User.current && User.current.character && User.current.character.hasGuild)
               {
                  _loc15_ = {};
                  _loc15_["timestamp"] = param3.chatMessage.timestamp;
                  _loc15_["character_from_name"] = param3.chatMessage.character_from_name;
                  _loc15_["message"] = param3.chatMessage.message;
                  _loc15_["is_private"] = param3.chatMessage.is_private;
                  _loc15_["is_officer"] = param3.chatMessage.is_officer;
                  _loc5_ = param3.chatMessage.timestamp + "_" + param3.chatMessage.id;
                  _loc14_ = TypedObject.empty;
                  _loc14_.setData(_loc5_,_loc15_);
                  User.current.character.guild.refreshLogMessages(_loc14_);
                  if(ViewManager.instance.activePanel == "guild" && (ViewManager.instance.activePanelInstance as PanelGuild).customGuild == null)
                  {
                     UiGuildChatTab.instance.addNewChatMessage(new GuildLogMessage(_loc15_,param3.chatMessage.id));
                  }
               }
               else
               {
                  UiGuildChatTab.instance.refreshGuildLog(true);
               }
               break;
            case "syncSlotmachineChat":
               if(_loc10_.hasData("slotmachineMessage"))
               {
                  UiSlotmachineChat.instance.appendMessage(param3.slotmachineMessage);
               }
         }
         if(User.current && User.current.character)
         {
            if(param3 && _loc10_.hasData("action"))
            {
               _loc18_ = param3.action;
               switch(_loc18_)
               {
                  case "guildMemberUpdate":
                     if(!_loc10_.hasData("id") || !_loc10_.hasData("field") || !_loc10_.hasData("value") || !User.current.character.hasGuild)
                     {
                        return;
                     }
                     _loc8_ = param3.id as int;
                     _loc12_ = User.current.character.guild.getMemberById(_loc8_);
                     if(_loc12_)
                     {
                        _loc7_ = TypedObject.empty;
                        _loc7_.setData(param3.field,param3.value);
                        _loc12_.update(_loc7_);
                        if(ViewManager.instance.activePanel == "guild" && (ViewManager.instance.activePanelInstance as PanelGuild).customGuild == null)
                        {
                           UiGuildMemberInfoTab.instance.refresh(User.current.character.guild);
                        }
                        AppEnvironment.friendBar.updateFriendData(_loc12_.userId,param3.field,param3.value);
                     }
                     break;
                  case "friendUpdate":
                     if(!_loc10_.hasData("id") || !_loc10_.hasData("field") || !_loc10_.hasData("value"))
                     {
                        return;
                     }
                     _loc16_ = param3.id as int;
                     _loc18_ = param3.field;
                     switch(_loc18_)
                     {
                        case "level":
                           AppEnvironment.friendBar.updateFriendData(_loc16_,param3.field,param3.value);
                           break;
                        case "online_status":
                           AppEnvironment.friendBar.updateFriendData(_loc16_,param3.field,param3.value);
                           break;
                        case "avatar_image":
                           AppEnvironment.friendBar.updateFriendData(_loc16_,param3.field,param3.value);
                     }
                     break;
               }
            }
         }
      }
      
      public function useFallback(param1:String) : Boolean
      {
         return param1 == "initEnvironment" || param1 == "initGame" || param1 == "loginUser" || param1 == "loginUserSSO" || param1 == "registerUser" || param1 == "registerUserSSO" || param1 == "autoLoginUser" || param1 == "logoutUser" || param1 == "createCharacter" || param1 == "checkCharacterName" || param1 == "resetUserPassword" || param1 == "updateGameSession";
      }
      
      private function handleRequestResponse(param1:ActionRequestResponse) : void
      {
         var _loc2_:* = param1.action;
         if("updateGameSession" !== _loc2_)
         {
            throw new Error("Failure handling response to action \'" + param1.action + "\'. Action not supported");
         }
         if(param1.error == "")
         {
         }
      }
   }
}
