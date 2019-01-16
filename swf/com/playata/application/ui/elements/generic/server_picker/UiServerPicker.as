package com.playata.application.ui.elements.generic.server_picker
{
   import com.playata.framework.application.Environment;
   import com.playata.framework.display.InteractiveDisplayObject;
   import com.playata.framework.input.InteractionEvent;
   import visuals.ui.elements.server_picker.SymbolServerPickOptionGeneric;
   import visuals.ui.elements.server_picker.SymbolServerPickerGeneric;
   
   public class UiServerPicker
   {
       
      
      private const BOX_HEIGHT:int = 37;
      
      private const BOX_BORDER:int = 10;
      
      private var _content:SymbolServerPickerGeneric = null;
      
      private var _singleServerColor:uint = 16777215;
      
      private var _onServerChange:Function = null;
      
      private var _onOpen:Function = null;
      
      private var _isOpen:Boolean = false;
      
      private var _serverBoxes:Vector.<UiServerPickOption>;
      
      private var _originalX:Number = 0;
      
      private var _originalWidth:Number = 0;
      
      private var _originalHeight:Number = 0;
      
      private var _availableServers:Vector.<String> = null;
      
      private var _currentServer:UiServerPickOption = null;
      
      private var _tooltipLayer:InteractiveDisplayObject = null;
      
      public function UiServerPicker(param1:SymbolServerPickerGeneric, param2:Vector.<String>, param3:String, param4:Function = null, param5:Function = null, param6:uint = 16777215)
      {
         var _loc7_:* = null;
         _serverBoxes = new Vector.<UiServerPickOption>();
         super();
         _content = param1;
         _singleServerColor = param6;
         _onServerChange = param4;
         _onOpen = param5;
         _availableServers = param2;
         _originalX = _content.x;
         _originalWidth = _content.width;
         _originalHeight = _content.height;
         _tooltipLayer = new InteractiveDisplayObject(_content.tooltipLayer);
         _tooltipLayer.onInteractionOut.add(handleInteractionOut);
         _currentServer = new UiServerPickOption(param1.iconSelectedServer,param3,onClickPickServer);
         _content.servers.visible = false;
         _content.selectionPopupBackground.visible = false;
         _content.tooltipLayer.visible = false;
         _content.selectionPopupBackground.width = 51;
         _serverBoxes = new Vector.<UiServerPickOption>();
         _content.servers.removeAllChildren();
         var _loc8_:int = 0;
         var _loc11_:int = 0;
         var _loc10_:int = 0;
         var _loc9_:int = 6;
         var _loc14_:int = 0;
         var _loc13_:* = _availableServers;
         for each(var _loc12_ in _availableServers)
         {
            _loc7_ = new UiServerPickOption(new SymbolServerPickOptionGeneric(),_loc12_,onClickSelect);
            if(_content.servers.numChildren > 0 && _content.servers.numChildren % _loc9_ == 0)
            {
               _loc8_ = _loc8_ + int(_loc7_.content.width);
               _loc11_ = 0;
            }
            _loc7_.content.x = _loc8_;
            _loc7_.content.y = _loc11_;
            _loc7_.content.background.visible = false;
            _loc7_.content.txtServerId.textColor = 16777215;
            if(_loc12_ == _currentServer.serverId)
            {
               _loc7_.active = true;
            }
            _content.servers.addChild(_loc7_.content);
            _serverBoxes.push(_loc7_);
            _loc10_++;
            _loc11_ = _loc11_ + 37;
         }
         _content.selectionPopupBackground.height = (_content.servers.numChildren > _loc9_?_loc9_:int(_content.servers.numChildren)) * 37 + 10;
         _content.selectionPopupBackground.width = _content.selectionPopupBackground.width + _loc8_;
         _content.tooltipLayer.x = _content.selectionPopupBackground.x;
         _content.tooltipLayer.y = _content.selectionPopupBackground.y;
         _content.tooltipLayer.width = _content.selectionPopupBackground.width;
         _content.tooltipLayer.height = _content.selectionPopupBackground.height;
         if(!_availableServers || _availableServers.length <= 1)
         {
            _currentServer.useHandCursor = false;
            _currentServer.content.background.visible = false;
            _currentServer.content.txtServerId.textColor = _singleServerColor;
         }
         else
         {
            _currentServer.useHandCursor = true;
            _currentServer.content.background.visible = true;
            _currentServer.content.txtServerId.textColor = 6444365;
         }
      }
      
      public function dispose() : void
      {
         _availableServers = null;
         _tooltipLayer.dispose();
         var _loc3_:int = 0;
         var _loc2_:* = _serverBoxes;
         for each(var _loc1_ in _serverBoxes)
         {
            _loc1_.dispose();
         }
         _currentServer.dispose();
         _currentServer = null;
      }
      
      private function onClickPickServer(param1:UiServerPickOption) : void
      {
         if(!_availableServers)
         {
            return;
         }
         if(_availableServers.length <= 1)
         {
            return;
         }
         if(_onOpen != null)
         {
            _onOpen();
         }
         open();
      }
      
      private function handleInteractionOut(param1:InteractionEvent) : void
      {
         if(param1.rawEvent.relatedObject is SymbolServerPickOption)
         {
            return;
         }
         if(param1.rawEvent.relatedObject is SymbolBackgroundScalable)
         {
            return;
         }
         if(param1.rawEvent.relatedObject is SymbolServerPickOptionActive)
         {
            return;
         }
         close();
      }
      
      public function open() : void
      {
         if(_isOpen)
         {
            close();
            return;
         }
         _isOpen = true;
         _content.servers.visible = true;
         _content.selectionPopupBackground.visible = true;
         _content.tooltipLayer.visible = true;
      }
      
      public function close() : void
      {
         if(_isOpen)
         {
            _content.servers.visible = false;
            _content.selectionPopupBackground.visible = false;
            _content.tooltipLayer.visible = false;
         }
         _isOpen = false;
      }
      
      private function onClickSelect(param1:UiServerPickOption) : void
      {
         if(_onServerChange != null)
         {
            Environment.audio.playFX("ui_button_click.mp3");
            var _loc4_:int = 0;
            var _loc3_:* = _serverBoxes;
            for each(var _loc2_ in _serverBoxes)
            {
               _loc2_.active = param1 == _loc2_;
            }
            _onServerChange(param1.serverId);
            _currentServer.serverId = param1.serverId;
         }
      }
      
      public function get content() : SymbolServerPickerGeneric
      {
         return _content;
      }
      
      public function get activeServer() : UiServerPickOption
      {
         var _loc3_:int = 0;
         var _loc2_:* = _serverBoxes;
         for each(var _loc1_ in _serverBoxes)
         {
            if(_loc1_.active)
            {
               return _loc1_;
            }
         }
         return null;
      }
   }
}
