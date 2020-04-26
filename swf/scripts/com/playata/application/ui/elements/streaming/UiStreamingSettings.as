package com.playata.application.ui.elements.streaming
{
   import com.playata.application.data.constants.CStreamingSetting;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.framework.application.Environment;
   import com.playata.framework.application.request.ActionRequestResponse;
   import com.playata.framework.display.InteractiveDisplayObject;
   import com.playata.framework.input.InteractionEvent;
   import visuals.ui.elements.streaming.SymbolStreamingSettingLineGeneric;
   import visuals.ui.elements.streaming.SymbolUiStreamingSettingsGeneric;
   
   public class UiStreamingSettings extends InteractiveDisplayObject
   {
      
      private static const MAX_LINES:int = 6;
      
      private static const SCROLL_VALUE:int = 2;
       
      
      private var _content:SymbolUiStreamingSettingsGeneric = null;
      
      private var _settingContent:UiStreamingSettingContent = null;
      
      private var _lines:Vector.<UiStreamingSettingLine> = null;
      
      private var _btnScrollUp:UiButton = null;
      
      private var _btnScrollDown:UiButton = null;
      
      private var _currentSelectedId:int = 0;
      
      private var _offset:int = 0;
      
      private var _allSettingIds:Vector.<int> = null;
      
      public function UiStreamingSettings(param1:SymbolUiStreamingSettingsGeneric)
      {
         var _loc2_:int = 0;
         _content = param1;
         super(_content);
         _settingContent = new UiStreamingSettingContent(_content.content);
         _lines = new Vector.<UiStreamingSettingLine>();
         _loc2_ = 1;
         while(_loc2_ <= 6)
         {
            _lines.push(new UiStreamingSettingLine(_content.getChildByName("line" + _loc2_) as SymbolStreamingSettingLineGeneric,_loc2_,onSelectLine));
            _loc2_++;
         }
         _btnScrollUp = new UiButton(_content.btnUp,"",onClickScrollUp);
         _btnScrollDown = new UiButton(_content.btnDown,"",onClickScrollDown);
         onMouseWheel.add(handleMouseWheel);
         _allSettingIds = CStreamingSetting.ids;
      }
      
      override public function dispose() : void
      {
         var _loc1_:int = 0;
         if(_btnScrollUp == null)
         {
            return;
         }
         _btnScrollUp.dispose();
         _btnScrollUp = null;
         _btnScrollDown.dispose();
         _btnScrollDown = null;
         _loc1_ = 0;
         while(_loc1_ < _lines.length)
         {
            _lines[_loc1_].dispose();
            _loc1_++;
         }
         _lines.length = 0;
         _lines = null;
         _settingContent.dispose();
         _settingContent = null;
         super.dispose();
      }
      
      private function onSelectLine(param1:UiStreamingSettingLine) : void
      {
         var _loc2_:int = 0;
         _currentSelectedId = param1.settingId;
         _loc2_ = 0;
         while(_loc2_ < _lines.length)
         {
            _lines[_loc2_].highlight(_currentSelectedId == _lines[_loc2_].settingId);
            _loc2_++;
         }
         _settingContent.refresh(_currentSelectedId);
         if(param1.isNew)
         {
            Environment.application.sendActionRequest("markStreamingSettingAsSeen",{"setting_id":_currentSelectedId},handleRequests);
         }
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
      
      private function onClickScrollUp(param1:InteractionEvent) : void
      {
         scrollUp(2,false);
      }
      
      private function onClickScrollDown(param1:InteractionEvent) : void
      {
         scrollDown(2,false);
      }
      
      private function scrollUp(param1:int, param2:Boolean) : void
      {
         if(!_btnScrollUp.visible)
         {
            return;
         }
         if(_offset == 0)
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
         if(_offset == _allSettingIds.length - 6)
         {
            return;
         }
         _offset = _offset + param1;
         if(_offset > _allSettingIds.length - 6)
         {
            _offset = _allSettingIds.length - 6;
            param2 = false;
         }
         if(param2)
         {
            Environment.audio.playFX("ui_button_click.mp3");
         }
         refreshList();
      }
      
      public function refreshList(param1:Boolean = false) : void
      {
         var _loc2_:int = 0;
         if(!_btnScrollDown)
         {
            return;
         }
         _btnScrollUp.visible = _allSettingIds.length > 6;
         _btnScrollDown.visible = _allSettingIds.length > 6;
         _btnScrollUp.buttonEnabled = _offset > 0;
         _btnScrollDown.buttonEnabled = _offset < _allSettingIds.length - 6;
         _loc2_ = 0;
         while(_loc2_ < _lines.length)
         {
            _lines[_loc2_].refresh(_allSettingIds.length >= _offset + _loc2_ + 1?_allSettingIds[_offset + _loc2_]:0);
            _loc2_++;
         }
         if(_currentSelectedId > 0)
         {
            _loc2_ = 0;
            while(_loc2_ < _lines.length)
            {
               if(_lines[_loc2_].settingId == _currentSelectedId)
               {
                  onSelectLine(_lines[_loc2_]);
                  break;
               }
               _loc2_++;
            }
         }
         else if(param1)
         {
            onSelectLine(_lines[0]);
         }
         else
         {
            _settingContent.refresh(_currentSelectedId);
         }
      }
      
      private function handleRequests(param1:ActionRequestResponse) : void
      {
         var _loc2_:* = param1.action;
         if("markStreamingSettingAsSeen" !== _loc2_)
         {
            throw new Error("Unsupported request action \'" + param1.action + "\'!");
         }
         if(param1.error == "")
         {
            Environment.application.updateData(param1.data);
         }
         else
         {
            Environment.reportError(param1.error,param1.request);
         }
      }
   }
}
