package com.playata.application.ui.elements.leaderboard
{
   import com.playata.application.data.constants.CConstant;
   import com.playata.application.data.user.User;
   import com.playata.application.platform.ServerInfo;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.application.ui.elements.generic.checkbox.UiRadioButton;
   import com.playata.application.ui.elements.generic.server_picker.UiServerSelection;
   import com.playata.framework.core.TypedObject;
   import com.playata.framework.display.ui.controls.TabGroup;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.elements.leaderboard.SymbolLeaderboardFilterGeneric;
   
   public class UiLeaderboardFilter
   {
      
      private static const THIS_SERVER:String = "this_server";
      
      private static const OTHER_SERVER:String = "other_server";
      
      private static const GLOBAL:String = "global";
      
      private static var _selectionId:String = "this_server";
       
      
      private var _content:SymbolLeaderboardFilterGeneric = null;
      
      private var _selectionGroup:TabGroup = null;
      
      private var _ckbThisServer:UiRadioButton = null;
      
      private var _ckbOtherServer:UiRadioButton = null;
      
      private var _ckbGlobal:UiRadioButton = null;
      
      private var _serverSelection:UiServerSelection = null;
      
      private var _btnSaveSettings:UiButton = null;
      
      private var _callback:Function = null;
      
      public function UiLeaderboardFilter(param1:SymbolLeaderboardFilterGeneric, param2:Function)
      {
         var _loc3_:* = null;
         super();
         _content = param1;
         _content.visible = false;
         _callback = param2;
         _content.txtThisServer.text = LocText.current.text("dialog/leaderboard/filter/this_server");
         _content.txtThisServer.autoFontSize = true;
         _content.txtOtherServer.text = LocText.current.text("dialog/leaderboard/filter/other_Server");
         _content.txtOtherServer.autoFontSize = true;
         _content.txtGlobal.text = LocText.current.text("dialog/leaderboard/filter/global");
         _content.txtGlobal.autoFontSize = true;
         _content.txtCaptionServer.text = LocText.current.text("dialog/leaderboard/filter/caption_server");
         _content.txtCaptionServer.autoFontSize = true;
         _content.txtRefreshInfo.text = LocText.current.text("dialog/leaderboard/filter/refresh_info",CConstant.leaderboard_global_refresh_minutes);
         _content.txtRefreshInfo.autoFontSize = true;
         _selectionGroup = new TabGroup();
         _ckbThisServer = new UiRadioButton(_content.ckbThisServer,_content.txtThisServer);
         _ckbOtherServer = new UiRadioButton(_content.ckbOtherServer,_content.txtOtherServer);
         _ckbGlobal = new UiRadioButton(_content.ckbGlobal,_content.txtGlobal);
         _selectionGroup.addTab("this_server",_ckbThisServer);
         _selectionGroup.addTab("other_server",_ckbOtherServer);
         _selectionGroup.addTab("global",_ckbGlobal);
         _selectionGroup.onTabSelected.add(onSelectionChanged);
         _serverSelection = new UiServerSelection(_content.serverSelection,onServerSelectionChange,ServerInfo.leaderboardServerSelectionData,_content.txtGlobal.textColor);
         _content.serverSelection.background.visible = false;
         _content.serverSelection.bringToTop();
         _btnSaveSettings = new UiButton(_content.btnSaveSettings,LocText.current.text("dialog/leaderboard/filter/button_save"),handleSaveSettingsClick);
         _content.dialogBackground.applySettings(new TypedObject({"interactionEnabled":true}));
         if(User.current.hasSetting("leaderboard_filter_settings"))
         {
            _loc3_ = User.current.getSettingValue("leaderboard_filter_settings");
            _selectionGroup.activateTab(_loc3_.selection_id,true);
            _serverSelection.setTo(_loc3_.locale,_loc3_.server_id);
         }
         else
         {
            _selectionGroup.activateTab("this_server",true);
            _serverSelection.setToDefaultServer();
         }
         updateElements();
      }
      
      public static function get isFilterActive() : Boolean
      {
         return _selectionId != null && _selectionId != "this_server";
      }
      
      public function dispose() : void
      {
         _btnSaveSettings.dispose();
         _btnSaveSettings = null;
         _ckbThisServer.dispose();
         _ckbThisServer = null;
         _ckbOtherServer.dispose();
         _ckbOtherServer = null;
         _ckbGlobal.dispose();
         _ckbGlobal = null;
         _content = null;
         _selectionId = "this_server";
      }
      
      public function get currentServer() : String
      {
         var _loc1_:* = _selectionId;
         switch(_loc1_)
         {
            case "this_server":
               return "";
            case "other_server":
               return _serverSelection.currentServer == null?"":_serverSelection.currentServer;
            case "global":
               return "global";
            default:
               return "";
         }
      }
      
      public function toggle() : void
      {
         _content.visible = !_content.visible;
      }
      
      public function hide() : void
      {
         _content.visible = false;
      }
      
      private function onSelectionChanged(param1:String) : void
      {
         _selectionId = param1;
         updateElements();
      }
      
      private function onServerSelectionChange(param1:String, param2:String) : void
      {
         updateElements();
      }
      
      private function updateElements() : void
      {
         var _loc1_:* = null;
         if(!User.current.hasSetting("leaderboard_filter_settings"))
         {
            _btnSaveSettings.buttonEnabled = isFilterActive;
         }
         else
         {
            _loc1_ = User.current.getSettingValue("leaderboard_filter_settings");
            _btnSaveSettings.buttonEnabled = _selectionId != _loc1_.selection_id || _serverSelection.currentLocale != _loc1_.locale || _serverSelection.currentServer != _loc1_.server_id;
         }
         _content.iconRefreshInfo.visible = _selectionId == "global" || _selectionId == "other_server" && _serverSelection.currentServer == "all";
         _content.txtRefreshInfo.visible = _content.iconRefreshInfo.visible;
         _content.serverSelection.visible = _selectionId == "other_server";
         _content.txtSelectedServer.visible = !_content.serverSelection.visible;
         if(_selectionId == "global")
         {
            _content.txtSelectedServer.text = LocText.current.text("dialog/leaderboard/filter/all");
         }
         else
         {
            _content.txtSelectedServer.text = ServerInfo.serverId;
         }
      }
      
      private function handleSaveSettingsClick(param1:InteractionEvent) : void
      {
         var _loc2_:Object = {
            "selection_id":_selectionId,
            "locale":_serverSelection.currentLocale,
            "server_id":_serverSelection.currentServer
         };
         User.current.setSettingValue("leaderboard_filter_settings",_loc2_);
         updateElements();
         _callback(true);
         hide();
      }
   }
}
