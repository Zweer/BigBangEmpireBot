package com.playata.framework.input
{
   import com.playata.framework.core.enum.Enum;
   
   public class SwipeDirection extends Enum
   {
      
      public static const NONE:SwipeDirection = new SwipeDirection();
      
      public static const LEFT:SwipeDirection = new SwipeDirection();
      
      public static const RIGHT:SwipeDirection = new SwipeDirection();
      
      public static const UP:SwipeDirection = new SwipeDirection();
      
      public static const DOWN:SwipeDirection = new SwipeDirection();
      
      {
         initEnum(SwipeDirection);
      }
      
      public function SwipeDirection()
      {
         super();
      }
   }
}
