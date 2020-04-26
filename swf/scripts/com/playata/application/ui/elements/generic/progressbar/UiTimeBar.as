package com.playata.application.ui.elements.generic.progressbar
{
   import com.greensock.easing.Linear;
   import visuals.ui.elements.generic.SymbolTimeBarGeneric;
   
   public class UiTimeBar extends UiProgressBarFillMasked
   {
       
      
      private var _timeBar:SymbolTimeBarGeneric = null;
      
      private var _animationStarted:Boolean = false;
      
      public function UiTimeBar(param1:SymbolTimeBarGeneric)
      {
         _timeBar = param1;
         super(_timeBar.m,_timeBar.fill);
      }
      
      override public function dispose() : void
      {
         stopAnimation();
         if(_timeBar != null)
         {
            _timeBar.dispose();
            _timeBar = null;
         }
      }
      
      override public function set value(param1:Number) : void
      {
         _timeBar.fill.killTweens();
         .super.value = param1;
      }
      
      public function stopAnimation() : void
      {
         _timeBar.fill.killTweens();
         _animationStarted = false;
      }
      
      public function startAnimation(param1:Number) : void
      {
         _timeBar.fill.tweenTo(param1,{
            "width":_timeBar.background.width,
            "ease":Linear.easeNone
         });
         _animationStarted = true;
      }
   }
}
