package com.playata.framework.display.ui.controls
{
   import com.playata.framework.core.signal.ISignal;
   import com.playata.framework.display.ui.Direction;
   
   public interface IScrollable extends IControl
   {
       
      
      function get onScroll() : ISignal;
      
      function scrollToStart(param1:Direction, param2:Number) : void;
      
      function scrollTo(param1:Direction, param2:Number, param3:Number) : void;
      
      function scrollToEnd(param1:Direction, param2:Number) : void;
      
      function isScrollable(param1:Direction) : Boolean;
      
      function isAtScrollMin(param1:Direction) : Boolean;
      
      function isAtScrollMax(param1:Direction) : Boolean;
      
      function getScrollValue(param1:Direction) : Number;
      
      function getScrollMax(param1:Direction) : Number;
      
      function get verticalScrollBar() : IScrollBar;
      
      function set verticalScrollBar(param1:IScrollBar) : void;
      
      function get horizontalScrollBar() : IScrollBar;
      
      function set horizontalScrollBar(param1:IScrollBar) : void;
   }
}
