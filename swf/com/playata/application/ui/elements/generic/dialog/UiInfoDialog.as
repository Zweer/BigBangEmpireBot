package com.playata.application.ui.elements.generic.dialog
{
   import com.playata.application.ui.elements.generic.button.UiTextButton;
   import com.playata.framework.core.logging.Logger;
   import com.playata.framework.display.ui.controls.Button;
   import com.playata.framework.input.InteractionEvent;
   import visuals.ui.base.SymbolUiDialogInfoGeneric;
   
   public class UiInfoDialog extends UiDialog
   {
       
      
      private var _callbackOnClick:Function = null;
      
      private var _button:UiTextButton = null;
      
      public function UiInfoDialog(param1:String, param2:String, param3:String, param4:Function = null, param5:Boolean = false, param6:Boolean = false)
      {
         var _loc7_:Number = NaN;
         Logger.debug("[Application] Creating info dialog...");
         _callbackOnClick = param4;
         var _loc8_:SymbolUiDialogInfoGeneric = new SymbolUiDialogInfoGeneric();
         super(_loc8_);
         _queued = param5;
         var _loc9_:Number = _loc8_.textMessage.height;
         _loc8_.textTitle.text = param1;
         if(param6)
         {
            _loc8_.textMessage.htmlText = param2;
         }
         else
         {
            _loc8_.textMessage.text = param2;
         }
         var _loc10_:Number = _loc8_.textMessage.textHeight;
         if(_loc10_ > _loc9_)
         {
            _loc7_ = _loc10_ - _loc9_;
            _loc8_.background.height = _loc8_.background.height + _loc7_;
            _loc8_.textMessage.height = _loc8_.textMessage.height + (_loc7_ + 5);
            _loc8_.button1.y = _loc8_.button1.y + _loc7_;
            _loc8_.background.y = _loc8_.background.y - _loc7_ / 2;
            _loc8_.textTitle.y = _loc8_.textTitle.y - _loc7_ / 2;
            _loc8_.textMessage.y = _loc8_.textMessage.y - _loc7_ / 2;
            _loc8_.button1.y = _loc8_.button1.y - _loc7_ / 2;
         }
         else
         {
            _loc8_.textMessage.verticallyAlignText(60);
         }
         _button = new UiTextButton(_loc8_.button1,param3,"",clickHandleButton);
      }
      
      override public function dispose() : void
      {
         Logger.debug("[Application] Destroying info dialog...");
         if(_button)
         {
            _button.dispose();
            _button = null;
         }
         super.dispose();
      }
      
      private function clickHandleButton(param1:InteractionEvent) : void
      {
         close(_callbackOnClick);
      }
      
      override public function get defaultButton() : Button
      {
         return _button;
      }
      
      override public function onEscape() : void
      {
         close(_callbackOnClick);
      }
   }
}
