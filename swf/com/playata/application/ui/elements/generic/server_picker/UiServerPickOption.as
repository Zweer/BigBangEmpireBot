package com.playata.application.ui.elements.generic.server_picker
{
   import com.playata.framework.application.Environment;
   import com.playata.framework.display.InteractiveDisplayObject;
   import com.playata.framework.input.InteractionEvent;
   import visuals.ui.elements.server_picker.SymbolServerPickOptionGeneric;
   
   public class UiServerPickOption extends InteractiveDisplayObject
   {
       
      
      private var _content:SymbolServerPickOptionGeneric = null;
      
      private var _serverId:String = null;
      
      private var _onClickCallback:Function = null;
      
      public function UiServerPickOption(param1:SymbolServerPickOptionGeneric, param2:String, param3:Function = null)
      {
         _content = param1;
         super(_content);
         _serverId = param2;
         _onClickCallback = param3;
         _content.active.visible = false;
         _content.txtServerId.htmlText = "<a href=\'event:null\'>" + _serverId + "</a>";
         if(_onClickCallback != null)
         {
            onClick.add(handleClick);
         }
      }
      
      public function get content() : SymbolServerPickOptionGeneric
      {
         return _content;
      }
      
      private function handleClick(param1:InteractionEvent) : void
      {
         if(_onClickCallback != null)
         {
            Environment.audio.playFX("ui_button_click.mp3");
            _onClickCallback(this);
         }
      }
      
      public function set active(param1:Boolean) : void
      {
         _content.active.visible = param1;
      }
      
      public function get active() : Boolean
      {
         return _content.active.visible;
      }
      
      public function get serverId() : String
      {
         return _serverId;
      }
      
      public function set serverId(param1:String) : void
      {
         if(_serverId == param1)
         {
            return;
         }
         _serverId = param1;
         _content.txtServerId.htmlText = "<a href=\'event:null\'>" + _serverId + "</a>";
      }
   }
}
