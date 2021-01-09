package com.playata.application.ui.elements.bonus
{
   import com.playata.framework.display.IDisplayObject;
   import com.playata.framework.display.ui.controls.ILabel;
   import visuals.ui.elements.bonus.SymbolDailyBonusQuestsGeneric;
   import visuals.ui.elements.bonus.SymbolDailyBonusRewardButtonGeneric;
   
   public class UiDailyBonusQuests extends UiDailyBonusBase
   {
       
      
      private var _content:SymbolDailyBonusQuestsGeneric = null;
      
      public function UiDailyBonusQuests(param1:SymbolDailyBonusQuestsGeneric, param2:int)
      {
         _content = param1;
         super(param1,param2,3);
      }
      
      override protected function getRewardButton(param1:int) : SymbolDailyBonusRewardButtonGeneric
      {
         if(param1 == 0)
         {
            return _content.reward1;
         }
         if(param1 == 1)
         {
            return _content.reward2;
         }
         if(param1 == 2)
         {
            return _content.reward3;
         }
         return _content.reward1;
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
