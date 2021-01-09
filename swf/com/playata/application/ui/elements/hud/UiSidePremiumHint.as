package com.playata.application.ui.elements.hud
{
   import visuals.ui.elements.duel.SymbolSidePremiumHintGeneric;
   
   public class UiSidePremiumHint
   {
       
      
      private var _content:SymbolSidePremiumHintGeneric;
      
      private var _caption:String;
      
      private var _premiumAmount:int;
      
      public function UiSidePremiumHint(param1:SymbolSidePremiumHintGeneric)
      {
         super();
         _content = param1;
         _content.caption.autoFontSize = true;
         _content.cost.autoFontSize = true;
      }
      
      public function show() : void
      {
         _content.visible = true;
      }
      
      public function hide() : void
      {
         _content.visible = false;
      }
      
      public function set caption(param1:String) : void
      {
         _caption = param1;
         refresh();
      }
      
      public function set premiumAmount(param1:int) : void
      {
         _premiumAmount = param1;
         refresh();
      }
      
      private function refresh() : void
      {
         if(!_caption || _caption == "")
         {
            return;
         }
         _content.caption.text = _caption;
         _content.cost.text = _premiumAmount.toString();
         if(_premiumAmount > 0)
         {
            var _loc1_:Boolean = true;
            _content.cost.visible = _loc1_;
            _content.iconPremiumCurrency.visible = _loc1_;
            _content.iconPremiumCurrency.x = Math.round(_content.caption.x + _content.caption.width + 4);
            _content.cost.x = Math.round(_content.iconPremiumCurrency.x + _content.iconPremiumCurrency.width + 4);
            _content.bg.width = _content.cost.x + _content.cost.width + 15;
         }
         else
         {
            _loc1_ = false;
            _content.cost.visible = _loc1_;
            _content.iconPremiumCurrency.visible = _loc1_;
            _content.bg.width = _content.caption.x + _content.caption.width + 15;
         }
      }
      
      public function get content() : SymbolSidePremiumHintGeneric
      {
         return _content;
      }
   }
}
