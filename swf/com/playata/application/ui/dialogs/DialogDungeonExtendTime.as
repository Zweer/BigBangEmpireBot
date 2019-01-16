package com.playata.application.ui.dialogs
{
   import com.playata.application.data.constants.CConstant;
   import com.playata.application.ui.ViewManager;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.application.ui.elements.generic.button.UiPremiumDiscountButton;
   import com.playata.application.ui.elements.generic.dialog.UiDialog;
   import com.playata.framework.application.Environment;
   import com.playata.framework.application.request.ActionRequestResponse;
   import com.playata.framework.core.util.TimeUtil;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.dialogs.SymbolDialogDungeonExtendTimeGeneric;
   
   public class DialogDungeonExtendTime extends UiDialog
   {
      
      private static var _isOpen:Boolean = false;
       
      
      private var _btnClose:UiButton = null;
      
      private var _btnBuyForPremiumCurrency:UiPremiumDiscountButton = null;
      
      private var _callbackExtended:Function = null;
      
      private var _callbackNotExtended:Function = null;
      
      public function DialogDungeonExtendTime(param1:Function, param2:Function)
      {
         _isOpen = true;
         _callbackExtended = param1;
         _callbackNotExtended = param2;
         var _loc5_:SymbolDialogDungeonExtendTimeGeneric = new SymbolDialogDungeonExtendTimeGeneric();
         super(_loc5_);
         _queued = false;
         var _loc4_:int = CConstant.dungeon_extend_time_premium_amount;
         var _loc3_:int = CConstant.dungeon_extend_time_amount;
         _loc5_.txtDialogTitle.text = LocText.current.text("dialog/dungeon_extend_time/title");
         _loc5_.txtInfo.text = LocText.current.text("dialog/dungeon_extend_time/text_info",TimeUtil.secondsToString(_loc3_));
         _btnClose = new UiButton(_loc5_.btnClose,"",onClickClose);
         _btnBuyForPremiumCurrency = new UiPremiumDiscountButton(_loc5_.btnBuyForPremiumCurrency,_loc4_,"",LocText.current.text("dialog/dungeon_extend_time/button_extend_time"),"","",onClickBuyPremium);
         _btnBuyForPremiumCurrency.premium = true;
      }
      
      public static function get isOpen() : Boolean
      {
         return _isOpen;
      }
      
      override public function show() : void
      {
         super.show();
      }
      
      override public function dispose() : void
      {
         _btnClose.dispose();
         _btnClose = null;
         _btnBuyForPremiumCurrency.dispose();
         _btnBuyForPremiumCurrency = null;
         super.dispose();
      }
      
      private function onClickClose(param1:InteractionEvent) : void
      {
         _callbackNotExtended();
         close();
      }
      
      override public function close(param1:Function = null) : void
      {
         _isOpen = false;
         super.close(param1);
      }
      
      private function onClickBuyPremium(param1:InteractionEvent) : void
      {
         _btnBuyForPremiumCurrency.buttonEnabled = false;
         Environment.application.sendActionRequest("extendDungeonTime",{},handleRequests);
      }
      
      private function handleRequests(param1:ActionRequestResponse) : void
      {
         var _loc2_:* = param1.action;
         if("extendDungeonTime" !== _loc2_)
         {
            throw new Error("Unsupported request action \'" + param1.action + "\'!");
         }
         if(param1.error == "")
         {
            Environment.application.updateData(param1.data);
            if(_callbackExtended != null)
            {
               _callbackExtended();
            }
            close();
         }
         else
         {
            _btnBuyForPremiumCurrency.buttonEnabled = true;
            if(param1.error == "errRemovePremiumCurrencyNotEnough")
            {
               ViewManager.instance.showNotEnoughPremiumDialog(CConstant.dungeon_extend_time_premium_amount);
            }
            else if(param1.error == "errExtendDungeonTimeTimeNotOver")
            {
               close();
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
