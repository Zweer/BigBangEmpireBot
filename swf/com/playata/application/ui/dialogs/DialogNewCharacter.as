package com.playata.application.ui.dialogs
{
   import com.playata.application.Application;
   import com.playata.application.assets.AppAssetUtil;
   import com.playata.application.platform.ServerInfo;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.application.ui.elements.generic.button.UiTextButton;
   import com.playata.application.ui.elements.generic.dialog.UiDialog;
   import com.playata.application.ui.elements.generic.locale_picker.UiLocalePicker;
   import com.playata.application.ui.elements.generic.server_picker.UiServerPicker;
   import com.playata.framework.application.Environment;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.dialogs.SymbolDialogNewCharacterGeneric;
   
   public class DialogNewCharacter extends UiDialog
   {
       
      
      private var _usedServerIds:Vector.<String> = null;
      
      private var _content:SymbolDialogNewCharacterGeneric = null;
      
      private var _btnClose:UiButton = null;
      
      private var _btnCreate:UiTextButton = null;
      
      private var _localePicker:UiLocalePicker = null;
      
      private var _serverPicker:UiServerPicker = null;
      
      public function DialogNewCharacter(param1:Vector.<String>)
      {
         _usedServerIds = param1;
         _content = new SymbolDialogNewCharacterGeneric();
         super(_content);
         _queued = false;
         _content.txtDialogTitle.text = LocText.current.text("dialog/new_character/title");
         _content.txtNewServerCaption.text = LocText.current.text("dialog/new_character/new_server_caption");
         _content.txtCurrentServerCaption.text = LocText.current.text("dialog/new_character/current_server_caption");
         _content.txtCurrentServerId.text = ServerInfo.serverId;
         _content.iconLocaleCurrentServer.gotoAndStop(AppAssetUtil.getLocaleFlagIndex(Environment.info.defaultLocale));
         _btnClose = new UiButton(_content.btnClose,"",onClickClose);
         _btnCreate = new UiTextButton(_content.btnCreate,LocText.current.text("dialog/new_character/create_character"),"",onClickCreateCharacter);
         var _loc4_:Vector.<String> = ServerInfo.defaultServerSelectionData.getAvailableNewCharacterLocales(_usedServerIds);
         var _loc2_:String = _loc4_[0];
         if(_loc4_.indexOf(Environment.info.defaultLocale) != -1)
         {
            _loc2_ = Environment.info.defaultLocale;
         }
         var _loc3_:Vector.<String> = ServerInfo.defaultServerSelectionData.getServersForNewCharacterLocale(_loc2_,_usedServerIds);
         _localePicker = new UiLocalePicker(_content.localePicker,_loc4_,_loc2_,onLocaleChange,onLocaleOpen,false);
         _serverPicker = new UiServerPicker(_content.serverPicker,_loc3_,_loc3_[_loc3_.length - 1],onServerChange,onServerOpen,_content.txtCurrentServerId.textColor);
         _localePicker.content.bringToTop();
         _serverPicker.content.bringToTop();
      }
      
      override public function dispose() : void
      {
         _btnClose.dispose();
         _btnClose = null;
         _btnCreate.dispose();
         _btnCreate = null;
         _localePicker.dispose();
         _localePicker = null;
         _serverPicker.dispose();
         _serverPicker = null;
         super.dispose();
      }
      
      private function onClickClose(param1:InteractionEvent) : void
      {
         close();
      }
      
      private function onClickCreateCharacter(param1:InteractionEvent) : void
      {
         close();
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
      
      override public function onEscape() : void
      {
         close();
      }
   }
}
