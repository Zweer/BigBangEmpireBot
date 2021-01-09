package com.playata.framework.display.ui.controls
{
   import com.playata.framework.display.IDisplayObject;
   import com.playata.framework.display.InteractiveDisplayObject;
   import com.playata.framework.display.ui.IListItem;
   
   public class ListLine extends InteractiveDisplayObject
   {
       
      
      protected var _content:IDisplayObject = null;
      
      protected var _index:int = 0;
      
      protected var _item:IListItem = null;
      
      public function ListLine(param1:IDisplayObject, param2:int)
      {
         _content = param1;
         _index = param2;
         super(_content);
         if(backgroundHighlight)
         {
            backgroundHighlight.visible = false;
         }
      }
      
      public function get backgroundHighlight() : IDisplayObject
      {
         return null;
      }
      
      public function get backgroundEven() : IDisplayObject
      {
         return null;
      }
      
      public function get backgroundOdd() : IDisplayObject
      {
         return null;
      }
      
      public function get index() : int
      {
         return _index;
      }
      
      public function get item() : IListItem
      {
         return _item;
      }
      
      public function highlight(param1:Boolean) : void
      {
         if(!_content.visible)
         {
            return;
         }
         if(backgroundHighlight == null)
         {
            return;
         }
         if(backgroundHighlight)
         {
            backgroundHighlight.visible = param1;
         }
         if(backgroundEven)
         {
            backgroundEven.visible = (backgroundHighlight == null || !param1) && _index % 2 == 0;
         }
         if(backgroundOdd)
         {
            backgroundOdd.visible = (backgroundHighlight == null || !param1) && _index % 2 != 0;
         }
      }
      
      public function refresh(param1:IListItem, param2:int) : void
      {
         _index = param2;
         _item = param1;
         if(_item == null)
         {
            _content.visible = false;
            return;
         }
         _content.visible = true;
         if(backgroundEven)
         {
            backgroundEven.visible = _index % 2 == 0;
         }
         if(backgroundOdd)
         {
            backgroundOdd.visible = _index % 2 != 0;
         }
      }
   }
}
