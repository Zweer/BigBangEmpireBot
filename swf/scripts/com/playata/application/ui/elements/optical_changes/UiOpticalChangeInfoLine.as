package com.playata.application.ui.elements.optical_changes
{
   import com.playata.application.data.optical_changes.OpticalChangeCategorie;
   import com.playata.framework.application.Environment;
   import com.playata.framework.display.InteractiveDisplayObject;
   import com.playata.framework.input.InteractionEvent;
   import visuals.ui.elements.optical_changes.SymbolOpticalChangesLineGeneric;
   
   public class UiOpticalChangeInfoLine extends InteractiveDisplayObject
   {
       
      
      private var _content:SymbolOpticalChangesLineGeneric = null;
      
      private var _index:int = 0;
      
      private var _opticalChangeCategorie:OpticalChangeCategorie = null;
      
      private var _onClickFunction:Function = null;
      
      public function UiOpticalChangeInfoLine(param1:SymbolOpticalChangesLineGeneric, param2:int, param3:Function)
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
      
      public function get opticalChangeCategorie() : OpticalChangeCategorie
      {
         return _opticalChangeCategorie;
      }
      
      override public function dispose() : void
      {
         _opticalChangeCategorie = null;
         _content = null;
         super.dispose();
      }
      
      private function handleClick(param1:InteractionEvent) : void
      {
         Environment.audio.playFX("ui_button_click.mp3");
      }
      
      public function highlight(param1:Boolean) : void
      {
         if(!_content.txtName.visible)
         {
            return;
         }
         _content.backgroundHighlight.visible = param1;
         _content.backgroundEven.visible = !param1 && _index % 2 == 0;
         _content.backgroundOdd.visible = !param1 && _index % 2 != 0;
         if(param1)
         {
            _opticalChangeCategorie.newOpticalChange = false;
            _content.iconExclamationMark.visible = _opticalChangeCategorie.hasCollectableOpticalChangeValues || _opticalChangeCategorie.newOpticalChange;
         }
      }
      
      public function refresh(param1:OpticalChangeCategorie, param2:int) : void
      {
         _index = param2;
         _opticalChangeCategorie = param1;
         _content.backgroundEven.visible = _index % 2 == 0;
         _content.backgroundOdd.visible = _index % 2 != 0;
         if(_opticalChangeCategorie == null)
         {
            _content.txtName.visible = false;
            _content.iconImage.visible = false;
            _content.iconCheckmark.visible = false;
            _content.iconExclamationMark.visible = false;
            return;
         }
         _content.txtName.visible = true;
         _content.iconImage.visible = true;
         _content.iconCheckmark.visible = _opticalChangeCategorie.isFullyCollected();
         _content.iconExclamationMark.visible = _opticalChangeCategorie.hasCollectableOpticalChangeValues || _opticalChangeCategorie.newOpticalChange;
         _content.txtName.text = _opticalChangeCategorie.title + " (" + _opticalChangeCategorie.currentValue + "/" + _opticalChangeCategorie.opticalChanges.length + ")";
         if(_content.txtName.numLines > 1)
         {
            _content.txtName.y = 6;
         }
         else
         {
            _content.txtName.y = 15;
         }
         _content.iconImage.setUriSprite(param1.iconImageUrl,50,50,true,7);
      }
   }
}
