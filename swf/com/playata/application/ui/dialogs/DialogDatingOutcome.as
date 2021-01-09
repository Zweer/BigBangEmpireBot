package com.playata.application.ui.dialogs
{
   import com.playata.application.data.GameUtil;
   import com.playata.application.data.character.Character;
   import com.playata.application.data.constants.CConstant;
   import com.playata.application.data.dating.DatingStep;
   import com.playata.application.data.dating.DatingUtil;
   import com.playata.application.data.item.Item;
   import com.playata.application.data.user.User;
   import com.playata.application.ui.ViewManager;
   import com.playata.application.ui.effects.EffectsLayer;
   import com.playata.application.ui.elements.dating.UiDatingGirl;
   import com.playata.application.ui.elements.generic.button.UiTextButton;
   import com.playata.application.ui.elements.generic.dialog.UiDialog;
   import com.playata.application.ui.elements.generic.dialog.UiInfoDialog;
   import com.playata.application.ui.elements.generic.dialog.UiTwoChoiceDialog;
   import com.playata.application.ui.elements.item.UiItemSlot;
   import com.playata.framework.application.Environment;
   import com.playata.framework.application.request.ActionRequestResponse;
   import com.playata.framework.display.ui.controls.Button;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.dialogs.SymbolDialogDatingOutcomeGeneric;
   
   public class DialogDatingOutcome extends UiDialog
   {
      
      private static var _isOpen:Boolean = false;
       
      
      private var _btnClose:UiTextButton = null;
      
      private var _itemReward:UiItemSlot = null;
      
      private var _datingStep:DatingStep = null;
      
      private var _girl:UiDatingGirl = null;
      
      private var _onNewStepStarted:Function;
      
      public function DialogDatingOutcome(param1:DatingStep, param2:Function = null)
      {
         var _loc5_:int = 0;
         _onNewStepStarted = param2;
         _isOpen = true;
         _datingStep = param1;
         var _loc4_:SymbolDialogDatingOutcomeGeneric = new SymbolDialogDatingOutcomeGeneric();
         super(_loc4_);
         _queued = false;
         var _loc3_:Character = User.current.character;
         _loc4_.txtDialogTitle.text = DatingUtil.getName(param1.datingIndex);
         _girl = new UiDatingGirl(_loc4_.girl);
         if(param1.isFinished)
         {
            _loc4_.txtRewardsCaption.visible = true;
            _loc4_.itemReward.visible = true;
            _loc4_.iconStatPoints.visible = true;
            _loc4_.txtStatPoints.visible = param1.reward.statPoints > 0;
            _loc4_.txtGirlPictureReward.visible = true;
            _loc4_.txtFailedHint.visible = false;
            _loc4_.txtFailed.visible = false;
            _loc5_ = 1;
            while(_loc5_ <= 5)
            {
               if(param1.stepIndex >= _loc5_)
               {
                  _loc4_["hearth" + _loc5_].gotoAndStop(2);
               }
               else
               {
                  _loc4_["hearth" + _loc5_].gotoAndStop(1);
               }
               _loc5_++;
            }
            if(param1.isLastStep)
            {
               _loc4_.txtOutcome.text = DatingUtil.getWinText(param1.datingIndex);
            }
            else
            {
               _loc4_.txtOutcome.text = DatingUtil.getOutroText(param1.datingIndex,param1.stepIndex);
            }
            _loc4_.txtOutcome.autoFontSize = true;
            _loc4_.txtRewardsCaption.text = LocText.current.text("dialog/dating_step/rewards");
            _loc4_.itemReward.visible = param1.reward.itemId != 0;
            if(param1.reward.itemId != 0)
            {
               _itemReward = new UiItemSlot(_loc4_.itemReward,0);
               _itemReward.item = _loc3_.getItemById(param1.reward.itemId);
            }
            if(param1.reward.statPoints)
            {
               _loc4_.txtStatPoints.text = GameUtil.getStatPointString(param1.reward.statPoints);
            }
            var _loc6_:* = DatingUtil.hasRewardImage(param1.datingIndex,param1.stepIndex,param1.repeat);
            _loc4_.iconGirlPictureReward.visible = _loc6_;
            _loc4_.txtGirlPictureReward.visible = _loc6_;
            if(_loc4_.txtGirlPictureReward.visible)
            {
               _loc4_.txtGirlPictureReward.text = LocText.current.text("dating/dating_step/reward_picture",DatingUtil.getRewardGirlPicture(param1.datingIndex,param1.stepIndex));
               _loc4_.txtGirlPictureReward.autoFontSize = true;
            }
            _girl.refresh(_datingStep.datingIndex,_datingStep.stepIndex + 1,true);
            Environment.audio.playFX("event_dungeon_battle_won.mp3");
         }
         else
         {
            _loc4_.txtRewardsCaption.visible = false;
            _loc4_.itemReward.visible = false;
            _loc4_.iconStatPoints.visible = false;
            _loc4_.txtStatPoints.visible = false;
            _loc4_.iconGirlPictureReward.visible = false;
            _loc4_.txtGirlPictureReward.visible = false;
            _loc4_.txtFailedHint.visible = true;
            _loc4_.txtFailed.visible = true;
            _loc5_ = 1;
            while(_loc5_ <= 5)
            {
               if(param1.stepIndex > _loc5_)
               {
                  _loc4_["hearth" + _loc5_].gotoAndStop(2);
               }
               else
               {
                  _loc4_["hearth" + _loc5_].gotoAndStop(1);
               }
               _loc5_++;
            }
            _loc4_.txtOutcome.text = DatingUtil.getLostText(param1.datingIndex);
            _loc4_.txtOutcome.autoFontSize = true;
            _loc4_.txtFailedHint.text = param1.failedAttributeHint;
            _loc4_.txtFailed.text = LocText.current.text("dialog/dating_fought/failed",CConstant.dating_attack_cooldown / 60);
            Environment.audio.playFX("event_dungeon_battle_lost.mp3");
            _girl.refresh(_datingStep.datingIndex,_datingStep.stepIndex);
         }
         _btnClose = new UiTextButton(_loc4_.btnClose,LocText.current.text("general/button_ok"),"",onClickClose);
      }
      
      public static function get isOpen() : Boolean
      {
         return _isOpen;
      }
      
      override public function show() : void
      {
         super.show();
         if(_datingStep.isFinished)
         {
            EffectsLayer.instance.show(114,{},_vo.parent,1);
         }
      }
      
      override public function dispose() : void
      {
         if(_btnClose == null)
         {
            return;
         }
         _btnClose.dispose();
         _btnClose = null;
         _girl.dispose();
         _girl = null;
         super.dispose();
      }
      
      private function onClickClose(param1:InteractionEvent) : void
      {
         if(!_btnClose.enabled)
         {
            return;
         }
         _btnClose.enabled = false;
         if(_datingStep.isFinished)
         {
            Environment.application.sendActionRequest("claimDatingStepReward",{
               "dating_index":_datingStep.datingIndex,
               "step_index":_datingStep.stepIndex,
               "discard_item":false
            },handleRequests);
         }
         else
         {
            ViewManager.instance.baseUserPanel.fadeInMainNavigationButtons();
            ViewManager.instance.showPanel("quests");
            close();
         }
      }
      
      private function onClickGotoShop() : void
      {
         ViewManager.instance.baseUserPanel.fadeInMainNavigationButtons();
         ViewManager.instance.showPanel("shop");
         close();
      }
      
      private function onClickDiscardItem() : void
      {
         Environment.application.sendActionRequest("claimDatingStepReward",{
            "dating_index":_datingStep.datingIndex,
            "step_index":_datingStep.stepIndex,
            "discard_item":true
         },handleRequests);
      }
      
      override public function close(param1:Function = null) : void
      {
         _isOpen = false;
         super.close(param1);
      }
      
      private function handleRequests(param1:ActionRequestResponse) : void
      {
         var _loc2_:* = param1.action;
         switch(_loc2_)
         {
            case "claimDatingStepReward":
               if(param1.error == "")
               {
                  Environment.application.updateData(param1.data);
                  if(_datingStep.isRewardProcessed && !_datingStep.isLastStep)
                  {
                     Environment.application.sendActionRequest("startNewDatingStep",{
                        "dating_index":_datingStep.datingIndex,
                        "step_index":_datingStep.stepIndex + 1
                     },handleRequests);
                  }
                  else
                  {
                     if(_datingStep.isRewardProcessed)
                     {
                        showRewardEffect(!param1.request.getBoolean("discard_item"));
                        if(DatingUtil.hasRewardImage(_datingStep.datingIndex,_datingStep.stepIndex,_datingStep.repeat))
                        {
                           Environment.panelManager.showDialog(new DialogDatingPicture(_datingStep.datingIndex,_datingStep.stepIndex));
                        }
                     }
                     close();
                     ViewManager.instance.baseUserPanel.fadeInMainNavigationButtons();
                     ViewManager.instance.showPanel("quests");
                  }
               }
               else if(param1.error == "errInventoryNoEmptySlot")
               {
                  Environment.panelManager.showDialog(new UiTwoChoiceDialog(LocText.current.text("dialog/no_free_slot/title"),LocText.current.text("dialog/no_free_slot/text",GameUtil.getGameCurrencyString(_itemReward.item.sellPrice)),LocText.current.text("dialog/no_free_slot/button_go_to_shop"),LocText.current.text("dialog/no_free_slot/button_discard_item"),onClickGotoShop,onClickDiscardItem,false));
               }
               else if(param1.error == "errClaimDatingStepRewardInvalidDatingStep")
               {
                  close();
               }
               else if(param1.error == "errClaimDatingRewardInvalidStatus")
               {
                  close();
               }
               else
               {
                  Environment.reportError(param1.error,param1.request);
               }
               break;
            case "startNewDatingStep":
               if(param1.error == "")
               {
                  Environment.application.updateData(param1.data);
                  if(_datingStep.isRewardProcessed)
                  {
                     showRewardEffect(!param1.request.getBoolean("discard_item"));
                     if(DatingUtil.hasRewardImage(_datingStep.datingIndex,_datingStep.stepIndex,_datingStep.repeat))
                     {
                        Environment.panelManager.showDialog(new DialogDatingPicture(_datingStep.datingIndex,_datingStep.stepIndex,null,null,null,_onNewStepStarted));
                     }
                  }
                  close();
                  ViewManager.instance.baseUserPanel.fadeInMainNavigationButtons();
                  ViewManager.instance.showPanel("quests");
               }
               else if(param1.error == "errStartDatingStepAnotherActive")
               {
                  Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/start_new_dating_step_another_step_active/title"),LocText.current.text("dialog/start_new_dating_step_another_step_active/text"),LocText.current.text("general/button_ok")));
               }
               else if(param1.error == "errStartDatingStepLastStepNotFinished")
               {
                  Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/start_new_dating_step_another_step_active/title"),LocText.current.text("dialog/start_new_dating_step_another_step_active/text"),LocText.current.text("general/button_ok")));
               }
               else if(param1.error == "errStartDatingStepInvalidLevel")
               {
                  Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/start_new_dating_step_invalid_level/title"),LocText.current.text("dialog/start_new_dating_step_invalid_level/text"),LocText.current.text("general/button_ok")));
               }
               else if(param1.error != "errStartDatingStepAlreadyStarted")
               {
                  if(param1.error != "errStartDatingStepAlreadyCompleted")
                  {
                     Environment.reportError(param1.error,param1.request);
                  }
               }
               close();
               break;
            default:
               throw new Error("Unsupported request action \'" + param1.action + "\'!");
         }
      }
      
      private function showRewardEffect(param1:Boolean) : void
      {
         var _loc2_:* = null;
         var _loc3_:SymbolDialogDatingOutcomeGeneric = _vo as SymbolDialogDatingOutcomeGeneric;
         if(param1 && _itemReward != null)
         {
            _loc2_ = User.current.character.getItemById(_datingStep.reward.itemId);
            EffectsLayer.instance.show(3,{
               "emitter":_loc3_.itemReward,
               "imageUrl":_loc2_.iconImageUrl
            });
         }
         if(_loc3_.iconStatPoints.visible)
         {
            EffectsLayer.instance.show(7,{
               "emitter":_loc3_.iconStatPoints,
               "amount":_datingStep.reward.statPoints
            });
         }
      }
      
      override public function get defaultButton() : Button
      {
         return _btnClose;
      }
   }
}
