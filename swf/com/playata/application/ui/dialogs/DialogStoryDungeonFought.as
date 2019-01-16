package com.playata.application.ui.dialogs
{
   import com.playata.application.AppEnvironment;
   import com.playata.application.data.GameUtil;
   import com.playata.application.data.character.Character;
   import com.playata.application.data.constants.CConstant;
   import com.playata.application.data.item.Item;
   import com.playata.application.data.story_dungeon.StoryDungeon;
   import com.playata.application.data.user.User;
   import com.playata.application.ui.ViewManager;
   import com.playata.application.ui.effects.EffectsLayer;
   import com.playata.application.ui.elements.generic.button.UiTextButton;
   import com.playata.application.ui.elements.generic.dialog.UiDialog;
   import com.playata.application.ui.elements.generic.dialog.UiTwoChoiceDialog;
   import com.playata.application.ui.elements.item.UiItemSlot;
   import com.playata.application.ui.elements.story_dungeon.UiStoryDungeonBoss;
   import com.playata.application.ui.panels.PanelQuests;
   import com.playata.framework.application.Environment;
   import com.playata.framework.application.request.ActionRequestResponse;
   import com.playata.framework.display.ui.controls.Button;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.dialogs.SymbolDialogStoryDungeonFoughtGeneric;
   
   public class DialogStoryDungeonFought extends UiDialog
   {
       
      
      private var _btnClose:UiTextButton = null;
      
      private var _itemReward:UiItemSlot = null;
      
      private var _storyDungeon:StoryDungeon = null;
      
      private var _boss:UiStoryDungeonBoss;
      
      public function DialogStoryDungeonFought(param1:StoryDungeon)
      {
         _storyDungeon = param1;
         var _loc3_:SymbolDialogStoryDungeonFoughtGeneric = new SymbolDialogStoryDungeonFoughtGeneric();
         super(_loc3_);
         _queued = false;
         _boss = new UiStoryDungeonBoss(_loc3_.boss,_storyDungeon.storyDungeonIndex,_storyDungeon.repeat);
         var _loc2_:Character = User.current.character;
         _loc3_.txtDialogTitle.text = StoryDungeon.getName(_storyDungeon.storyDungeonIndex);
         if(_storyDungeon.isFinished)
         {
            _loc3_.txtRewardsCaption.visible = true;
            _loc3_.itemReward.visible = true;
            _loc3_.iconStatPoints.visible = true;
            _loc3_.txtStatPoints.visible = _storyDungeon.reward.statPoints > 0;
            _loc3_.txtStageReward.visible = true;
            _loc3_.txtFailed.visible = false;
            _loc3_.txtOutcome.text = StoryDungeon.getWinText(_storyDungeon.storyDungeonIndex);
            _loc3_.txtOutcome.autoFontSize = true;
            _loc3_.txtRewardsCaption.text = LocText.current.text("dialog/story_dungeon_unlocked/rewards");
            _loc3_.itemReward.visible = _storyDungeon.reward.itemId != 0;
            if(_storyDungeon.reward.itemId != 0)
            {
               _itemReward = new UiItemSlot(_loc3_.itemReward,0);
               _itemReward.item = _loc2_.getItemById(_storyDungeon.reward.itemId);
            }
            if(_storyDungeon.reward.statPoints)
            {
               _loc3_.txtStatPoints.text = GameUtil.getStatPointString(_storyDungeon.reward.statPoints);
            }
            if(_storyDungeon.repeat)
            {
               _loc3_.txtStageReward.visible = false;
               _loc3_.txtStageMissionReward.visible = false;
               _loc3_.iconStageReward.visible = false;
               _loc3_.iconStageMissionReward.visible = false;
            }
            else
            {
               _loc3_.txtStageReward.text = StoryDungeon.getRewardStageChanges(_storyDungeon.storyDungeonIndex);
               _loc3_.txtStageReward.autoFontSize = true;
               _loc3_.txtStageMissionReward.text = StoryDungeon.getRewardStageMissions(_storyDungeon.storyDungeonIndex);
               _loc3_.txtStageMissionReward.autoFontSize = true;
            }
            Environment.audio.playFX("event_dungeon_battle_won.mp3");
         }
         else
         {
            _loc3_.txtRewardsCaption.visible = false;
            _loc3_.itemReward.visible = false;
            _loc3_.iconStatPoints.visible = false;
            _loc3_.txtStatPoints.visible = false;
            _loc3_.txtStageReward.visible = false;
            _loc3_.txtStageMissionReward.visible = false;
            _loc3_.iconStageReward.visible = false;
            _loc3_.iconStageMissionReward.visible = false;
            _loc3_.txtFailed.visible = true;
            _loc3_.txtOutcome.text = StoryDungeon.getLostText(_storyDungeon.storyDungeonIndex);
            _loc3_.txtOutcome.autoFontSize = true;
            _loc3_.txtFailed.text = LocText.current.text("dialog/story_dungeon_fought/failed",CConstant.story_dungeon_attack_cooldown / 60);
            Environment.audio.playFX("event_dungeon_battle_lost.mp3");
         }
         _btnClose = new UiTextButton(_loc3_.btnClose,LocText.current.text("general/button_ok"),"",onClickClose);
      }
      
      override public function show() : void
      {
         super.show();
         if(_storyDungeon.isFinished)
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
         _boss.dispose();
         _boss = null;
         super.dispose();
      }
      
      private function onClickClose(param1:InteractionEvent) : void
      {
         Environment.application.sendActionRequest("claimStoryDungeonReward",{
            "discard_item":false,
            "story_dungeon_index":_storyDungeon.storyDungeonIndex
         },handleRequests);
      }
      
      private function onClickGotoShop() : void
      {
         ViewManager.instance.baseUserPanel.fadeInMainNavigationButtons();
         ViewManager.instance.showPanel("shop");
         close();
      }
      
      private function onClickDiscardItem() : void
      {
         Environment.application.sendActionRequest("claimStoryDungeonReward",{
            "discard_item":true,
            "story_dungeon_index":_storyDungeon.storyDungeonIndex
         },handleRequests);
      }
      
      private function handleRequests(param1:ActionRequestResponse) : void
      {
         var _loc2_:* = param1.action;
         if("claimStoryDungeonReward" !== _loc2_)
         {
            throw new Error("Unsupported request action \'" + param1.action + "\'!");
         }
         if(param1.error == "")
         {
            if(!_storyDungeon.repeat)
            {
               PanelQuests.showInitAnimationForStoryDungeon = User.current.character.currentStoryDungeonIndex;
            }
            Environment.application.updateData(param1.data);
            ViewManager.instance.baseUserPanel.fadeInMainNavigationButtons();
            ViewManager.instance.showPanel("quests");
            if(_storyDungeon.isFinished)
            {
               showRewardEffect(!param1.request.getBoolean("discard_item"));
            }
            close();
            if(AppEnvironment.appPlatform.isFacebook && _storyDungeon.isRewardProcessed)
            {
               platform.publishFeed(StoryDungeon.getBossFacebookImageUrl(_storyDungeon.storyDungeonIndex),LocText.current.text("facebook/object/complete_story_dungeon/title",StoryDungeon.getName(_storyDungeon.storyDungeonIndex)),LocText.current.text("facebook/object/complete_story_dungeon/description",User.current.character.name,StoryDungeon.getBossName(_storyDungeon.storyDungeonIndex)));
            }
         }
         else if(param1.error == "errInventoryNoEmptySlot")
         {
            Environment.panelManager.showDialog(new UiTwoChoiceDialog(LocText.current.text("dialog/no_free_slot/title"),LocText.current.text("dialog/no_free_slot/text",GameUtil.getGameCurrencyString(_itemReward.item.sellPrice)),LocText.current.text("dialog/no_free_slot/button_go_to_shop"),LocText.current.text("dialog/no_free_slot/button_discard_item"),onClickGotoShop,onClickDiscardItem,false));
         }
         else if(param1.error == "errClaimStoryDungeonRewardNoStoryDungeonBattle")
         {
            close();
         }
         else if(param1.error == "errClaimStoryDungeonRewardInvalidStoryDungeon")
         {
            close();
         }
         else if(param1.error == "errClaimStoryDungeonRewardInvalidStatus")
         {
            close();
         }
         else
         {
            Environment.reportError(param1.error,param1.request);
         }
      }
      
      private function showRewardEffect(param1:Boolean) : void
      {
         var _loc2_:* = null;
         var _loc3_:SymbolDialogStoryDungeonFoughtGeneric = _vo as SymbolDialogStoryDungeonFoughtGeneric;
         if(param1 && _itemReward != null)
         {
            _loc2_ = User.current.character.getItemById(_storyDungeon.reward.itemId);
            EffectsLayer.instance.show(3,{
               "emitter":_loc3_.itemReward,
               "imageUrl":_loc2_.iconImageUrl
            });
         }
         if((_vo as SymbolDialogStoryDungeonFoughtGeneric).iconStatPoints.visible)
         {
            EffectsLayer.instance.show(7,{
               "emitter":(_vo as SymbolDialogStoryDungeonFoughtGeneric).iconStatPoints,
               "amount":_storyDungeon.reward.statPoints
            });
         }
      }
      
      override public function get defaultButton() : Button
      {
         return _btnClose;
      }
   }
}
