package com.playata.framework.display.ui
{
   import com.playata.framework.display.IDisplayObject;
   
   public interface IDragSource extends IDisplayObject
   {
       
      
      function onDragStart() : void;
      
      function onDragComplete(param1:IDropTarget) : void;
   }
}
