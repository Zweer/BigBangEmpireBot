package com.playata.application.ui.dialogs
{
   import com.playata.application.data.GameUtil;
   import com.playata.application.data.character.Character;
   import com.playata.application.data.dating.DatingStep;
   import com.playata.application.data.dating.DatingUtil;
   import com.playata.application.data.item.Item;
   import com.playata.application.data.quest.Quest;
   import com.playata.application.data.story_dungeon.StoryDungeon;
   import com.playata.application.data.user.User;
   import com.playata.application.ui.ViewManager;
   import com.playata.application.ui.effects.EffectsLayer;
   import com.playata.application.ui.elements.dating.UiDatingItemReward;
   import com.playata.application.ui.elements.dungeon.UiDungeonKeyReward;
   import com.playata.application.ui.elements.event.UiEventItemReward;
   import com.playata.application.ui.elements.generic.button.UiTextButton;
   import com.playata.application.ui.elements.generic.dialog.UiDialog;
   import com.playata.application.ui.elements.generic.dialog.UiTwoChoiceDialog;
   import com.playata.application.ui.elements.generic.textfield.UiTextTooltip;
   import com.playata.application.ui.elements.guild_competition.UiGuildCompetitionItemReward;
   import com.playata.application.ui.elements.herobook.UiHerobookItemReward;
   import com.playata.application.ui.elements.item.UiItemSlot;
   import com.playata.application.ui.elements.movie.UiMovieVoteItem;
   import com.playata.application.ui.elements.slotmachine.UiSlotMachineJetonReward;
   import com.playata.framework.application.Environment;
   import com.playata.framework.application.request.ActionRequestResponse;
   import com.playata.framework.display.ui.controls.Button;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.dialogs.SymbolDialogQuestCompleteGeneric;
   
   public class DialogQuestComplete extends UiDialog
   {
       
      
      private var _btnClose:UiTextButton = null;
      
      private var _itemReward:UiItemSlot = null;
      
      private var _dungeonKeyReward:UiDungeonKeyReward = null;
      
      private var _movieVoteItemReward:UiMovieVoteItem = null;
      
      private var _eventItemReward:UiEventItemReward = null;
      
      private var _datingItemReward:UiDatingItemReward = null;
      
      private var _slotMachineJetonRewards:UiSlotMachineJetonReward = null;
      
      private var _guildCompetitionItemReward:UiGuildCompetitionItemReward = null;
      
      private var _herobookItemReward:UiHerobookItemReward = null;
      
      private var _quest:Quest = null;
      
      private var _callback:Function = null;
      
      private var _storyDungeonTooltipText:UiTextTooltip;
      
      private var _storyDungeonTooltipIcon:UiTextTooltip;
      
      private var _repeatStoryDungeonTooltipIcon:UiTextTooltip;
      
      private var _repeatDatingTooltipIcon:UiTextTooltip;
      
      public function DialogQuestComplete(param1:Quest, param2:Function)
      {
         var _loc9_:* = null;
         _quest = param1;
         _callback = param2;
         var _loc7_:SymbolDialogQuestCompleteGeneric = new SymbolDialogQuestCompleteGeneric();
         super(_loc7_);
         _queued = false;
         var _loc3_:Character = User.current.character;
         if(_quest.isTimeQuest)
         {
            _loc7_.txtDialogTitle.text = LocText.current.text("dialog/quest_complete/title_mission");
            _loc7_.txtOutcome.text = _quest.winText;
            _loc7_.txtRewardsCaption.text = LocText.current.text("dialog/quest_complete/rewards");
         }
         else if(_quest.isWon)
         {
            _loc7_.txtDialogTitle.text = LocText.current.text("dialog/quest_complete/title_win");
            _loc7_.txtOutcome.text = _quest.winText;
            _loc7_.txtRewardsCaption.text = LocText.current.text("dialog/quest_complete/rewards");
         }
         else
         {
            _loc7_.txtDialogTitle.text = LocText.current.text("dialog/quest_complete/title_lose");
            _loc7_.txtOutcome.text = _quest.lostText;
            _loc7_.txtRewardsCaption.text = LocText.current.text("dialog/quest_complete/no_rewards");
         }
         _loc7_.itemReward.visible = _quest.reward.itemId != 0;
         if(_quest.reward.itemId != 0)
         {
            _itemReward = new UiItemSlot(_loc7_.itemReward,0);
            _itemReward.item = User.current.character.getItemById(_quest.reward.itemId);
         }
         _loc7_.dungeonKeyReward.visible = !_loc3_.hasDungeonKey && _quest.reward.dungeonKey && _loc3_.currentDungeon == null;
         if(_loc7_.dungeonKeyReward.visible)
         {
            _dungeonKeyReward = new UiDungeonKeyReward(_loc7_.dungeonKeyReward);
         }
         _loc7_.movieVoteReward.visible = param1.reward.movieVotes > 0;
         if(_loc7_.movieVoteReward.visible)
         {
            if(_movieVoteItemReward == null)
            {
               _movieVoteItemReward = new UiMovieVoteItem(_loc7_.movieVoteReward);
            }
            _movieVoteItemReward.movieVotes = param1.reward.movieVotes;
         }
         _loc7_.eventItemReward.visible = _quest.reward.eventItemIdentifier != null;
         if(_loc7_.eventItemReward.visible)
         {
            _eventItemReward = new UiEventItemReward(_loc7_.eventItemReward);
            _eventItemReward.eventItem = _quest.reward.eventItemIdentifier;
         }
         _loc7_.datingItemReward.visible = param1.reward.datingItemIdentifier != null;
         if(_loc7_.datingItemReward.visible)
         {
            if(_datingItemReward == null)
            {
               _datingItemReward = new UiDatingItemReward(_loc7_.datingItemReward);
            }
            _datingItemReward.datingItem = param1.reward.datingItemIdentifier;
         }
         var _loc4_:int = param1.reward.storyDungeonUnlockPoint;
         _loc7_.txtStoryDungeon.visible = false;
         _loc7_.iconStoryDungeon.visible = false;
         var _loc5_:String = null;
         if(_loc4_ > 0)
         {
            _loc9_ = null;
            if(_loc3_.currentStoryDungeon && _loc3_.currentStoryDungeon.storyDungeonIndex == _loc4_)
            {
               _loc9_ = _loc3_.currentStoryDungeon;
            }
            else if(_loc3_.repeatStoryDungeon && _loc3_.repeatStoryDungeon.storyDungeonIndex == _loc4_)
            {
               _loc9_ = _loc3_.repeatStoryDungeon;
            }
            if(_loc9_ && !_loc9_.allPointsCollected())
            {
               _loc7_.txtStoryDungeon.visible = true;
               _loc7_.iconStoryDungeon.visible = true;
               _loc7_.txtStoryDungeon.text = StoryDungeon.getUnlockPoinName(_loc9_.storyDungeonIndex);
               _loc7_.txtStoryDungeon.autoFontSize = true;
               _loc7_.iconStoryDungeon.setUriSprite(StoryDungeon.getUnlockPointImageUrl(_loc9_.storyDungeonIndex),37,37,false,1,null,true);
               _loc5_ = StoryDungeon.getUnlockPoinTooltip(_loc9_.storyDungeonIndex);
               if(!_storyDungeonTooltipText)
               {
                  _storyDungeonTooltipText = new UiTextTooltip(_loc7_.txtStoryDungeon,_loc5_);
               }
               else
               {
                  _storyDungeonTooltipText.text = _loc5_;
               }
               if(!_storyDungeonTooltipIcon)
               {
                  _storyDungeonTooltipIcon = new UiTextTooltip(_loc7_.iconStoryDungeon,_loc5_);
               }
               else
               {
                  _storyDungeonTooltipIcon.text = _loc5_;
               }
            }
         }
         _loc7_.iconRepeatStoryDungeonKey.visible = false;
         if(param1.reward.repeatStoryDungeonIndex > 0)
         {
            _loc7_.txtStoryDungeon.visible = true;
            _loc7_.iconRepeatStoryDungeonKey.visible = true;
            _loc7_.txtStoryDungeon.text = StoryDungeon.getRepeatKeyName(param1.reward.repeatStoryDungeonIndex);
            _loc7_.txtStoryDungeon.autoFontSize = true;
            _loc7_.iconRepeatStoryDungeonKey.setUriSprite(StoryDungeon.getRepeatKeyImageUrl(param1.reward.repeatStoryDungeonIndex),37,37,false,1,null,true);
            _loc5_ = StoryDungeon.getRepeatKeyName(param1.reward.repeatStoryDungeonIndex) + "\n\n" + StoryDungeon.getRepeatKeyDescription(param1.reward.repeatStoryDungeonIndex);
            if(!_storyDungeonTooltipText)
            {
               _storyDungeonTooltipText = new UiTextTooltip(_loc7_.txtStoryDungeon,_loc5_);
            }
            else
            {
               _storyDungeonTooltipText.text = _loc5_;
            }
            if(!_repeatStoryDungeonTooltipIcon)
            {
               _repeatStoryDungeonTooltipIcon = new UiTextTooltip(_loc7_.iconRepeatStoryDungeonKey,_loc5_);
            }
            else
            {
               _repeatStoryDungeonTooltipIcon.text = _loc5_;
            }
         }
         _loc7_.iconRepeatDatingKey.visible = false;
         if(param1.reward.repeatDatingIndex > 0)
         {
            _loc7_.txtStoryDungeon.visible = true;
            _loc7_.iconRepeatDatingKey.visible = true;
            _loc7_.txtStoryDungeon.text = DatingUtil.getRepeatKeyName(param1.reward.repeatDatingIndex);
            _loc7_.txtStoryDungeon.autoFontSize = true;
            _loc7_.iconRepeatDatingKey.setUriSprite(DatingUtil.getRepeatKeyImageUrl(param1.reward.repeatDatingIndex),37,37,false,1,null,true);
            _loc5_ = DatingUtil.getRepeatKeyName(param1.reward.repeatDatingIndex) + "\n\n" + DatingUtil.getRepeatKeyDescription(param1.reward.repeatDatingIndex);
            if(!_storyDungeonTooltipText)
            {
               _storyDungeonTooltipText = new UiTextTooltip(_loc7_.txtStoryDungeon,_loc5_);
            }
            else
            {
               _storyDungeonTooltipText.text = _loc5_;
            }
            if(!_repeatDatingTooltipIcon)
            {
               _repeatDatingTooltipIcon = new UiTextTooltip(_loc7_.iconRepeatDatingKey,_loc5_);
            }
            else
            {
               _repeatDatingTooltipIcon.text = _loc5_;
            }
         }
         _loc7_.herobookItemReward.visible = _quest.reward.herobookItemIdentifier != null;
         if(_loc7_.herobookItemReward.visible)
         {
            _herobookItemReward = new UiHerobookItemReward(_loc7_.herobookItemReward);
            _herobookItemReward.refresh(_quest.reward.herobookItemIdentifier);
         }
         _loc7_.slotmachineJetonReward.visible = _quest.reward.slotMachinJetons > 0;
         if(_loc7_.slotmachineJetonReward.visible)
         {
            _slotMachineJetonRewards = new UiSlotMachineJetonReward(_loc7_.slotmachineJetonReward);
            _slotMachineJetonRewards.amount = _quest.reward.slotMachinJetons;
         }
         _loc7_.guildCompetitionItemReward.visible = _quest.reward.guildCompetitionItemIdentifier != null;
         if(_loc7_.guildCompetitionItemReward.visible)
         {
            if(_guildCompetitionItemReward == null)
            {
               _guildCompetitionItemReward = new UiGuildCompetitionItemReward(_loc7_.guildCompetitionItemReward);
            }
            _guildCompetitionItemReward.guildCompetitionItem = _quest.reward.guildCompetitionItemIdentifier;
         }
         var _loc6_:int = param1.reward.opticalChangeResource;
         _loc7_.iconOpticalChangeResource.visible = false;
         if(!_loc7_.txtStoryDungeon.visible && _loc6_ > 0)
         {
            _loc7_.txtStoryDungeon.visible = true;
            _loc7_.iconOpticalChangeResource.visible = true;
            _loc7_.txtStoryDungeon.text = GameUtil.getOpticalChangeResourceString(_loc6_);
            _loc7_.txtStoryDungeon.autoFontSize = true;
         }
         var _loc8_:int = param1.reward.fanFotoResource;
         _loc7_.iconFanFotoResource.visible = false;
         if(!_loc7_.txtStoryDungeon.visible && _loc8_ > 0 && _loc3_.fanFoto)
         {
            _loc7_.txtStoryDungeon.visible = true;
            _loc7_.iconFanFotoResource.visible = true;
            _loc7_.txtStoryDungeon.text = GameUtil.getFanFotoResourceString(_loc8_);
            _loc7_.txtStoryDungeon.autoFontSize = true;
         }
         _loc7_.iconCoins.visible = _quest.reward.gameCurrency > 0;
         _loc7_.txtCoins.visible = _quest.reward.gameCurrency > 0;
         _loc7_.txtCoins.text = _quest.reward.gameCurrencyString;
         _loc7_.iconXp.visible = _quest.reward.xp > 0;
         _loc7_.txtXp.visible = _quest.reward.xp > 0;
         _loc7_.txtXp.text = _quest.reward.xpString;
         _loc7_.iconPremiumCurrency.visible = _quest.reward.premiumCurrency > 0;
         _loc7_.txtPremiumCurrency.visible = _quest.reward.premiumCurrency > 0;
         _loc7_.txtPremiumCurrency.text = _quest.reward.premiumCurrencyString;
         _btnClose = new UiTextButton(_loc7_.btnClose,LocText.current.text("general/button_ok"),"",onClickClose);
      }
      
      override public function show() : void
      {
         super.show();
         if(_quest.isWon)
         {
            EffectsLayer.instance.show(100,{},_vo.parent,1);
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
         if(_storyDungeonTooltipText != null)
         {
            _storyDungeonTooltipText.dispose();
            _storyDungeonTooltipText = null;
         }
         if(_storyDungeonTooltipIcon != null)
         {
            _storyDungeonTooltipIcon.dispose();
            _storyDungeonTooltipIcon = null;
         }
         if(_repeatStoryDungeonTooltipIcon != null)
         {
            _repeatStoryDungeonTooltipIcon.dispose();
            _repeatStoryDungeonTooltipIcon = null;
         }
         if(_repeatDatingTooltipIcon != null)
         {
            _repeatDatingTooltipIcon.dispose();
            _repeatDatingTooltipIcon = null;
         }
         super.dispose();
      }
      
      private function onClickClose(param1:InteractionEvent) : void
      {
         Environment.application.sendActionRequest("claimQuestRewards",{
            "discard_item":false,
            "create_new":true
         },handleRequests);
      }
      
      private function onClickGotoShop() : void
      {
         if(!_quest.isTimeQuest)
         {
            ViewManager.instance.baseUserPanel.fadeInMainNavigationButtons();
         }
         ViewManager.instance.showPanel("shop");
         _callback();
         close();
      }
      
      private function onClickDiscardItem() : void
      {
         Environment.application.sendActionRequest("claimQuestRewards",{
            "discard_item":true,
            "create_new":true
         },handleRequests);
      }
      
      private function handleRequests(param1:ActionRequestResponse) : void
      {
         var _loc3_:Boolean = false;
         var _loc2_:int = 0;
         var _loc4_:Boolean = false;
         var _loc5_:* = null;
         var _loc6_:* = param1.action;
         if("claimQuestRewards" !== _loc6_)
         {
            throw new Error("Unsupported request action \'" + param1.action + "\'!");
         }
         if(param1.error == "")
         {
            _loc3_ = User.current.character.hasDungeonKey;
            _loc2_ = ViewManager.instance.user.character.currentRepeatStoryDungeonId;
            _loc4_ = ViewManager.instance.user.character.dating.hasActiveRepeatDatingStep();
            Environment.application.updateData(param1.data);
            ViewManager.instance.showPanel("quests");
            _callback();
            showRewardEffect(!param1.request.rawData.discard_item);
            if(!_quest.isTimeQuest)
            {
               ViewManager.instance.baseUserPanel.fadeInMainNavigationButtons();
            }
            close();
            if(!_loc3_ && User.current.character.hasDungeonKey)
            {
               Environment.panelManager.showDialog(new DialogDungeonSelect(true));
            }
            if(_loc2_ != ViewManager.instance.user.character.currentRepeatStoryDungeonId)
            {
               Environment.panelManager.showDialog(new DialogStoryDungeonUnlocked(ViewManager.instance.user.character.repeatStoryDungeon.storyDungeonIndex,false,true));
            }
            if(!_loc4_ && ViewManager.instance.user.character.dating.hasActiveRepeatDatingStep())
            {
               _loc5_ = ViewManager.instance.user.character.dating.getLastRepeatDatingStep();
               if(_loc5_.isStarted || _loc5_.isFinished)
               {
                  Environment.panelManager.showDialog(new DialogDatingStepUnlocked(_loc5_.datingIndex,_loc5_.stepIndex,null,true));
               }
            }
         }
         else if(param1.error == "errInventoryNoEmptySlot")
         {
            Environment.panelManager.showDialog(new UiTwoChoiceDialog(LocText.current.text("dialog/no_free_slot/title"),LocText.current.text("dialog/no_free_slot/text",GameUtil.getGameCurrencyString(_itemReward.item.sellPrice)),LocText.current.text("dialog/no_free_slot/button_go_to_shop"),LocText.current.text("dialog/no_free_slot/button_discard_item"),onClickGotoShop,onClickDiscardItem,false));
         }
         else if(param1.error != "errClaimQuestRewardsNoActiveQuest")
         {
            if(param1.error == "errClaimQuestRewardsInvalidStatus")
            {
               close();
            }
            else
            {
               Environment.reportError(param1.error,param1.request);
            }
         }
      }
      
      private function showRewardEffect(param1:Boolean) : void
      {
         var _loc3_:* = null;
         var _loc2_:* = null;
         try
         {
            _loc3_ = _vo as SymbolDialogQuestCompleteGeneric;
            if(_loc3_.iconCoins.visible)
            {
               EffectsLayer.instance.show(0,{"emitter":_loc3_.iconCoins});
            }
            if(_loc3_.iconXp.visible)
            {
               EffectsLayer.instance.show(1,{"emitter":_loc3_.iconXp});
            }
            if(_loc3_.iconPremiumCurrency.visible)
            {
               EffectsLayer.instance.show(2,{"emitter":_loc3_.iconPremiumCurrency});
            }
            if(param1 && _itemReward != null)
            {
               _loc2_ = User.current.character.getItemById(_quest.reward.itemId);
               EffectsLayer.instance.show(3,{
                  "emitter":_loc3_.itemReward,
                  "imageUrl":_loc2_.iconImageUrl
               });
            }
            if(_loc3_.dungeonKeyReward.visible)
            {
               EffectsLayer.instance.show(4,{"emitter":_loc3_.dungeonKeyReward});
            }
            if(_loc3_.movieVoteReward.visible)
            {
               EffectsLayer.instance.show(12,{"emitter":_loc3_.movieVoteReward});
            }
            if(_loc3_.iconStoryDungeon.visible)
            {
               EffectsLayer.instance.show(14,{
                  "emitter":_loc3_.iconStoryDungeon,
                  "imageUrl":StoryDungeon.getUnlockPointImageUrl(_quest.reward.storyDungeonUnlockPoint)
               });
            }
            if(_loc3_.iconRepeatStoryDungeonKey.visible)
            {
               EffectsLayer.instance.show(14,{
                  "emitter":_loc3_.iconRepeatStoryDungeonKey,
                  "imageUrl":StoryDungeon.getRepeatKeyImageUrl(_quest.reward.repeatStoryDungeonIndex)
               });
            }
            if(_loc3_.iconRepeatDatingKey.visible)
            {
               EffectsLayer.instance.show(14,{
                  "emitter":_loc3_.iconRepeatDatingKey,
                  "imageUrl":DatingUtil.getRepeatKeyImageUrl(_quest.reward.repeatDatingIndex)
               });
            }
            return;
         }
         catch(e:Error)
         {
            return;
         }
      }
      
      override public function get defaultButton() : Button
      {
         return _btnClose;
      }
   }
}
