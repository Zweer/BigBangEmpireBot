package com.playata.application.ui.dialogs
{
   import com.playata.application.data.user.User;
   import com.playata.application.messaging.Message;
   import com.playata.application.messaging.MessageRouter;
   import com.playata.application.ui.ViewManager;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.application.ui.elements.generic.dialog.UiDialog;
   import com.playata.application.ui.elements.generic.dialog.UiInfoDialog;
   import com.playata.application.ui.elements.guild.UiGuildBattleAutoJoinPackage;
   import com.playata.application.ui.elements.guild.UiGuildChatTab;
   import com.playata.framework.application.Environment;
   import com.playata.framework.application.request.ActionRequestResponse;
   import com.playata.framework.core.Runtime;
   import com.playata.framework.data.constants.Constants;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.dialogs.SymbolDialogGuildRechargeGuildBattleAutoJoinsGeneric;
   
   public class DialogGuildRechargeGuildBattleAutoJoins extends UiDialog
   {
       
      
      private var _btnClose:UiButton = null;
      
      private var _packageIndex:int;
      
      private var _package1:UiGuildBattleAutoJoinPackage;
      
      private var _package2:UiGuildBattleAutoJoinPackage;
      
      private var _package3:UiGuildBattleAutoJoinPackage;
      
      public function DialogGuildRechargeGuildBattleAutoJoins()
      {
         var _loc1_:SymbolDialogGuildRechargeGuildBattleAutoJoinsGeneric = new SymbolDialogGuildRechargeGuildBattleAutoJoinsGeneric();
         super(_loc1_);
         _queued = false;
         _loc1_.txtDialogTitle.text = LocText.current.text("dialog/guild_recharge_auto_joins/title");
         _loc1_.txtInfo.text = LocText.current.text("dialog/guild_recharge_auto_joins/info_text");
         _btnClose = new UiButton(_loc1_.btnClose,"",onClickClose);
         _package1 = new UiGuildBattleAutoJoinPackage(_loc1_.package1,1,onPackageSelected);
         _package2 = new UiGuildBattleAutoJoinPackage(_loc1_.package2,2,onPackageSelected);
         _package3 = new UiGuildBattleAutoJoinPackage(_loc1_.package3,3,onPackageSelected);
         MessageRouter.addListener("ViewMessage.notifyNeededGuildDonationMade",handleMessages);
      }
      
      override public function dispose() : void
      {
         MessageRouter.removeAllListeners(handleMessages);
         if(_btnClose == null)
         {
            return;
         }
         _btnClose.dispose();
         _btnClose = null;
         _package1.dispose();
         _package2.dispose();
         _package3.dispose();
         super.dispose();
      }
      
      private function get minAmount() : int
      {
         return User.current.character.guild.autoJoins;
      }
      
      private function onClickClose(param1:InteractionEvent) : void
      {
         close();
      }
      
      private function onPackageSelected(param1:int) : void
      {
         _packageIndex = param1;
         rechargeAutoJoins();
      }
      
      private function rechargeAutoJoins() : void
      {
         Environment.application.sendActionRequest("rechargeGuildAutoJoins",{"package":_packageIndex},handleRequests);
      }
      
      private function closeDialog() : void
      {
         close();
      }
      
      private function handleRequests(param1:ActionRequestResponse) : void
      {
         var _loc2_:* = param1.action;
         if("rechargeGuildAutoJoins" !== _loc2_)
         {
            throw new Error("Unsupported request action \'" + param1.action + "\'!");
         }
         if(param1.error == "")
         {
            Environment.application.updateData(param1.data);
            Environment.audio.playFX("guild_missiles_recharged.mp3");
            close();
            UiGuildChatTab.instance.refreshGuildLog();
         }
         else if(param1.error == "errRemoveGameCurrencyNotEnough" || param1.error == "errRemovePremiumCurrencyNotEnough")
         {
            ViewManager.instance.showGuildNotEnoughGameCurrencyPremiumCurrencyDialog(0,Constants.current.getInt("guild_auto_joins_premium_currency_amount_package" + _packageIndex),closeDialog);
         }
         else if(param1.error == "errProcessingGuildBattle")
         {
            Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/processing_guild_battle/title"),LocText.current.text("dialog/processing_guild_battle/text"),LocText.current.text("general/button_ok")));
         }
         else
         {
            Environment.reportError(param1.error,param1.request);
         }
      }
      
      private function handleMessages(param1:Message) : void
      {
         var _loc2_:* = param1.type;
         if("ViewMessage.notifyNeededGuildDonationMade" !== _loc2_)
         {
            throw new Error("Encountered unknown message type! type=" + param1.type);
         }
         Runtime.delayFunction(rechargeAutoJoins,0.3);
      }
      
      override public function onEscape() : void
      {
         close();
      }
   }
}
