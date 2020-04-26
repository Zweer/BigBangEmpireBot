package com.playata.framework.display.ui.controls
{
   import com.playata.framework.core.signal.ISignal;
   import com.playata.framework.core.signal.Signal;
   import com.playata.framework.core.util.NumberUtil;
   import com.playata.framework.display.IDisplayObject;
   import com.playata.framework.display.InteractiveDisplayObject;
   import com.playata.framework.display.ui.Direction;
   import com.playata.framework.input.InputCore;
   import com.playata.framework.input.InteractionEvent;
   import flash.geom.Point;
   
   public class Slider extends Control
   {
       
      
      protected var _bar:InteractiveDisplayObject = null;
      
      protected var _btnKnob:Button = null;
      
      protected var _direction:Direction;
      
      protected var _minValue:Number;
      
      protected var _maxValue:Number;
      
      protected var _numberOfSteps:uint = 0;
      
      protected var _initOffset:Number;
      
      protected var _position:uint = 0;
      
      protected var _sliding:Boolean = false;
      
      protected var _barCorrection:uint = 0;
      
      protected var _onValueChanged:ISignal = null;
      
      public function Slider(param1:IDisplayObject, param2:IDisplayObject, param3:Button, param4:String, param5:Number, param6:Number, param7:uint, param8:Direction)
      {
         _bar = new InteractiveDisplayObject(param2);
         _btnKnob = param3;
         _minValue = param5;
         _maxValue = param6;
         _numberOfSteps = param7;
         _direction = param8;
         if(_direction == Direction.VERTICAL)
         {
            _initOffset = _btnKnob.y;
         }
         else
         {
            _initOffset = _btnKnob.x;
         }
         _bar.onInteractionDown.add(handleInteractionDown);
         _btnKnob.onInteractionDown.add(handleInteractionDown);
         _btnKnob.onInteractionUp.add(handleInteractionUp);
         super(param1);
      }
      
      override public function dispose() : void
      {
         _bar.dispose();
         _bar = null;
         _btnKnob.dispose();
         _btnKnob = null;
         if(_onValueChanged != null)
         {
            _onValueChanged.removeAll();
            _onValueChanged = null;
         }
         if(_sliding)
         {
            InputCore.current.mouse.onMove.remove(handleInteractionMove);
         }
         super.dispose();
      }
      
      public function get direction() : Direction
      {
         return _direction;
      }
      
      public function get minValue() : Number
      {
         return _minValue;
      }
      
      public function get maxValue() : Number
      {
         return _maxValue;
      }
      
      public function get numberOfSteps() : uint
      {
         return _numberOfSteps;
      }
      
      public function get onValueChanged() : ISignal
      {
         if(_onValueChanged == null)
         {
            _onValueChanged = new Signal();
         }
         return _onValueChanged;
      }
      
      public function get barCorrection() : Number
      {
         return _barCorrection;
      }
      
      public function set barCorrection(param1:Number) : void
      {
         _barCorrection = param1;
      }
      
      public function get knob() : Button
      {
         return _btnKnob;
      }
      
      public function get value() : Number
      {
         var _loc1_:Number = _position / _numberOfSteps;
         return (_maxValue - _minValue) * _loc1_ + _minValue;
      }
      
      public function set value(param1:Number) : void
      {
         if(!_enabled)
         {
            return;
         }
         if(param1 < _minValue || param1 > _maxValue)
         {
            return;
         }
         var _loc2_:Number = (param1 - _minValue) / (_maxValue - _minValue);
         if(_direction == Direction.VERTICAL)
         {
            _btnKnob.y = calculatePosition(_loc2_);
         }
         else
         {
            _btnKnob.x = calculatePosition(_loc2_);
         }
         if(_onValueChanged != null)
         {
            _onValueChanged.dispatch(value);
         }
      }
      
      private function handleInteractionDown(param1:InteractionEvent) : void
      {
         var _loc2_:Number = NaN;
         if(!_enabled)
         {
            return;
         }
         if(param1.target != _btnKnob)
         {
            _loc2_ = calculateByMousePosition();
            if(_direction == Direction.VERTICAL)
            {
               if(_btnKnob.y == _loc2_)
               {
                  return;
               }
               _btnKnob.y = _loc2_;
            }
            else
            {
               if(_btnKnob.x == _loc2_)
               {
                  return;
               }
               _btnKnob.x = _loc2_;
            }
            if(_onValueChanged != null)
            {
               _onValueChanged.dispatch(value);
            }
            return;
         }
         _sliding = true;
         InputCore.current.mouse.onMove.add(handleInteractionMove);
      }
      
      private function handleInteractionUp(param1:InteractionEvent) : void
      {
         if(!_enabled)
         {
            return;
         }
         _sliding = false;
         InputCore.current.mouse.onMove.remove(handleInteractionMove);
      }
      
      private function handleInteractionMove(param1:InteractionEvent) : void
      {
         var _loc2_:Number = NaN;
         if(!_enabled)
         {
            return;
         }
         if(_sliding)
         {
            _loc2_ = calculateByMousePosition();
            if(_direction == Direction.VERTICAL)
            {
               if(_btnKnob.y == _loc2_)
               {
                  return;
               }
               _btnKnob.y = _loc2_;
            }
            else
            {
               if(_btnKnob.x == _loc2_)
               {
                  return;
               }
               _btnKnob.x = _loc2_;
            }
            if(_onValueChanged != null)
            {
               _onValueChanged.dispatch(value);
            }
         }
      }
      
      private function calculateByMousePosition() : uint
      {
         var _loc1_:Number = NaN;
         var _loc2_:Point = new Point(InputCore.current.mouse.mouseX,InputCore.current.mouse.mouseY);
         var _loc3_:Point = _bar.globalToLocal(_loc2_);
         if(_direction != Direction.VERTICAL)
         {
            _loc1_ = NumberUtil.clampf(_loc3_.x * _bar.scaleX / barWidth,0,1);
         }
         else
         {
            _loc1_ = NumberUtil.clampf(_loc3_.y * _bar.scaleY / barHeight,0,1);
         }
         return calculatePosition(_loc1_);
      }
      
      private function calculatePosition(param1:Number) : uint
      {
         var _loc4_:* = 0;
         var _loc3_:* = 0;
         var _loc2_:Number = NaN;
         if(_direction != Direction.VERTICAL)
         {
            _loc4_ = uint(Math.round(param1 * _numberOfSteps));
            if(_loc4_ == _position)
            {
               return _btnKnob.x;
            }
            _position = _loc4_;
            _loc3_ = uint(NumberUtil.clampf(_position / _numberOfSteps * barWidth,0,barWidth));
            return _loc3_ + _initOffset;
         }
         _loc4_ = uint(Math.round(param1 * _numberOfSteps));
         if(_loc4_ == _position)
         {
            return _btnKnob.y;
         }
         _position = _loc4_;
         _loc2_ = NumberUtil.clampf(_position / _numberOfSteps * barHeight,0,barHeight);
         return _loc2_ + _initOffset;
      }
      
      private function get barWidth() : Number
      {
         return _bar.width - _barCorrection;
      }
      
      private function get barHeight() : Number
      {
         return _bar.height - _barCorrection;
      }
   }
}
