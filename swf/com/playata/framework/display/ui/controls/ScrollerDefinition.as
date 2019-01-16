package com.playata.framework.display.ui.controls
{
   import com.playata.framework.display.IImage;
   import flash.geom.Rectangle;
   
   public class ScrollerDefinition
   {
       
      
      public var policy:ScrollPolicy;
      
      public var width:Number = -1;
      
      public var height:Number = -1;
      
      public var viewPort:Rectangle;
      
      public var scrollIndicatorVertical:IImage;
      
      public var scrollIndicatorHorizontal:IImage;
      
      public var masked:Boolean = false;
      
      public var allowRubberBanding:Boolean = true;
      
      public var enableMouseWheel:Boolean = true;
      
      public function ScrollerDefinition()
      {
         policy = ScrollPolicy.VERTICAL;
         viewPort = new Rectangle();
         super();
      }
   }
}
