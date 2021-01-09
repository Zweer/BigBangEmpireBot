package com.playata.application.ui.elements.generic.dialog
{
   import com.playata.application.ui.elements.generic.button.UiTextButton;
   import com.playata.framework.core.logging.Logger;
   import com.playata.framework.display.ui.controls.Button;
   import com.playata.framework.input.InteractionEvent;
   import visuals.ui.base.SymbolUiDialogTwoChoiceGeneric;
   
   public class UiTwoChoiceDialog extends UiDialog
   {
       
      
      private var _button1:UiTextButton = null;
      
      private var _button2:UiTextButton = null;
      
      private var _callbackOnButton1:Function = null;
      
      private var _callbackOnButton2:Function = null;
      
      private var _instantCallbackOnButton1:Boolean = false;
      
      private var _instantCallbackOnButton2:Boolean = false;
      
      public function UiTwoChoiceDialog(param1:String, param2:String, param3:String, param4:String, param5:Function = null, param6:Function = null, param7:Boolean = false, param8:Boolean = false)
      {
         var _loc13_:Number = NaN;
         var _loc11_:Number = NaN;
         Logger.debug("[Application] Creating two-choice dialog...");
         _callbackOnButton1 = param5;
         _callbackOnButton2 = param6;
         _instantCallbackOnButton1 = param7;
         _instantCallbackOnButton2 = param8;
         var _loc9_:SymbolUiDialogTwoChoiceGeneric = new SymbolUiDialogTwoChoiceGeneric();
         super(_loc9_,false);
         _loc9_.textTitle.autoFontSize = true;
         _loc9_.textTitle.text = param1;
         _loc9_.textMessage.text = param2;
         _loc9_.textMessage.verticallyAlignText(60);
         _button1 = new UiTextButton(_loc9_.button1,param3,"",clickHandleButton1);
         _button2 = new UiTextButton(_loc9_.button2,param4,"",clickHandleButton2);
         var _loc10_:int = 14;
         var _loc12_:Number = _button2.x - _button2.width / 2 - (_button1.x + _button1.width / 2);
         if(_loc12_ < _loc10_)
         {
            _button1.x = _button1.x - (_loc10_ - _loc12_) / 2;
            _button2.x = _button2.x + (_loc10_ - _loc12_) / 2;
            _loc13_ = _button1.x - _button1.width / 2;
            _loc11_ = _button2.x + _button2.width / 2;
            _button1.x = _button1.x - (_loc11_ + _loc13_) / 2;
            _button2.x = _button2.x - (_loc11_ + _loc13_) / 2;
         }
      }
      
      override public function dispose() : void
      {
         Logger.debug("[Application] Destroying two-choice dialog...");
         if(_button1)
         {
            _button1.dispose();
            _button1 = null;
         }
         if(_button2)
         {
            _button2.dispose();
            _button2 = null;
         }
         super.dispose();
      }
      
      private function clickHandleButton1(param1:InteractionEvent) : void
      {
         if(_instantCallbackOnButton1 && _callbackOnButton1 != null)
         {
            _callbackOnButton1();
            _callbackOnButton1 = null;
         }
         close(_callbackOnButton1);
      }
      
      private function clickHandleButton2(param1:InteractionEvent) : void
      {
         if(_instantCallbackOnButton2 && _callbackOnButton2 != null)
         {
            _callbackOnButton2();
            _callbackOnButton2 = null;
         }
         close(_callbackOnButton2);
      }
      
      override public function get defaultButton() : Button
      {
         return _button1;
      }
   }
}
