package com.playata.application.ui.dialogs
{
   import com.playata.application.data.constants.CConstant;
   import com.playata.application.data.dungeon.DungeonQuest;
   import com.playata.application.data.user.User;
   import com.playata.application.messaging.Message;
   import com.playata.application.messaging.MessageRouter;
   import com.playata.application.ui.ViewManager;
   import com.playata.application.ui.elements.advertisement.UiVideoAdvertismentButton;
   import com.playata.application.ui.elements.dungeon.UiDungeonQuestBriefingContent;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.application.ui.elements.generic.button.UiPremiumButton;
   import com.playata.application.ui.elements.generic.dialog.UiDialog;
   import com.playata.application.ui.elements.generic.dialog.UiInfoDialog;
   import com.playata.application.ui.elements.resource.UiUseResourceButton;
   import com.playata.application.ui.panels.PanelBattle;
   import com.playata.application.ui.panels.PanelStatQuest;
   import com.playata.framework.application.Environment;
   import com.playata.framework.application.request.ActionRequestResponse;
   import com.playata.framework.core.Runtime;
   import com.playata.framework.core.timer.ITimer;
   import com.playata.framework.core.util.TimeUtil;
   import com.playata.framework.display.ui.controls.Button;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.dialogs.SymbolDialogDungeonQuestBriefingGeneric;
   
   public class DialogDungeonQuestBriefing extends UiDialog
   {
      
      private static var _isOpen:Boolean;
       
      
      private var _dungeonQuest:DungeonQuest = null;
      
      private var _timer:ITimer = null;
      
      private var _btnClose:UiButton = null;
      
      private var _btnAttack:UiPremiumButton = null;
      
      private var _btnVideoAdvertisment:UiVideoAdvertismentButton = null;
      
      private var _btnUseResource:UiUseResourceButton = null;
      
      private var _dungeonQuestContent:UiDungeonQuestBriefingContent = null;
      
      private var _premiumAmount:int;
      
      public function DialogDungeonQuestBriefing(param1:DungeonQuest)
      {
         _isOpen = true;
         _dungeonQuest = param1;
         var _loc2_:SymbolDialogDungeonQuestBriefingGeneric = new SymbolDialogDungeonQuestBriefingGeneric();
         super(_loc2_);
         _queued = false;
         _btnClose = new UiButton(_loc2_.btnClose,"",onClickClose);
         _premiumAmount = !!User.current.character.lastDungeonQuestLost?CConstant.dungeon_quest_cooldown_lost_premium_amount:int(CConstant.dungeon_quest_cooldown_win_premium_amount);
         _btnAttack = new UiPremiumButton(_loc2_.btnStartDungeonQuest,_premiumAmount,LocText.current.text("dialog/dungeon_quest_briefing/button_attack"),LocText.current.text("dialog/dungeon_quest_briefing/button_attack"),LocText.current.text("dialog/dungeon_quest_briefing/button_attack_no_cooldown_tooltip"),"",onClickStartDungeonQuest);
         if(param1.isFightQuest)
         {
            _loc2_.txtDialogTitle.text = LocText.current.text("dialog/dungeon_quest_briefing/title_fight");
         }
         else
         {
            _loc2_.txtDialogTitle.text = LocText.current.text("dialog/dungeon_quest_briefing/title_stat");
         }
         _btnVideoAdvertisment = new UiVideoAdvertismentButton(_loc2_.btnShowVideoAdvertisment);
         _loc2_.addChild(_btnVideoAdvertisment);
         _btnUseResource = new UiUseResourceButton(_loc2_.btnUseResource,1,true,"dungeon_quest");
         _btnUseResource.visible = false;
         _dungeonQuestContent = new UiDungeonQuestBriefingContent(_loc2_.dungeonQuestContent);
         _dungeonQuestContent.refresh(_dungeonQuest);
         _timer = Environment.createTimer("DialogDungeonQuestBriefing::timer",1000,onTimerEvent);
         _timer.start();
         onTimerEvent();
         _btnVideoAdvertisment.refresh(LocText.current.text("dialog/dungeon_quest_briefing/button_video_advertisment_tooltip",CConstant.video_advertisment_bonus_dungeon_cooldown * 100),4,!!User.current.character.hasDungeonQuestCooldown?_dungeonQuest.id:0);
         _btnVideoAdvertisment.tweenFrom(0.5,{
            "alpha":0,
            "delay":1
         });
         _btnUseResource.tweenFrom(0.5,{
            "alpha":0,
            "delay":1
         });
         MessageRouter.addListener("ViewMessage.notifyVideoAdvertismentFinished",handleMessages);
      }
      
      public static function get isOpen() : Boolean
      {
         return _isOpen;
      }
      
      override public function dispose() : void
      {
         MessageRouter.removeAllListeners(handleMessages);
         _vo.removeChild(_btnVideoAdvertisment);
         _btnClose.dispose();
         _btnClose = null;
         _btnAttack.dispose();
         _btnAttack = null;
         _dungeonQuestContent.dispose();
         _dungeonQuestContent = null;
         _btnVideoAdvertisment.dispose();
         _btnVideoAdvertisment = null;
         _btnUseResource.dispose();
         _btnUseResource = null;
         _timer.dispose();
         _timer = null;
         super.dispose();
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
         _btnAttack.premium = User.current.character.hasDungeonQuestCooldown;
         _btnUseResource.visible = _btnAttack.premium && User.current.character.hasTutorialFlag("tutorial_finished") && platform.isResourceRequestAllowed;
         _btnUseResource.refresh();
         var _loc1_:SymbolDialogDungeonQuestBriefingGeneric = _vo as SymbolDialogDungeonQuestBriefingGeneric;
         _loc1_.txtCooldown.visible = _btnAttack.premium;
         if(User.current.character.lastDungeonQuestLost)
         {
            _loc1_.txtCooldown.text = LocText.current.text("dialog/dungeon_quest_briefing/cooldown_lost_time",TimeUtil.secondsToString(User.current.character.secondsToNextDungeonQuest));
         }
         else
         {
            _loc1_.txtCooldown.text = LocText.current.text("dialog/dungeon_quest_briefing/cooldown_win_time",TimeUtil.secondsToString(User.current.character.secondsToNextDungeonQuest));
         }
         if(_btnAttack.premium && User.current.character.lastDungeonQuestLost)
         {
            _btnAttack.premiumTooltip = LocText.current.text("dialog/dungeon_quest_briefing/button_attack_cooldown_lost_tooltip",TimeUtil.secondsToString(User.current.character.secondsToNextDungeonQuest));
         }
         if(_btnAttack.premium && !User.current.character.lastDungeonQuestLost)
         {
            _btnAttack.premiumTooltip = LocText.current.text("dialog/dungeon_quest_briefing/button_attack_cooldown_win_tooltip",TimeUtil.secondsToString(User.current.character.secondsToNextDungeonQuest));
         }
      }
      
      private function onClickStartDungeonQuest(param1:InteractionEvent) : void
      {
         if(!_dungeonQuest)
         {
            return;
         }
         if(_btnAttack.premium)
         {
            Environment.application.sendActionRequest("startDungeonQuest",{
               "dungeon_quest_id":_dungeonQuest.id,
               "finish_cooldown":true
            },handleRequests);
         }
         else
         {
            Environment.application.sendActionRequest("startDungeonQuest",{
               "dungeon_quest_id":_dungeonQuest.id,
               "finish_cooldown":false
            },handleRequests);
         }
      }
      
      private function onClickClose(param1:InteractionEvent) : void
      {
         close();
      }
      
      override public function close(param1:Function = null) : void
      {
         if(!_isOpen)
         {
            return;
         }
         _isOpen = false;
         super.close(param1);
         _btnVideoAdvertisment.visible = false;
         _btnUseResource.visible = false;
      }
      
      private function handleRequests(param1:ActionRequestResponse) : void
      {
         response = param1;
         var _loc3_:* = response.action;
         if("startDungeonQuest" !== _loc3_)
         {
            throw new Error("Unsupported request action \'" + response.action + "\'!");
         }
         if(response.error == "")
         {
            Environment.application.updateData(response.data);
            close();
            if(User.current.character.currentDungeon.isOpen)
            {
               if(User.current.character.activeDungeonQuest.isFightQuest)
               {
                  if(User.current.showDungeonBattles)
                  {
                     PanelBattle.activeDungeonQuest = User.current.character.activeDungeonQuest;
                     ViewManager.instance.showPanel("battle");
                  }
                  else
                  {
                     PanelBattle.lastViewedMode = 3;
                     MessageRouter.dispatch(new Message("ViewMessage.notifyBattleFinished",null,this));
                  }
               }
               else
               {
                  PanelStatQuest.movieMode = false;
                  PanelStatQuest.datingStep = null;
                  ViewManager.instance.showPanel("stat_quest");
               }
            }
         }
         else if(response.error == "errStartDungeonQuestActiveCooldown")
         {
            var startCallback:Function = function():void
            {
               Environment.application.sendActionRequest("startDungeonQuest",{
                  "dungeon_quest_id":_dungeonQuest.id,
                  "finish_cooldown":false
               },handleRequests);
            };
            Runtime.delayFunction(startCallback,1);
         }
         else if(response.error == "errRemovePremiumCurrencyNotEnough")
         {
            ViewManager.instance.showNotEnoughPremiumDialog(_premiumAmount);
         }
         else if(response.error == "errStartDungeonQuestActiveDuelFound")
         {
            Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/start_dungeon_quest_active_duel/title"),LocText.current.text("dialog/start_dungeon_quest_active_duel/text"),LocText.current.text("general/button_ok")));
         }
         else if(response.error == "errStartDungeonQuestActiveWorkFound")
         {
            Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/start_dungeon_quest_active_work/title"),LocText.current.text("dialog/start_dungeon_quest_active_work/text"),LocText.current.text("general/button_ok")));
         }
         else if(response.error == "errStartDungeonQuestActiveQuestFound")
         {
            Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/start_dungeon_quest_active_quest/title"),LocText.current.text("dialog/start_dungeon_quest_active_quest/text"),LocText.current.text("general/button_ok")));
         }
         else if(response.error == "errStartDungeonQuestActiveStoryDungeonBattleFound")
         {
            Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/start_dungeon_quest_active_story_dungeon_battle/title"),LocText.current.text("dialog/start_dungeon_quest_active_story_dungeon_battle/text"),LocText.current.text("general/button_ok")));
         }
         else if(response.error == "errFinishDungeonTimeUpInvalidStatus")
         {
            close();
            ViewManager.instance.showPanel("citymap");
         }
         else if(response.error != "errStartDungeonQuestActiveDungeonQuestFound")
         {
            Environment.reportError(response.error,response.request);
         }
      }
      
      override public function get defaultButton() : Button
      {
         return _btnAttack;
      }
      
      override public function onEscape() : void
      {
         close();
      }
      
      public function get videoAdvertismentButton() : UiVideoAdvertismentButton
      {
         return _btnVideoAdvertisment;
      }
      
      private function handleMessages(param1:Message) : void
      {
         var _loc2_:* = param1.type;
         if("ViewMessage.notifyVideoAdvertismentFinished" !== _loc2_)
         {
            throw new Error("Encountered unknown message type! type=" + param1.type);
         }
         if(param1.data.type != 4)
         {
            return;
         }
         if(param1.data.reference_id != _dungeonQuest.id)
         {
            return;
         }
      }
   }
}
