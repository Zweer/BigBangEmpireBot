package com.playata.framework.display.layout
{
   import com.playata.framework.core.enum.Enum;
   
   public class Orientation extends Enum
   {
      
      public static const UNKNOWN:Orientation = new Orientation();
      
      public static const PORTRAIT_DEFAULT:Orientation = new Orientation();
      
      public static const PORTRAIT_UPSIDE_DOWN:Orientation = new Orientation();
      
      public static const LANDSCAPE_RIGHT:Orientation = new Orientation();
      
      public static const LANDSCAPE_LEFT:Orientation = new Orientation();
      
      {
         initEnum(Orientation);
      }
      
      public function Orientation()
      {
         super();
      }
      
      public function isLandscape() : Boolean
      {
         return this == LANDSCAPE_RIGHT || this == LANDSCAPE_LEFT;
      }
      
      public function isPortrait() : Boolean
      {
         return this == PORTRAIT_DEFAULT || this == PORTRAIT_UPSIDE_DOWN;
      }
   }
}
