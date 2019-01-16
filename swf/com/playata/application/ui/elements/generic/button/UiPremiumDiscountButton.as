package com.playata.application.ui.elements.generic.button
{
   import com.greensock.easing.Back;
   import com.greensock.easing.Linear;
   import com.greensock.easing.Quart;
   import com.playata.framework.application.Environment;
   import com.playata.framework.core.Runtime;
   import visuals.ui.elements.buttons.SymbolButtonPremiumGeneric;
   import visuals.ui.elements.quest.SymbolDiscountAnimationGeneric;
   
   public class UiPremiumDiscountButton extends UiPremiumButton
   {
       
      
      private var _realContent:SymbolButtonPremiumGeneric;
      
      private var _discountAnimation:SymbolDiscountAnimationGeneric;
      
      private var _discountedPrice:int;
      
      public function UiPremiumDiscountButton(param1:SymbolButtonPremiumGeneric, param2:int, param3:String, param4:String, param5:String, param6:String, param7:Function)
      {
         _realContent = param1;
         super(param1,param2,param3,param4,param5,param6,param7);
         _discountAnimation = new SymbolDiscountAnimationGeneric();
         _realContent.cost.addChild(_discountAnimation);
         _discountAnimation.x = _realContent.cost.caption.x;
         _discountAnimation.y = _realContent.cost.caption.y;
         _discountAnimation.visible = false;
      }
      
      override public function dispose() : void
      {
         _discountAnimation = null;
         super.dispose();
      }
      
      public function discountTo(param1:int) : void
      {
         if(param1 == premiumAmount)
         {
            return;
         }
         if(param1 > premiumAmount)
         {
            premiumAmount = param1;
            return;
         }
         if(!param1)
         {
            premiumAmount = 0;
            premium = false;
            return;
         }
         _discountedPrice = param1;
         hideGlowAnimation();
         _discountAnimation.visible = true;
         _realContent.cost.caption.visible = false;
         syncTextFields();
         _discountAnimation.xAnimation.alpha = 1;
         _discountAnimation.xAnimation.visible = true;
         _discountAnimation.xAnimation.x = _discountAnimation.priceCaption.x;
         _discountAnimation.xAnimation.tweenFrom(0.5,{
            "alpha":0,
            "onComplete":onDiscountXAnimationComplete
         });
         Environment.audio.playFX("battle_attack1.mp3");
         Runtime.delayFunction(Environment.audio.playFX,0.2,["battle_attack2.mp3"]);
      }
      
      private function onDiscountXAnimationComplete() : void
      {
         _discountAnimation.xAnimation.tweenTo(0.5,{
            "autoAlpha":0,
            "ease":Linear.easeNone
         });
         _discountAnimation.priceCaption.tweenTo(0.5,{
            "alpha":0,
            "ease":Linear.easeNone,
            "onComplete":setNewDiscountPrice
         });
         Environment.audio.playFX("event_wait_time_complete.mp3");
      }
      
      private function setNewDiscountPrice() : void
      {
         premiumAmount = _discountedPrice;
         syncTextFields();
         _discountAnimation.priceCaption.alpha = 1;
         _discountAnimation.priceCaption.tweenFrom(0.8,{
            "scaleX":0,
            "scaleY":0,
            "ease":Back.easeOut
         });
         _discountAnimation.glow.x = _discountAnimation.priceCaption.x;
         _discountAnimation.glow.visible = true;
         var _loc1_:* = 0;
         _discountAnimation.glow.alpha = _loc1_;
         _loc1_ = _loc1_;
         _discountAnimation.glow.scaleY = _loc1_;
         _discountAnimation.glow.scaleX = _loc1_;
         _discountAnimation.glow.tweenTo(0.8,{
            "alpha":1,
            "scaleX":1,
            "scaleY":1,
            "ease":Quart.easeOut
         });
         _discountAnimation.glow.tweenTo(0.8,{
            "delay":4,
            "alpha":0,
            "scaleX":0,
            "scaleY":0,
            "ease":Quart.easeIn,
            "onComplete":onDiscountAnimationComplete
         });
      }
      
      private function onDiscountAnimationComplete() : void
      {
         _realContent.cost.caption.visible = true;
         _discountAnimation.visible = false;
         hideGlowAnimation();
      }
      
      private function syncTextFields() : void
      {
         _discountAnimation.priceCaption.caption.text = _realContent.cost.caption.text;
         _discountAnimation.priceCaption.caption.width = _realContent.cost.caption.width;
         _discountAnimation.priceCaption.caption.x = -_discountAnimation.priceCaption.caption.textWidth / 2 - 2;
         _discountAnimation.priceCaption.x = -_discountAnimation.priceCaption.caption.x;
      }
      
      private function hideGlowAnimation() : void
      {
         _discountAnimation.glow.visible = false;
      }
   }
}
