package com.playata.framework.display
{
   import com.playata.framework.core.enum.Enum;
   
   public class AnchorPoint extends Enum
   {
      
      public static const TOP_FIXED:AnchorPoint = new AnchorPoint();
      
      public static const LEFT_FIXED:AnchorPoint = new AnchorPoint();
      
      public static const RIGHT_FIXED:AnchorPoint = new AnchorPoint();
      
      public static const BOTTOM_FIXED:AnchorPoint = new AnchorPoint();
      
      public static const WIDTH_PERCENTAGE:AnchorPoint = new AnchorPoint();
      
      public static const HEIGHT_PERCENTAGE:AnchorPoint = new AnchorPoint();
      
      public static const TOP_LEFT:AnchorPoint = new AnchorPoint();
      
      public static const TOP_RIGHT:AnchorPoint = new AnchorPoint();
      
      public static const BOTTOM_LEFT:AnchorPoint = new AnchorPoint();
      
      public static const BOTTOM_RIGHT:AnchorPoint = new AnchorPoint();
      
      public static const LEFT_RIGHT:AnchorPoint = new AnchorPoint();
      
      public static const TOP_BOTTOM:AnchorPoint = new AnchorPoint();
      
      {
         initEnum(AnchorPoint);
      }
      
      public function AnchorPoint()
      {
         super();
      }
   }
}
