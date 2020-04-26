package com.playata.application.ui.elements.hud
{
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.framework.application.Environment;
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.layout.LayoutUtil;
   import com.playata.framework.display.ui.TextFieldAutoAdjustWidthHeight;
   import com.playata.framework.input.InteractionEvent;
   
   public class UiHint
   {
       
      
      private var _hint:Sprite;
      
      private var _target:UiButton;
      
      private var _caption:String;
      
      private var _cost:String;
      
      public function UiHint(param1:Sprite, param2:UiButton, param3:String = null, param4:String = null)
      {
         super();
         _hint = param1;
         _hint.visible = false;
         _target = param2;
         var _loc5_:Object = null;
         if(Environment.info.isTouchScreen && LayoutUtil.isPhoneLayout)
         {
            _loc5_ = _hint as Object;
            _loc5_.caption.fontSize = 18;
            _loc5_.caption.autoAdjustWidthHeight = TextFieldAutoAdjustWidthHeight.HORIZONTAL;
            _loc5_.caption.y = _loc5_.caption.y - 2;
            _loc5_.cost.fontSize = 20;
            _loc5_.cost.y = _loc5_.cost.y - 3;
         }
         if(Environment.info.defaultLocale == "pt_BR" || Environment.info.defaultLocale == "pt_PT")
         {
            _loc5_ = _hint as Object;
            if(Environment.info.isTouchScreen && LayoutUtil.isPhoneLayout)
            {
               _loc5_.caption.fontSize = 16;
               _loc5_.caption.y = _loc5_.caption.y + 2;
            }
            else
            {
               _loc5_.caption.fontSize = 13;
               _loc5_.caption.y = _loc5_.caption.y + 2;
            }
         }
         this.caption = param3;
         this.cost = param4;
         if(!Environment.info.isTouchScreen)
         {
            _target.onInteractionOut.add(handleInteractionOut);
            _target.onInteractionOver.add(handleInteractionOver);
         }
      }
      
      public function dispose() : void
      {
         _target.dispose();
         _target = null;
         _hint = null;
         _caption = null;
         _cost = null;
      }
      
      public function get content() : Sprite
      {
         return _hint;
      }
      
      public function show() : void
      {
         _hint.visible = true;
      }
      
      public function hide() : void
      {
         _hint.visible = false;
      }
      
      private function handleInteractionOver(param1:InteractionEvent) : void
      {
         show();
      }
      
      private function handleInteractionOut(param1:InteractionEvent) : void
      {
         hide();
      }
      
      public function get caption() : String
      {
         return _caption;
      }
      
      public function set caption(param1:String) : void
      {
         var _loc2_:Number = NaN;
         if(param1 == null || param1 == _caption)
         {
            return;
         }
         _caption = param1;
         var _loc3_:Object = _hint as Object;
         _loc3_.caption.text = _caption;
         if(_loc3_.caption.textWidth + 20 > _loc3_.caption.width)
         {
            _loc2_ = _loc3_.caption.textWidth - _loc3_.caption.width + 20;
            _loc3_.bg.width = _loc3_.bg.width + _loc2_;
            _loc3_.caption.width = _loc3_.caption.width + _loc2_;
            _loc3_.cost.x = _loc3_.cost.x + _loc2_;
            _loc3_.iconPremiumCurrency.x = _loc3_.iconPremiumCurrency.x + _loc2_;
         }
      }
      
      public function get cost() : String
      {
         return _cost;
      }
      
      public function set cost(param1:String) : void
      {
         _cost = param1;
         var _loc2_:Object = _hint as Object;
         if(_cost)
         {
            _loc2_.cost.text = _cost;
            var _loc3_:Boolean = true;
            _loc2_.cost.visible = _loc3_;
            _loc2_.iconPremiumCurrency.visible = _loc3_;
            _loc2_.iconPremiumCurrency.x = Math.round(_loc2_.caption.x + _loc2_.caption.width + 4);
            _loc2_.cost.x = Math.round(_loc2_.iconPremiumCurrency.x + _loc2_.iconPremiumCurrency.width + 4);
            _loc2_.bg.width = _loc2_.cost.x + _loc2_.cost.width + 15;
         }
         else
         {
            _loc3_ = false;
            _loc2_.cost.visible = _loc3_;
            _loc2_.iconPremiumCurrency.visible = _loc3_;
            _loc2_.bg.width = _loc2_.caption.x + _loc2_.caption.width + 15;
         }
      }
   }
}
