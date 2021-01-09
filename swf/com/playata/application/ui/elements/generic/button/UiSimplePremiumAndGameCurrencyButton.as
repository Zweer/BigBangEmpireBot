package com.playata.application.ui.elements.generic.button
{
   import visuals.ui.elements.buttons.SymbolButtonSimplePremiumAndGameCurrencyGeneric;
   
   public class UiSimplePremiumAndGameCurrencyButton extends UiButton
   {
       
      
      private var _isPremium:Boolean = false;
      
      private var _isGameCurrency:Boolean = false;
      
      private var _caption:String;
      
      private var _contentVO:SymbolButtonSimplePremiumAndGameCurrencyGeneric;
      
      public function UiSimplePremiumAndGameCurrencyButton(param1:SymbolButtonSimplePremiumAndGameCurrencyGeneric, param2:String, param3:Boolean, param4:Boolean, param5:String, param6:Function)
      {
         super(param1,param5,param6);
         _isPremium = param3;
         _isGameCurrency = param4;
         _contentVO = param1;
         this.caption = param2;
      }
      
      public function get isPremium() : Boolean
      {
         return _isPremium;
      }
      
      public function get isGameCurrency() : Boolean
      {
         return _isGameCurrency;
      }
      
      public function set caption(param1:String) : void
      {
         _caption = param1;
         refresh(_isPremium,_isGameCurrency);
      }
      
      public function get caption() : String
      {
         return _caption;
      }
      
      public function refresh(param1:Boolean, param2:Boolean) : void
      {
         _isPremium = param1;
         _isGameCurrency = param2;
         _contentVO.iconPremiumCurrency.visible = _isPremium;
         _contentVO.iconGameCurrency.visible = _isGameCurrency;
         _contentVO.caption.text = caption;
         if(_contentVO.caption.textWidth + 8 > _contentVO.caption.width)
         {
            _contentVO.caption.width = _contentVO.caption.textWidth + 8;
         }
         var _loc3_:Number = -_contentVO.caption.x * 2;
         var _loc5_:* = Number(_contentVO.caption.textWidth + 8);
         if(param2)
         {
            _loc5_ = Number(_loc5_ + (_contentVO.iconGameCurrency.width + 10));
         }
         if(param1)
         {
            _loc5_ = Number(_loc5_ + (_contentVO.iconPremiumCurrency.width + 10));
         }
         if(_loc5_ > _loc3_)
         {
            _contentVO.bg.width = _loc5_ + 18;
            _contentVO.bg.x = -_contentVO.bg.width / 2;
            _contentVO.caption.x = -_contentVO.bg.width / 2;
         }
         if(_loc5_ < _loc3_)
         {
            _loc5_ = _loc3_;
         }
         var _loc4_:Number = _loc5_ / 2;
         _loc4_ = _loc4_ - 20;
         if(param2)
         {
            _loc4_ = _loc4_ - 40;
            _contentVO.iconGameCurrency.x = _loc4_ + 9;
         }
         if(param1)
         {
            _loc4_ = _loc4_ - 40;
            _contentVO.iconPremiumCurrency.x = _loc4_;
         }
         _contentVO.caption.width = _loc4_ - _contentVO.caption.x;
      }
      
      override public function set buttonEnabled(param1:Boolean) : void
      {
         .super.buttonEnabled = param1;
         if(!param1)
         {
            _isGameCurrency = false;
            _isPremium = false;
            refresh(_isPremium,_isGameCurrency);
         }
      }
   }
}
