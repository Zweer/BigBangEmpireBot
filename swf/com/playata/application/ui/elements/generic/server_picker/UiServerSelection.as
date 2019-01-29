package com.playata.application.ui.elements.generic.server_picker
{
   import com.playata.application.platform.ServerInfo;
   import com.playata.application.ui.elements.generic.locale_picker.UiLocalePicker;
   import com.playata.framework.application.Environment;
   import visuals.ui.base.SymbolServerSelectionGeneric;
   
   public class UiServerSelection
   {
       
      
      private var _content:SymbolServerSelectionGeneric = null;
      
      private var _localePicker:UiLocalePicker = null;
      
      private var _serverPicker:UiServerPicker = null;
      
      private var _onSelectionChange:Function = null;
      
      public function UiServerSelection(param1:SymbolServerSelectionGeneric, param2:Function)
      {
         super();
         _content = param1;
         _onSelectionChange = param2;
         _localePicker = new UiLocalePicker(_content.localePicker,ServerInfo.availableServerSelectionLocales,Environment.info.defaultLocale,onLocaleChange,onLocaleOpen,false);
         _serverPicker = new UiServerPicker(_content.serverPicker,ServerInfo.getServersForLocale(Environment.info.defaultLocale),ServerInfo.serverId,onServerChange,onServerOpen,2894892);
      }
      
      public function dispose() : void
      {
         _localePicker.dispose();
         _localePicker = null;
         _serverPicker.dispose();
         _serverPicker = null;
      }
      
      public function setToCurrentServer() : void
      {
         var _loc2_:String = !!ServerInfo.isInternational?"en_WO":Environment.info.defaultLocale;
         _localePicker.setActiveLocale(_loc2_);
         if(_serverPicker)
         {
            _serverPicker.dispose();
            _serverPicker = null;
         }
         var _loc1_:Vector.<String> = ServerInfo.getServersForLocale(_loc2_);
         _serverPicker = new UiServerPicker(_content.serverPicker,_loc1_,ServerInfo.serverId,onServerChange,onServerOpen);
      }
      
      protected function onLocaleChange(param1:String) : void
      {
         if(_serverPicker)
         {
            _serverPicker.dispose();
            _serverPicker = null;
         }
         var _loc2_:Vector.<String> = ServerInfo.getServersForLocale(param1);
         _serverPicker = new UiServerPicker(_content.serverPicker,_loc2_,_loc2_[_loc2_.length - 1],onServerChange,onServerOpen);
         _localePicker.close();
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
