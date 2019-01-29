package com.playata.application.ui.panels
{
   import com.playata.application.data.GameUtil;
   import com.playata.application.data.character.Character;
   import com.playata.application.data.constants.CConstant;
   import com.playata.application.data.dataobject.DOBattleOpponent;
   import com.playata.application.data.dataobject.DOMissedDuel;
   import com.playata.application.data.duel.DuelOpponent;
   import com.playata.application.data.duel.MissedDuel;
   import com.playata.application.data.user.User;
   import com.playata.application.messaging.Message;
   import com.playata.application.messaging.MessageRouter;
   import com.playata.application.ui.ViewManager;
   import com.playata.application.ui.dialogs.DialogDuelResults;
   import com.playata.application.ui.dialogs.DialogMissedDuels;
   import com.playata.application.ui.dialogs.DialogTutorialPopup;
   import com.playata.application.ui.elements.action_bar.ActionBarLayer;
   import com.playata.application.ui.elements.bonus.UiDailyBonus;
   import com.playata.application.ui.elements.duel.UiDuelEnemyLine;
   import com.playata.application.ui.elements.duel.UiDuelStaminaBar;
   import com.playata.application.ui.elements.duel.UiRefreshDuelEnemiesButton;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.application.ui.elements.generic.button.UiPremiumButton;
   import com.playata.application.ui.elements.generic.dialog.UiInfoDialog;
   import com.playata.application.ui.elements.generic.dialog.UiTwoChoiceDialog;
   import com.playata.application.ui.elements.generic.textfield.UiTextTooltip;
   import com.playata.application.ui.elements.hud.UiHint;
   import com.playata.application.ui.elements.hud.UiHonorPanel;
   import com.playata.framework.application.Environment;
   import com.playata.framework.application.request.ActionRequestResponse;
   import com.playata.framework.core.Runtime;
   import com.playata.framework.core.timer.ITimer;
   import com.playata.framework.core.util.TimeUtil;
   import com.playata.framework.display.AnchorPoint;
   import com.playata.framework.display.layout.LayoutUtil;
   import com.playata.framework.display.ui.controls.ILabel;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.panels.SymbolPanelDuelsGeneric;
   
   public class PanelDuels extends DefaultPanel
   {
      
      private static const DUEL_OPPONENTS_REFRESH_TIME:int = 60;
      
      private static var _lastDuelOpponentsRefresh:int = 0;
       
      
      private var _btnHelp:UiButton = null;
      
      private var _btnAttack:UiPremiumButton = null;
      
      private var _btnViewPlayer:UiButton = null;
      
      private var _btnRefreshDuelEnemies:UiRefreshDuelEnemiesButton = null;
      
      private var _btnRefillDuelStamina:UiButton = null;
      
      private var _btnDuelHistory:UiButton = null;
      
      private var _selectedOpponent:DuelOpponent = null;
      
      private var _missedDuels:Vector.<MissedDuel> = null;
      
      private var _tooltipDuelStamina:UiTextTooltip = null;
      
      private var _duelStaminaBar:UiDuelStaminaBar = null;
      
      private var _timer:ITimer = null;
      
      private var _duelStaminaRefillHint:UiHint = null;
      
      private var _enemyLine1:UiDuelEnemyLine = null;
      
      private var _enemyLine2:UiDuelEnemyLine = null;
      
      private var _enemyLine3:UiDuelEnemyLine = null;
      
      private var _enemyLine4:UiDuelEnemyLine = null;
      
      private var _enemyLine5:UiDuelEnemyLine = null;
      
      private var _enemyLine6:UiDuelEnemyLine = null;
      
      private var _enemyLine7:UiDuelEnemyLine = null;
      
      private var _enemyLine8:UiDuelEnemyLine = null;
      
      private var _enemyLine9:UiDuelEnemyLine = null;
      
      private var _honorPanel:UiHonorPanel = null;
      
      private var _dailyBonus:UiDailyBonus = null;
      
      public function PanelDuels(param1:SymbolPanelDuelsGeneric)
      {
         super(param1);
         param1.content.txtNameCaption.text = LocText.current.text("screen/duel/column_name");
         param1.content.txtHonorCaption.text = LocText.current.text("screen/duel/column_honor");
         _tooltipDuelStamina = new UiTextTooltip(param1.content.txtDuelStamina,"");
         _btnHelp = new UiButton(param1.btnHelp,LocText.current.text("general/button_help"),onClickHelp);
         _btnAttack = new UiPremiumButton(param1.content.btnAttack,CConstant.duel_single_attack_premium_amount,LocText.current.text("screen/duel/button_attack"),LocText.current.text("screen/duel/button_attack"),LocText.current.text("screen/duel/button_attack_tooltip"),LocText.current.text("screen/duel/button_attack_tooltip"),onClickAttack);
         _btnViewPlayer = new UiButton(param1.content.btnViewPlayer,LocText.current.text("screen/duel/button_show_player_tooltip"),onClickViewPlayer);
         _btnRefillDuelStamina = new UiButton(param1.content.btnRefillDuelStamina,"",onClickRefillDuelStamina);
         _btnDuelHistory = new UiButton(param1.btnDuelHistory,LocText.current.text("screen/duel_history/tooltip"),onClickDuelHistory);
         _btnRefreshDuelEnemies = new UiRefreshDuelEnemiesButton(param1.content.btnRefreshDuelEnemies,param1.content.duelEnemiesRefreshHint,onClickRefreshDuelEnemies);
         _duelStaminaBar = new UiDuelStaminaBar(param1.content.duelStaminaBar);
         param1.addChild(param1.content.duelEnemiesRefreshHint);
         _enemyLine1 = new UiDuelEnemyLine(param1.content.enemyLine1,param1.content.avatars.avatar1,handleClick,handleDoubleClick,1,0);
         _enemyLine2 = new UiDuelEnemyLine(param1.content.enemyLine2,param1.content.avatars.avatar2,handleClick,handleDoubleClick,2,1);
         _enemyLine3 = new UiDuelEnemyLine(param1.content.enemyLine3,param1.content.avatars.avatar3,handleClick,handleDoubleClick,3,0);
         _enemyLine4 = new UiDuelEnemyLine(param1.content.enemyLine4,param1.content.avatars.avatar4,handleClick,handleDoubleClick,4,0);
         _enemyLine5 = new UiDuelEnemyLine(param1.content.enemyLine5,param1.content.avatars.avatar5,handleClick,handleDoubleClick,5,1);
         _enemyLine6 = new UiDuelEnemyLine(param1.content.enemyLine6,param1.content.avatars.avatar6,handleClick,handleDoubleClick,6,0);
         _enemyLine7 = new UiDuelEnemyLine(param1.content.enemyLine7,param1.content.avatars.avatar7,handleClick,handleDoubleClick,7,1);
         _enemyLine8 = new UiDuelEnemyLine(param1.content.enemyLine8,param1.content.avatars.avatar8,handleClick,handleDoubleClick,8,0);
         _enemyLine9 = new UiDuelEnemyLine(param1.content.enemyLine9,param1.content.avatars.avatar9,handleClick,handleDoubleClick,9,1);
         hideList();
         _duelStaminaRefillHint = new UiHint(param1.content.duelStaminaRefillHint,_btnRefillDuelStamina,LocText.current.text("screen/duel/buy_duel_stamina"),CConstant.duel_stamina_reset_premium_amount.toString());
         if(Environment.info.isTouchScreen)
         {
            _duelStaminaRefillHint.content.x = _duelStaminaRefillHint.content.x + 55;
         }
         _honorPanel = new UiHonorPanel(param1.honorPanel);
         _dailyBonus = new UiDailyBonus(param1.content.dailyBonusDuel,2);
         _timer = Environment.createTimer("UiDuelsContent::timer",1000,onTimerEvent);
         MessageRouter.addListener("ViewMessage.notifyBattleFinished",handleMessages);
         MessageRouter.addListener("ViewMessage.notifyRefreshDuelOpponents",handleMessages);
         _anchorContainer.add(param1.content,AnchorPoint.TOP_RIGHT,0.5);
         _anchorContainer.add(param1.honorPanel,AnchorPoint.TOP_RIGHT);
         _anchorContainer.add(param1.btnDuelHistory,AnchorPoint.TOP_RIGHT);
         _anchorContainer.add(param1.content,AnchorPoint.BOTTOM_FIXED,0.5);
      }
      
      public static function resetLastDuelOpponentsRefresh() : void
      {
         _lastDuelOpponentsRefresh = 0;
      }
      
      public static function getDuelResultTooltipTop(param1:int, param2:int) : String
      {
         var _loc5_:int = GameUtil.duelHonorWinReward(User.current.character.honor,param2);
         var _loc3_:int = GameUtil.duelGameCurrencyWinReward(param1);
         var _loc4_:String = "";
         if(_loc5_ == 0)
         {
            _loc4_ = LocText.current.text("screen/duel/tooltip_win_no_honor",GameUtil.getGameCurrencyString(_loc3_));
         }
         else
         {
            _loc4_ = LocText.current.text("screen/duel/tooltip_win_honor",GameUtil.getHonorString(_loc5_),GameUtil.getGameCurrencyString(_loc3_));
         }
         return _loc4_;
      }
      
      public static function getDuelResultTooltipBottom(param1:int, param2:int) : String
      {
         var _loc4_:int = GameUtil.duelHonorLostReward(param1,User.current.character.honor);
         var _loc3_:String = "";
         if(_loc4_ == 0)
         {
            _loc3_ = _loc3_ + LocText.current.text("screen/duel/tooltip_lose_no_honor");
         }
         else
         {
            _loc3_ = _loc3_ + LocText.current.text("screen/duel/tooltip_lose_honor",GameUtil.getHonorString(_loc4_));
         }
         if(User.current.character.totalStats < param2)
         {
            _loc3_ = _loc3_ + "\n\n";
            _loc3_ = _loc3_ + LocText.current.text("screen/duel/tooltip_increased_reward_chance");
         }
         return _loc3_;
      }
      
      public static function getDuelResultTooltip(param1:int, param2:int, param3:int) : String
      {
         var _loc4_:String = "";
         _loc4_ = _loc4_ + getDuelResultTooltipTop(param1,param2);
         _loc4_ = _loc4_ + "\n\n";
         _loc4_ = _loc4_ + getDuelResultTooltipBottom(param2,param3);
         return _loc4_;
      }
      
      override public function refreshPanelLocalization() : void
      {
         var _loc1_:SymbolPanelDuelsGeneric = _vo as SymbolPanelDuelsGeneric;
         _loc1_.content.txtNameCaption.text = LocText.current.text("screen/duel/column_name");
         _loc1_.content.txtHonorCaption.text = LocText.current.text("screen/duel/column_honor");
         _btnHelp.tooltip = LocText.current.text("general/button_help");
         _btnAttack.nonPremiumCaption = LocText.current.text("screen/duel/button_attack");
         _btnAttack.premiumCaption = LocText.current.text("screen/duel/button_attack");
         _btnAttack.nonPremiumTooltip = LocText.current.text("screen/duel/button_attack_tooltip");
         _btnAttack.premiumTooltip = LocText.current.text("screen/duel/button_attack_tooltip");
         _btnViewPlayer.tooltip = LocText.current.text("screen/duel/button_show_player_tooltip");
         _btnRefreshDuelEnemies.refreshLocalization();
         _duelStaminaRefillHint.caption = LocText.current.text("screen/duel/buy_duel_stamina");
      }
      
      private function hideList() : void
      {
         _enemyLine1.visible = false;
         _enemyLine2.visible = false;
         _enemyLine3.visible = false;
         _enemyLine4.visible = false;
         _enemyLine5.visible = false;
         _enemyLine6.visible = false;
         _enemyLine7.visible = false;
         _enemyLine8.visible = false;
         _enemyLine9.visible = false;
      }
      
      override public function dispose() : void
      {
         super.dispose();
         var _loc1_:SymbolPanelDuelsGeneric = _vo as SymbolPanelDuelsGeneric;
         _btnHelp.dispose();
         _btnHelp = null;
         _btnAttack.dispose();
         _btnAttack = null;
         _btnViewPlayer.dispose();
         _btnViewPlayer = null;
         _btnRefillDuelStamina.dispose();
         _btnRefillDuelStamina = null;
         _btnDuelHistory.dispose();
         _btnDuelHistory = null;
         _btnRefreshDuelEnemies.dispose();
         _btnRefreshDuelEnemies = null;
         _enemyLine1.dispose();
         _enemyLine1 = null;
         _enemyLine2.dispose();
         _enemyLine2 = null;
         _enemyLine3.dispose();
         _enemyLine3 = null;
         _enemyLine4.dispose();
         _enemyLine4 = null;
         _enemyLine5.dispose();
         _enemyLine5 = null;
         _enemyLine6.dispose();
         _enemyLine6 = null;
         _enemyLine7.dispose();
         _enemyLine7 = null;
         _enemyLine8.dispose();
         _enemyLine8 = null;
         _enemyLine9.dispose();
         _enemyLine9 = null;
         _tooltipDuelStamina.dispose();
         _tooltipDuelStamina = null;
         _honorPanel.dispose();
         _honorPanel = null;
         _timer.dispose();
         _timer = null;
         _dailyBonus.dispose();
         _dailyBonus = null;
         MessageRouter.removeAllListeners(handleMessages);
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
         if(!_vo.visible)
         {
            return;
         }
         var _loc1_:SymbolPanelDuelsGeneric = _vo as SymbolPanelDuelsGeneric;
         if(!User.current.character.isFirstDuel)
         {
            _loc1_.content.txtTimeToDuelStaminaRefill.text = LocText.current.text("screen/duel/duel_stamina_refill_time",1,TimeUtil.secondsToString(User.current.character.secondsToNextDuelStaminaRefill));
         }
         else
         {
            _loc1_.content.txtTimeToDuelStaminaRefill.text = LocText.current.text("screen/duel/duel_stamina_refill_time_first_duel",TimeUtil.secondsToString(User.current.character.secondsToNextFreeDuel - 1));
         }
         _loc1_.content.txtTimeToDuelStaminaRefill.visible = !User.current.character.hasFullDuelStamina;
         _btnRefillDuelStamina.visible = !User.current.character.hasFullDuelStamina;
         _btnAttack.premium = !User.current.character.hasAvailableFreeDuel;
         if(!User.current.character.hasAvailableFreeDuel)
         {
            _tooltipDuelStamina.text = LocText.current.text("screen/duel/duel_stamina_not_available_tooltip",User.current.character.duelStaminaCost,TimeUtil.secondsToString(User.current.character.secondsToNextFreeDuel));
         }
         else
         {
            _tooltipDuelStamina.text = LocText.current.text("screen/duel/duel_stamina_available_tooltip",User.current.character.duelStaminaCost,User.current.character.availableFreeDuelCount);
         }
         if(User.current.character.duelStamina > _duelStaminaBar.value)
         {
            _duelStaminaBar.setValue(User.current.character.duelStamina);
         }
         _loc1_.content.txtDuelStamina.text = User.current.character.duelStamina.toString();
         if(User.current.character.hasAvailableFreeDuel)
         {
            _btnAttack.tooltip = LocText.current.text("screen/duel/button_attack_tooltip");
         }
         else
         {
            _btnAttack.tooltip = LocText.current.text("screen/duel/button_single_attack_tooltip",TimeUtil.secondsToString(User.current.character.secondsToNextFreeDuel));
         }
         _btnRefreshDuelEnemies.refresh();
      }
      
      override public function reset() : void
      {
         if(_timer)
         {
            _timer.stop();
         }
         _lastDuelOpponentsRefresh = 0;
         _selectedOpponent = null;
         _missedDuels = null;
      }
      
      private function onClickViewPlayer(param1:InteractionEvent) : void
      {
         if(!_selectedOpponent)
         {
            return;
         }
         ViewManager.instance.loadCharacter(_selectedOpponent.id,null);
      }
      
      private function onClickRefreshDuelEnemies(param1:InteractionEvent) : void
      {
         interactionEvent = param1;
         if(Environment.info.isTouchScreen && !User.current.character.hasFreeDuelEnemiesRefresh)
         {
            _btnRefreshDuelEnemies.hint.show();
            ActionBarLayer.instance.open(_btnRefreshDuelEnemies,6,onAction,null,-41,-45,null,function():void
            {
               _btnRefreshDuelEnemies.hint.hide();
            });
         }
         else
         {
            Environment.application.sendActionRequest("getDuelOpponents",{"user_refresh":true},handleRequests);
         }
      }
      
      private function onClickRefillDuelStamina(param1:InteractionEvent) : void
      {
         interactionEvent = param1;
         if(Environment.info.isTouchScreen)
         {
            _duelStaminaRefillHint.show();
            ActionBarLayer.instance.open(_btnRefillDuelStamina,7,onAction,null,-55,-55,null,function():void
            {
               _duelStaminaRefillHint.hide();
            });
         }
         else
         {
            Environment.application.sendActionRequest("buyDuelStamina",{"confirm_refill":false},handleRequests);
         }
      }
      
      private function onAction(param1:String) : Boolean
      {
         if(param1 == "refreshDuelOpponents")
         {
            Environment.application.sendActionRequest("getDuelOpponents",{"user_refresh":true},handleRequests);
         }
         else if(param1 == "refillDuelStamina")
         {
            Environment.application.sendActionRequest("buyDuelStamina",{"confirm_refill":false},handleRequests);
         }
         _btnRefreshDuelEnemies.hint.hide();
         _duelStaminaRefillHint.hide();
         return true;
      }
      
      private function onClickDuelHistory(param1:InteractionEvent) : void
      {
         Environment.application.sendActionRequest("getMissedDuelsNew",{"history":true},handleRequests);
      }
      
      private function handleClick(param1:UiDuelEnemyLine) : void
      {
         Environment.audio.playFX("ui_button_click.mp3");
         selectEnemyLine(param1);
      }
      
      private function handleDoubleClick(param1:UiDuelEnemyLine) : void
      {
         Environment.audio.playFX("ui_button_click.mp3");
         selectEnemyLine(param1);
         onClickViewPlayer(null);
      }
      
      override public function show(param1:* = null) : void
      {
         _duelStaminaBar.value = User.current.character.duelStamina;
         onTimerEvent();
         _btnRefreshDuelEnemies.refresh();
         super.show(param1);
         ViewManager.instance.setBackground(2);
         ViewManager.instance.fadeInPanel(_vo);
         if(_lastDuelOpponentsRefresh < TimeUtil.now - 60)
         {
            hideList();
            Environment.application.sendActionRequest("getDuelOpponents",{},handleRequests);
            _lastDuelOpponentsRefresh = TimeUtil.now;
         }
         else if(User.current.autoShowMissedDuels && User.current.character.missedDuels > 0)
         {
            Environment.application.sendActionRequest("getMissedDuelsNew",{"history":false},handleRequests);
         }
         var _loc2_:* = User.current.character.hasTutorialFlag("first_duel");
         _btnRefreshDuelEnemies.visible = _loc2_;
         _btnViewPlayer.visible = _loc2_;
         if(!User.current.character.hasTutorialFlag("first_duel"))
         {
            ViewManager.instance.tutorialArrow.showTutorial(LocText.current.text("tutorial/duel_opponent_list_arrow_text"),"right_back","right",380 + LayoutUtil.deviceAdjustedWidthCorrection / 2,370 + LayoutUtil.deviceAdjustedHeightCorrection / 2);
         }
      }
      
      override public function hide() : void
      {
         super.hide();
      }
      
      private function onClickHelp(param1:InteractionEvent) : void
      {
         showTutorialDialog();
      }
      
      private function onClickAttack(param1:InteractionEvent) : void
      {
         ViewManager.instance.tutorialArrow.hide();
         startDuel();
      }
      
      private function startDuel() : void
      {
         if(!_selectedOpponent)
         {
            return;
         }
         Environment.application.sendActionRequest("startDuel",{
            "character_id":_selectedOpponent.id,
            "use_premium":_btnAttack.premium
         },handleRequests);
      }
      
      override public function refresh() : void
      {
         var _loc1_:Character = User.current.character;
         super.refresh();
         _btnAttack.visible = true;
         _btnViewPlayer.visible = _loc1_.hasTutorialFlag("first_duel");
         _btnRefreshDuelEnemies.visible = _btnViewPlayer.visible;
         _btnRefreshDuelEnemies.refresh();
         _honorPanel.refresh();
         if(!_loc1_.hasFullDuelStamina)
         {
            _timer.start();
         }
         else
         {
            _timer.stop();
         }
         onTimerEvent();
         var _loc2_:SymbolPanelDuelsGeneric = _vo as SymbolPanelDuelsGeneric;
         _loc2_.content.txtDuelStamina.text = _loc1_.duelStamina.toString();
         if(_loc1_.duelStamina > _duelStaminaBar.value)
         {
            _duelStaminaBar.setValue(_loc1_.duelStamina);
         }
         refreshHistoryButton();
         _dailyBonus.refresh();
      }
      
      public function refreshHistoryButton() : void
      {
         _btnDuelHistory.visible = User.current.character.hasTutorialFlag("tutorial_finished");
         if(!_btnDuelHistory.visible)
         {
            return;
         }
         var _loc2_:SymbolPanelDuelsGeneric = _vo as SymbolPanelDuelsGeneric;
         _loc2_.btnDuelHistory.counterMissedDuels.bringToTop();
         _loc2_.btnDuelHistory.counterMissedDuels.visible = User.current.character.missedDuels > 0;
         if(!_loc2_.btnDuelHistory.counterMissedDuels.visible)
         {
            return;
         }
         var _loc1_:ILabel = _loc2_.btnDuelHistory.counterMissedDuels.getChildByName("caption") as ILabel;
         _loc1_.text = LocText.current.formatHugeNumber(User.current.character.missedDuels);
      }
      
      private function refreshDuelOpponentsList() : void
      {
         var _loc1_:Boolean = false;
         _btnViewPlayer.buttonEnabled = _loc1_;
         _btnAttack.buttonEnabled = _loc1_;
         _selectedOpponent = null;
         _enemyLine1.refresh();
         _enemyLine2.refresh();
         _enemyLine3.refresh();
         _enemyLine4.refresh();
         _enemyLine5.refresh();
         _enemyLine6.refresh();
         _enemyLine7.refresh();
         _enemyLine8.refresh();
         _enemyLine9.refresh();
         selectEnemyLine(_enemyLine1);
      }
      
      private function selectEnemyLine(param1:UiDuelEnemyLine) : void
      {
         if(User.current.character.duelOpponents.length == 0)
         {
            return;
         }
         _enemyLine1.selected(param1 == _enemyLine1);
         _enemyLine2.selected(param1 == _enemyLine2);
         _enemyLine3.selected(param1 == _enemyLine3);
         _enemyLine4.selected(param1 == _enemyLine4);
         _enemyLine5.selected(param1 == _enemyLine5);
         _enemyLine6.selected(param1 == _enemyLine6);
         _enemyLine7.selected(param1 == _enemyLine7);
         _enemyLine8.selected(param1 == _enemyLine8);
         _enemyLine9.selected(param1 == _enemyLine9);
         _selectedOpponent = User.current.character.duelOpponents[param1.index - 1];
         if(_selectedOpponent)
         {
            var _loc2_:Boolean = true;
            _btnViewPlayer.buttonEnabled = _loc2_;
            _btnAttack.buttonEnabled = _loc2_;
         }
      }
      
      private function showTutorialDialog() : void
      {
         Environment.panelManager.showDialog(new DialogTutorialPopup(LocText.current.text("dialog/tutorial/duel/title"),LocText.current.text("dialog/tutorial/duel/text"),onTutorialDialogClosed));
      }
      
      private function onTutorialDialogClosed() : void
      {
         User.current.character.setTutorialFlag("duel");
      }
      
      private function handleMessages(param1:Message) : void
      {
         var _loc2_:* = param1.type;
         switch(_loc2_)
         {
            case "ViewMessage.notifyBattleFinished":
               if(PanelBattle.lastViewedMode != 2)
               {
                  return;
               }
               onBattleFinished();
               break;
            case "ViewMessage.notifyRefreshDuelOpponents":
               Environment.application.sendActionRequest("getDuelOpponents",{},handleRequests);
               _lastDuelOpponentsRefresh = TimeUtil.now;
               break;
            default:
               throw new Error("Encountered unknown message type! type=" + param1.type);
         }
      }
      
      private function onBattleFinished() : void
      {
         if(User.current.character.activeDuel && User.current.character.activeDuel.characterStatus == 1)
         {
            if(User.current.character.activeDuel.isWon)
            {
               Environment.audio.playFX("event_pvp_win.mp3");
            }
            else
            {
               Environment.audio.playFX("event_pvp_lose.mp3");
            }
            var completeCallback:Function = function():void
            {
               Environment.application.sendActionRequest("checkForDuelComplete",{},handleRequests);
            };
            Runtime.delayFunction(completeCallback,2);
         }
         else if(User.current.character.activeDuel && User.current.character.activeDuel.characterStatus == 2)
         {
            Environment.panelManager.showDialog(new DialogDuelResults(User.current.character.activeDuel));
         }
         else if(PanelBattle.missedDuel != null)
         {
            if(!PanelBattle.missedDuel.isWon)
            {
               Environment.audio.playFX("event_pvp_win.mp3");
            }
            else
            {
               Environment.audio.playFX("event_pvp_lose.mp3");
            }
            var showDuelPanelCallback:Function = function():void
            {
               ViewManager.instance.baseUserPanel.fadeInMainNavigationButtons();
               ViewManager.instance.showPanel("duels");
            };
            Runtime.delayFunction(showDuelPanelCallback,2);
         }
      }
      
      private function handleRequests(param1:ActionRequestResponse) : void
      {
         response = param1;
         var _loc4_:* = response.action;
         switch(_loc4_)
         {
            case "getMissedDuelsNew":
               if(response.error == "")
               {
                  _missedDuels = new Vector.<MissedDuel>();
                  if(response.appResponse.missed_duel_data != null)
                  {
                     var _loc6_:int = 0;
                     var _loc5_:* = response.appResponse.missed_duel_data;
                     for each(missedDuel in response.appResponse.missed_duel_data)
                     {
                        var missingDuel:MissedDuel = new MissedDuel(missedDuel);
                        _missedDuels.push(missingDuel);
                        _loc4_ = 0;
                        var _loc3_:* = response.appResponse.missed_duel_opponents;
                        for each(opponent in response.appResponse.missed_duel_opponents)
                        {
                           if(opponent.id == missedDuel.opponentId)
                           {
                              missingDuel.refreshOpponent(opponent);
                              break;
                           }
                        }
                     }
                  }
                  if(User.current.character.hasTutorialFlag("tutorial_finished"))
                  {
                     Environment.panelManager.showDialog(new DialogMissedDuels(_missedDuels,response.request.getData("history")));
                  }
                  Environment.application.updateData(response.data);
               }
               else
               {
                  Environment.reportError(response.error,response.request);
               }
               break;
            case "getDuelOpponents":
               if(response.error == "")
               {
                  Environment.application.updateData(response.data);
                  refreshDuelOpponentsList();
                  if(!User.current.character.hasTutorialFlag("duel_shown"))
                  {
                     User.current.character.setTutorialFlag("duel_shown");
                  }
                  if(User.current.autoShowMissedDuels)
                  {
                     if(response.appResponse.missed_duels > 0)
                     {
                        Environment.application.sendActionRequest("getMissedDuelsNew",{"history":false},handleRequests);
                     }
                  }
               }
               else if(response.error == "errRemovePremiumCurrencyNotEnough")
               {
                  ViewManager.instance.showNotEnoughPremiumDialog(CConstant.duel_enemies_refresh_premium_amount);
               }
               else
               {
                  Environment.reportError(response.error,response.request);
               }
               break;
            case "startDuel":
               if(response.error == "")
               {
                  Environment.application.updateData(response.data);
                  Environment.audio.playFX("duel_stamina_use.mp3");
                  _duelStaminaBar.decrease(User.current.character.duelStaminaCost);
                  _btnAttack.visible = false;
                  _btnViewPlayer.visible = false;
                  _btnRefreshDuelEnemies.visible = false;
                  if(User.current.showDuelBattles)
                  {
                     var startBattle:Function = function():void
                     {
                        PanelBattle.activeDuel = User.current.character.activeDuel;
                        ViewManager.instance.showPanel("battle");
                     };
                     Runtime.delayFunction(startBattle,1);
                  }
                  else
                  {
                     PanelDuels.resetLastDuelOpponentsRefresh();
                     onBattleFinished();
                     refresh();
                  }
               }
               else if(response.error == "errStartDuelAttackNotAllowed")
               {
                  Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/duel_attack_not_allowed/title"),LocText.current.text("dialog/duel_attack_not_allowed/text",LocText.current.text("general/attack",CConstant.duel_attack_limit)),LocText.current.text("general/button_ok")));
               }
               else if(!(response.error == "errStartDuelInvalidEnemy" || response.error == "errStartDuelAttackCurrentlyNotAllowed"))
               {
                  if(response.error == "errRemoveDuelStaminaNotEnough")
                  {
                     Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/duel_stamina_not_enough/title"),LocText.current.text("dialog/duel_stamina_not_enough/text"),LocText.current.text("general/button_ok")));
                  }
                  else if(response.error == "errRemovePremiumCurrencyNotEnough")
                  {
                     ViewManager.instance.showNotEnoughPremiumDialog(CConstant.duel_single_attack_premium_amount);
                  }
                  else if(response.error == "errStartDuelActiveDuelFound")
                  {
                     Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/start_duel_active_duel/title"),LocText.current.text("dialog/start_duel_active_duel/text"),LocText.current.text("general/button_ok")));
                  }
                  else
                  {
                     Environment.reportError(response.error,response.request);
                  }
               }
               break;
            case "checkForDuelComplete":
               if(response.error == "")
               {
                  Environment.application.updateData(response.data);
                  Environment.panelManager.showDialog(new DialogDuelResults(User.current.character.activeDuel));
                  if(!User.current.showDuelBattles)
                  {
                     if(_lastDuelOpponentsRefresh < TimeUtil.now - 60)
                     {
                        hideList();
                        Environment.application.sendActionRequest("getDuelOpponents",{},handleRequests);
                        _lastDuelOpponentsRefresh = TimeUtil.now;
                     }
                  }
               }
               else if(response.error == "errorIO" || response.error == "errorIO 2032" || response.error == "errorIO 0")
               {
                  var completeCallback:Function = function():void
                  {
                     Environment.application.sendActionRequest("checkForDuelComplete",{},handleRequests);
                  };
                  Runtime.delayFunction(completeCallback,1);
               }
               else if(response.error != "errFinishInvalidStatus")
               {
                  Environment.reportError(response.error,response.request);
               }
               break;
            case "buyDuelStamina":
               if(response.error == "")
               {
                  Environment.application.updateData(response.data);
                  Environment.audio.playFX("duel_stamina_refill.mp3");
               }
               else if(response.error == "errBuyDuelStaminaAlreadyFull")
               {
                  Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/duel_stamina_full/title"),LocText.current.text("dialog/duel_stamina_full/text"),LocText.current.text("general/button_ok")));
               }
               else if(response.error == "errBuyDuelStaminaConfirm")
               {
                  var buyDuelStaminaConfirmed:Function = function():void
                  {
                     Environment.application.sendActionRequest("buyDuelStamina",{"confirm_refill":true},handleRequests);
                  };
                  Environment.panelManager.showDialog(new UiTwoChoiceDialog(LocText.current.text("dialog/duel_stamina_refill_confirm/title"),LocText.current.text("dialog/duel_stamina_refill_confirm/text"),LocText.current.text("general/button_yes"),LocText.current.text("general/button_no"),buyDuelStaminaConfirmed));
               }
               else if(response.error == "errRemovePremiumCurrencyNotEnough")
               {
                  ViewManager.instance.showNotEnoughPremiumDialog(CConstant.duel_stamina_reset_premium_amount);
               }
               else
               {
                  Environment.reportError(response.error,response.request);
               }
               break;
            default:
               throw new Error("Unsupported request action \'" + response.action + "\'!");
         }
      }
   }
}
