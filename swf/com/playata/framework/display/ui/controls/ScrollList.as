package com.playata.framework.display.ui.controls
{
   import com.playata.framework.core.signal.ISignal;
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.ui.Direction;
   import com.playata.framework.display.ui.IListItem;
   
   public class ScrollList extends List implements IScrollable
   {
       
      
      protected var _scrollBar:IScrollBar = null;
      
      protected var _scrollContainer:IScrollContainer = null;
      
      protected var _appendFromEnd:Boolean = false;
      
      protected var _appendFromEndPadding:int = 0;
      
      public function ScrollList(param1:Sprite, param2:Class, param3:Direction, param4:IScrollBar, param5:Button, param6:Button, param7:Boolean, param8:Boolean, param9:Function = null)
      {
         super(param1,param2,param3,param5,param6,param7,param8,param9);
         onMouseWheel.removeAll();
         var _loc10_:ScrollerDefinition = new ScrollerDefinition();
         _loc10_.policy = _direction == Direction.VERTICAL?ScrollPolicy.VERTICAL:ScrollPolicy.HORIZONTAL;
         _loc10_.width = _listContainer.width;
         _loc10_.height = _listContainer.height;
         _loc10_.scrollIndicatorVertical = null;
         _loc10_.scrollIndicatorHorizontal = null;
         _loc10_.masked = true;
         _loc10_.allowRubberBanding = false;
         _loc10_.enableMouseWheel = true;
         _scrollContainer = new ScrollContainer(_loc10_);
         _listContainer.scale = 1;
         _listContainer.removeAllChildren();
         _listContainer.addChild(_scrollContainer);
         this.scrollBar = param4;
      }
      
      public function set appendFromEnd(param1:Boolean) : void
      {
         _appendFromEnd = param1;
      }
      
      public function get appendFromEnd() : Boolean
      {
         return _appendFromEnd;
      }
      
      public function set appendFromEndPadding(param1:int) : void
      {
         _appendFromEndPadding = param1;
      }
      
      public function get appendFromEndPadding() : int
      {
         return _appendFromEndPadding;
      }
      
      override public function set enabled(param1:Boolean) : void
      {
         .super.enabled = param1;
         _scrollContainer.enabled = param1;
      }
      
      override public function get width() : Number
      {
         return _scrollContainer.width;
      }
      
      override public function set width(param1:Number) : void
      {
         _scrollContainer.width = param1;
      }
      
      override public function get height() : Number
      {
         return _scrollContainer.height;
      }
      
      override public function set height(param1:Number) : void
      {
         _scrollContainer.height = param1;
      }
      
      public function set scrollBar(param1:IScrollBar) : void
      {
         _scrollBar = param1;
         if(_direction == Direction.VERTICAL)
         {
            _scrollContainer.verticalScrollBar = _scrollBar;
         }
         else
         {
            _scrollContainer.horizontalScrollBar = _scrollBar;
         }
      }
      
      public function get scrollBar() : IScrollBar
      {
         return _scrollBar;
      }
      
      public function get verticalScrollBar() : IScrollBar
      {
         if(_direction == Direction.VERTICAL)
         {
            return _scrollContainer.verticalScrollBar;
         }
         return null;
      }
      
      public function set verticalScrollBar(param1:IScrollBar) : void
      {
         if(_direction == Direction.VERTICAL)
         {
            _scrollContainer.verticalScrollBar = param1;
            _scrollBar = param1;
         }
      }
      
      public function get horizontalScrollBar() : IScrollBar
      {
         if(_direction == Direction.HORIZONTAL)
         {
            return _scrollContainer.horizontalScrollBar;
         }
         return null;
      }
      
      public function set horizontalScrollBar(param1:IScrollBar) : void
      {
         if(_direction == Direction.HORIZONTAL)
         {
            _scrollContainer.horizontalScrollBar = param1;
            _scrollBar = param1;
         }
      }
      
      override public function addItem(param1:IListItem, param2:Boolean = true) : void
      {
         var _loc3_:ListLine = addNewLine(param1,_lines.length);
         _scrollContainer.addElement(_loc3_);
         super.addItem(param1,param2);
      }
      
      override public function removeItem(param1:IListItem, param2:Boolean = true) : void
      {
         var _loc3_:ListLine = getLineForItem(param1);
         if(!_loc3_)
         {
            return;
         }
         _scrollContainer.removeElement(_loc3_);
         _lines.removeAt(_lines.indexOf(_loc3_));
         super.removeItem(param1,param2);
      }
      
      override public function clear(param1:Boolean = true) : void
      {
         _scrollContainer.removeAllElements();
         super.clear(param1);
      }
      
      public function get onScroll() : ISignal
      {
         return _scrollContainer.onScroll;
      }
      
      public function scrollToStart(param1:Direction, param2:Number) : void
      {
         _scrollContainer.scrollToStart(param1,param2);
      }
      
      public function scrollTo(param1:Direction, param2:Number, param3:Number) : void
      {
         _scrollContainer.scrollTo(param1,param2,param3);
      }
      
      public function scrollToEnd(param1:Direction, param2:Number) : void
      {
         _scrollContainer.scrollToEnd(param1,param2);
      }
      
      public function isScrollable(param1:Direction) : Boolean
      {
         return _scrollContainer.isScrollable(param1);
      }
      
      public function isAtScrollMin(param1:Direction) : Boolean
      {
         return _scrollContainer.isAtScrollMin(param1);
      }
      
      public function isAtScrollMax(param1:Direction) : Boolean
      {
         return _scrollContainer.isAtScrollMax(param1);
      }
      
      public function getScrollValue(param1:Direction) : Number
      {
         return _scrollContainer.getScrollValue(param1);
      }
      
      public function getScrollMax(param1:Direction) : Number
      {
         return _scrollContainer.getScrollMax(param1);
      }
      
      override protected function scrollUp(param1:int) : void
      {
         if(_btnScrollUp && !_btnScrollUp.visible)
         {
            return;
         }
         if(isAtScrollMin(_direction))
         {
            return;
         }
         scrollTo(_direction,param1,0);
      }
      
      override protected function scrollDown(param1:int) : void
      {
         if(_btnScrollDown && !_btnScrollDown.visible)
         {
            return;
         }
         if(isAtScrollMax(_direction))
         {
            return;
         }
         scrollTo(_direction,param1,0);
      }
      
      override protected function renderList() : void
      {
         var _loc2_:Boolean = false;
         var _loc8_:* = NaN;
         var _loc10_:* = NaN;
         var _loc1_:Number = NaN;
         var _loc4_:Number = NaN;
         if(_btnScrollUp && _btnScrollDown)
         {
            _btnScrollUp.enabled = isScrollable(_direction) && !isAtScrollMin(_direction);
            _btnScrollDown.enabled = isScrollable(_direction) && !isAtScrollMax(_direction);
         }
         var _loc6_:int = 0;
         var _loc3_:* = 0;
         var _loc9_:* = 0;
         var _loc7_:Boolean = true;
         var _loc12_:int = 0;
         var _loc11_:* = _lines;
         for each(var _loc5_ in _lines)
         {
            _loc5_.refresh(_currentListItems.length > _loc6_?_currentListItems[_loc6_]:null,_loc6_);
            if(_loc5_.item == null)
            {
               _loc7_ = false;
               _loc5_.x = 0;
               _loc5_.y = 0;
               _loc5_.visible = false;
            }
            else
            {
               _loc2_ = false;
               if(_direction == Direction.VERTICAL)
               {
                  _loc8_ = _loc9_;
                  if(_loc5_.y != _loc8_)
                  {
                     _loc2_ = true;
                     _loc5_.y = _loc8_;
                  }
                  _loc9_ = Number(_loc9_ + _loc5_.height);
               }
               if(_direction == Direction.HORIZONTAL)
               {
                  _loc10_ = _loc3_;
                  if(_loc5_.x != _loc10_)
                  {
                     _loc2_ = true;
                     _loc5_.x = _loc10_;
                  }
                  _loc3_ = Number(_loc3_ + _loc5_.width);
               }
               if(_loc2_)
               {
                  _scrollContainer.updateElement(_loc5_);
               }
               _loc6_++;
            }
         }
         (_scrollContainer as ScrollContainer).refresh();
         if(_appendFromEnd)
         {
            if(!isScrollable(_direction))
            {
               if(_direction == Direction.VERTICAL)
               {
                  _loc1_ = _scrollContainer.height - _loc9_;
                  _scrollContainer.y = Math.max(0,_loc1_ - _appendFromEndPadding);
               }
               else if(_direction == Direction.HORIZONTAL)
               {
                  _loc4_ = _scrollContainer.width - _loc3_;
                  _scrollContainer.x = Math.max(0,_loc4_ - _appendFromEndPadding);
               }
            }
            else if(_direction == Direction.VERTICAL)
            {
               _scrollContainer.y = 0;
            }
            else if(_direction == Direction.HORIZONTAL)
            {
               _scrollContainer.x = 0;
            }
         }
         if(_scrollBar)
         {
            _scrollBar.refresh();
         }
      }
   }
}
