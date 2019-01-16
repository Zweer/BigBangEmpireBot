package com.playata.application.ui.dialogs
{
   import com.playata.application.data.GameUtil;
   import com.playata.application.data.constants.CConstant;
   import com.playata.application.data.user.User;
   import com.playata.application.ui.ViewManager;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.application.ui.elements.generic.button.UiPremiumButton;
   import com.playata.application.ui.elements.generic.dialog.UiDialog;
   import com.playata.framework.application.Environment;
   import com.playata.framework.application.request.ActionRequestResponse;
   import com.playata.framework.display.layout.LayoutUtil;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.dialogs.SymbolDialogOutOfMovieEnergyGeneric;
   
   public class DialogOutOfMovieEnergy extends UiDialog
   {
       
      
      private var _callback:Function;
      
      private var _btnClose:UiButton;
      
      private var _btnBuyEnergyForPremiumCurrency:UiPremiumButton;
      
      public function DialogOutOfMovieEnergy(param1:Function)
      {
         var _loc3_:SymbolDialogOutOfMovieEnergyGeneric = new SymbolDialogOutOfMovieEnergyGeneric();
         super(_loc3_);
         _callback = param1;
         _queued = false;
         var _loc2_:int = CConstant.movie_energy_cost;
         _loc3_.txtDialogTitle.text = LocText.current.text("dialog/not_enough_movie_energy/title");
         _loc3_.txtEnergyNotice.text = LocText.current.text("dialog/not_enough_movie_energy/info",GameUtil.getMovieEnergyString(User.current.character.movieEnergy));
         _loc3_.txtEnergyNotice.autoFontSize = true;
         _loc3_.txtInstructionsCaption.text = LocText.current.text("dialog/not_enough_movie_energy/instruction");
         _btnClose = new UiButton(_loc3_.btnClose,"",onClickClose);
         _btnBuyEnergyForPremiumCurrency = new UiPremiumButton(_loc3_.btnBuyEnergyForPremiumCurrency,_loc2_,"",LocText.current.text("dialog/not_enough_movie_energy/button_buy_energy"),"","",onClickBuyPremium);
         _btnBuyEnergyForPremiumCurrency.premium = true;
         _loc3_.txtEnergy.text = GameUtil.getMovieEnergyString(CConstant.movie_energy_refill_amount);
         _loc3_.lady.alpha = 0;
         _loc3_.lady.y = _loc3_.lady.y + LayoutUtil.deviceAdjustedHeightCorrection / 2;
      }
      
      override public function show() : void
      {
         super.show();
         var _loc1_:SymbolDialogOutOfMovieEnergyGeneric = _vo as SymbolDialogOutOfMovieEnergyGeneric;
         _loc1_.lady.tweenTo(0.8,{
            "alpha":1,
            "delay":0.5
         });
      }
      
      override public function dispose() : void
      {
         var _loc1_:SymbolDialogOutOfMovieEnergyGeneric = _vo as SymbolDialogOutOfMovieEnergyGeneric;
         _loc1_.lady.killTweens();
         _btnClose.dispose();
         _btnClose = null;
         _btnBuyEnergyForPremiumCurrency.dispose();
         _btnBuyEnergyForPremiumCurrency = null;
         super.dispose();
      }
      
      private function onClickClose(param1:InteractionEvent) : void
      {
         close();
         (_vo as SymbolDialogOutOfMovieEnergyGeneric).lady.visible = false;
      }
      
      private function onClickBuyPremium(param1:InteractionEvent) : void
      {
         _btnBuyEnergyForPremiumCurrency.buttonEnabled = false;
         Environment.application.sendActionRequest("buyMovieEnergy",{},handleRequests);
      }
      
      private function handleRequests(param1:ActionRequestResponse) : void
      {
         var _loc2_:* = param1.action;
         if("buyMovieEnergy" !== _loc2_)
         {
            throw new Error("Unsupported request action \'" + param1.action + "\'!");
         }
         if(param1.error == "")
         {
            if(param1.request.rawData.use_premium === false)
            {
               Environment.audio.playFX("energy_buy.mp3");
            }
            Environment.application.updateData(param1.data);
            close();
            if(_callback != null)
            {
               _callback();
            }
         }
         else
         {
            _btnBuyEnergyForPremiumCurrency.buttonEnabled = true;
            if(param1.error == "errRemovePremiumCurrencyNotEnough")
            {
               ViewManager.instance.showNotEnoughPremiumDialog(CConstant.movie_energy_cost);
            }
            else
            {
               Environment.reportError(param1.error,param1.request);
            }
         }
      }
      
      override public function onEscape() : void
      {
         close();
      }
   }
}
