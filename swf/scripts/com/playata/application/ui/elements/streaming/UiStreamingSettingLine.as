package com.playata.application.ui.elements.streaming
{
   import com.playata.application.data.streaming.Streaming;
   import com.playata.application.data.streaming.StreamingActor;
   import com.playata.application.data.user.User;
   import com.playata.framework.application.Environment;
   import com.playata.framework.display.InteractiveDisplayObject;
   import com.playata.framework.input.InteractionEvent;
   import visuals.ui.elements.streaming.SymbolStreamingSettingLineGeneric;
   
   public class UiStreamingSettingLine extends InteractiveDisplayObject
   {
       
      
      private var _content:SymbolStreamingSettingLineGeneric = null;
      
      private var _index:int = 0;
      
      private var _settingId:int = -1;
      
      private var _onClickFunction:Function = null;
      
      public function UiStreamingSettingLine(param1:SymbolStreamingSettingLineGeneric, param2:int, param3:Function)
      {
         _content = param1;
         super(_content);
         _index = param2;
         _onClickFunction = param3;
         _content.backgroundHighlight.visible = false;
         onClick.add(handleClick);
      }
      
      public function get index() : int
      {
         return _index;
      }
      
      public function get settingId() : int
      {
         return _settingId;
      }
      
      public function get isNew() : Boolean
      {
         return _content.iconExclamationMark.visible;
      }
      
      override public function dispose() : void
      {
         _settingId = -1;
         _content = null;
         super.dispose();
      }
      
      private function handleClick(param1:InteractionEvent) : void
      {
         Environment.audio.playFX("ui_button_click.mp3");
         _onClickFunction(this);
         _content.iconExclamationMark.visible = false;
      }
      
      public function highlight(param1:Boolean) : void
      {
         _content.backgroundHighlight.visible = param1;
      }
      
      public function refresh(param1:int) : void
      {
         _settingId = param1;
         if(_settingId <= 0)
         {
            _content.visible = false;
            return;
         }
         _content.visible = true;
         var _loc2_:Streaming = User.current.character.streaming;
         var _loc4_:Boolean = false;
         var _loc3_:Boolean = false;
         if(_loc2_.getUnlockedSettings().exists(_settingId))
         {
            _loc3_ = true;
            _loc4_ = _loc2_.getUnlockedSettings().getData(_settingId);
         }
         _content.lock.visible = !_loc3_;
         _content.iconExclamationMark.visible = _loc4_;
         _content.icon.setUriSprite(StreamingActor.getSettingIconUrl(param1),56,57,true,1);
      }
   }
}
