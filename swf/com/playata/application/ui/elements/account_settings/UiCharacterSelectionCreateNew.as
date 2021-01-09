package com.playata.application.ui.elements.account_settings
{
   import com.playata.application.Application;
   import com.playata.application.assets.AppAssetUtil;
   import com.playata.application.platform.ServerInfo;
   import com.playata.application.ui.elements.generic.locale_picker.UiLocalePicker;
   import com.playata.application.ui.elements.generic.server_picker.UiServerPicker;
   import com.playata.framework.application.Environment;
   import com.playata.framework.display.ui.dialogs.Dialog;
   import com.playata.framework.localization.LocText;
   import visuals.ui.elements.application.SymbolCharacterSelectionCreateNewGeneric;
   
   public class UiCharacterSelectionCreateNew
   {
       
      
      private var _usedServerIds:Vector.<String> = null;
      
      private var _content:SymbolCharacterSelectionCreateNewGeneric = null;
      
      private var _parentDialog:Dialog = null;
      
      private var _localePicker:UiLocalePicker = null;
      
      private var _serverPicker:UiServerPicker = null;
      
      public function UiCharacterSelectionCreateNew(param1:SymbolCharacterSelectionCreateNewGeneric, param2:Vector.<String>, param3:Dialog)
      {
         super();
         _content = param1;
         _usedServerIds = param2;
         _parentDialog = param3;
         _content.txtNewServerCaption.text = LocText.current.text("dialog/new_character/new_server_caption");
         _content.txtCurrentServerCaption.text = LocText.current.text("dialog/new_character/current_server_caption");
         _content.txtCurrentServerId.text = ServerInfo.serverId;
         _content.iconLocaleCurrentServer.gotoAndStop(AppAssetUtil.getLocaleFlagIndex(Environment.info.defaultLocale));
         var _loc6_:Vector.<String> = ServerInfo.defaultServerSelectionData.getAvailableNewCharacterLocales(_usedServerIds);
         var _loc4_:String = _loc6_[0];
         if(_loc6_.indexOf(Environment.info.defaultLocale) != -1)
         {
            _loc4_ = Environment.info.defaultLocale;
         }
         var _loc5_:Vector.<String> = ServerInfo.defaultServerSelectionData.getServersForNewCharacterLocale(_loc4_,_usedServerIds);
         _localePicker = new UiLocalePicker(_content.localePicker,_loc6_,_loc4_,onLocaleChange,onLocaleOpen,false);
         _serverPicker = new UiServerPicker(_content.serverPicker,_loc5_,_loc5_[_loc5_.length - 1],onServerChange,onServerOpen,_content.txtCurrentServerId.textColor);
         _localePicker.content.bringToTop();
         _serverPicker.content.bringToTop();
      }
      
      public function dispose() : void
      {
         _localePicker.dispose();
         _localePicker = null;
         _serverPicker.dispose();
         _serverPicker = null;
      }
      
      public function get content() : SymbolCharacterSelectionCreateNewGeneric
      {
         return _content;
      }
      
      public function onAction() : void
      {
         (Environment.application as Application).onCharacterSelectionChange(_localePicker.activeLocale.locale,_serverPicker.activeServer.serverId);
      }
      
      protected function onLocaleChange(param1:String) : void
      {
         _localePicker.close();
         if(_serverPicker)
         {
            _serverPicker.dispose();
            _serverPicker = null;
         }
         var _loc2_:Vector.<String> = ServerInfo.defaultServerSelectionData.getServersForNewCharacterLocale(param1,_usedServerIds);
         _serverPicker = new UiServerPicker(_content.serverPicker,_loc2_,_loc2_[_loc2_.length - 1],onServerChange,onServerOpen,_content.txtCurrentServerId.textColor);
      }
      
      protected function onServerChange(param1:String) : void
      {
         _serverPicker.close();
      }
      
      protected function onLocaleOpen() : void
      {
         _serverPicker.close();
      }
      
      protected function onServerOpen() : void
      {
         _localePicker.close();
      }
   }
}
