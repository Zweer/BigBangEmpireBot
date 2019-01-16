package com.playata.application.ui.elements.generic.scrollbar
{
   import com.playata.framework.display.IDisplayObject;
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.ui.Direction;
   import com.playata.framework.display.ui.controls.IScrollable;
   import com.playata.framework.display.ui.controls.ScrollBar;
   
   public class UiScrollBar extends ScrollBar
   {
       
      
      private var _scrollKnob:UiScrollBarKnob = null;
      
      public function UiScrollBar(param1:Sprite, param2:IDisplayObject, param3:IScrollable)
      {
         _scrollKnob = new UiScrollBarKnob(param1);
         super(Direction.VERTICAL,param3,param2,_scrollKnob);
      }
   }
}
