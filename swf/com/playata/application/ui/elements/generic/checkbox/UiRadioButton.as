package com.playata.application.ui.elements.generic.checkbox
{
   import com.playata.framework.application.Environment;
   import com.playata.framework.display.IDisplayObject;
   import com.playata.framework.display.ui.controls.ILabel;
   import com.playata.framework.display.ui.controls.Tab;
   import com.playata.framework.input.InteractionEvent;
   import visuals.ui.base.SymbolUiCheckboxGeneric;
   
   public class UiRadioButton extends Tab
   {
       
      
      private var _content:SymbolUiCheckboxGeneric = null;
      
      private var _caption:ILabel = null;
      
      public function UiRadioButton(param1:SymbolUiCheckboxGeneric, param2:ILabel = null)
      {
         _content = param1;
         super(_content);
         _caption = param2;
         if(_caption)
         {
            _caption.onClick.add(handleCaptionClick);
         }
      }
      
      override public function dispose() : void
      {
         _content = null;
         super.dispose();
      }
      
      public function get content() : IDisplayObject
      {
         return _content;
      }
      
      override public function set enabled(param1:Boolean) : void
      {
         _enabled = param1;
         useHandCursor = _enabled;
         _content.alpha = !!_enabled?1:0.7;
      }
      
      override protected function onSelected() : void
      {
         _content.checked.visible = true;
      }
      
      override protected function onDeselected() : void
      {
         _content.checked.visible = false;
      }
      
      private function handleCaptionClick(param1:InteractionEvent) : void
      {
         onClicked(null);
      }
      
      override protected function onClicked(param1:InteractionEvent) : void
      {
         if(!_enabled)
         {
            Environment.audio.playFX("ui_button_click_disabled.mp3");
            return;
         }
         Environment.audio.playFX("ui_button_click.mp3");
         super.onClicked(param1);
      }
   }
}
