package com.playata.application.ui.dialogs
{
   import com.playata.application.data.GameUtil;
   import com.playata.application.data.user.User;
   import com.playata.application.ui.ViewManager;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.application.ui.elements.generic.dialog.UiDialog;
   import com.playata.application.ui.elements.quest.UiQuestRefreshOption;
   import com.playata.framework.application.Environment;
   import com.playata.framework.application.request.ActionRequestResponse;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.dialogs.SymbolDialogRefreshQuestsGeneric;
   
   public class DialogRefreshQuests extends UiDialog
   {
       
      
      private var _btnClose:UiButton = null;
      
      private var _option1:UiQuestRefreshOption = null;
      
      private var _option2:UiQuestRefreshOption = null;
      
      public function DialogRefreshQuests()
      {
         var _loc1_:SymbolDialogRefreshQuestsGeneric = new SymbolDialogRefreshQuestsGeneric();
         super(_loc1_);
         _queued = false;
         _loc1_.txtDialogTitle.text = LocText.current.text("dialog/refresh_quests/title");
         _loc1_.txtInfo.text = LocText.current.text("dialog/refresh_quests/info");
         if(User.current.character.maxQuestStage == 1)
         {
            _option2 = new UiQuestRefreshOption(_loc1_.option2,false,onClickRefresh);
            _loc1_.option1.visible = false;
            _loc1_.txtInfo.text = LocText.current.text("dialog/refresh_quests/info_single_stage");
            _loc1_.option2.x = _loc1_.option2.x - (_loc1_.option2.width / 2 + 12);
         }
         else
         {
            _option1 = new UiQuestRefreshOption(_loc1_.option1,true,onClickRefresh);
            _option2 = new UiQuestRefreshOption(_loc1_.option2,false,onClickRefresh);
         }
         _btnClose = new UiButton(_loc1_.btnClose,"",onClickClose);
      }
      
      override public function dispose() : void
      {
         _btnClose.dispose();
         _btnClose = null;
         if(_option1)
         {
            _option1.dispose();
            _option1 = null;
         }
         _option2.dispose();
         _option2 = null;
         super.dispose();
      }
      
      private function onClickClose(param1:InteractionEvent) : void
      {
         close();
      }
      
      private function onClickRefresh(param1:Boolean) : void
      {
         Environment.application.sendActionRequest("generateNewQuests",{"all_stages":param1},handleRequests);
      }
      
      private function handleRequests(param1:ActionRequestResponse) : void
      {
         var _loc2_:* = param1.action;
         if("generateNewQuests" !== _loc2_)
         {
            throw new Error("Unsupported request action \'" + param1.action + "\'!");
         }
         if(param1.error == "")
         {
            Environment.application.updateData(param1.data);
            close();
         }
         else if(param1.error == "errRemovePremiumCurrencyNotEnough")
         {
            ViewManager.instance.showNotEnoughPremiumDialog(GameUtil.getQuestRefreshCost(param1.request.getBoolean("all_stages"),User.current.character.maxQuestStage));
         }
         else
         {
            Environment.reportError(param1.error,param1.request);
         }
      }
      
      override public function onEscape() : void
      {
         close();
      }
   }
}
