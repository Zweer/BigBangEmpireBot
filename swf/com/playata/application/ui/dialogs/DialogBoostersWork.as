package com.playata.application.ui.dialogs
{
   import com.playata.application.data.GameUtil;
   import com.playata.application.data.character.Character;
   import com.playata.application.data.constants.CBooster;
   import com.playata.application.data.constants.CConstant;
   import com.playata.application.data.user.User;
   import com.playata.application.ui.ViewManager;
   import com.playata.application.ui.elements.booster.UiBoosterButton;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.application.ui.elements.generic.dialog.UiDialog;
   import com.playata.application.ui.elements.generic.dialog.UiTwoChoiceDialog;
   import com.playata.framework.application.Environment;
   import com.playata.framework.application.request.ActionRequestResponse;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.dialogs.SymbolDialogBoostersWorkGeneric;
   
   public class DialogBoostersWork extends UiDialog
   {
       
      
      private var _btnClose:UiButton = null;
      
      private var _buttonWork1:UiBoosterButton = null;
      
      private var _buttonWork2:UiBoosterButton = null;
      
      private var _buttonWork3:UiBoosterButton = null;
      
      private var _confirmationBoosterId:String = null;
      
      public function DialogBoostersWork()
      {
         var _loc2_:SymbolDialogBoostersWorkGeneric = new SymbolDialogBoostersWorkGeneric();
         addExcludedFontScalingTextfield(_loc2_.btnBoostWork1.txtDuration);
         addExcludedFontScalingTextfield(_loc2_.btnBoostWork1.txtEffectAmount);
         addExcludedFontScalingTextfield(_loc2_.btnBoostWork2.txtDuration);
         addExcludedFontScalingTextfield(_loc2_.btnBoostWork2.txtEffectAmount);
         addExcludedFontScalingTextfield(_loc2_.btnBoostWork3.txtDuration);
         addExcludedFontScalingTextfield(_loc2_.btnBoostWork3.txtEffectAmount);
         super(_loc2_);
         _queued = false;
         _loc2_.txtDialogTitle.text = LocText.current.text("dialog/boosters_work/title");
         _loc2_.txtInfo.text = LocText.current.text("dialog/boosters_work/info");
         _btnClose = new UiButton(_loc2_.btnClose,"",onClickClose);
         var _loc1_:Character = User.current.character;
         _buttonWork1 = new UiBoosterButton(_loc2_.btnBoostWork1,"booster_work1",_loc1_,onClickBooster);
         _buttonWork2 = new UiBoosterButton(_loc2_.btnBoostWork2,"booster_work2",_loc1_,onClickBooster);
         _buttonWork3 = new UiBoosterButton(_loc2_.btnBoostWork3,"booster_work3",_loc1_,onClickBooster);
      }
      
      private function refresh() : void
      {
         var _loc1_:Character = User.current.character;
         _buttonWork1.refresh(_loc1_);
         _buttonWork2.refresh(_loc1_);
         _buttonWork3.refresh(_loc1_);
      }
      
      override public function dispose() : void
      {
         _btnClose.dispose();
         _btnClose = null;
         _buttonWork1.dispose();
         _buttonWork2.dispose();
         _buttonWork3.dispose();
         _buttonWork1 = null;
         _buttonWork2 = null;
         _buttonWork3 = null;
         super.dispose();
      }
      
      private function onClickBooster(param1:UiBoosterButton) : void
      {
         _confirmationBoosterId = param1.boosterId;
         if(User.current.character.workBoosterActive)
         {
            if(User.current.character.activeWorkBoosterId != param1.boosterId)
            {
               Environment.panelManager.showDialog(new UiTwoChoiceDialog(LocText.current.text("dialog/boosters/overwrite_title"),LocText.current.text("dialog/boosters/overwrite_text_work"),LocText.current.text("general/button_yes"),LocText.current.text("general/button_no"),onClickOverwrite));
            }
            else
            {
               buyBooster(param1.boosterId);
            }
         }
         else
         {
            buyBooster(param1.boosterId);
         }
      }
      
      private function buyBooster(param1:String) : void
      {
         Environment.application.sendActionRequest("buyBooster",{"id":param1},handleRequests);
      }
      
      private function onClickClose(param1:InteractionEvent) : void
      {
         close();
      }
      
      private function onClickOverwrite() : void
      {
         buyBooster(_confirmationBoosterId);
      }
      
      private function handleRequests(param1:ActionRequestResponse) : void
      {
         var _loc2_:int = 0;
         var _loc3_:* = param1.action;
         if("buyBooster" !== _loc3_)
         {
            throw new Error("Unsupported request action \'" + param1.action + "\'!");
         }
         if(param1.error == "")
         {
            Environment.application.updateData(param1.data);
            Environment.audio.playFX("booster_activate.mp3");
            refresh();
         }
         else
         {
            if(param1.error == "errRemovePremiumCurrencyNotEnough")
            {
               ViewManager.instance.showNotEnoughPremiumDialog(CConstant.booster_large_costs_premium_currency);
            }
            else if(param1.error == "errRemoveGameCurrencyNotEnough")
            {
               _loc2_ = CBooster.fromId(_confirmationBoosterId).amount;
               ViewManager.instance.showNotEnoughGameCurrencyDialog(GameUtil.boosterCost(User.current.character.level,_loc2_ == 10));
            }
            else
            {
               Environment.reportError(param1.error,param1.request);
            }
            ViewManager.instance.refresh();
         }
      }
      
      override public function onEscape() : void
      {
         close();
      }
   }
}
