package com.playata.application.ui.dialogs
{
   import com.playata.application.data.constants.CConstant;
   import com.playata.application.data.convention.Convention;
   import com.playata.application.data.dating.DatingStep;
   import com.playata.application.data.dating.DatingUtil;
   import com.playata.application.data.quest.Quest;
   import com.playata.application.data.story_dungeon.StoryDungeon;
   import com.playata.application.data.user.User;
   import com.playata.application.data.user_story.UserStories;
   import com.playata.application.data.user_story.UserStory;
   import com.playata.application.messaging.Message;
   import com.playata.application.messaging.MessageRouter;
   import com.playata.application.ui.ViewManager;
   import com.playata.application.ui.elements.convention.UiConventionShowBriefingContent;
   import com.playata.application.ui.elements.dating.UiDatingBriefingContent;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.application.ui.elements.generic.button.UiPremiumButton;
   import com.playata.application.ui.elements.generic.button.UiTextButton;
   import com.playata.application.ui.elements.generic.dialog.UiDialog;
   import com.playata.application.ui.elements.generic.dialog.UiInfoDialog;
   import com.playata.application.ui.elements.generic.textfield.UiTextTooltip;
   import com.playata.application.ui.elements.quest.UiQuestBriefingContent;
   import com.playata.application.ui.elements.story_dungeon.UiStoryDungeonBriefingContent;
   import com.playata.application.ui.panels.PanelBattle;
   import com.playata.application.ui.panels.PanelQuests;
   import com.playata.application.ui.panels.PanelStatQuest;
   import com.playata.framework.application.Environment;
   import com.playata.framework.application.request.ActionRequestResponse;
   import com.playata.framework.core.Runtime;
   import com.playata.framework.display.layout.LayoutUtil;
   import com.playata.framework.display.ui.controls.Button;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.input.SwipeDirection;
   import com.playata.framework.localization.LocText;
   import visuals.ui.dialogs.SymbolDialogQuestBriefingGeneric;
   
   public class DialogQuestBriefing extends UiDialog
   {
      
      private static var _isOpen:Boolean = false;
       
      
      private var _realContent:SymbolDialogQuestBriefingGeneric = null;
      
      private var _btnClose:UiButton = null;
      
      private var _btnStartQuest:UiTextButton = null;
      
      private var _btnStartQuestPremium:UiPremiumButton = null;
      
      private var _btnPreviousQuest:UiButton = null;
      
      private var _btnNextQuest:UiButton = null;
      
      private var _btnReportUserStory:UiButton = null;
      
      private var _currentData:Object = null;
      
      private var _questContent:UiQuestBriefingContent = null;
      
      private var _conventionContent:UiConventionShowBriefingContent = null;
      
      private var _storyDungeonContent:UiStoryDungeonBriefingContent = null;
      
      private var _datingContent:UiDatingBriefingContent = null;
      
      private var _userStoryTagTooltip:UiTextTooltip = null;
      
      private var _callback:Function = null;
      
      private var _initialTextTypeX:Number = 0;
      
      private var _initialHeight:Number = 0;
      
      private var _initialButtonStartY:Number = 0;
      
      private var _initialButtonStartPremiumY:Number = 0;
      
      private var _btnUserStoryInfo:UiButton = null;
      
      public function DialogQuestBriefing(param1:Object, param2:Function)
      {
         data = param1;
         callback = param2;
         _currentData = data;
         _isOpen = true;
         _callback = callback;
         _realContent = new SymbolDialogQuestBriefingGeneric();
         super(_realContent);
         _queued = false;
         _btnClose = new UiButton(_realContent.btnClose,"",onClickClose);
         _btnStartQuest = new UiTextButton(_realContent.btnStartQuest,LocText.current.text("dialog/quest_briefing/button_start"),"",onClickStartQuest);
         _btnStartQuestPremium = new UiPremiumButton(_realContent.btnStartQuestPremium,0,"",LocText.current.text("dialog/quest_briefing/button_start"),"","",onClickStartQuest);
         _btnStartQuestPremium.premium = true;
         _btnStartQuestPremium.visible = false;
         _btnPreviousQuest = new UiButton(_realContent.btnPreviousQuest,LocText.current.text("dialog/quest_briefing/button_previous_quest"),onClickPreviousQuest);
         _btnNextQuest = new UiButton(_realContent.btnNextQuest,LocText.current.text("dialog/quest_briefing/button_next_quest"),onClickNextQuest);
         _btnReportUserStory = new UiButton(_realContent.btnReportUserStory,LocText.current.text("dialog/user_story_report/button_report"),onClickReportUserStory);
         _btnReportUserStory.visible = false;
         var maxTextWidth:Number = 0;
         _initialTextTypeX = _realContent.txtType.x;
         _initialHeight = _realContent.dialogBackground.height;
         _initialButtonStartY = _realContent.btnStartQuest.y;
         _initialButtonStartPremiumY = _realContent.btnStartQuestPremium.y;
         _realContent.txtType.text = LocText.current.text("screen/quest/button_time_quest_tooltip");
         if(_realContent.txtType.textWidth > maxTextWidth)
         {
            maxTextWidth = _realContent.txtType.textWidth;
         }
         _realContent.txtType.text = LocText.current.text("screen/quest/button_fight_quest_tooltip");
         if(_realContent.txtType.textWidth > maxTextWidth)
         {
            maxTextWidth = _realContent.txtType.textWidth;
         }
         _realContent.txtType.text = LocText.current.text("screen/quest/button_stat_quest_tooltip");
         if(_realContent.txtType.textWidth > maxTextWidth)
         {
            maxTextWidth = _realContent.txtType.textWidth;
         }
         _realContent.txtType.text = LocText.current.text("screen/quest/button_convention_show_tooltip");
         if(_realContent.txtType.text != "screen/quest/button_convention_show_tooltip" && _realContent.txtType.textWidth > maxTextWidth)
         {
            maxTextWidth = _realContent.txtType.textWidth;
         }
         if(User.current.character.getUserStoryQuestInStage(User.current.character.currentQuestStage))
         {
            _realContent.txtType.text = User.current.character.getUserStoryQuestInStage(User.current.character.currentQuestStage).title;
            var textWidth:Number = _realContent.txtType.textWidth + _realContent.iconUserStoryTag.width;
            if(textWidth > maxTextWidth)
            {
               maxTextWidth = textWidth;
            }
         }
         if(User.current.character.currentStoryDungeon)
         {
            _realContent.txtType.text = StoryDungeon.getName(User.current.character.currentStoryDungeon.storyDungeonIndex);
            if(_realContent.txtType.textWidth > maxTextWidth)
            {
               maxTextWidth = _realContent.txtType.textWidth;
            }
         }
         if(ViewManager.instance.user.character.repeatStoryDungeon)
         {
            _realContent.txtType.text = StoryDungeon.getName(ViewManager.instance.user.character.repeatStoryDungeon.storyDungeonIndex);
            if(_realContent.txtType.textWidth > maxTextWidth)
            {
               maxTextWidth = _realContent.txtType.textWidth;
            }
         }
         if(_currentData is DatingStep)
         {
            _realContent.txtType.text = DatingUtil.getName((_currentData as DatingStep).datingIndex);
            if(_realContent.txtType.textWidth > maxTextWidth)
            {
               maxTextWidth = _realContent.txtType.textWidth;
            }
         }
         var currentSpace:Number = _btnNextQuest.content.x - (_btnPreviousQuest.content.x + _btnPreviousQuest.content.width);
         var neededSpace:Number = maxTextWidth + 50;
         if(neededSpace > currentSpace)
         {
            _btnPreviousQuest.x = _btnPreviousQuest.x - Math.round((neededSpace - currentSpace) / 2);
            _btnNextQuest.x = _btnNextQuest.x + Math.round((neededSpace - currentSpace) / 2);
         }
         _questContent = new UiQuestBriefingContent(_realContent.questContent);
         _conventionContent = new UiConventionShowBriefingContent(_realContent.conventionShowContent,_realContent.conventionBannerLeft,_realContent.conventionBannerRight);
         _storyDungeonContent = new UiStoryDungeonBriefingContent(_realContent.storyDungeonContent,setCurrentData,close);
         _datingContent = new UiDatingBriefingContent(_realContent.datingContent,setCurrentData,close);
         _realContent.txtUserStoryInfo.htmlText = LocText.current.text("screen/quest/user_story/user_generated_content_info");
         _realContent.txtUserStoryInfo.autoFontSize = true;
         _btnUserStoryInfo = new UiButton(_realContent.txtUserStoryInfo,"",onClickUserStoryInfo);
         _btnUserStoryInfo.interactionOverMode = "none";
         _btnUserStoryInfo.visible = false;
         setCurrentData();
         onInteractionSwipe.add(function(param1:InteractionEvent):void
         {
            if(param1.swipeDirection == SwipeDirection.RIGHT && _btnPreviousQuest.buttonEnabled && _btnPreviousQuest.visible)
            {
               onClickPreviousQuest(null);
            }
            else if(param1.swipeDirection == SwipeDirection.LEFT && _btnNextQuest.buttonEnabled && _btnNextQuest.visible)
            {
               onClickNextQuest(null);
            }
         });
         _userStoryTagTooltip = new UiTextTooltip(_realContent.iconUserStoryTag,"",requestTagTootip);
      }
      
      public static function get isOpen() : Boolean
      {
         return _isOpen;
      }
      
      private function requestTagTootip() : String
      {
         var _loc1_:UserStory = null;
         if(_currentData is Quest && (_currentData as Quest).isUserStoryQuest)
         {
            _loc1_ = UserStories.getUserStory(parseInt((_currentData as Quest).identifier));
         }
         if(!_loc1_)
         {
            return "";
         }
         return _loc1_.tagName + "\n\n" + _loc1_.tagTooltip;
      }
      
      private function setCurrentData() : void
      {
         var _loc1_:* = null;
         _btnStartQuest.visible = true;
         _btnStartQuestPremium.visible = false;
         _btnStartQuest.x = 0;
         _btnStartQuestPremium.x = 0;
         _btnStartQuestPremium.premiumCaption = LocText.current.text("dialog/quest_briefing/button_start");
         _btnStartQuestPremium.tooltip = "";
         _btnReportUserStory.visible = false;
         _realContent.iconUserStoryTag.visible = false;
         _realContent.txtType.x = _initialTextTypeX;
         _realContent.dialogBackground.height = _initialHeight;
         _realContent.btnStartQuest.y = _initialButtonStartY;
         _realContent.btnStartQuestPremium.y = _initialButtonStartPremiumY;
         _btnUserStoryInfo.visible = false;
         if(_currentData is Quest)
         {
            _realContent.txtType.text = (_currentData as Quest).title;
            _questContent.content.visible = true;
            _questContent.refresh(_currentData as Quest);
            _conventionContent.content.visible = false;
            _conventionContent.hideBanner();
            _storyDungeonContent.content.visible = false;
            _datingContent.content.visible = false;
            if((_currentData as Quest).isUserStoryQuest)
            {
               _loc1_ = UserStories.getUserStory(parseInt((_currentData as Quest).identifier));
               _btnReportUserStory.visible = _loc1_ != null && _loc1_.canBeReported();
               _btnUserStoryInfo.visible = true;
               _realContent.iconUserStoryTag.gotoAndStop(_loc1_.tag);
               _realContent.iconUserStoryTag.visible = true;
               _realContent.txtType.x = _realContent.txtType.x + _realContent.iconUserStoryTag.width / 2;
               _realContent.dialogBackground.height = _realContent.dialogBackground.height + 60;
               _realContent.btnStartQuest.y = _realContent.btnStartQuest.y + 60;
               _realContent.btnStartQuestPremium.y = _realContent.btnStartQuestPremium.y + 60;
               _realContent.iconUserStoryTag.x = _realContent.txtType.x + _realContent.txtType.width / 2 - _realContent.txtType.textWidth / 2 - _realContent.iconUserStoryTag.width / 2 - 5;
            }
         }
         else if(_currentData is Convention)
         {
            _realContent.txtType.text = LocText.current.text("screen/quest/button_convention_show_tooltip");
            _questContent.content.visible = false;
            _conventionContent.content.visible = true;
            _conventionContent.refresh(_currentData as Convention);
            _conventionContent.showBanner();
            _storyDungeonContent.content.visible = false;
            _datingContent.content.visible = false;
            _btnStartQuest.visible = true;
            _btnStartQuestPremium.visible = true;
            _btnStartQuestPremium.premiumAmount = CConstant.convention_show_multi_attend_premium_amount;
            _btnStartQuest.x = -120;
            _btnStartQuestPremium.x = 120;
            _btnStartQuestPremium.premiumCaption = LocText.current.text("dialog/quest_briefing/button_start_convention_multi_attend",CConstant.convention_show_multi_attend_iterations);
            _btnStartQuestPremium.tooltip = LocText.current.text("dialog/quest_briefing/button_start_convention_multi_attend_tooltip",CConstant.convention_show_multi_attend_iterations);
         }
         else if(_currentData is StoryDungeon)
         {
            _realContent.txtType.text = StoryDungeon.getName((_currentData as StoryDungeon).storyDungeonIndex);
            _questContent.content.visible = false;
            _conventionContent.content.visible = false;
            _storyDungeonContent.content.visible = true;
            _storyDungeonContent.refresh(_currentData as StoryDungeon);
            _datingContent.content.visible = false;
            if((_currentData as StoryDungeon).allPointsCollected())
            {
               _btnStartQuest.visible = (_currentData as StoryDungeon).hasFreeAttack;
               _btnStartQuestPremium.visible = !_btnStartQuest.visible;
               _btnStartQuestPremium.premiumAmount = CConstant.story_dungeon_attack_premium_currency;
               _btnStartQuest.x = -120;
               _btnStartQuestPremium.x = -120;
            }
            else
            {
               _btnStartQuest.visible = false;
               _btnStartQuestPremium.visible = false;
            }
         }
         else if(_currentData is DatingStep)
         {
            _realContent.txtType.text = DatingUtil.getName((_currentData as DatingStep).datingIndex);
            _questContent.content.visible = false;
            _conventionContent.content.visible = false;
            _storyDungeonContent.content.visible = false;
            _datingContent.content.visible = true;
            _datingContent.refresh(_currentData as DatingStep);
            if((_currentData as DatingStep).allPointsCollected() && (_currentData as DatingStep).isLastStep)
            {
               _btnStartQuest.visible = (_currentData as DatingStep).hasFreeAttack;
               _btnStartQuestPremium.visible = !_btnStartQuest.visible;
               _btnStartQuestPremium.premiumAmount = CConstant.dating_attack_premium_currency;
               _btnStartQuest.x = -120;
               _btnStartQuestPremium.x = -120;
            }
            else
            {
               _btnStartQuest.visible = false;
               _btnStartQuestPremium.visible = false;
            }
         }
         if(PanelQuests.quest1 == null && PanelQuests.quest3 == null && PanelQuests.quest4 == null || _currentData is StoryDungeon && !(_currentData as StoryDungeon).allPointsCollected() || _currentData is DatingStep && (!(_currentData as DatingStep).allPointsCollected() || !(_currentData as DatingStep).isLastStep))
         {
            _btnPreviousQuest.visible = false;
            _btnNextQuest.visible = false;
         }
         else
         {
            _btnPreviousQuest.visible = true;
            _btnNextQuest.visible = true;
         }
      }
      
      public function refreshConventionFans() : void
      {
         if(!_conventionContent.content.visible)
         {
            return;
         }
         _conventionContent.refreshHitpoints();
      }
      
      override public function dispose() : void
      {
         _btnClose.dispose();
         _btnClose = null;
         _btnStartQuest.dispose();
         _btnStartQuest = null;
         _btnStartQuestPremium.dispose();
         _btnStartQuestPremium = null;
         _btnPreviousQuest.dispose();
         _btnPreviousQuest = null;
         _btnNextQuest.dispose();
         _btnNextQuest = null;
         _questContent.dispose();
         _questContent = null;
         _conventionContent.dispose();
         _conventionContent = null;
         _storyDungeonContent.dispose();
         _storyDungeonContent = null;
         _datingContent.dispose();
         _datingContent = null;
         _btnReportUserStory.dispose();
         _btnReportUserStory = null;
         _currentData = null;
         super.dispose();
      }
      
      private function onClickStartQuest(param1:InteractionEvent) : void
      {
         var _loc4_:* = null;
         var _loc2_:* = null;
         var _loc5_:int = 0;
         var _loc6_:* = null;
         var _loc3_:* = null;
         if(_currentData is Quest)
         {
            _loc4_ = _currentData as Quest;
            Environment.application.sendActionRequest("startQuest",{"quest_id":_loc4_.id},handleRequests);
         }
         else if(_currentData is Convention)
         {
            _loc2_ = _currentData as Convention;
            _loc5_ = 1;
            if(param1 && param1.target == _btnStartQuestPremium)
            {
               _loc5_ = CConstant.convention_show_multi_attend_iterations;
            }
            Environment.application.sendActionRequest("startConventionShow",{
               "convention_id":_loc2_.id,
               "iterations":_loc5_
            },handleRequests);
         }
         else if(_currentData is StoryDungeon)
         {
            _loc6_ = _currentData as StoryDungeon;
            Environment.application.sendActionRequest("startStoryDungeonBattle",{
               "finish_cooldown":_btnStartQuestPremium.visible,
               "story_dungeon_index":_loc6_.storyDungeonIndex
            },handleRequests);
         }
         else if(_currentData is DatingStep)
         {
            _loc3_ = _currentData as DatingStep;
            Environment.application.sendActionRequest("startDatingBattle",{
               "dating_index":_loc3_.datingIndex,
               "step_index":_loc3_.stepIndex,
               "finish_cooldown":_btnStartQuestPremium.visible
            },handleRequests);
         }
      }
      
      private function onClickPreviousQuest(param1:InteractionEvent) : void
      {
         if(PanelQuests.quest2 == _currentData)
         {
            _currentData = PanelQuests.quest1;
         }
         else if(PanelQuests.quest3 == _currentData)
         {
            _currentData = PanelQuests.quest2;
         }
         else if(PanelQuests.quest4 == _currentData)
         {
            _currentData = PanelQuests.quest3;
         }
         else if(PanelQuests.quest1 == _currentData)
         {
            if(PanelQuests.convention != null && User.current.character.fansTotal > 0)
            {
               _currentData = PanelQuests.convention;
            }
            else if(PanelQuests.storyDungeon != null && PanelQuests.storyDungeon.allPointsCollected())
            {
               _currentData = PanelQuests.storyDungeon;
            }
            else if(PanelQuests.datingStep != null && PanelQuests.datingStep.allPointsCollected() && PanelQuests.datingStep.isLastStep)
            {
               _currentData = PanelQuests.datingStep;
            }
            else
            {
               _currentData = PanelQuests.quest4 != null?PanelQuests.quest4:PanelQuests.quest3;
            }
         }
         else if(PanelQuests.convention == _currentData)
         {
            if(PanelQuests.storyDungeon != null && PanelQuests.storyDungeon.allPointsCollected())
            {
               _currentData = PanelQuests.storyDungeon;
            }
            else if(PanelQuests.datingStep != null && PanelQuests.datingStep.allPointsCollected() && PanelQuests.datingStep.isLastStep)
            {
               _currentData = PanelQuests.datingStep;
            }
            else
            {
               _currentData = PanelQuests.quest4 != null?PanelQuests.quest4:PanelQuests.quest3;
            }
         }
         else if(PanelQuests.storyDungeon == _currentData)
         {
            if(PanelQuests.datingStep != null && PanelQuests.datingStep.allPointsCollected() && PanelQuests.datingStep.isLastStep)
            {
               _currentData = PanelQuests.datingStep;
            }
            else
            {
               _currentData = PanelQuests.quest4 != null?PanelQuests.quest4:PanelQuests.quest3;
            }
         }
         else if(PanelQuests.datingStep == _currentData)
         {
            _currentData = PanelQuests.quest4 != null?PanelQuests.quest4:PanelQuests.quest3;
         }
         setCurrentData();
      }
      
      private function onClickNextQuest(param1:InteractionEvent) : void
      {
         if(PanelQuests.quest1 == _currentData)
         {
            _currentData = PanelQuests.quest2;
         }
         else if(PanelQuests.quest2 == _currentData)
         {
            _currentData = PanelQuests.quest3;
         }
         else if(PanelQuests.quest3 == _currentData)
         {
            if(PanelQuests.quest4 != null)
            {
               _currentData = PanelQuests.quest4;
            }
            else if(PanelQuests.convention != null && User.current.character.fansTotal > 0)
            {
               _currentData = PanelQuests.convention;
            }
            else if(PanelQuests.storyDungeon != null && PanelQuests.storyDungeon.allPointsCollected())
            {
               _currentData = PanelQuests.storyDungeon;
            }
            else if(PanelQuests.datingStep != null && PanelQuests.datingStep.allPointsCollected() && PanelQuests.datingStep.isLastStep)
            {
               _currentData = PanelQuests.datingStep;
            }
            else
            {
               _currentData = PanelQuests.quest1;
            }
         }
         else if(PanelQuests.quest4 == _currentData)
         {
            if(PanelQuests.convention != null && User.current.character.fansTotal > 0)
            {
               _currentData = PanelQuests.convention;
            }
            else if(PanelQuests.storyDungeon != null && PanelQuests.storyDungeon.allPointsCollected())
            {
               _currentData = PanelQuests.storyDungeon;
            }
            else if(PanelQuests.datingStep != null && PanelQuests.datingStep.allPointsCollected() && PanelQuests.datingStep.isLastStep)
            {
               _currentData = PanelQuests.datingStep;
            }
            else
            {
               _currentData = PanelQuests.quest1;
            }
         }
         else if(PanelQuests.convention == _currentData)
         {
            if(PanelQuests.storyDungeon != null && PanelQuests.storyDungeon.allPointsCollected())
            {
               _currentData = PanelQuests.storyDungeon;
            }
            else if(PanelQuests.datingStep != null && PanelQuests.datingStep.allPointsCollected() && PanelQuests.datingStep.isLastStep)
            {
               _currentData = PanelQuests.datingStep;
            }
            else
            {
               _currentData = PanelQuests.quest1;
            }
         }
         else if(PanelQuests.storyDungeon == _currentData)
         {
            if(PanelQuests.datingStep != null && PanelQuests.datingStep.allPointsCollected() && PanelQuests.datingStep.isLastStep)
            {
               _currentData = PanelQuests.datingStep;
            }
            else
            {
               _currentData = PanelQuests.quest1;
            }
         }
         else if(PanelQuests.datingStep == _currentData)
         {
            _currentData = PanelQuests.quest1;
         }
         setCurrentData();
      }
      
      override public function close(param1:Function = null) : void
      {
         if(_currentData is Convention)
         {
            _conventionContent.hideBanner();
         }
         _isOpen = false;
         super.close(param1);
      }
      
      private function onClickClose(param1:InteractionEvent) : void
      {
         close(_callback);
      }
      
      private function onClickReportUserStory(param1:InteractionEvent) : void
      {
         var _loc2_:UserStory = null;
         if(_currentData is Quest && (_currentData as Quest).isUserStoryQuest)
         {
            _loc2_ = UserStories.getUserStory(parseInt((_currentData as Quest).identifier));
         }
         if(_loc2_)
         {
            Environment.panelManager.showDialog(new DialogReportUserStory(_loc2_,setCurrentData,true));
         }
      }
      
      private function onClickUserStoryInfo(param1:InteractionEvent) : void
      {
         Environment.panelManager.showDialog(new DialogUserStoryUnlock());
      }
      
      private function startQuest() : void
      {
         if(!_btnStartQuest)
         {
            return;
         }
         _btnStartQuest.visible = false;
         _btnStartQuestPremium.visible = false;
         _btnClose.visible = false;
         var start:Function = function():void
         {
            var _loc1_:* = null;
            if(_currentData is Quest)
            {
               _loc1_ = _currentData as Quest;
               Environment.application.sendActionRequest("startQuest",{"quest_id":_loc1_.id},handleRequests);
            }
         };
         Runtime.delayFunction(start,1);
      }
      
      private function handleRequests(param1:ActionRequestResponse) : void
      {
         var _loc2_:* = false;
         var _loc3_:* = null;
         var _loc4_:* = param1.action;
         switch(_loc4_)
         {
            case "startQuest":
               if(param1.error == "")
               {
                  Environment.application.updateData(param1.data);
                  ViewManager.instance.showPanel("quest_progress");
                  if(!User.current.character.hasTutorialFlag("first_mission"))
                  {
                     ViewManager.instance.tutorialArrow.showTutorial(LocText.current.text("tutorial/mission_instant_finish_arrow_text"),"left_front","up",550 + LayoutUtil.deviceAdjustedWidthCorrection / 2,440 + LayoutUtil.deviceAdjustedHeightCorrection / 2,2);
                  }
                  close(null);
               }
               else if(param1.error == "errRemoveQuestEnergyNotEnough")
               {
                  if(User.current.character.hasUsedAllQuestEnergy)
                  {
                     _loc2_ = false;
                     if(_currentData is Quest)
                     {
                        _loc2_ = (_currentData as Quest).energyCost <= User.current.character.currentEnergyStorage + User.current.character.questEnergy;
                     }
                     if(_loc2_)
                     {
                        Environment.panelManager.showDialog(new DialogOutOfEnergyUseStorage(startQuest));
                     }
                     else
                     {
                        Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/not_enough_energy/info_title"),LocText.current.text("dialog/not_enough_energy/info_text",User.current.character.questEnergy),LocText.current.text("general/button_ok"),null));
                     }
                  }
                  else
                  {
                     Environment.panelManager.showDialog(new DialogOutOfEnergy(startQuest,false));
                  }
               }
               else if(param1.error == "errStartQuestActiveDuelFound")
               {
                  Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/start_quest_active_duel/title"),LocText.current.text("dialog/start_quest_active_duel/text"),LocText.current.text("general/button_ok")));
               }
               else if(param1.error == "errStartQuestActiveConventionShowFound")
               {
                  Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/start_quest_active_convention_show/title"),LocText.current.text("dialog/start_quest_active_convention_show/text"),LocText.current.text("general/button_ok")));
               }
               else if(param1.error == "errStartQuestActiveStoryDungeonBattleFound")
               {
                  Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/start_quest_active_story_dungeon_battle/title"),LocText.current.text("dialog/start_quest_active_story_dungeon_battle/text"),LocText.current.text("general/button_ok")));
               }
               else if(param1.error != "errStartQuestActiveQuestFound")
               {
                  Environment.reportError(param1.error,param1.request);
               }
               break;
            case "startConventionShow":
               if(param1.error == "")
               {
                  Environment.application.updateData(param1.data);
                  ViewManager.instance.showPanel("quest_progress");
                  close(null);
               }
               else if(param1.error == "errStartConventionShowActiveDuelFound")
               {
                  Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/start_quest_active_duel/title"),LocText.current.text("dialog/start_quest_active_duel/text"),LocText.current.text("general/button_ok")));
               }
               else if(param1.error == "errStartConventionShowActiveQuestFound")
               {
                  Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/start_convention_show_active_quest/title"),LocText.current.text("dialog/start_convention_show_active_quest/text"),LocText.current.text("general/button_ok")));
               }
               else if(param1.error == "errStartConventionShowActiveStoryDungeonBattleFound")
               {
                  Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/start_convention_show_active_story_dungeon_battle/title"),LocText.current.text("dialog/start_convention_show_active_story_dungeon_battle/text"),LocText.current.text("general/button_ok")));
               }
               else if(param1.error != "errStartConventionShowActiveConventionShowFound")
               {
                  if(param1.error == "errStartConventionShowInvalidConvention")
                  {
                     close(null);
                     _loc3_ = _currentData as Convention;
                     Environment.application.sendActionRequest("finishConventionShow",{"convention_id":_loc3_.id},handleRequests);
                  }
                  else if(param1.error == "errRemovePremiumCurrencyNotEnough")
                  {
                     ViewManager.instance.showNotEnoughPremiumDialog(CConstant.convention_show_multi_attend_premium_amount);
                  }
                  else
                  {
                     Environment.reportError(param1.error,param1.request);
                  }
               }
               break;
            case "startStoryDungeonBattle":
               if(param1.error == "")
               {
                  Environment.application.updateData(param1.data);
                  close(null);
                  if(User.current.showStoryDungeonBattles)
                  {
                     PanelBattle.activeStoryDungeonBattle = User.current.character.activeStoryDungeonBattle;
                     ViewManager.instance.showPanel("battle");
                  }
                  else
                  {
                     PanelBattle.lastViewedMode = 6;
                     MessageRouter.dispatch(new Message("ViewMessage.notifyBattleFinished",null,this));
                  }
               }
               else if(param1.error == "errStartStoryDungeonBattleActiveDungeonQuestFound")
               {
                  Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/start_story_dungeon_active_dungeon_quest/title"),LocText.current.text("dialog/start_story_dungeon_active_dungeon_quest/text"),LocText.current.text("general/button_ok")));
               }
               else if(param1.error == "errStartStoryDungeonBattleActiveConventionShowFound")
               {
                  Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/start_story_dungeon_active_convention_show/title"),LocText.current.text("dialog/start_story_dungeon_active_convention_show/text"),LocText.current.text("general/button_ok")));
               }
               else if(param1.error == "errStartStoryDungeonBattleActiveQuestFound")
               {
                  Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/start_story_dungeon_active_quest/title"),LocText.current.text("dialog/start_story_dungeon_active_quest/text"),LocText.current.text("general/button_ok")));
               }
               else if(param1.error == "errStartStoryDungeonBattleActiveDuelFound")
               {
                  Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/start_story_dungeon_active_duel/title"),LocText.current.text("dialog/start_story_dungeon_active_duel/text"),LocText.current.text("general/button_ok")));
               }
               else if(param1.error == "errStartStoryDungeonBattleActiveStoryDungeonBattleFound")
               {
                  Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/start_story_dungeon_active_story_dungeon/title"),LocText.current.text("dialog/start_story_dungeon_active_story_dungeon/text"),LocText.current.text("general/button_ok")));
               }
               else if(param1.error == "errStartStoryDungeonBattleInvalidStoryDungeon")
               {
                  Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/start_story_dungeon_invalid_story_dungeon/title"),LocText.current.text("dialog/start_story_dungeon_invalid_story_dungeon/text"),LocText.current.text("general/button_ok")));
               }
               else if(param1.error == "errStartStoryDungeonBattleActiveCooldown")
               {
                  Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/start_story_dungeon_cooldown_active/title"),LocText.current.text("dialog/start_story_dungeon_cooldown_active/text"),LocText.current.text("general/button_ok")));
               }
               else if(param1.error == "errRemovePremiumCurrencyNotEnough")
               {
                  ViewManager.instance.showNotEnoughPremiumDialog(CConstant.story_dungeon_attack_premium_currency);
               }
               else
               {
                  Environment.reportError(param1.error,param1.request);
               }
               break;
            case "startDatingBattle":
               if(param1.error == "")
               {
                  Environment.application.updateData(param1.data);
                  close(null);
                  PanelStatQuest.movieMode = false;
                  PanelStatQuest.datingStep = _currentData as DatingStep;
                  if(User.current.showDatingStatAnimation)
                  {
                     ViewManager.instance.showPanel("stat_quest");
                  }
                  else
                  {
                     PanelStatQuest.lastViewedMode = 7;
                     MessageRouter.dispatch(new Message("ViewMessage.notifyStatQuestFinished",null,this));
                  }
               }
               else if(param1.error == "errStartDatingBattleActiveDungeonQuestFound")
               {
                  Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/start_dating_active_dungeon_quest/title"),LocText.current.text("dialog/start_dating_active_dungeon_quest/text"),LocText.current.text("general/button_ok")));
               }
               else if(param1.error == "errStartDatingBattleActiveConventionShowFound")
               {
                  Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/start_dating_active_convention_show/title"),LocText.current.text("dialog/start_dating_active_convention_show/text"),LocText.current.text("general/button_ok")));
               }
               else if(param1.error == "errStartDatingBattleActiveQuestFound")
               {
                  Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/start_dating_active_quest/title"),LocText.current.text("dialog/start_dating_active_quest/text"),LocText.current.text("general/button_ok")));
               }
               else if(param1.error == "errStartDatingBattleActiveDuelFound")
               {
                  Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/start_dating_active_duel/title"),LocText.current.text("dialog/start_dating_active_duel/text"),LocText.current.text("general/button_ok")));
               }
               else if(param1.error == "errStartDatingBattleActiveStoryDungeonBattleFound")
               {
                  Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/start_dating_active_story_dungeon/title"),LocText.current.text("dialog/start_dating_active_story_dungeon/text"),LocText.current.text("general/button_ok")));
               }
               else if(param1.error == "errStartDatingBattleInvalidDatingStep")
               {
                  Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/start_dating_invalid_dating_step/title"),LocText.current.text("dialog/start_dating_invalid_dating_step/text"),LocText.current.text("general/button_ok")));
               }
               else if(param1.error == "errStartDatingBattleActiveCooldown")
               {
                  Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/start_dating_cooldown_active/title"),LocText.current.text("dialog/start_dating_cooldown_active/text"),LocText.current.text("general/button_ok")));
               }
               else if(param1.error == "errAttackDatingBossInvalidStep")
               {
                  Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/start_dating_invalid_dating_step/title"),LocText.current.text("dialog/start_dating_invalid_dating_step/text"),LocText.current.text("general/button_ok")));
               }
               else if(param1.error == "errAttackDatingBossInvalidStatus")
               {
                  Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/start_dating_invalid_dating_step/title"),LocText.current.text("dialog/start_dating_invalid_dating_step/text"),LocText.current.text("general/button_ok")));
               }
               else if(param1.error == "errRemovePremiumCurrencyNotEnough")
               {
                  ViewManager.instance.showNotEnoughPremiumDialog(CConstant.dating_attack_premium_currency);
               }
               else
               {
                  Environment.reportError(param1.error,param1.request);
               }
               break;
            case "finishConventionShow":
               if(param1.error == "")
               {
                  Environment.application.updateData(param1.data);
                  _loc3_ = _currentData as Convention;
                  if(_loc3_.isFinished)
                  {
                     if(!DialogConventionInfo.hasBeenShown(_loc3_))
                     {
                        Environment.panelManager.showDialog(new DialogConventionInfo(_loc3_));
                     }
                  }
               }
               else
               {
                  Environment.reportError(param1.error,param1.request);
               }
               break;
            default:
               throw new Error("Unsupported request action \'" + param1.action + "\'!");
         }
      }
      
      override public function get defaultButton() : Button
      {
         if(_btnStartQuest && _btnStartQuest.visible)
         {
            return _btnStartQuest;
         }
         if(_btnStartQuestPremium && _btnStartQuestPremium.visible)
         {
            return _btnStartQuestPremium;
         }
         return null;
      }
      
      override public function onEscape() : void
      {
         close(_callback);
      }
   }
}
