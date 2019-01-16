package com.playata.application.ui.elements.generic.button
{
   import com.playata.framework.display.IDisplayObjectContainer;
   import com.playata.framework.localization.LocText;
   
   public class UiGameCurrencyButton extends UiButton
   {
       
      
      private var _gameCurrencyAmount:int = 0;
      
      private var _caption:String = null;
      
      public function UiGameCurrencyButton(param1:IDisplayObjectContainer, param2:int, param3:String, param4:String, param5:Function)
      {
         super(param1,param4,param5);
         _gameCurrencyAmount = param2;
         _caption = param3;
         refresh();
      }
      
      public function set gameCurrencyAmount(param1:int) : void
      {
         _gameCurrencyAmount = param1;
         refresh();
      }
      
      public function get gameCurrencyAmount() : int
      {
         return _gameCurrencyAmount;
      }
      
      public function set caption(param1:String) : void
      {
         _caption = param1;
         refresh();
      }
      
      public function refresh() : void
      {
         var _loc1_:Object = _content as Object;
         _loc1_.caption.autoFontSize = true;
         _loc1_.cost.caption.autoFontSize = true;
         _loc1_.caption.text = _caption;
         _loc1_.cost.caption.text = LocText.current.formatHugeNumber(_gameCurrencyAmount);
      }
   }
}
