package com.playata.application.ui.elements.generic.checkbox
{
   import com.playata.application.ui.elements.generic.textfield.UiTextTooltip;
   import com.playata.framework.application.Environment;
   import com.playata.framework.display.IDisplayObject;
   import com.playata.framework.display.ui.controls.Control;
   import com.playata.framework.display.ui.controls.ILabel;
   import com.playata.framework.display.ui.controls.TextTooltip;
   import com.playata.framework.display.ui.controls.Tooltip;
   import com.playata.framework.input.InteractionEvent;
   import flash.events.KeyboardEvent;
   import visuals.ui.base.SymbolUiCheckboxGeneric;
   
   public class UiCheckBox extends Control
   {
       
      
      private var _content:SymbolUiCheckboxGeneric = null;
      
      private var _checked:Boolean = false;
      
      private var _onCheckedChanged:Function = null;
      
      private var _onBoforeCheckedChanged:Function = null;
      
      private var _locked:Boolean = false;
      
      private var _caption:ILabel = null;
      
      private var _tag:Object = null;
      
      public function UiCheckBox(param1:SymbolUiCheckboxGeneric, param2:Boolean, param3:String = "", param4:Function = null, param5:Function = null, param6:ILabel = null)
      {
         _content = param1;
         super(_content);
         _checked = param2;
         _onCheckedChanged = param4;
         _onBoforeCheckedChanged = param5;
         _caption = param6;
         refresh();
         _tooltip = new UiTextTooltip(_content,param3);
         onClick.add(handleClick);
         if(_caption)
         {
            _caption.onClick.add(handleCaptionClick);
         }
      }
      
      override public function dispose() : void
      {
         if(_caption)
         {
            _caption.onClick.remove(handleCaptionClick);
         }
         _content = null;
         super.dispose();
      }
      
      public function get content() : IDisplayObject
      {
         return _content;
      }
      
      private function handleCaptionClick(param1:InteractionEvent) : void
      {
         handleClick(null);
      }
      
      public function get checked() : Boolean
      {
         return _checked;
      }
      
      public function set checked(param1:Boolean) : void
      {
         _checked = param1;
         refresh();
      }
      
      public function set locked(param1:Boolean) : void
      {
         _locked = param1;
         useHandCursor = !_locked && enabled;
      }
      
      public function get locked() : Boolean
      {
         return _locked;
      }
      
      public function set tooltip(param1:String) : void
      {
         if(!_tooltip || !(_tooltip is TextTooltip))
         {
            _tooltip = new UiTextTooltip(this,param1);
         }
         (_tooltip as TextTooltip).text = param1;
      }
      
      public function get tooltip() : String
      {
         if(_tooltip is TextTooltip)
         {
            return (_tooltip as TextTooltip).text;
         }
         return null;
      }
      
      public function get tooltipElement() : Tooltip
      {
         return _tooltip;
      }
      
      override public function set enabled(param1:Boolean) : void
      {
         _enabled = param1;
         useHandCursor = !_locked && enabled;
         _content.alpha = !!_enabled?1:0.7;
      }
      
      override public function get enabled() : Boolean
      {
         return _enabled;
      }
      
      private function handleClick(param1:InteractionEvent) : void
      {
         if(_locked || !_enabled)
         {
            Environment.audio.playFX("ui_button_click_disabled.mp3");
            return;
         }
         if(_onBoforeCheckedChanged != null)
         {
            if(!_onBoforeCheckedChanged(checked))
            {
               return;
            }
         }
         checked = !checked;
         Environment.audio.playFX("ui_button_click.mp3");
         if(_onCheckedChanged != null)
         {
            _onCheckedChanged(checked);
         }
      }
      
      private function refresh() : void
      {
         _content.checked.visible = _checked;
      }
      
      private function onInputKeyDown(param1:KeyboardEvent) : void
      {
         if(Environment.display.focus != _content)
         {
            return;
         }
         if(param1.charCode == 32)
         {
            handleClick(null);
         }
      }
      
      public function get tag() : Object
      {
         return _tag;
      }
      
      public function get tagAsInt() : int
      {
         return _tag as int;
      }
      
      public function set tag(param1:Object) : void
      {
         _tag = param1;
      }
   }
}
