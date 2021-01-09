package com.playata.application.ui.dialogs
{
   import com.playata.application.data.constants.CConstant;
   import com.playata.application.ui.ViewManager;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.application.ui.elements.generic.button.UiPremiumButton;
   import com.playata.application.ui.elements.generic.dialog.UiDialog;
   import com.playata.framework.application.Environment;
   import com.playata.framework.application.request.ActionRequestResponse;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.dialogs.SymbolDialogFanFotoRemoveTagGeneric;
   
   public class DialogFanFotoBuyResource extends UiDialog
   {
       
      
      private var _btnBuy:UiPremiumButton = null;
      
      private var _btnClose:UiButton;
      
      private var _neededResource:int;
      
      private var _onBoughtCallback:Function;
      
      public function DialogFanFotoBuyResource(param1:int, param2:Function)
      {
         var _loc3_:SymbolDialogFanFotoRemoveTagGeneric = new SymbolDialogFanFotoRemoveTagGeneric();
         super(_loc3_);
         _queued = false;
         _neededResource = param1;
         _onBoughtCallback = param2;
         _loc3_.txtDialogTitle.text = LocText.current.text("dialog/fan_foto_buy_resource/title");
         _loc3_.textMessage.text = LocText.current.text("dialog/fan_foto_buy_resource/info",_neededResource);
         _btnBuy = new UiPremiumButton(_loc3_.btnRemove,_neededResource * CConstant.fan_foto_resource_cost,"",LocText.current.text("dialog/fan_foto_buy_resource/btn_buy"),"","",onClickBuy);
         _btnBuy.premium = true;
         _btnClose = new UiButton(_loc3_.btnClose,"",onClickClose);
         _loc3_.btnRemoveAll.visible = false;
         _btnBuy.x = 0;
      }
      
      override public function dispose() : void
      {
         _btnBuy.dispose();
         _btnBuy = null;
         _btnClose.dispose();
         _btnClose = null;
         super.dispose();
      }
      
      private function onClickClose(param1:InteractionEvent) : void
      {
         close();
      }
      
      private function onClickBuy(param1:InteractionEvent) : void
      {
         Environment.application.sendActionRequest("buyFanFotoResource",{"amount":_neededResource},handleRequests);
      }
      
      private function handleRequests(param1:ActionRequestResponse) : void
      {
         var _loc2_:* = param1.action;
         if("buyFanFotoResource" !== _loc2_)
         {
            throw new Error("Unsupported request action \'" + param1.action + "\'!");
         }
         if(param1.error == "")
         {
            Environment.application.updateData(param1.data);
            close(_onBoughtCallback);
         }
         else if(param1.error == "errRemovePremiumCurrencyNotEnough")
         {
            ViewManager.instance.showNotEnoughPremiumDialog(_btnBuy.premiumAmount);
         }
         else
         {
            Environment.reportError(param1.error,param1.request);
         }
      }
   }
}
