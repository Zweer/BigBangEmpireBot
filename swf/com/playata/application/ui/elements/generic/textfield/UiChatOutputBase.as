package com.playata.application.ui.elements.generic.textfield
{
   import com.playata.framework.display.ui.Direction;
   import com.playata.framework.display.ui.controls.ILabelArea;
   
   public class UiChatOutputBase
   {
       
      
      protected var _handleLinkCallback:Function = null;
      
      public function UiChatOutputBase()
      {
         super();
      }
      
      public function init(param1:Function) : void
      {
         _handleLinkCallback = param1;
         textField.onLinkClick.add(_handleLinkCallback);
         textField.interactionEnabled = true;
         textField.selectable = true;
         clear();
      }
      
      public function dispose() : void
      {
         textField.dispose();
      }
      
      public function scrollToBottom(param1:Boolean = false) : void
      {
         textField.scrollToEnd(Direction.VERTICAL,!!param1?0.3:0);
      }
      
      public function isAtBottom() : Boolean
      {
         return textField.isAtScrollMax(Direction.VERTICAL);
      }
      
      public function set x(param1:Number) : void
      {
         throw new Error("Must be implemented");
      }
      
      public function get x() : Number
      {
         throw new Error("Must be implemented");
      }
      
      public function set y(param1:Number) : void
      {
         throw new Error("Must be implemented");
      }
      
      public function get y() : Number
      {
         throw new Error("Must be implemented");
      }
      
      public function set width(param1:Number) : void
      {
         throw new Error("Must be implemented");
      }
      
      public function get width() : Number
      {
         throw new Error("Must be implemented");
      }
      
      public function set height(param1:Number) : void
      {
         throw new Error("Must be implemented");
      }
      
      public function get height() : Number
      {
         throw new Error("Must be implemented");
      }
      
      public function get textField() : ILabelArea
      {
         throw new Error("Must be implemented");
      }
      
      public function set text(param1:String) : void
      {
         throw new Error("Must be implemented");
      }
      
      public function clear() : void
      {
         throw new Error("Must be implemented");
      }
      
      public function appendText(param1:String) : void
      {
         throw new Error("Must be implemented");
      }
      
      public function replaceText(param1:String, param2:String) : void
      {
         throw new Error("Must be implemented");
      }
   }
}
