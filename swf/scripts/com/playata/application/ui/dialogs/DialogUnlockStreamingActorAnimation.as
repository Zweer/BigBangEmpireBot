package com.playata.application.ui.dialogs
{
   import com.playata.application.data.GameUtil;
   import com.playata.application.data.constants.CStreamingActorAnimation;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.application.ui.elements.generic.button.UiGameCurrencyButton;
   import com.playata.application.ui.elements.generic.button.UiPremiumButton;
   import com.playata.application.ui.elements.generic.dialog.UiDialog;
   import com.playata.framework.display.ui.controls.Button;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.dialogs.SymbolDialogUnlockStreamingActorAnimationGeneric;
   
   public class DialogUnlockStreamingActorAnimation extends UiDialog
   {
       
      
      private var _buttonUnlockStreaming:UiGameCurrencyButton = null;
      
      private var _buttonUnlockPremium:UiPremiumButton = null;
      
      private var _buttonClose:UiButton = null;
      
      private var _unlockCallback:Function = null;
      
      private var _premiumUnlockCallback:Function = null;
      
      public function DialogUnlockStreamingActorAnimation(param1:CStreamingActorAnimation, param2:Function, param3:Function)
      {
         var _loc8_:Number = NaN;
         var _loc4_:Number = NaN;
         _unlockCallback = param2;
         _premiumUnlockCallback = param3;
         var _loc5_:SymbolDialogUnlockStreamingActorAnimationGeneric = new SymbolDialogUnlockStreamingActorAnimationGeneric();
         super(_loc5_,false);
         _loc5_.textTitle.autoFontSize = true;
         _loc5_.textTitle.text = LocText.current.text("dialog/streaming_actors/unlock_animation_title");
         _loc5_.textMessage.text = LocText.current.text("dialog/streaming_actors/unlock_animation_text",LocText.current.text("streaming/pose/" + param1.animation + "/title"),GameUtil.getStreamingResourceString(param1.unlockValue),GameUtil.getPremiumCurrencyString(param1.premiumUnlockValue));
         _loc5_.textMessage.verticallyAlignText(60);
         _buttonUnlockStreaming = new UiGameCurrencyButton(_loc5_.btnUnlockStreamingCurrency,param1.unlockValue,LocText.current.text("dialog/streaming_actors/btn_unlock_pose"),"",onClickUnlock);
         _buttonUnlockPremium = new UiPremiumButton(_loc5_.btnUnlockPremiumCurrency,param1.premiumUnlockValue,LocText.current.text("dialog/streaming_actors/btn_unlock_pose"),LocText.current.text("dialog/streaming_actors/btn_unlock_pose"),"","",onClickUnlockPremium);
         _buttonUnlockPremium.premium = true;
         _buttonUnlockPremium.visible = _buttonUnlockPremium.premiumAmount > 0;
         _buttonClose = new UiButton(_loc5_.btnClose,"",onClickClose);
         var _loc6_:int = 14;
         var _loc7_:Number = _buttonUnlockPremium.x - _buttonUnlockPremium.width / 2 - (_buttonUnlockStreaming.x + _buttonUnlockStreaming.width / 2);
         if(_loc7_ < _loc6_)
         {
            _buttonUnlockStreaming.x = _buttonUnlockStreaming.x - (_loc6_ - _loc7_) / 2;
            _buttonUnlockPremium.x = _buttonUnlockPremium.x + (_loc6_ - _loc7_) / 2;
            _loc8_ = _buttonUnlockStreaming.x - _buttonUnlockStreaming.width / 2;
            _loc4_ = _buttonUnlockPremium.x + _buttonUnlockPremium.width / 2;
            _buttonUnlockStreaming.x = _buttonUnlockStreaming.x - (_loc4_ + _loc8_) / 2;
            _buttonUnlockPremium.x = _buttonUnlockPremium.x - (_loc4_ + _loc8_) / 2;
         }
      }
      
      override public function dispose() : void
      {
         if(_buttonUnlockStreaming)
         {
            _buttonUnlockStreaming.dispose();
            _buttonUnlockStreaming = null;
         }
         if(_buttonUnlockPremium)
         {
            _buttonUnlockPremium.dispose();
            _buttonUnlockPremium = null;
         }
         if(_buttonClose)
         {
            _buttonClose.dispose();
            _buttonClose = null;
         }
         super.dispose();
      }
      
      private function onClickUnlock(param1:InteractionEvent) : void
      {
         close(_unlockCallback);
      }
      
      private function onClickUnlockPremium(param1:InteractionEvent) : void
      {
         close(_premiumUnlockCallback);
      }
      
      private function onClickClose(param1:InteractionEvent) : void
      {
         close();
      }
      
      override public function get defaultButton() : Button
      {
         return _buttonUnlockStreaming;
      }
   }
}
