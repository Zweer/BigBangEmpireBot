package com.playata.framework.display.ui.controls
{
   import com.playata.framework.display.ui.Direction;
   
   public interface IScrollBar extends IControl
   {
       
      
      function refresh() : void;
      
      function get knob() : IScrollBarKnob;
      
      function get direction() : Direction;
      
      function get isScrolling() : Boolean;
      
      function get scrollValue() : Number;
      
      function set scrollValue(param1:Number) : void;
      
      function scrollToStart(param1:Number) : void;
      
      function scrollTo(param1:Number, param2:Number) : void;
      
      function scrollToEnd(param1:Number) : void;
   }
}
