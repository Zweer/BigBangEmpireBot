package com.playata.application.ui.elements.generic.textfield
{
   import com.playata.framework.display.ui.controls.ILabelArea;
   
   public class UiChatOutputTextField extends UiChatOutputBase
   {
       
      
      private var _outputTextField:ILabelArea = null;
      
      public function UiChatOutputTextField(param1:ILabelArea)
      {
         super();
         _outputTextField = param1;
      }
      
      override public function set x(param1:Number) : void
      {
         _outputTextField.x = param1;
      }
      
      override public function get x() : Number
      {
         return _outputTextField.x;
      }
      
      override public function set y(param1:Number) : void
      {
         _outputTextField.y = param1;
      }
      
      override public function get y() : Number
      {
         return _outputTextField.y;
      }
      
      override public function set width(param1:Number) : void
      {
         _outputTextField.width = param1;
      }
      
      override public function get width() : Number
      {
         return _outputTextField.width;
      }
      
      override public function set height(param1:Number) : void
      {
         _outputTextField.height = param1;
      }
      
      override public function get height() : Number
      {
         return _outputTextField.height;
      }
      
      override public function get textField() : ILabelArea
      {
         return _outputTextField;
      }
      
      override public function set text(param1:String) : void
      {
         _outputTextField.htmlText = param1;
      }
      
      override public function clear() : void
      {
         _outputTextField.htmlText = "";
      }
      
      override public function appendText(param1:String) : void
      {
         _outputTextField.htmlText = _outputTextField.htmlText + param1;
      }
      
      override public function replaceText(param1:String, param2:String) : void
      {
         _outputTextField.htmlText = _outputTextField.htmlText.replace(param1,param2);
      }
   }
}
