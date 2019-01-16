package com.playata.application.ui.elements.generic.button
{
   import com.playata.framework.display.IDisplayObjectContainer;
   import com.playata.framework.display.ui.controls.ILabel;
   import com.playata.framework.display.ui.controls.Tooltip;
   import visuals.ui.elements.buttons.SymbolButtonPremiumGeneric;
   
   public class UiPremiumButton extends UiButton
   {
       
      
      private var _dynamicWidthAdjustment:Boolean = true;
      
      private var _premiumAmount:int = 0;
      
      private var _nonPremiumCaption:String = null;
      
      private var _premiumCaption:String = null;
      
      private var _nonPremiumTooltip:String = null;
      
      private var _premiumTooltip:String = null;
      
      private var _premium:Boolean = false;
      
      private var _customTooltip:Tooltip = null;
      
      public function UiPremiumButton(param1:IDisplayObjectContainer, param2:int, param3:String, param4:String, param5:String, param6:String, param7:Function)
      {
         super(param1,"",param7);
         _premiumAmount = param2;
         _nonPremiumCaption = param3;
         _premiumCaption = param4;
         _nonPremiumTooltip = param5;
         _premiumTooltip = param6;
         _premium = false;
         refresh();
      }
      
      public function get realContent() : SymbolButtonPremiumGeneric
      {
         return _content as SymbolButtonPremiumGeneric;
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
      
      public function set nonPremiumCaption(param1:String) : void
      {
         _nonPremiumCaption = param1;
         refresh();
      }
      
      public function set premiumCaption(param1:String) : void
      {
         _premiumCaption = param1;
         refresh();
      }
      
      public function set nonPremiumTooltip(param1:String) : void
      {
         _nonPremiumTooltip = param1;
         refresh();
      }
      
      public function set premiumTooltip(param1:String) : void
      {
         _premiumTooltip = param1;
         refresh();
      }
      
      public function set premium(param1:Boolean) : void
      {
         if(_premium == param1)
         {
            return;
         }
         _premium = param1;
         refresh();
      }
      
      public function get premium() : Boolean
      {
         return _premium;
      }
      
      public function allowDynamicWidthAdjustment(param1:Boolean) : void
      {
         _dynamicWidthAdjustment = param1;
         if(_dynamicWidthAdjustment)
         {
            adjustWidth();
         }
      }
      
      public function set customTooltip(param1:Tooltip) : void
      {
         _customTooltip = param1;
         assignTooltip(_customTooltip);
      }
      
      public function refresh() : void
      {
         var _loc2_:* = null;
         var _loc1_:Object = _content as Object;
         if(_premium)
         {
            _loc1_.gotoAndStop("premium");
            _loc1_.caption.autoFontSize = true;
            _loc1_.cost.caption.autoFontSize = true;
            _loc1_.caption.text = _premiumCaption;
            if(!_customTooltip)
            {
               tooltip = _premiumTooltip;
            }
            _loc1_.iconPremiumCurrency.visible = true;
            _loc2_ = _loc1_.cost as Object;
            _loc2_.caption.text = _premiumAmount.toString();
         }
         else
         {
            _loc1_.gotoAndStop("nonpremium");
            _loc1_.caption.text = _nonPremiumCaption;
            if(!_customTooltip)
            {
               tooltip = _nonPremiumTooltip;
            }
            _loc1_.iconPremiumCurrency.visible = false;
         }
         adjustWidth();
      }
      
      private function adjustWidth() : void
      {
         var _loc4_:Number = NaN;
         var _loc3_:* = null;
         if(!_dynamicWidthAdjustment)
         {
            return;
         }
         var _loc1_:Object = content as Object;
         var _loc6_:ILabel = _loc1_.caption as ILabel;
         var _loc5_:Number = _loc6_.width;
         var _loc2_:Number = _loc6_.textWidth;
         if(_loc2_ > _loc5_)
         {
            _loc4_ = _loc2_ - _loc5_ + 10;
            _loc6_.width = _loc6_.width + _loc4_;
            _loc6_.x = _loc6_.x - Math.round(_loc4_ / 2);
            _loc1_.background.width = _loc1_.background.width + _loc4_;
            _loc1_.background.x = _loc1_.background.x - Math.round(_loc4_ / 2);
            _loc1_.iconPremiumCurrency.x = _loc1_.iconPremiumCurrency.x + Math.round(_loc4_ / 2);
            _loc3_ = _loc1_.cost as Object;
            _loc3_.caption.x = _loc3_.caption.x + Math.round(_loc4_ / 2);
         }
      }
   }
}
