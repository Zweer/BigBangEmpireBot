package com.playata.framework.display
{
   import com.playata.framework.core.enum.Enum;
   
   public class InteractiveDisplayObjectState extends Enum
   {
      
      public static const UP:InteractiveDisplayObjectState = new InteractiveDisplayObjectState();
      
      public static const DOWN:InteractiveDisplayObjectState = new InteractiveDisplayObjectState();
      
      public static const OVER:InteractiveDisplayObjectState = new InteractiveDisplayObjectState();
      
      public static const DISABLED:InteractiveDisplayObjectState = new InteractiveDisplayObjectState();
      
      {
         initEnum(InteractiveDisplayObjectState);
      }
      
      public function InteractiveDisplayObjectState()
      {
         super();
      }
   }
}
