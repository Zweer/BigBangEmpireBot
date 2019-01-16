package com.playata.framework.display.ui.controls
{
   import com.playata.framework.core.enum.Enum;
   
   public class ScrollPolicy extends Enum
   {
      
      public static const HORIZONTAL:ScrollPolicy = new ScrollPolicy();
      
      public static const VERTICAL:ScrollPolicy = new ScrollPolicy();
      
      public static const BOTH:ScrollPolicy = new ScrollPolicy();
      
      {
         initEnum(ScrollPolicy);
      }
      
      public function ScrollPolicy()
      {
         super();
      }
   }
}
