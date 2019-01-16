package com.playata.framework.display.ui.controls
{
   import com.playata.framework.core.util.NumberUtil;
   import com.playata.framework.display.IDisplayObject;
   import com.playata.framework.display.ui.Direction;
   import com.playata.framework.input.InputCore;
   import com.playata.framework.input.InteractionEvent;
   
   public class ScrollBar extends Control implements IScrollBar
   {
       
      
      protected var _direction:Direction = null;
      
      protected var _scrollable:IScrollable = null;
      
      protected var _knob:IScrollBarKnob = null;
      
      protected var _scrolling:Boolean = false;
      
      protected var _scrollValue:Number = 0;
      
      protected var _oldMouseValue:Number = 0;
      
      public function ScrollBar(param1:Direction, param2:IScrollable, param3:IDisplayObject, param4:IScrollBarKnob)
      {
         super(param3);
         _direction = param1;
         _scrollable = param2;
         _knob = param4;
         _knob.onInteractionDown.add(startScroll);
         _knob.onInteractionUp.add(stopScroll);
      }
      
      public function refresh() : void
      {
         if(_scrolling)
         {
            return;
         }
         scrollValue = _scrollable.getScrollValue(_direction);
      }
      
      public function get knob() : IScrollBarKnob
      {
         return _knob;
      }
      
      public function get direction() : Direction
      {
         return _direction;
      }
      
      public function get isScrolling() : Boolean
      {
         return _scrolling;
      }
      
      override public function set visible(param1:Boolean) : void
      {
         _knob.visible = param1;
         .super.visible = param1;
      }
      
      public function get scrollValue() : Number
      {
         var _loc1_:Number = _scrollable.getScrollMax(_direction);
         var _loc2_:* = 0;
         if(_direction == Direction.HORIZONTAL)
         {
            _loc2_ = Number(this.width - _knob.width);
         }
         else
         {
            _loc2_ = Number(this.height - _knob.height);
         }
         var _loc3_:Number = _loc1_ / _loc2_;
         if(_direction == Direction.HORIZONTAL)
         {
            return (_knob.x - this.x) * _loc3_;
         }
         return (_knob.y - this.y) * _loc3_;
      }
      
      public function set scrollValue(param1:Number) : void
      {
         visible = _scrollable.isScrollable(_direction);
         if(!visible)
         {
            return;
         }
         var _loc2_:Number = _scrollable.getScrollMax(_direction);
         var _loc3_:* = 0;
         if(_direction == Direction.HORIZONTAL)
         {
            _loc3_ = Number(this.width - _knob.width);
         }
         else
         {
            _loc3_ = Number(this.height - _knob.height);
         }
         var _loc4_:Number = _loc2_ / _loc3_;
         if(_direction == Direction.HORIZONTAL)
         {
            _knob.x = NumberUtil.clampf(this.x + param1 / _loc4_,this.x,this.x + this.width - _knob.width);
         }
         else
         {
            _knob.y = NumberUtil.clampf(this.y + param1 / _loc4_,this.y,this.y + this.height - _knob.height);
         }
      }
      
      public function scrollToStart(param1:Number) : void
      {
         _scrollable.scrollToStart(_direction,param1);
      }
      
      public function scrollTo(param1:Number, param2:Number) : void
      {
         _scrollable.scrollTo(_direction,param1,param2);
      }
      
      public function scrollToEnd(param1:Number) : void
      {
         _scrollable.scrollToEnd(_direction,param1);
      }
      
      protected function moveKnob(param1:Number) : void
      {
         var _loc2_:* = 0;
         _scrollValue = _scrollValue + param1;
         if(_direction == Direction.HORIZONTAL)
         {
            _loc2_ = Number(_knob.x);
            _knob.x = _scrollValue;
         }
         else
         {
            _loc2_ = Number(_knob.y);
            _knob.y = _scrollValue;
         }
         if(_direction == Direction.HORIZONTAL)
         {
            _knob.x = NumberUtil.clampf(_knob.x,this.x,this.x + this.width - _knob.width);
            if(_loc2_ == _knob.x)
            {
               return;
            }
         }
         else
         {
            _knob.y = NumberUtil.clampf(_knob.y,this.y,this.y + this.height - _knob.height);
            if(_loc2_ == _knob.y)
            {
               return;
            }
         }
         _scrollable.scrollTo(_direction,scrollValue,0);
      }
      
      protected function startScroll(param1:InteractionEvent) : void
      {
         if(_enabled == false)
         {
            return;
         }
         if(_scrolling)
         {
            return;
         }
         if(!_scrollable.isScrollable(_direction))
         {
            return;
         }
         _scrolling = true;
         _oldMouseValue = mouseValue;
         if(_direction == Direction.HORIZONTAL)
         {
            _scrollValue = _knob.x;
         }
         else
         {
            _scrollValue = _knob.y;
         }
         InputCore.current.mouse.onMove.add(handleInteractionMove);
      }
      
      protected function stopScroll(param1:InteractionEvent) : void
      {
         if(_scrolling == false)
         {
            return;
         }
         _scrolling = false;
         InputCore.current.mouse.onMove.remove(handleInteractionMove);
      }
      
      protected function handleInteractionMove(param1:InteractionEvent) : void
      {
         var _loc2_:Number = NaN;
         var _loc3_:Number = NaN;
         if(_scrolling)
         {
            _loc2_ = mouseValue;
            _loc3_ = _loc2_ - _oldMouseValue;
            _oldMouseValue = _loc2_;
            moveKnob(_loc3_);
         }
      }
      
      protected function get mouseValue() : Number
      {
         if(_direction == Direction.HORIZONTAL)
         {
            return InputCore.current.mouse.mouseX;
         }
         return InputCore.current.mouse.mouseY;
      }
   }
}
