package com.playata.application.ui.elements.duel
{
   import com.playata.application.data.character.Character;
   import com.playata.application.data.constants.CConstant;
   import com.playata.application.data.duel.Duel;
   import com.playata.application.data.duel.MissedDuel;
   import com.playata.application.data.user.User;
   import com.playata.application.ui.ViewManager;
   import com.playata.application.ui.dialogs.DialogMissedDuels;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.application.ui.elements.generic.button.UiPremiumButton;
   import com.playata.application.ui.elements.generic.button.UiTextButton;
   import com.playata.application.ui.elements.generic.checkbox.UiCheckBox;
   import com.playata.application.ui.elements.generic.dialog.UiInfoDialog;
   import com.playata.application.ui.elements.generic.dialog.UiTwoChoiceDialog;
   import com.playata.application.ui.panels.PanelBattle;
   import com.playata.application.ui.panels.PanelDuels;
   import com.playata.framework.application.Environment;
   import com.playata.framework.application.request.ActionRequestResponse;
   import com.playata.framework.core.timer.ITimer;
   import com.playata.framework.core.util.TimeUtil;
   import com.playata.framework.display.InteractiveDisplayObject;
   import com.playata.framework.input.InputCore;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.elements.duel.SymbolMissedDuelContentGeneric;
   
   public class UiMissedDuelsContent extends InteractiveDisplayObject
   {
       
      
      private var _vo:SymbolMissedDuelContentGeneric;
      
      private var _btnScrollUp:UiButton = null;
      
      private var _btnScrollDown:UiButton = null;
      
      private var _btnViewFight:UiTextButton = null;
      
      private var _btnViewPlayer:UiButton = null;
      
      private var _btnCounterAttack:UiPremiumButton = null;
      
      private var _btnSendMessage:UiTextButton = null;
      
      private var _btnDelete:UiButton = null;
      
      private var _btnDeleteAll:UiButton = null;
      
      private var _checkAutoShown:UiCheckBox = null;
      
      private var _currentDuels:Vector.<MissedDuel>;
      
      private var _duels:Vector.<MissedDuel> = null;
      
      private var _selectedLine:MissedDuel = null;
      
      private var _offset:int = 0;
      
      private var _timer:ITimer = null;
      
      private var _modeHistory:Boolean = false;
      
      private var _line1:UiMissedDuelLine = null;
      
      private var _line2:UiMissedDuelLine = null;
      
      private var _line3:UiMissedDuelLine = null;
      
      private var _line4:UiMissedDuelLine = null;
      
      private var _line5:UiMissedDuelLine = null;
      
      private var _line6:UiMissedDuelLine = null;
      
      private var _line7:UiMissedDuelLine = null;
      
      private var _line8:UiMissedDuelLine = null;
      
      private var _line9:UiMissedDuelLine = null;
      
      private var _line10:UiMissedDuelLine = null;
      
      private var _closeCallBack:Function;
      
      public function UiMissedDuelsContent(param1:SymbolMissedDuelContentGeneric, param2:Vector.<MissedDuel>, param3:Boolean, param4:Function)
      {
         _currentDuels = new Vector.<MissedDuel>();
         _vo = param1;
         super(_vo);
         _duels = param2;
         _modeHistory = param3;
         _closeCallBack = param4;
         param1.txtDateCaption.text = LocText.current.text("dialog/missed_duels/column_date");
         param1.txtNameCaption.text = LocText.current.text("dialog/missed_duels/column_name");
         param1.txtLevelCaption.text = LocText.current.text("dialog/missed_duels/column_level");
         param1.txtResultsCaption.text = LocText.current.text("dialog/missed_duels/column_result");
         param1.txtAutoShown.text = LocText.current.text("dialog/missed_duels/auto_popup_info");
         param1.txtNoDuels.text = LocText.current.text("dialog/missed_duels/no_duels");
         _btnScrollUp = new UiButton(param1.btnUp,LocText.current.text("dialog/missed_duels/button_scroll_up"),onClickScrollUp);
         _btnScrollDown = new UiButton(param1.btnDown,LocText.current.text("dialog/missed_duels/button_scroll_down"),onClickScrollDown);
         _btnViewFight = new UiTextButton(param1.btnViewFight,LocText.current.text("dialog/missed_duels/button_replay_fight"),"",onClickViewBattle);
         _btnViewPlayer = new UiButton(param1.btnViewPlayer,LocText.current.text("dialog/missed_duels/button_view_player"),onClickViewCharacter);
         _btnCounterAttack = new UiPremiumButton(param1.btnCounterAttack,CConstant.duel_single_attack_premium_amount,LocText.current.text("dialog/missed_duels/button_counter_attack"),LocText.current.text("dialog/missed_duels/button_counter_attack"),"","",onClickCounterAttack);
         _btnSendMessage = new UiTextButton(param1.btnSendMessage,LocText.current.text("dialog/missed_duels/button_send_message"),"",onClickSendMessage);
         _btnDelete = new UiButton(param1.btnDelete,LocText.current.text("dialog/mailbox/button_delete"),onClickDelete);
         _btnDeleteAll = new UiButton(param1.btnDeleteAll,LocText.current.text("dialog/mailbox/button_delete_all"),onClickDeleteAll);
         _checkAutoShown = new UiCheckBox(param1.checkAutoShown,User.current.autoShowMissedDuels,LocText.current.text("dialog/missed_duels/auto_popup_tooltip"),onChangeAutoShown,null,param1.txtAutoShown);
         _btnDelete.visible = _modeHistory;
         _btnDeleteAll.visible = _modeHistory;
         _btnSendMessage.visible = !_modeHistory;
         param1.summary.visible = !_modeHistory;
         _line1 = new UiMissedDuelLine(param1.duel1,1,selectLine,doubleClickLine);
         _line2 = new UiMissedDuelLine(param1.duel2,2,selectLine,doubleClickLine);
         _line3 = new UiMissedDuelLine(param1.duel3,3,selectLine,doubleClickLine);
         _line4 = new UiMissedDuelLine(param1.duel4,4,selectLine,doubleClickLine);
         _line5 = new UiMissedDuelLine(param1.duel5,5,selectLine,doubleClickLine);
         _line6 = new UiMissedDuelLine(param1.duel6,6,selectLine,doubleClickLine);
         _line7 = new UiMissedDuelLine(param1.duel7,7,selectLine,doubleClickLine);
         _line8 = new UiMissedDuelLine(param1.duel8,8,selectLine,doubleClickLine);
         _line9 = new UiMissedDuelLine(param1.duel9,9,selectLine,doubleClickLine);
         _line10 = new UiMissedDuelLine(param1.duel10,10,selectLine,doubleClickLine);
         param1.duel1.visible = false;
         param1.duel2.visible = false;
         param1.duel3.visible = false;
         param1.duel4.visible = false;
         param1.duel5.visible = false;
         param1.duel6.visible = false;
         param1.duel7.visible = false;
         param1.duel8.visible = false;
         param1.duel9.visible = false;
         param1.duel10.visible = false;
         onMouseWheel.add(handleMouseWheel);
         _timer = Environment.createTimer("UiMissedDuelsContent::timer",1000,onTimerEvent);
      }
      
      private function get duelCount() : int
      {
         return _duels.length;
      }
      
      public function show() : void
      {
         refresh();
      }
      
      public function refresh() : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         if(!_btnScrollUp)
         {
            return;
         }
         if(_duels)
         {
            _vo.visible = true;
            _btnScrollUp.visible = duelCount > DialogMissedDuels.MAX_LINES;
            _btnScrollDown.visible = duelCount > DialogMissedDuels.MAX_LINES;
            _loc2_ = 0;
            _loc3_ = 0;
            var _loc5_:int = 0;
            var _loc4_:* = _duels;
            for each(var _loc1_ in _duels)
            {
               if(_loc1_.isWon)
               {
                  _loc2_++;
               }
               _loc3_ = _loc3_ + _loc1_.reward.honor;
            }
            _vo.summary.txtNumAttacks.text = LocText.current.text("general/attack",duelCount);
            _vo.summary.txtNumLostCaption.text = LocText.current.text("dialog/missed_duels/num_lost");
            _vo.summary.txtNumWonCaption.text = LocText.current.text("dialog/missed_duels/num_won");
            _vo.summary.txtTotalHonorCaption.text = LocText.current.text("dialog/missed_duels/total_honor");
            _vo.summary.txtNumLost.text = LocText.current.formatHugeNumber(duelCount - _loc2_) + "x";
            _vo.summary.txtNumWon.text = LocText.current.formatHugeNumber(_loc2_) + "x";
            _vo.summary.txtTotalHonor.text = LocText.current.formatHugeNumber(_loc3_,true);
            _timer.start();
            onTimerEvent();
            refreshList();
         }
         else
         {
            Environment.application.sendActionRequest("getMissedDuelsNew",{"history":_modeHistory},handleRequests);
         }
      }
      
      public function hide() : void
      {
         _vo.visible = false;
         _timer.stop();
      }
      
      private function close() : void
      {
      }
      
      override public function dispose() : void
      {
         _btnScrollUp.dispose();
         _btnScrollUp = null;
         _btnScrollDown.dispose();
         _btnScrollDown = null;
         _btnViewFight.dispose();
         _btnViewFight = null;
         _btnViewPlayer.dispose();
         _btnViewPlayer = null;
         _btnCounterAttack.dispose();
         _btnCounterAttack = null;
         _btnSendMessage.dispose();
         _btnSendMessage = null;
         _btnDelete.dispose();
         _btnDelete = null;
         _btnDeleteAll.dispose();
         _btnDeleteAll = null;
         _line1.dispose();
         _line1 = null;
         _line2.dispose();
         _line2 = null;
         _line3.dispose();
         _line3 = null;
         _line4.dispose();
         _line4 = null;
         _line5.dispose();
         _line5 = null;
         _line6.dispose();
         _line6 = null;
         _line7.dispose();
         _line7 = null;
         _line8.dispose();
         _line8 = null;
         _line9.dispose();
         _line9 = null;
         _line10.dispose();
         _line10 = null;
         _timer.dispose();
         _timer = null;
         _checkAutoShown.dispose();
         _checkAutoShown = null;
         super.dispose();
      }
      
      public function get currentDuels() : Vector.<MissedDuel>
      {
         return _currentDuels;
      }
      
      public function get currentDuel() : MissedDuel
      {
         if(currentDuels.length == 1)
         {
            return currentDuels[0];
         }
         return null;
      }
      
      public function addCurrentDuel(param1:MissedDuel) : void
      {
         var _loc2_:int = 0;
         if(_currentDuels.indexOf(param1) != -1)
         {
            _loc2_ = _currentDuels.indexOf(param1);
            _currentDuels.splice(_loc2_,1);
            return;
         }
         _currentDuels.push(param1);
      }
      
      public function clearCurrentDuels() : void
      {
         _currentDuels = new Vector.<MissedDuel>();
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
         _btnCounterAttack.premium = !User.current.character.hasAvailableFreeDuel;
         _btnCounterAttack.buttonEnabled = User.current.character.activeDuel == null && (currentDuels.length == 1 && !_selectedLine.opponent.isDeleted);
         var _loc1_:String = "";
         if(User.current.character.hasAvailableFreeDuel)
         {
            _loc1_ = LocText.current.text("screen/duel/button_attack_tooltip");
         }
         else
         {
            _loc1_ = LocText.current.text("screen/duel/button_single_attack_tooltip",TimeUtil.secondsToString(User.current.character.secondsToNextFreeDuel));
         }
         if(User.current.character.activeDuel)
         {
            _loc1_ = LocText.current.text("screen/character/button_attack/occupied_with_duel_tooltip");
         }
         _btnCounterAttack.premiumTooltip = _loc1_;
         _btnCounterAttack.nonPremiumTooltip = _loc1_;
      }
      
      private function onClickDelete(param1:InteractionEvent) : void
      {
         interactionEvent = param1;
         var deleteCallback:Function = function():void
         {
            var _loc2_:String = "";
            var _loc4_:int = 0;
            var _loc3_:* = currentDuels;
            for each(var _loc1_ in currentDuels)
            {
               if(_loc2_ != "")
               {
                  _loc2_ = _loc2_ + ";";
               }
               _loc2_ = _loc2_ + _loc1_.id.toString();
            }
            Environment.application.sendActionRequest("deleteMissedDuels",{"duel_ids":_loc2_},handleRequests);
         };
         Environment.panelManager.showDialog(new UiTwoChoiceDialog(LocText.current.text("general/missed_duels/confirm_delete_title"),LocText.current.text("general/missed_duels/confirm_delete_text"),LocText.current.text("general/button_yes"),LocText.current.text("general/button_no"),deleteCallback));
      }
      
      private function onClickDeleteAll(param1:InteractionEvent) : void
      {
         interactionEvent = param1;
         var deleteCallback:Function = function():void
         {
            var _loc2_:int = 0;
            var _loc4_:int = 0;
            var _loc3_:* = _duels;
            for each(var _loc1_ in _duels)
            {
               if(_loc1_.id > _loc2_)
               {
                  _loc2_ = _loc1_.id;
               }
            }
            Environment.application.sendActionRequest("deleteAllMissedDuels",{"max_duel_id":_loc2_},handleRequests);
         };
         Environment.panelManager.showDialog(new UiTwoChoiceDialog(LocText.current.text("general/missed_duels/confirm_delete_all_title"),LocText.current.text("general/missed_duels/confirm_delete_all_text"),LocText.current.text("general/button_yes"),LocText.current.text("general/button_no"),deleteCallback));
      }
      
      private function handleMouseWheel(param1:InteractionEvent) : void
      {
         if(param1.mouseWheelDelta > 0)
         {
            scrollUp(1,true);
         }
         else
         {
            scrollDown(1,true);
         }
      }
      
      private function onClickScrollUp(param1:InteractionEvent) : void
      {
         scrollUp(5,false);
      }
      
      private function onClickScrollDown(param1:InteractionEvent) : void
      {
         scrollDown(5,false);
      }
      
      private function scrollUp(param1:int, param2:Boolean) : void
      {
         if(_btnScrollDown == null || !_btnScrollUp.visible)
         {
            return;
         }
         _offset = _offset - param1;
         if(_offset < 0)
         {
            _offset = 0;
            param2 = false;
         }
         if(param2)
         {
            Environment.audio.playFX("ui_button_click.mp3");
         }
         refreshList();
      }
      
      private function scrollDown(param1:int, param2:Boolean) : void
      {
         if(_btnScrollDown == null || !_btnScrollDown.visible)
         {
            return;
         }
         _offset = _offset + param1;
         if(_offset > duelCount - DialogMissedDuels.MAX_LINES)
         {
            _offset = duelCount - DialogMissedDuels.MAX_LINES;
            param2 = false;
         }
         if(param2)
         {
            Environment.audio.playFX("ui_button_click.mp3");
         }
         refreshList();
      }
      
      private function onClickViewBattle(param1:InteractionEvent) : void
      {
         Environment.application.sendActionRequest("getMissedDuel",{"duel_id":_selectedLine.id},handleRequests);
      }
      
      private function onClickViewCharacter(param1:InteractionEvent) : void
      {
         ViewManager.instance.loadCharacter(_selectedLine.opponent.id,close);
      }
      
      private function onClickCounterAttack(param1:InteractionEvent) : void
      {
         startDuel();
      }
      
      private function startDuel() : void
      {
         Environment.application.sendActionRequest("startDuel",{
            "character_id":_selectedLine.opponent.id,
            "use_premium":_btnCounterAttack.premium
         },handleRequests);
      }
      
      private function onClickSendMessage(param1:InteractionEvent) : void
      {
         close();
         ViewManager.instance.baseUserPanel.streamsPanel.createPrivateConversation(_selectedLine.opponent.name);
      }
      
      private function refreshList() : void
      {
         _vo.txtNoDuels.visible = duelCount == 0;
         _btnScrollUp.visible = duelCount > DialogMissedDuels.MAX_LINES;
         _btnScrollDown.visible = duelCount > DialogMissedDuels.MAX_LINES;
         _btnScrollUp.buttonEnabled = _offset > 0;
         _btnScrollDown.buttonEnabled = _offset < duelCount - DialogMissedDuels.MAX_LINES;
         _line1.refresh(DialogMissedDuels.MAX_LINES >= 1 && duelCount >= _offset + 1?_duels[_offset + 0]:null,1);
         _line2.refresh(DialogMissedDuels.MAX_LINES >= 2 && duelCount >= _offset + 2?_duels[_offset + 1]:null,2);
         _line3.refresh(DialogMissedDuels.MAX_LINES >= 3 && duelCount >= _offset + 3?_duels[_offset + 2]:null,3);
         _line4.refresh(DialogMissedDuels.MAX_LINES >= 4 && duelCount >= _offset + 4?_duels[_offset + 3]:null,4);
         _line5.refresh(DialogMissedDuels.MAX_LINES >= 5 && duelCount >= _offset + 5?_duels[_offset + 4]:null,5);
         _line6.refresh(DialogMissedDuels.MAX_LINES >= 6 && duelCount >= _offset + 6?_duels[_offset + 5]:null,6);
         _line7.refresh(DialogMissedDuels.MAX_LINES >= 7 && duelCount >= _offset + 7?_duels[_offset + 6]:null,7);
         _line8.refresh(DialogMissedDuels.MAX_LINES >= 8 && duelCount >= _offset + 8?_duels[_offset + 7]:null,8);
         _line9.refresh(DialogMissedDuels.MAX_LINES >= 9 && duelCount >= _offset + 9?_duels[_offset + 8]:null,9);
         _line10.refresh(DialogMissedDuels.MAX_LINES >= 10 && duelCount >= _offset + 10?_duels[_offset + 9]:null,10);
         if(_selectedLine != null)
         {
            _line1.highlight(currentDuels.indexOf(_line1.duel) != -1);
            _line2.highlight(currentDuels.indexOf(_line2.duel) != -1);
            _line3.highlight(currentDuels.indexOf(_line3.duel) != -1);
            _line4.highlight(currentDuels.indexOf(_line4.duel) != -1);
            _line5.highlight(currentDuels.indexOf(_line5.duel) != -1);
            _line6.highlight(currentDuels.indexOf(_line6.duel) != -1);
            _line7.highlight(currentDuels.indexOf(_line7.duel) != -1);
            _line8.highlight(currentDuels.indexOf(_line8.duel) != -1);
            _line9.highlight(currentDuels.indexOf(_line9.duel) != -1);
            _line10.highlight(currentDuels.indexOf(_line10.duel) != -1);
         }
         else if(_line1.duel != null)
         {
            selectLine(_line1);
         }
         refreshButtons();
      }
      
      private function selectLine(param1:UiMissedDuelLine) : void
      {
         _selectedLine = param1.duel;
         if(_selectedLine != null)
         {
            if(!InputCore.current.keyboard.isCtrlPressed)
            {
               clearCurrentDuels();
            }
            addCurrentDuel(_selectedLine);
         }
         _line1.highlight(currentDuels.indexOf(_line1.duel) != -1);
         _line2.highlight(currentDuels.indexOf(_line2.duel) != -1);
         _line3.highlight(currentDuels.indexOf(_line3.duel) != -1);
         _line4.highlight(currentDuels.indexOf(_line4.duel) != -1);
         _line5.highlight(currentDuels.indexOf(_line5.duel) != -1);
         _line6.highlight(currentDuels.indexOf(_line6.duel) != -1);
         _line7.highlight(currentDuels.indexOf(_line7.duel) != -1);
         _line8.highlight(currentDuels.indexOf(_line8.duel) != -1);
         _line9.highlight(currentDuels.indexOf(_line9.duel) != -1);
         _line10.highlight(currentDuels.indexOf(_line10.duel) != -1);
         refreshButtons();
      }
      
      private function doubleClickLine(param1:UiMissedDuelLine) : void
      {
         clearCurrentDuels();
         selectLine(param1);
         onClickViewCharacter(null);
      }
      
      private function refreshButtons() : void
      {
         _btnViewFight.buttonEnabled = currentDuels.length == 1;
         _btnViewPlayer.buttonEnabled = currentDuels.length == 1;
         _btnSendMessage.buttonEnabled = currentDuels.length == 1 && !_selectedLine.opponent.isDeleted;
         _btnCounterAttack.buttonEnabled = currentDuels.length == 1 && !_selectedLine.opponent.isDeleted;
         _btnDelete.buttonEnabled = currentDuels.length > 0;
         _btnDeleteAll.buttonEnabled = currentDuels.length > 0;
      }
      
      private function onChangeAutoShown(param1:Boolean) : void
      {
         User.current.autoShowMissedDuels = param1;
      }
      
      private function handleRequests(param1:ActionRequestResponse) : void
      {
         var _loc3_:* = null;
         var _loc4_:int = 0;
         var _loc6_:* = param1.action;
         switch(_loc6_)
         {
            case "getMissedDuel":
               if(param1.error == "")
               {
                  Environment.application.updateData(param1.data);
                  _loc3_ = new Duel(param1.appResponse.missed_duel);
                  _loc3_.refreshBattle(param1.appResponse.missed_duel_battle);
                  if(param1.appResponse.hasData("requested_character"))
                  {
                     _loc3_.opponent = Character.fromData(param1.data);
                  }
                  PanelBattle.missedDuel = _loc3_;
                  ViewManager.instance.showPanel("battle");
                  if(param1.appResponse.decrease_counter === true)
                  {
                     User.current.character.missedDuels = User.current.character.missedDuels - 1;
                  }
                  close();
               }
               else
               {
                  Environment.reportError(param1.error,param1.request);
               }
               break;
            case "startDuel":
               if(param1.error == "")
               {
                  Environment.application.updateData(param1.data);
                  Environment.audio.playFX("duel_stamina_use.mp3");
                  PanelBattle.activeDuel = User.current.character.activeDuel;
                  ViewManager.instance.showPanel("battle");
                  close();
               }
               else if(param1.error == "errStartDuelAttackNotAllowed")
               {
                  Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/duel_attack_not_allowed/title"),LocText.current.text("dialog/duel_attack_not_allowed/text",LocText.current.text("general/attack",CConstant.duel_attack_limit)),LocText.current.text("general/button_ok")));
               }
               else if(!(param1.error == "errStartDuelInvalidEnemy" || param1.error == "errStartDuelAttackCurrentlyNotAllowed"))
               {
                  if(param1.error == "errRemoveDuelStaminaNotEnough")
                  {
                     Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/duel_stamina_not_enough/title"),LocText.current.text("dialog/duel_stamina_not_enough/text"),LocText.current.text("general/button_ok")));
                  }
                  else if(param1.error == "errRemovePremiumCurrencyNotEnough")
                  {
                     ViewManager.instance.showNotEnoughPremiumDialog(CConstant.duel_single_attack_premium_amount);
                  }
                  else if(param1.error == "errStartDuelActiveDuelFound")
                  {
                     Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/start_duel_active_duel/title"),LocText.current.text("dialog/start_duel_active_duel/text"),LocText.current.text("general/button_ok")));
                  }
                  else
                  {
                     Environment.reportError(param1.error,param1.request);
                  }
               }
               break;
            case "deleteMissedDuels":
               if(param1.error == "")
               {
                  _loc4_ = 0;
                  _loc6_ = 0;
                  var _loc5_:* = currentDuels;
                  for each(var _loc2_ in currentDuels)
                  {
                     _duels.splice(_duels.indexOf(_loc2_),1);
                     _loc4_++;
                  }
                  User.current.character.missedDuels = User.current.character.missedDuels - _loc4_;
                  Environment.application.updateData(param1.data);
                  if(ViewManager.instance.activePanelInstance is PanelDuels)
                  {
                     (ViewManager.instance.activePanelInstance as PanelDuels).refreshHistoryButton();
                  }
                  ViewManager.instance.baseUserPanel.refreshMissedDuelsBubble();
                  clearCurrentDuels();
                  _selectedLine = null;
                  refreshList();
               }
               else
               {
                  Environment.reportError(param1.error,param1.request);
               }
               break;
            case "deleteAllMissedDuels":
               if(param1.error == "")
               {
                  User.current.character.missedDuels = 0;
                  Environment.application.updateData(param1.data);
                  _duels = new Vector.<MissedDuel>();
                  _offset = 0;
                  clearCurrentDuels();
                  _selectedLine = null;
                  refreshList();
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
   }
}
