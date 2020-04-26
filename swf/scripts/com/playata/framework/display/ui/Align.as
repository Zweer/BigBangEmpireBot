package com.playata.framework.display.ui
{
   import com.playata.framework.core.enum.Enum;
   
   public class Align extends Enum
   {
      
      public static const LEFT:Align = new Align();
      
      public static const CENTER:Align = new Align();
      
      public static const RIGHT:Align = new Align();
      
      public static const TOP:Align = new Align();
      
      public static const BOTTOM:Align = new Align();
      
      {
         initEnum(Align);
      }
      
      public function Align()
      {
         super();
      }
   }
}
