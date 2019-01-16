package com.playata.framework.display.ui.controls
{
   import com.playata.framework.display.lib.flash.FlashTypeConverter;
   import com.playata.framework.display.ui.Align;
   import flash.text.TextFormat;
   
   public class TextFieldFormat
   {
       
      
      public var fontName:String = "Verdana";
      
      public var fontSize:uint = 12;
      
      public var color:uint = 0;
      
      public var bold:Boolean = false;
      
      public var italic:Boolean = false;
      
      public var underline:Boolean = false;
      
      public var hAlign:Align;
      
      public var vAlign:Align;
      
      public var autoFontSize:Boolean = false;
      
      public var kerning:Boolean = false;
      
      public var leading:int = 0;
      
      public function TextFieldFormat(param1:String = "Verdana", param2:uint = 12, param3:uint = 0, param4:Boolean = false, param5:Align = null, param6:Align = null, param7:Boolean = false)
      {
         hAlign = Align.CENTER;
         vAlign = Align.CENTER;
         super();
         this.fontName = param1;
         this.fontSize = param2;
         this.color = param3;
         this.bold = param4;
         this.hAlign = param5;
         this.vAlign = param6;
         this.autoFontSize = param7;
      }
      
      public function get toFlashTextFormat() : TextFormat
      {
         var _loc1_:TextFormat = new TextFormat();
         _loc1_.font = fontName;
         _loc1_.size = fontSize;
         _loc1_.color = color;
         _loc1_.bold = bold;
         _loc1_.italic = italic;
         _loc1_.underline = underline;
         _loc1_.align = FlashTypeConverter.toFlashAlign(hAlign);
         _loc1_.kerning = kerning;
         _loc1_.leading = leading;
         return _loc1_;
      }
   }
}
