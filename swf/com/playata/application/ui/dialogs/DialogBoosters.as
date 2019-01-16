package com.playata.application.ui.dialogs
{
   import com.playata.application.data.GameUtil;
   import com.playata.application.data.character.Character;
   import com.playata.application.data.constants.CBooster;
   import com.playata.application.data.constants.CConstant;
   import com.playata.application.data.user.User;
   import com.playata.application.ui.ViewManager;
   import com.playata.application.ui.elements.booster.UiBoosterButton;
   import com.playata.application.ui.elements.booster.UiBoosterButtonSense;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.application.ui.elements.generic.dialog.UiDialog;
   import com.playata.application.ui.elements.generic.dialog.UiTwoChoiceDialog;
   import com.playata.framework.application.Environment;
   import com.playata.framework.application.request.ActionRequestResponse;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.dialogs.SymbolDialogBoostersGeneric;
   
   public class DialogBoosters extends UiDialog
   {
       
      
      private var _btnHelp:UiButton = null;
      
      private var _btnClose:UiButton = null;
      
      private var _buttonQuest1:UiBoosterButton = null;
      
      private var _buttonQuest2:UiBoosterButton = null;
      
      private var _buttonQuest3:UiBoosterButton = null;
      
      private var _buttonStats1:UiBoosterButton = null;
      
      private var _buttonStats2:UiBoosterButton = null;
      
      private var _buttonStats3:UiBoosterButton = null;
      
      private var _buttonWork1:UiBoosterButton = null;
      
      private var _buttonWork2:UiBoosterButton = null;
      
      private var _buttonWork3:UiBoosterButton = null;
      
      private var _buttonSense:UiBoosterButtonSense = null;
      
      private var _confirmationBoosterId:String = null;
      
      private var _onCloseCallback:Function = null;
      
      public function DialogBoosters(param1:Function = null)
      {
         var _loc5_:* = null;
         var _loc4_:SymbolDialogBoostersGeneric = new SymbolDialogBoostersGeneric();
         addExcludedFontScalingTextfield(_loc4_.btnBoostQuest1.txtDuration);
         addExcludedFontScalingTextfield(_loc4_.btnBoostQuest1.txtEffectAmount);
         addExcludedFontScalingTextfield(_loc4_.btnBoostQuest2.txtDuration);
         addExcludedFontScalingTextfield(_loc4_.btnBoostQuest2.txtEffectAmount);
         addExcludedFontScalingTextfield(_loc4_.btnBoostQuest3.txtDuration);
         addExcludedFontScalingTextfield(_loc4_.btnBoostQuest3.txtEffectAmount);
         addExcludedFontScalingTextfield(_loc4_.btnBoostStats1.txtDuration);
         addExcludedFontScalingTextfield(_loc4_.btnBoostStats1.txtEffectAmount);
         addExcludedFontScalingTextfield(_loc4_.btnBoostStats2.txtDuration);
         addExcludedFontScalingTextfield(_loc4_.btnBoostStats2.txtEffectAmount);
         addExcludedFontScalingTextfield(_loc4_.btnBoostStats3.txtDuration);
         addExcludedFontScalingTextfield(_loc4_.btnBoostStats3.txtEffectAmount);
         addExcludedFontScalingTextfield(_loc4_.btnBoostWork1.txtDuration);
         addExcludedFontScalingTextfield(_loc4_.btnBoostWork1.txtEffectAmount);
         addExcludedFontScalingTextfield(_loc4_.btnBoostWork2.txtDuration);
         addExcludedFontScalingTextfield(_loc4_.btnBoostWork2.txtEffectAmount);
         addExcludedFontScalingTextfield(_loc4_.btnBoostWork3.txtDuration);
         addExcludedFontScalingTextfield(_loc4_.btnBoostWork3.txtEffectAmount);
         addExcludedFontScalingTextfield(_loc4_.boosterHeroSense.txtDuration);
         addExcludedFontScalingTextfield(_loc4_.boosterHeroSense.txtName);
         super(_loc4_);
         _onCloseCallback = param1;
         _queued = false;
         _loc4_.txtDialogTitle.text = LocText.current.text("dialog/boosters/title");
         _loc4_.txtBoostQuest.text = LocText.current.text("dialog/boosters/quest_boost");
         _loc4_.txtBoostStats.text = LocText.current.text("dialog/boosters/stat_boost");
         _loc4_.txtBoostWork.text = LocText.current.text("dialog/boosters/work_boost");
         var _loc3_:Boolean = false;
         _loc3_ = _loc4_.txtBoostQuest.numLines > 1 || _loc4_.txtBoostStats.numLines > 1 || _loc4_.txtBoostWork.numLines > 1;
         if(_loc3_)
         {
            _loc5_ = _loc4_.txtBoostQuest.text;
            if(_loc5_.indexOf(" ") >= 0)
            {
               _loc4_.txtBoostQuest.y = _loc4_.txtBoostQuest.y - 20;
               _loc4_.txtBoostQuest.height = _loc4_.txtBoostQuest.height + 30;
               _loc4_.txtBoostQuest.text = _loc5_.substr(0,_loc5_.lastIndexOf(" ")) + "\n" + _loc5_.substr(_loc5_.lastIndexOf(" ") + 1);
               _loc4_.txtBoostQuest.autoFontSize = true;
            }
            _loc5_ = _loc4_.txtBoostStats.text;
            if(_loc5_.indexOf(" ") >= 0)
            {
               _loc4_.txtBoostStats.y = _loc4_.txtBoostStats.y - 20;
               _loc4_.txtBoostStats.height = _loc4_.txtBoostStats.height + 30;
               _loc4_.txtBoostStats.text = _loc5_.substr(0,_loc5_.lastIndexOf(" ")) + "\n" + _loc5_.substr(_loc5_.lastIndexOf(" ") + 1);
               _loc4_.txtBoostStats.autoFontSize = true;
            }
            _loc5_ = _loc4_.txtBoostWork.text;
            if(_loc5_.indexOf(" ") >= 0)
            {
               _loc4_.txtBoostWork.y = _loc4_.txtBoostWork.y - 20;
               _loc4_.txtBoostWork.height = _loc4_.txtBoostWork.height + 30;
               _loc4_.txtBoostWork.text = _loc5_.substr(0,_loc5_.lastIndexOf(" ")) + "\n" + _loc5_.substr(_loc5_.lastIndexOf(" ") + 1);
               _loc4_.txtBoostWork.autoFontSize = true;
            }
         }
         _btnClose = new UiButton(_loc4_.btnClose,"",onClickClose);
         _btnHelp = new UiButton(_loc4_.btnHelp,LocText.current.text("general/button_help"),onClickHelp);
         var _loc2_:Character = User.current.character;
         _buttonQuest1 = new UiBoosterButton(_loc4_.btnBoostQuest1,"booster_quest1",_loc2_,onClickBooster);
         _buttonQuest2 = new UiBoosterButton(_loc4_.btnBoostQuest2,"booster_quest2",_loc2_,onClickBooster);
         _buttonQuest3 = new UiBoosterButton(_loc4_.btnBoostQuest3,"booster_quest3",_loc2_,onClickBooster);
         _buttonStats1 = new UiBoosterButton(_loc4_.btnBoostStats1,"booster_stats1",_loc2_,onClickBooster);
         _buttonStats2 = new UiBoosterButton(_loc4_.btnBoostStats2,"booster_stats2",_loc2_,onClickBooster);
         _buttonStats3 = new UiBoosterButton(_loc4_.btnBoostStats3,"booster_stats3",_loc2_,onClickBooster);
         _buttonWork1 = new UiBoosterButton(_loc4_.btnBoostWork1,"booster_work1",_loc2_,onClickBooster);
         _buttonWork2 = new UiBoosterButton(_loc4_.btnBoostWork2,"booster_work2",_loc2_,onClickBooster);
         _buttonWork3 = new UiBoosterButton(_loc4_.btnBoostWork3,"booster_work3",_loc2_,onClickBooster);
         _buttonSense = new UiBoosterButtonSense(_loc4_.boosterHeroSense);
      }
      
      private function refresh() : void
      {
         if(!_buttonQuest1)
         {
            return;
         }
         var _loc1_:Character = User.current.character;
         _buttonQuest1.refresh(_loc1_);
         _buttonQuest2.refresh(_loc1_);
         _buttonQuest3.refresh(_loc1_);
         _buttonStats1.refresh(_loc1_);
         _buttonStats2.refresh(_loc1_);
         _buttonStats3.refresh(_loc1_);
         _buttonWork1.refresh(_loc1_);
         _buttonWork2.refresh(_loc1_);
         _buttonWork3.refresh(_loc1_);
         _buttonSense.refresh();
      }
      
      override public function dispose() : void
      {
         _btnClose.dispose();
         _btnClose = null;
         _btnHelp.dispose();
         _btnHelp = null;
         _buttonQuest1.dispose();
         _buttonQuest2.dispose();
         _buttonQuest3.dispose();
         _buttonStats1.dispose();
         _buttonStats2.dispose();
         _buttonStats3.dispose();
         _buttonWork1.dispose();
         _buttonWork2.dispose();
         _buttonWork3.dispose();
         _buttonSense.dispose();
         _buttonQuest1 = null;
         _buttonQuest2 = null;
         _buttonQuest3 = null;
         _buttonStats1 = null;
         _buttonStats2 = null;
         _buttonStats3 = null;
         _buttonWork1 = null;
         _buttonWork2 = null;
         _buttonWork3 = null;
         _buttonSense = null;
         super.dispose();
      }
      
      private function onClickHelp(param1:InteractionEvent) : void
      {
         showTutorialDialog();
      }
      
      private function onClickBooster(param1:UiBoosterButton) : void
      {
         _confirmationBoosterId = param1.boosterId;
         if(User.current.character.questBoosterActive && param1.boosterType == 1)
         {
            if(User.current.character.activeQuestBoosterId != param1.boosterId)
            {
               Environment.panelManager.showDialog(new UiTwoChoiceDialog(LocText.current.text("dialog/boosters/overwrite_title"),LocText.current.text("dialog/boosters/overwrite_text_quest"),LocText.current.text("general/button_yes"),LocText.current.text("general/button_no"),onClickOverwrite));
            }
            else
            {
               buyBooster(param1.boosterId);
            }
         }
         else if(User.current.character.statsBoosterActive && param1.boosterType == 2)
         {
            if(User.current.character.activeStatsBoosterId != param1.boosterId)
            {
               Environment.panelManager.showDialog(new UiTwoChoiceDialog(LocText.current.text("dialog/boosters/overwrite_title"),LocText.current.text("dialog/boosters/overwrite_text_stats"),LocText.current.text("general/button_yes"),LocText.current.text("general/button_no"),onClickOverwrite));
            }
            else
            {
               buyBooster(param1.boosterId);
            }
         }
         else if(User.current.character.workBoosterActive && param1.boosterType == 3)
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
      
      private function showTutorialDialog() : void
      {
         Environment.panelManager.showDialog(new DialogTutorialPopup(LocText.current.text("dialog/tutorial/boosters/title"),LocText.current.text("dialog/tutorial/boosters/text"),onTutorialDialogClosed));
      }
      
      private function onTutorialDialogClosed() : void
      {
         User.current.character.setTutorialFlag("booster");
      }
      
      private function onClickClose(param1:InteractionEvent) : void
      {
         close(_onCloseCallback);
      }
      
      private function closeDialog() : void
      {
         close(_onCloseCallback);
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
            else if(param1.error != "errConsumeBoosterNotYetAllowed")
            {
               Environment.reportError(param1.error,param1.request);
            }
            ViewManager.instance.refresh();
         }
      }
      
      override public function onEscape() : void
      {
         close(_onCloseCallback);
      }
   }
}
