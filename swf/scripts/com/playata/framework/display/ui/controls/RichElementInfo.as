package com.playata.framework.display.ui.controls
{
   import com.playata.framework.core.TypedObject;
   import com.playata.framework.display.IInteractiveDisplayObject;
   
   public class RichElementInfo
   {
       
      
      public var index:int = -1;
      
      public var code:String = null;
      
      public var requestVisual:Function = null;
      
      public var tag:TypedObject = null;
      
      public var visual:IInteractiveDisplayObject = null;
      
      public function RichElementInfo()
      {
         super();
      }
   }
}
