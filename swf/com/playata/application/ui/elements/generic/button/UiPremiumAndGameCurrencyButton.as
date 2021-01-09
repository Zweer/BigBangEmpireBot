package com.playata.application.ui.elements.generic.button
{
   import com.playata.framework.localization.LocText;
   import visuals.ui.elements.buttons.SymbolButtonPremiumAndGameCurrencyGeneric;
   
   public class UiPremiumAndGameCurrencyButton extends UiButton
   {
       
      
      private var _premiumAmount:int = 0;
      
      private var _gameCurrencyAmount:int = 0;
      
      private var _caption:String;
      
      private var _contentVO:SymbolButtonPremiumAndGameCurrencyGeneric;
      
      public function UiPremiumAndGameCurrencyButton(param1:SymbolButtonPremiumAndGameCurrencyGeneric, param2:String, param3:int, param4:int, param5:String, param6:Function)
      {
         super(param1,param5,param6);
         _premiumAmount = param3;
         _gameCurrencyAmount = param4;
         _contentVO = param1;
         var _loc7_:Boolean = true;
         param1.costPremium.caption.autoFontSize = _loc7_;
         param1.costGameCurrency.caption.autoFontSize = _loc7_;
         this.caption = param2;
      }
      
      public function set premiumAmount(param1:int) : void
      {
         _premiumAmount = param1;
         refresh();
      }
      
      public function get premiumAmount() : int
      {
         return _premiumAmount;
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
      
      public function get caption() : String
      {
         return _caption;
      }
      
      public function refresh() : void
      {
         var _loc4_:* = premiumAmount > 0;
         _contentVO.iconPremiumCurrency.visible = _loc4_;
         _contentVO.costPremium.visible = _loc4_;
         _loc4_ = gameCurrencyAmount > 0;
         _contentVO.iconGameCurrency.visible = _loc4_;
         _contentVO.costGameCurrency.visible = _loc4_;
         _contentVO.costPremium.caption.text = LocText.current.formatHugeNumber(premiumAmount);
         _contentVO.costGameCurrency.caption.text = LocText.current.formatHugeNumber(gameCurrencyAmount);
         _contentVO.caption.text = caption;
         if(_contentVO.caption.textWidth + 8 > _contentVO.caption.width)
         {
            _contentVO.caption.width = _contentVO.caption.textWidth + 8;
         }
         var _loc1_:Number = -_contentVO.caption.x * 2;
         var _loc3_:* = Number(_contentVO.caption.textWidth + 8);
         if(gameCurrencyAmount > 0)
         {
            _loc3_ = Number(_loc3_ + (_contentVO.iconGameCurrency.width + _contentVO.costGameCurrency.caption.width + 30));
         }
         if(premiumAmount > 0)
         {
            _loc3_ = Number(_loc3_ + (_contentVO.iconPremiumCurrency.width + _contentVO.costPremium.caption.width + 28));
         }
         if(_loc3_ > _loc1_)
         {
            _contentVO.caption.x = -_loc3_ / 2;
            _contentVO.bg.x = _contentVO.caption.x - 1;
            _contentVO.bg.width = _loc3_ + 31;
         }
         if(_loc3_ < _loc1_)
         {
            _loc3_ = _loc1_;
         }
         var _loc2_:Number = _loc3_ / 2;
         if(gameCurrencyAmount > 0)
         {
            _loc2_ = _loc2_ - (_contentVO.costGameCurrency.width + 20);
            _contentVO.costGameCurrency.x = _loc2_;
            _loc2_ = _loc2_ - 10;
            _contentVO.iconGameCurrency.x = _loc2_;
            _loc2_ = _loc2_ - 20;
            _loc4_ = true;
            _contentVO.iconGameCurrency.visible = _loc4_;
            _contentVO.costGameCurrency.visible = _loc4_;
         }
         else
         {
            _loc4_ = false;
            _contentVO.iconGameCurrency.visible = _loc4_;
            _contentVO.costGameCurrency.visible = _loc4_;
         }
         if(premiumAmount > 0)
         {
            _loc2_ = _loc2_ - (_contentVO.costPremium.width + 20);
            _contentVO.costPremium.x = _loc2_;
            _loc2_ = _loc2_ - 18;
            _contentVO.iconPremiumCurrency.x = _loc2_;
            _loc2_ = _loc2_ - 10;
            _loc4_ = true;
            _contentVO.iconPremiumCurrency.visible = _loc4_;
            _contentVO.costPremium.visible = _loc4_;
         }
         else
         {
            _loc4_ = false;
            _contentVO.iconPremiumCurrency.visible = _loc4_;
            _contentVO.costPremium.visible = _loc4_;
         }
         _contentVO.caption.width = _loc2_ - _contentVO.caption.x;
      }
      
      override public function set buttonEnabled(param1:Boolean) : void
      {
         .super.buttonEnabled = param1;
         if(!param1)
         {
            _gameCurrencyAmount = 0;
            _premiumAmount = 0;
            refresh();
         }
      }
   }
}
