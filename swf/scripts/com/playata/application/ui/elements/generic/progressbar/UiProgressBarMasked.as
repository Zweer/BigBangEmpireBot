package com.playata.application.ui.elements.generic.progressbar
{
   import com.greensock.easing.Ease;
   import com.greensock.easing.Linear;
   import com.playata.framework.display.DisplayObjectFactory;
   import com.playata.framework.display.IDisplayObjectContainer;
   import com.playata.framework.display.IQuad;
   import com.playata.framework.display.ui.controls.ProgressBar;
   
   public class UiProgressBarMasked extends ProgressBar
   {
       
      
      protected var _baseWidth:Number = 0;
      
      protected var _fill:IDisplayObjectContainer = null;
      
      public function UiProgressBarMasked(param1:Number, param2:IDisplayObjectContainer)
      {
         _baseWidth = param1;
         _fill = param2;
         super(_fill);
         var _loc3_:IQuad = DisplayObjectFactory.createQuadFromSettings({
            "x":0,
            "y":0,
            "width":_fill.width,
            "height":_fill.height
         });
         _fill.addChild(_loc3_);
         _fill.mask = _loc3_;
         reset();
      }
      
      override public function set value(param1:Number) : void
      {
         .super.value = param1 / 100;
      }
      
      public function set percentValue(param1:Number) : void
      {
         .super.value = param1;
      }
      
      public function reset() : void
      {
         _fill.mask.width = 0;
         refresh();
      }
      
      public function setValueAndTween(param1:Number, param2:Number, param3:Number = 0, param4:Function = null, param5:Ease = null) : void
      {
         value = param1;
         tweenDuration = param2;
         tweenDelay = param3;
         onComplete = param4;
         ease = param5;
         if(value > _maxValue)
         {
            var value:Number = _maxValue;
         }
         if(value == _currentValue)
         {
            return;
         }
         if(value < 0)
         {
            value = 0;
         }
         if(!ease)
         {
            var ease:Ease = Linear.easeNone;
         }
         var oldValue:Number = _currentValue;
         _fill.mask.tweenTo(tweenDuration,{
            "delay":tweenDelay,
            "width":value * _baseWidth,
            "ease":ease,
            "onComplete":function():void
            {
               _currentValue = value;
               onValueChanged(oldValue,_currentValue);
               if(onComplete != null)
               {
                  onComplete();
               }
            }
         });
      }
      
      override protected function onMaxChanged(param1:Number, param2:Number) : void
      {
         refresh();
      }
      
      override protected function onValueChanged(param1:Number, param2:Number) : void
      {
         refresh();
      }
      
      protected function refresh() : void
      {
         _fill.mask.width = value * _baseWidth;
      }
   }
}
