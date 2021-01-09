package com.playata.application.ui.elements.generic.color_picker
{
   import com.playata.framework.application.Environment;
   import com.playata.framework.display.InteractiveDisplayObject;
   import com.playata.framework.input.InteractionEvent;
   import visuals.ui.elements.guild.SymbolColorBoxGeneric;
   import visuals.ui.elements.guild.SymbolColorBoxPickerGeneric;
   
   public class UiColorBoxPicker
   {
       
      
      private const MAX_HORIZONTAL_BOXES:int = 6;
      
      private const BOX_MARGIN:int = 4;
      
      private const BOX_BORDER:int = 8;
      
      private var _tooltipLayer:InteractiveDisplayObject;
      
      private var _content:SymbolColorBoxPickerGeneric = null;
      
      private var _onColorChange:Function = null;
      
      private var _isOpen:Boolean = false;
      
      private var _colorBoxes:Vector.<UiColorBox>;
      
      private var _originalX:Number = 0;
      
      private var _originalWidth:Number = 0;
      
      private var _originalHeight:Number = 0;
      
      public function UiColorBoxPicker(param1:SymbolColorBoxPickerGeneric, param2:Function = null)
      {
         _colorBoxes = new Vector.<UiColorBox>();
         super();
         _content = param1;
         _onColorChange = param2;
         _content.visible = false;
         _originalX = _content.x;
         _originalWidth = _content.width;
         _originalHeight = _content.height;
         _tooltipLayer = new InteractiveDisplayObject(_content.tooltipLayer);
      }
      
      public function dispose() : void
      {
         _tooltipLayer.dispose();
         var _loc3_:int = 0;
         var _loc2_:* = _colorBoxes;
         for each(var _loc1_ in _colorBoxes)
         {
            _loc1_.dispose();
         }
      }
      
      private function handleInteractionOut(param1:InteractionEvent) : void
      {
         if(param1.rawEvent.relatedObject is SymbolColorBox)
         {
            return;
         }
         close();
      }
      
      public function set onColorChange(param1:Function) : void
      {
         _onColorChange = param1;
      }
      
      public function open(param1:Vector.<uint>, param2:uint, param3:Function = null) : void
      {
         var _loc8_:* = null;
         if(_isOpen && param3 != null && param3 == _onColorChange)
         {
            close();
            return;
         }
         _isOpen = true;
         _onColorChange = param3;
         _colorBoxes = new Vector.<UiColorBox>();
         _content.boxes.removeAllChildren();
         var _loc4_:* = 0;
         var _loc7_:* = 0;
         var _loc6_:int = 0;
         var _loc10_:int = 0;
         var _loc9_:* = param1;
         for each(var _loc5_ in param1)
         {
            if(_loc6_ != 0 && _loc6_ % 6 == 0)
            {
               _loc4_ = 0;
               _loc7_ = Number(_loc7_ + (_content.boxes.getChildAt(0).height + 4));
            }
            _loc8_ = new UiColorBox(new SymbolColorBoxGeneric(),_loc5_,"",onClickSelect);
            _loc8_.content.x = _loc4_ + _loc8_.content.width / 2;
            _loc8_.content.y = _loc7_ + _loc8_.content.height / 2;
            if(_loc5_ == param2)
            {
               _loc8_.active = true;
            }
            _content.boxes.addChild(_loc8_.content);
            _colorBoxes.push(_loc8_);
            _loc4_ = Number(_loc4_ + (_loc8_.content.width + 4));
            _loc6_++;
         }
         _content.boxes.x = 8;
         _content.boxes.y = 8;
         _content.background.width = _content.boxes.width + 8 * 2 + 2;
         _content.background.height = _content.boxes.height + 8 * 2 + 5;
         _content.visible = true;
         _tooltipLayer.onInteractionOut.add(handleInteractionOut);
      }
      
      public function close() : void
      {
         if(_isOpen)
         {
            _content.visible = false;
         }
         _isOpen = false;
      }
      
      private function onClickSelect(param1:UiColorBox) : void
      {
         if(_onColorChange != null)
         {
            Environment.audio.playFX("ui_button_click.mp3");
            var _loc4_:int = 0;
            var _loc3_:* = _colorBoxes;
            for each(var _loc2_ in _colorBoxes)
            {
               _loc2_.active = param1 == _loc2_;
            }
            _onColorChange(param1.color);
         }
      }
      
      public function get content() : SymbolColorBoxPickerGeneric
      {
         return _content;
      }
      
      public function get activeColor() : UiColorBox
      {
         var _loc3_:int = 0;
         var _loc2_:* = _colorBoxes;
         for each(var _loc1_ in _colorBoxes)
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
