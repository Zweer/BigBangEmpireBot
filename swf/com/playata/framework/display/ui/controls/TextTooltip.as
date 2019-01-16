package com.playata.framework.display.ui.controls
{
   import com.playata.framework.display.IDisplayObject;
   import com.playata.framework.display.IInteractiveDisplayObject;
   import com.playata.framework.input.InteractionEvent;
   
   public class TextTooltip extends Tooltip
   {
       
      
      protected var _requestTextFunction:Function = null;
      
      protected var _isHtml:Boolean = false;
      
      protected var _text:String = null;
      
      public function TextTooltip(param1:IInteractiveDisplayObject, param2:IDisplayObject, param3:String, param4:Function = null)
      {
         super(param1,param2);
         _requestTextFunction = param4;
         text = param3;
      }
      
      public function set requestTextFunction(param1:Function) : void
      {
         _requestTextFunction = param1;
      }
      
      public function get requestTextFunction() : Function
      {
         return _requestTextFunction;
      }
      
      override protected function handleInteractionOver(param1:InteractionEvent) : void
      {
         if(_requestTextFunction != null)
         {
            text = _requestTextFunction();
         }
         super.handleInteractionOver(param1);
      }
      
      public function set text(param1:String) : void
      {
         _isHtml = false;
         if(_text == param1)
         {
            return;
         }
         _text = param1;
         onTextChanged();
      }
      
      public function get text() : String
      {
         return _text;
      }
      
      public function set htmlText(param1:String) : void
      {
         _isHtml = true;
         if(_text == param1)
         {
            return;
         }
         _text = param1;
         onTextChanged();
      }
      
      protected function onTextChanged() : void
      {
      }
   }
}
