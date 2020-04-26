package com.playata.application.ui.elements.generic.progressbar
{
   import com.greensock.easing.Ease;
   import com.greensock.easing.Linear;
   import com.playata.framework.display.IDisplayObject;
   import com.playata.framework.display.IDisplayObjectContainer;
   import com.playata.framework.display.ui.controls.ProgressBar;
   
   public class UiProgressBarFillMasked extends ProgressBar
   {
       
      
      protected var _baseWidth:Number = 0;
      
      protected var _mask:IDisplayObject = null;
      
      protected var _fill:IDisplayObjectContainer = null;
      
      public function UiProgressBarFillMasked(param1:IDisplayObject, param2:IDisplayObjectContainer)
      {
         _mask = param1;
         _baseWidth = _mask.width;
         _fill = param2;
         _fill.x = _mask.x;
         super(_fill);
         _fill.mask = param1;
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
         _fill.width = 0;
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
         _fill.tweenTo(tweenDuration,{
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
         _fill.width = value * _baseWidth;
      }
   }
}
