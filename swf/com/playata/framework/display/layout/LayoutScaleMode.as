package com.playata.framework.display.layout
{
   import com.playata.framework.core.enum.Enum;
   
   public class LayoutScaleMode extends Enum
   {
      
      public static const NONE:LayoutScaleMode = new LayoutScaleMode();
      
      public static const FIT_WIDTH:LayoutScaleMode = new LayoutScaleMode();
      
      public static const FIT_HEIGHT:LayoutScaleMode = new LayoutScaleMode();
      
      {
         initEnum(LayoutScaleMode);
      }
      
      public function LayoutScaleMode()
      {
         super();
      }
   }
}
