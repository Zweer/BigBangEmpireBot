package com.playata.application.ui.elements.stats
{
   import com.greensock.TweenMax;
   import com.greensock.easing.Sine;
   import com.playata.framework.display.IDisplayObject;
   import visuals.ui.elements.gauge.SymbolGaugeNeedleInnerGeneric;
   
   public class NeedleStuttering
   {
       
      
      public var max:Number;
      
      private var _content:IDisplayObject;
      
      private var _target:Number;
      
      private var _playing:Boolean;
      
      public function NeedleStuttering(param1:SymbolGaugeNeedleInnerGeneric)
      {
         super();
         _content = param1;
         _target = 0;
         max = 0;
      }
      
      public function start() : void
      {
         _playing = true;
         startNextTween();
      }
      
      public function stop() : void
      {
         _playing = false;
         _content.killTweens();
         new TweenMax(_content,0.05,{
            "rotation":0,
            "ease":Sine.easeInOut
         });
         max = 0;
         _target = 0;
      }
      
      private function startNextTween() : void
      {
         if(!_playing)
         {
            return;
         }
         _target = _target > 0?-max:Number(max);
         §§push(new TweenMax(_content,0.05,{
            "rotation":_target,
            "ease":Sine.easeInOut,
            "onComplete":startNextTween
         }));
      }
   }
}
