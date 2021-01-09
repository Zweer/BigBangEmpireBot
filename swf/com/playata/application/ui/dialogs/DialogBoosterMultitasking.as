package com.playata.application.ui.dialogs
{
   import com.playata.application.data.constants.CConstant;
   import com.playata.application.ui.ViewManager;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.application.ui.elements.generic.button.UiPremiumButton;
   import com.playata.application.ui.elements.generic.dialog.UiDialog;
   import com.playata.framework.application.Environment;
   import com.playata.framework.application.request.ActionRequestResponse;
   import com.playata.framework.core.util.TimeUtil;
   import com.playata.framework.display.layout.LayoutUtil;
   import com.playata.framework.display.ui.controls.Button;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.dialogs.SymbolDialogBoosterMultitaskingGeneric;
   
   public class DialogBoosterMultitasking extends UiDialog
   {
       
      
      private var _btnClose:UiButton = null;
      
      private var _btnUnlock:UiPremiumButton;
      
      private var _callback:Function;
      
      private var _abortCallback:Function;
      
      public function DialogBoosterMultitasking(param1:Function = null, param2:Function = null)
      {
         _callback = param1;
         _abortCallback = param2;
         var _loc3_:SymbolDialogBoosterMultitaskingGeneric = new SymbolDialogBoosterMultitaskingGeneric();
         super(_loc3_);
         _queued = false;
         _loc3_.txtDialogTitle.text = LocText.current.text("dialog/booster_multitasking/title");
         _btnClose = new UiButton(_loc3_.btnClose,"",onClickClose);
         _btnUnlock = new UiPremiumButton(_loc3_.btnUnlock,CConstant.multitasking_rent_premium_amount,"",LocText.current.text("dialog/booster_multitasking/button_rent",TimeUtil.secondsToString(CConstant.multitasking_rent_time_amount)),"","",onClickRent);
         _btnUnlock.premium = true;
         _loc3_.txtInfo.text = LocText.current.text("dialog/booster_multitasking/info");
         _loc3_.girls.alpha = 0;
         _loc3_.girls.y = _loc3_.girls.y + LayoutUtil.deviceAdjustedHeightCorrection / 2;
      }
      
      override public function dispose() : void
      {
         _btnClose.dispose();
         _btnClose = null;
         _btnUnlock.dispose();
         _btnUnlock = null;
         super.dispose();
      }
      
      private function onClickClose(param1:InteractionEvent) : void
      {
         if(_abortCallback != null)
         {
            _abortCallback();
         }
         (_vo as SymbolDialogBoosterMultitaskingGeneric).girls.visible = false;
         close();
      }
      
      override public function show() : void
      {
         (_vo as SymbolDialogBoosterMultitaskingGeneric).girls.tweenTo(0.8,{
            "alpha":1,
            "delay":0.5
         });
         super.show();
      }
      
      private function onClickRent(param1:InteractionEvent) : void
      {
         Environment.application.sendActionRequest("buyMultitaskingBooster",{},handleRequests);
      }
      
      private function handleRequests(param1:ActionRequestResponse) : void
      {
         var _loc2_:* = param1.action;
         if("buyMultitaskingBooster" !== _loc2_)
         {
            throw new Error("Unsupported request action \'" + param1.action + "\'!");
         }
         if(param1.error == "")
         {
            Environment.application.updateData(param1.data);
            if(_callback != null)
            {
               _callback(null);
            }
            close();
         }
         else if(param1.error == "errRemovePremiumCurrencyNotEnough")
         {
            ViewManager.instance.showNotEnoughPremiumDialog(CConstant.multitasking_rent_premium_amount);
         }
         else
         {
            Environment.reportError(param1.error,param1.request);
         }
      }
      
      override public function get defaultButton() : Button
      {
         return _btnUnlock;
      }
      
      override public function onEscape() : void
      {
         if(_btnClose.visible)
         {
            close();
         }
      }
   }
}
