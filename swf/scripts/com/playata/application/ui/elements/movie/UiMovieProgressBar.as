package com.playata.application.ui.elements.movie
{
   import com.greensock.easing.Back;
   import com.playata.framework.core.util.TimeUtil;
   import visuals.ui.elements.movie.SymbolMovieMeterGeneric;
   
   public class UiMovieProgressBar
   {
       
      
      private var _content:SymbolMovieMeterGeneric;
      
      private var _value:int = -1;
      
      public function UiMovieProgressBar(param1:SymbolMovieMeterGeneric)
      {
         super();
         _content = param1;
      }
      
      public function set value(param1:int) : void
      {
         if(_content.fill.isTweening)
         {
            _content.fill.killTweens();
            _content.fill.y = 727 - _value / 100 * 340;
            refreshValue();
         }
         if(param1 == _value)
         {
            return;
         }
         _value = param1;
         if(param1 == 0)
         {
            refreshValue();
            _content.fill.y = 727;
            return;
         }
         var _loc2_:Number = 727 - param1 / 100 * 340;
         _content.fill.tweenTo(0.8,{
            "delay":0.75,
            "y":_loc2_,
            "ease":Back.easeIn,
            "onComplete":refreshValue
         });
      }
      
      private function refreshValue() : void
      {
         _content.txtProgressInfo.text = _value + "%";
      }
      
      public function set remainingTime(param1:int) : void
      {
         _content.txtTimeLeft.text = TimeUtil.secondsToStringFormat(param1,"H:m:s");
      }
   }
}
