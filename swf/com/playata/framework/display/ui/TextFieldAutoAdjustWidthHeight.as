package com.playata.framework.display.ui
{
   import com.playata.framework.core.enum.Enum;
   
   public class TextFieldAutoAdjustWidthHeight extends Enum
   {
      
      public static const NONE:TextFieldAutoAdjustWidthHeight = new TextFieldAutoAdjustWidthHeight();
      
      public static const HORIZONTAL:TextFieldAutoAdjustWidthHeight = new TextFieldAutoAdjustWidthHeight();
      
      public static const VERTICAL:TextFieldAutoAdjustWidthHeight = new TextFieldAutoAdjustWidthHeight();
      
      public static const BOTH_DIRECTIONS:TextFieldAutoAdjustWidthHeight = new TextFieldAutoAdjustWidthHeight();
      
      {
         initEnum(TextFieldAutoAdjustWidthHeight);
      }
      
      public function TextFieldAutoAdjustWidthHeight()
      {
         super();
      }
   }
}
