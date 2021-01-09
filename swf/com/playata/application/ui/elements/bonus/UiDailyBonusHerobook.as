package com.playata.application.ui.elements.bonus
{
   import com.playata.framework.display.IDisplayObject;
   import com.playata.framework.display.ui.controls.ILabel;
   import visuals.ui.elements.bonus.SymbolDailyBonusHerobookGeneric;
   import visuals.ui.elements.bonus.SymbolDailyBonusRewardButtonGeneric;
   
   public class UiDailyBonusHerobook extends UiDailyBonusBase
   {
       
      
      private var _content:SymbolDailyBonusHerobookGeneric = null;
      
      public function UiDailyBonusHerobook(param1:SymbolDailyBonusHerobookGeneric, param2:int)
      {
         _content = param1;
         super(param1,param2,1);
      }
      
      override protected function getRewardButton(param1:int) : SymbolDailyBonusRewardButtonGeneric
      {
         return _content.reward;
      }
      
      override protected function get txtCount() : ILabel
      {
         return _content.txtCount;
      }
      
      override protected function get background() : IDisplayObject
      {
         return _content.bg;
      }
      
      override protected function get fill() : IDisplayObject
      {
         return _content.fill;
      }
      
      override protected function get frame() : IDisplayObject
      {
         return _content.frame;
      }
      
      override public function dispose() : void
      {
         _content = null;
         super.dispose();
      }
   }
}
