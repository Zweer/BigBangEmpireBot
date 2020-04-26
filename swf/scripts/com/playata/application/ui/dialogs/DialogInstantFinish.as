package com.playata.application.ui.dialogs
{
   import com.playata.application.ui.elements.generic.button.UiPremiumButton;
   import com.playata.application.ui.elements.generic.button.UiTextButton;
   import com.playata.application.ui.elements.generic.dialog.UiDialog;
   import com.playata.framework.display.ui.controls.Button;
   import com.playata.framework.input.InteractionEvent;
   import visuals.ui.dialogs.SymbolDialogInstantFinishGeneric;
   
   public class DialogInstantFinish extends UiDialog
   {
       
      
      private var _button1:UiPremiumButton = null;
      
      private var _button2:UiTextButton = null;
      
      private var _callbackOnButton1:Function = null;
      
      private var _callbackOnButton2:Function = null;
      
      private var _instantCallbackOnButton1:Boolean = false;
      
      private var _instantCallbackOnButton2:Boolean = false;
      
      public function DialogInstantFinish(param1:String, param2:String, param3:String, param4:String, param5:int, param6:Function = null, param7:Function = null, param8:Boolean = false, param9:Boolean = false)
      {
         var _loc10_:Number = NaN;
         _callbackOnButton1 = param6;
         _callbackOnButton2 = param7;
         _instantCallbackOnButton1 = param8;
         _instantCallbackOnButton2 = param9;
         var _loc11_:SymbolDialogInstantFinishGeneric = new SymbolDialogInstantFinishGeneric();
         super(_loc11_,false);
         _loc11_.textTitle.autoFontSize = true;
         _loc11_.textTitle.text = param1;
         var _loc12_:Number = _loc11_.textMessage.height;
         _loc11_.textMessage.text = param2;
         var _loc13_:Number = _loc11_.textMessage.textHeight;
         if(_loc13_ > _loc12_)
         {
            _loc10_ = _loc13_ - _loc12_;
            _loc11_.background.height = _loc11_.background.height + _loc10_;
            _loc11_.textMessage.height = _loc11_.textMessage.height + (_loc10_ + 5);
            _loc11_.button1.y = _loc11_.button1.y + _loc10_;
            _loc11_.button2.y = _loc11_.button2.y + _loc10_;
         }
         else
         {
            _loc11_.textMessage.verticallyAlignText(60);
         }
         _button1 = new UiPremiumButton(_loc11_.button1,param5,param3,param3,"","",clickHandleButton1);
         _button1.premium = param5 > 0;
         _button2 = new UiTextButton(_loc11_.button2,param4,"",clickHandleButton2);
      }
      
      override public function dispose() : void
      {
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
