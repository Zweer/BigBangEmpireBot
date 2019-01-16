package com.playata.application.ui.elements.resource
{
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.framework.display.ui.controls.ILabel;
   import visuals.ui.elements.buttons.SymbolButtonResourceGeneric;
   
   public class UiResourceButton extends UiButton
   {
       
      
      private var _dynamicWidthAdjustment:Boolean = true;
      
      private var _contentButton:SymbolButtonResourceGeneric = null;
      
      private var _amount:int = 0;
      
      private var _caption:String = null;
      
      private var _iconIndex:int = 0;
      
      public function UiResourceButton(param1:SymbolButtonResourceGeneric, param2:int, param3:int, param4:String, param5:String, param6:Function, param7:Boolean = false)
      {
         _contentButton = param1;
         _amount = param3;
         _caption = param4;
         _iconIndex = param2;
         super(param1,param5,param6);
         this.premiumMode = param7;
         refresh();
      }
      
      public function set premiumMode(param1:Boolean) : void
      {
         _contentButton.iconPremiumCurrency.visible = param1;
         _contentButton.iconResource.visible = !param1;
         if(!param1)
         {
            _contentButton.iconResource.gotoAndStop(_iconIndex);
         }
      }
      
      public function get premiumMode() : Boolean
      {
         return _contentButton.iconPremiumCurrency.visible;
      }
      
      public function set amount(param1:int) : void
      {
         _amount = param1;
         refresh();
      }
      
      public function get amount() : int
      {
         return _amount;
      }
      
      public function set caption(param1:String) : void
      {
         _caption = param1;
         refresh();
      }
      
      override public function set tooltip(param1:String) : void
      {
         .super.tooltip = param1;
         refresh();
      }
      
      public function allowDynamicWidthAdjustment(param1:Boolean) : void
      {
         _dynamicWidthAdjustment = param1;
         if(_dynamicWidthAdjustment)
         {
            adjustWidth();
         }
      }
      
      public function refresh() : void
      {
         var _loc1_:SymbolButtonResourceGeneric = content as SymbolButtonResourceGeneric;
         _loc1_.caption.text = _caption;
         _loc1_.cost.caption.text = _amount.toString();
         adjustWidth();
      }
      
      private function adjustWidth() : void
      {
         var _loc3_:Number = NaN;
         if(!_dynamicWidthAdjustment)
         {
            return;
         }
         var _loc2_:SymbolButtonResourceGeneric = content as SymbolButtonResourceGeneric;
         var _loc5_:ILabel = _loc2_.caption;
         var _loc4_:Number = _loc5_.width;
         var _loc1_:Number = _loc5_.textWidth;
         if(_loc1_ > _loc4_)
         {
            _loc3_ = _loc1_ - _loc4_ + 10;
            _loc5_.width = _loc5_.width + _loc3_;
            _loc5_.x = _loc5_.x - Math.round(_loc3_ / 2);
            _loc2_.bg.width = _loc2_.bg.width + _loc3_;
            _loc2_.bg.x = _loc2_.bg.x - Math.round(_loc3_ / 2);
            _loc2_.iconResource.x = _loc2_.iconResource.x + Math.round(_loc3_ / 2);
            _loc2_.iconPremiumCurrency.x = _loc2_.iconPremiumCurrency.x + Math.round(_loc3_ / 2);
            _loc2_.cost.caption.x = _loc2_.cost.caption.x + Math.round(_loc3_ / 2);
         }
      }
   }
}
