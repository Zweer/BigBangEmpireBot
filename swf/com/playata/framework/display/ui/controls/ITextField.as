package com.playata.framework.display.ui.controls
{
   import com.playata.framework.core.signal.ISignal;
   import com.playata.framework.display.ui.Align;
   import com.playata.framework.display.ui.TextFieldAutoAdjustWidthHeight;
   import flash.geom.Rectangle;
   
   public interface ITextField extends IControl
   {
       
      
      function get onLinkClick() : ISignal;
      
      function get hasLinkClick() : Boolean;
      
      function set text(param1:String) : void;
      
      function get text() : String;
      
      function set htmlText(param1:String) : void;
      
      function get htmlText() : String;
      
      function clear() : void;
      
      function prependText(param1:String) : void;
      
      function appendText(param1:String) : void;
      
      function replaceText(param1:String, param2:String) : void;
      
      function setTextToFit(param1:String, param2:String, param3:Boolean = true) : Boolean;
      
      function set autoAdjustWidthHeight(param1:TextFieldAutoAdjustWidthHeight) : void;
      
      function get autoAdjustWidthHeight() : TextFieldAutoAdjustWidthHeight;
      
      function set fontName(param1:String) : void;
      
      function get fontName() : String;
      
      function set fontSize(param1:uint) : void;
      
      function get fontSize() : uint;
      
      function set autoFontSize(param1:Boolean) : void;
      
      function get autoFontSize() : Boolean;
      
      function set textColor(param1:uint) : void;
      
      function get textColor() : uint;
      
      function set bold(param1:Boolean) : void;
      
      function get bold() : Boolean;
      
      function set italic(param1:Boolean) : void;
      
      function get italic() : Boolean;
      
      function set underline(param1:Boolean) : void;
      
      function get underline() : Boolean;
      
      function set hAlign(param1:Align) : void;
      
      function get hAlign() : Align;
      
      function set vAlign(param1:Align) : void;
      
      function get vAlign() : Align;
      
      function verticallyAlignText(param1:int) : void;
      
      function set leading(param1:int) : void;
      
      function get leading() : int;
      
      function set kerning(param1:Boolean) : void;
      
      function get kerning() : Boolean;
      
      function get textBounds() : Rectangle;
      
      function getTextBounds(param1:Number) : Rectangle;
      
      function get textWidth() : Number;
      
      function get textHeight() : Number;
      
      function get firstVisibleLine() : uint;
      
      function get lastVisibleLine() : uint;
      
      function getLineText(param1:int) : String;
      
      function getLineLength(param1:int) : int;
      
      function set selectable(param1:Boolean) : void;
      
      function get selectable() : Boolean;
      
      function get length() : int;
      
      function get numLines() : int;
   }
}
