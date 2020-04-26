package com.playata.framework.display.ui
{
   import com.playata.framework.display.IDisplayObject;
   
   public interface IDropTarget extends IDisplayObject
   {
       
      
      function acceptsDragSource(param1:IDragSource) : Boolean;
      
      function onDragIn(param1:IDragSource) : void;
      
      function onDragOut(param1:IDragSource) : void;
      
      function onDrop(param1:IDragSource) : Boolean;
   }
}
