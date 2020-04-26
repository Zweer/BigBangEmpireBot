package com.playata.application.ui.elements.story_dungeon
{
   import com.playata.application.data.story_dungeon.StoryDungeon;
   import com.playata.application.data.user.User;
   import com.playata.application.messaging.Message;
   import com.playata.application.messaging.MessageRouter;
   import com.playata.application.ui.ViewManager;
   import com.playata.application.ui.dialogs.DialogInstantFinish;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.application.ui.elements.generic.button.UiPremiumButton;
   import com.playata.application.ui.panels.PanelBattle;
   import com.playata.framework.application.Environment;
   import com.playata.framework.application.request.ActionRequestResponse;
   import com.playata.framework.core.timer.ITimer;
   import com.playata.framework.core.util.TimeUtil;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.elements.story_dungeon.SymbolStoryDungeonBriefingContentGeneric;
   
   public class UiStoryDungeonBriefingContent
   {
       
      
      private var _content:SymbolStoryDungeonBriefingContentGeneric = null;
      
      private var _storyDungeon:StoryDungeon = null;
      
      private var _reward:UiStoryDungeonReward = null;
      
      private var _boss:UiStoryDungeonBoss = null;
      
      private var _progressBar:UiStoryDungeonProgressBar;
      
      private var _refreshCallback:Function = null;
      
      private var _timer:ITimer;
      
      private var _btnInstantFinish:UiButton;
      
      private var _btnInstantFinishBattle:UiPremiumButton;
      
      private var _closeCallback:Function;
      
      public function UiStoryDungeonBriefingContent(param1:SymbolStoryDungeonBriefingContentGeneric, param2:Function, param3:Function)
      {
         super();
         _content = param1;
         _refreshCallback = param2;
         _closeCallback = param3;
         _reward = new UiStoryDungeonReward(_content.reward);
         _boss = new UiStoryDungeonBoss(_content.boss);
         _progressBar = new UiStoryDungeonProgressBar(_content.progressBar);
         _btnInstantFinish = new UiButton(_content.btnInstantFinish,"",onClickInstantFinish);
         _btnInstantFinishBattle = new UiPremiumButton(_content.btnInstantFinishBattle,0,"",LocText.current.text("dialog/story_dungeon_briefing/finish_battle"),"","",onClickInstantFinishBattle);
         _btnInstantFinishBattle.premium = true;
         _btnInstantFinishBattle.visible = false;
         _timer = Environment.createTimer("UiStoryDungeonBriefingContent::timer",1000,onTimerEvent);
      }
      
      private function onItemAction(param1:String) : Boolean
      {
         var _loc2_:* = param1;
         if("skipStoryDungeon" === _loc2_)
         {
            Environment.application.sendActionRequest("instantFinishStoryDungeon",{"story_dungeon_index":_storyDungeon.storyDungeonIndex},handleRequests);
            _btnInstantFinish.buttonEnabled = false;
            _btnInstantFinishBattle.buttonEnabled = false;
         }
         return true;
      }
      
      private function onClickInstantFinish(param1:InteractionEvent) : void
      {
         if(_storyDungeon)
         {
            Environment.panelManager.showDialog(new DialogInstantFinish(LocText.current.text("dialog/instant_finish_objective/title"),LocText.current.text("dialog/instant_finish_objective/text",_storyDungeon.instantFinishCost),LocText.current.text("dialog/instant_finish_objective/button_yes"),LocText.current.text("dialog/instant_finish_objective/button_no"),_storyDungeon.instantFinishCost,instantFinish));
         }
      }
      
      private function instantFinish() : void
      {
         if(_storyDungeon)
         {
            Environment.application.sendActionRequest("instantFinishStoryDungeon",{"story_dungeon_index":_storyDungeon.storyDungeonIndex},handleRequests);
            _btnInstantFinish.buttonEnabled = false;
            _btnInstantFinishBattle.buttonEnabled = false;
         }
      }
      
      private function onClickInstantFinishBattle(param1:InteractionEvent) : void
      {
         if(_storyDungeon)
         {
            Environment.application.sendActionRequest("instantFinishStoryDungeonBattle",{"story_dungeon_index":_storyDungeon.storyDungeonIndex},handleRequests);
            _btnInstantFinish.buttonEnabled = false;
            _btnInstantFinishBattle.buttonEnabled = false;
         }
      }
      
      public function dispose() : void
      {
         _content = null;
         _storyDungeon = null;
         _btnInstantFinish.dispose();
         _btnInstantFinish = null;
         _btnInstantFinishBattle.dispose();
         _btnInstantFinishBattle = null;
         _reward.dispose();
         _reward = null;
         _boss.dispose();
         _boss = null;
         _timer.dispose();
         _timer = null;
      }
      
      public function get content() : SymbolStoryDungeonBriefingContentGeneric
      {
         return _content;
      }
      
      public function refresh(param1:StoryDungeon) : void
      {
         _storyDungeon = param1;
         if(_storyDungeon == null)
         {
            return;
         }
         _reward.refresh(_storyDungeon.storyDungeonIndex,_storyDungeon.repeat);
         _boss.refresh(_storyDungeon.storyDungeonIndex,_storyDungeon.repeat);
         _timer.stop();
         _content.txtCooldown.visible = false;
         _btnInstantFinish.visible = false;
         _btnInstantFinishBattle.visible = false;
         if(_storyDungeon.allPointsCollected())
         {
            _content.txtProgressCaption.visible = false;
            _content.txtProgress.visible = false;
            _content.progressBar.visible = false;
            _content.txtDescription.text = StoryDungeon.getTaskCompleteBriefingText(_storyDungeon.storyDungeonIndex);
            if(!_storyDungeon.hasFreeAttack)
            {
               _timer.start();
               onTimerEvent();
            }
            _btnInstantFinishBattle.premiumAmount = _storyDungeon.instantFinishCost;
            _btnInstantFinishBattle.visible = true;
         }
         else
         {
            _btnInstantFinish.visible = true;
            _content.txtProgressCaption.visible = true;
            _content.txtProgress.visible = true;
            _content.progressBar.visible = true;
            _progressBar.value = _storyDungeon.progress;
            _content.txtProgress.text = _storyDungeon.progressText;
            _content.txtProgressCaption.text = LocText.current.text("dialog/story_dungeon_briefing/progress_caption");
            _content.txtDescription.text = StoryDungeon.getBriefingText(_storyDungeon.storyDungeonIndex);
            _btnInstantFinish.tooltip = LocText.current.text("dialog/story_dungeon_briefing/instant_finish_tooltip",_storyDungeon.instantFinishCost);
         }
         _content.txtDescription.autoFontSize = true;
      }
      
      private function onTimerEvent() : void
      {
         if(!User.current)
         {
            if(_timer)
            {
               _timer.stop();
            }
            return;
         }
         if(_storyDungeon == null)
         {
            return;
         }
         if(!_storyDungeon.hasFreeAttack)
         {
            _content.txtCooldown.visible = true;
            _content.txtCooldown.text = LocText.current.text("dialog/story_dungeon_briefing/cooldown",TimeUtil.secondsToString(_storyDungeon.secondsUntilFreeAttack));
         }
         else
         {
            _content.txtCooldown.visible = false;
            _timer.stop();
            _refreshCallback();
         }
      }
      
      private function handleRequests(param1:ActionRequestResponse) : void
      {
         var _loc2_:* = param1.action;
         switch(_loc2_)
         {
            case "instantFinishStoryDungeon":
               if(param1.error == "")
               {
                  _btnInstantFinish.buttonEnabled = true;
                  _btnInstantFinishBattle.buttonEnabled = true;
                  Environment.application.updateData(param1.data);
                  _refreshCallback();
               }
               else if(param1.error == "errRemovePremiumCurrencyNotEnough")
               {
                  ViewManager.instance.showNotEnoughPremiumDialog(_storyDungeon.instantFinishCost);
               }
               else if(param1.error != "errStartQuestActiveQuestFound")
               {
                  Environment.reportError(param1.error,param1.request);
               }
               break;
            case "instantFinishStoryDungeonBattle":
               if(param1.error == "")
               {
                  _btnInstantFinish.buttonEnabled = true;
                  _btnInstantFinishBattle.buttonEnabled = true;
                  Environment.application.updateData(param1.data);
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
                  _closeCallback();
               }
               else if(param1.error == "errRemovePremiumCurrencyNotEnough")
               {
                  ViewManager.instance.showNotEnoughPremiumDialog(_storyDungeon.instantFinishCost);
               }
               else if(param1.error != "errStartQuestActiveQuestFound")
               {
                  Environment.reportError(param1.error,param1.request);
               }
               break;
            default:
               throw new Error("Unsupported request action \'" + param1.action + "\'!");
         }
      }
   }
}
