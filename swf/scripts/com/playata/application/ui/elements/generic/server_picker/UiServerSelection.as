package com.playata.application.ui.elements.generic.server_picker
{
   import com.playata.application.data.server.IServerSelectionData;
   import com.playata.application.ui.elements.generic.locale_picker.UiLocalePicker;
   import visuals.ui.base.SymbolServerSelectionGeneric;
   
   public class UiServerSelection
   {
       
      
      private var _content:SymbolServerSelectionGeneric = null;
      
      private var _localePicker:UiLocalePicker = null;
      
      private var _serverPicker:UiServerPicker = null;
      
      private var _onSelectionChange:Function = null;
      
      private var _serverSelectionData:IServerSelectionData = null;
      
      private var _singleServerColor:uint = 0;
      
      public function UiServerSelection(param1:SymbolServerSelectionGeneric, param2:Function, param3:IServerSelectionData, param4:uint = 2894892)
      {
         super();
         _content = param1;
         _onSelectionChange = param2;
         _serverSelectionData = param3;
         _singleServerColor = param4;
         _localePicker = new UiLocalePicker(_content.localePicker,_serverSelectionData.availableLocales,_serverSelectionData.defaultLocale,onLocaleChange,onLocaleOpen,false);
         _serverPicker = new UiServerPicker(_content.serverPicker,_serverSelectionData.availableServers(_serverSelectionData.defaultLocale),_serverSelectionData.defaultServer,onServerChange,onServerOpen,_singleServerColor);
      }
      
      public function dispose() : void
      {
         _localePicker.dispose();
         _localePicker = null;
         _serverPicker.dispose();
         _serverPicker = null;
      }
      
      public function get currentLocale() : String
      {
         if(!_localePicker.activeLocale)
         {
            return null;
         }
         return _localePicker.activeLocale.locale;
      }
      
      public function get currentServer() : String
      {
         if(!_serverPicker.activeServer)
         {
            return null;
         }
         return _serverPicker.activeServer.serverId;
      }
      
      public function setTo(param1:String, param2:String) : void
      {
         if(!param1)
         {
            param1 = _serverSelectionData.defaultLocale;
         }
         if(!param2)
         {
            param2 = _serverSelectionData.defaultServer;
         }
         _localePicker.setActiveLocale(param1);
         if(_serverPicker)
         {
            _serverPicker.dispose();
            _serverPicker = null;
         }
         var _loc3_:Vector.<String> = _serverSelectionData.availableServers(param1);
         _serverPicker = new UiServerPicker(_content.serverPicker,_loc3_,param2,onServerChange,onServerOpen,_singleServerColor);
      }
      
      public function setToDefaultServer() : void
      {
         setTo(_serverSelectionData.defaultLocale,_serverSelectionData.defaultServer);
      }
      
      protected function onLocaleChange(param1:String) : void
      {
         if(_serverPicker)
         {
            _serverPicker.dispose();
            _serverPicker = null;
         }
         var _loc2_:Vector.<String> = _serverSelectionData.availableServers(param1);
         _serverPicker = new UiServerPicker(_content.serverPicker,_loc2_,_loc2_[_loc2_.length - 1],onServerChange,onServerOpen,_singleServerColor);
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
