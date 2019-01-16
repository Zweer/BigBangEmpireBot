package com.playata.application.ui.dialogs
{
   import com.playata.application.data.GameUtil;
   import com.playata.application.data.constants.CConstant;
   import com.playata.application.data.user.User;
   import com.playata.application.ui.ViewManager;
   import com.playata.application.ui.elements.booster.UiBoosterExpiredButton;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.application.ui.elements.generic.dialog.UiDialog;
   import com.playata.framework.application.Environment;
   import com.playata.framework.application.request.ActionRequestResponse;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.dialogs.SymbolDialogBoosterSenseGeneric;
   
   public class DialogBoosterSense extends UiDialog
   {
       
      
      private var _booster:UiBoosterExpiredButton;
      
      private var _btnClose:UiButton = null;
      
      public function DialogBoosterSense()
      {
         var _loc1_:SymbolDialogBoosterSenseGeneric = new SymbolDialogBoosterSenseGeneric();
         super(_loc1_);
         _booster = new UiBoosterExpiredButton(_loc1_.boosterSense,"booster_sense",User.current.character,onBoosterBuyClicked,false);
         _btnClose = new UiButton(_loc1_.btnClose,"",onClickClose);
         _loc1_.txtDialogTitle.text = LocText.current.text("dialog/booster_sense/title");
         _loc1_.txtInfo.text = LocText.current.text("dialog/booster_sense/text",GameUtil.getSenseBoosterDurationString());
      }
      
      private function onBoosterBuyClicked(param1:UiBoosterExpiredButton) : void
      {
         Environment.application.sendActionRequest("buySenseBooster",{},handleRequests);
      }
      
      override public function dispose() : void
      {
         _btnClose.dispose();
         _btnClose = null;
         _booster.dispose();
         super.dispose();
      }
      
      private function handleRequests(param1:ActionRequestResponse) : void
      {
         var _loc2_:* = param1.action;
         if("buySenseBooster" !== _loc2_)
         {
            throw new Error("Unsupported request action \'" + param1.action + "\'!");
         }
         if(param1.error == "")
         {
            Environment.application.updateData(param1.data);
            Environment.audio.playFX("booster_activate.mp3");
            close();
         }
         else
         {
            if(param1.error == "errRemovePremiumCurrencyNotEnough")
            {
               ViewManager.instance.showNotEnoughPremiumDialog(CConstant.booster_sense_costs_premium_currency_amount);
            }
            else
            {
               Environment.reportError(param1.error,param1.request);
            }
            ViewManager.instance.refresh();
         }
      }
      
      private function onClickClose(param1:InteractionEvent) : void
      {
         close();
      }
      
      override public function onEscape() : void
      {
         close();
      }
   }
}
