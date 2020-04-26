package com.playata.framework.display.ui
{
   import com.playata.framework.core.enum.Enum;
   
   public class Direction extends Enum
   {
      
      public static const VERTICAL:Direction = new Direction();
      
      public static const HORIZONTAL:Direction = new Direction();
      
      {
         initEnum(Direction);
      }
      
      public function Direction()
      {
         super();
      }
   }
}
