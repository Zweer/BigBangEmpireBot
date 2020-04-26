package com.playata.application.ui.dialogs
{
   import com.playata.application.data.dataobject.DOGuildHistoryBattle;
   import com.playata.application.data.guild.GuildBattle;
   import com.playata.application.data.guild.GuildBattleHistoryFight;
   import com.playata.application.ui.ViewManager;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.application.ui.elements.generic.button.UiTextButton;
   import com.playata.application.ui.elements.generic.dialog.UiDialog;
   import com.playata.application.ui.elements.generic.dialog.UiInfoDialog;
   import com.playata.application.ui.elements.guild.UiGuildBattleHistoryLine;
   import com.playata.application.ui.panels.PanelBattle;
   import com.playata.framework.application.Environment;
   import com.playata.framework.application.request.ActionRequestResponse;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.dialogs.SymbolDialogGuildBattleHistoryGeneric;
   
   public class DialogGuildBattleHistory extends UiDialog
   {
      
      public static const SCROLL_VALUE:int = 5;
      
      public static const MAX_LINES:int = 10;
       
      
      private var _btnClose:UiButton = null;
      
      private var _btnScrollUp:UiButton = null;
      
      private var _btnScrollDown:UiButton = null;
      
      private var _btnViewFight:UiTextButton = null;
      
      private var _btnViewEnemy:UiTextButton = null;
      
      private var _guildBattleHistoryFights:Vector.<GuildBattleHistoryFight>;
      
      private var _guildBattleHistoryFight:GuildBattleHistoryFight = null;
      
      private var _offset:int = 0;
      
      private var _line1:UiGuildBattleHistoryLine = null;
      
      private var _line2:UiGuildBattleHistoryLine = null;
      
      private var _line3:UiGuildBattleHistoryLine = null;
      
      private var _line4:UiGuildBattleHistoryLine = null;
      
      private var _line5:UiGuildBattleHistoryLine = null;
      
      private var _line6:UiGuildBattleHistoryLine = null;
      
      private var _line7:UiGuildBattleHistoryLine = null;
      
      private var _line8:UiGuildBattleHistoryLine = null;
      
      private var _line9:UiGuildBattleHistoryLine = null;
      
      private var _line10:UiGuildBattleHistoryLine = null;
      
      public function DialogGuildBattleHistory()
      {
         _guildBattleHistoryFights = new Vector.<GuildBattleHistoryFight>();
         var _loc1_:SymbolDialogGuildBattleHistoryGeneric = new SymbolDialogGuildBattleHistoryGeneric();
         super(_loc1_);
         _queued = false;
         _loc1_.txtDialogTitle.text = LocText.current.text("dialog/guild_fight_history/title");
         _loc1_.txtDateCaption.text = LocText.current.text("dialog/missed_duels/column_date");
         _loc1_.txtEnemyNameCaption.text = LocText.current.text("dialog/guild_fight_history/column_enemy");
         _loc1_.txtJoinedCaption.text = LocText.current.text("dialog/guild_fight_history/column_joined");
         _loc1_.txtResultsCaption.text = LocText.current.text("dialog/missed_duels/column_result");
         _loc1_.txtNoBattles.text = LocText.current.text("dialog/guild_fight_history/no_battles");
         _btnClose = new UiButton(_loc1_.btnClose,"",onClickClose);
         _btnScrollUp = new UiButton(_loc1_.btnUp,LocText.current.text("dialog/missed_duels/button_scroll_up"),onClickScrollUp);
         _btnScrollDown = new UiButton(_loc1_.btnDown,LocText.current.text("dialog/missed_duels/button_scroll_down"),onClickScrollDown);
         _btnViewFight = new UiTextButton(_loc1_.btnViewFight,LocText.current.text("dialog/missed_duels/button_replay_fight"),"",onClickViewBattle);
         _btnViewEnemy = new UiTextButton(_loc1_.btnViewEnemy,LocText.current.text("dialog/guild_battle_search/button_view"),"",onClickViewEnemy);
         _btnScrollUp.visible = false;
         _btnScrollDown.visible = false;
         _line1 = new UiGuildBattleHistoryLine(_loc1_.line1,1,selectLine,doubleClickLine);
         _line2 = new UiGuildBattleHistoryLine(_loc1_.line2,2,selectLine,doubleClickLine);
         _line3 = new UiGuildBattleHistoryLine(_loc1_.line3,3,selectLine,doubleClickLine);
         _line4 = new UiGuildBattleHistoryLine(_loc1_.line4,4,selectLine,doubleClickLine);
         _line5 = new UiGuildBattleHistoryLine(_loc1_.line5,5,selectLine,doubleClickLine);
         _line6 = new UiGuildBattleHistoryLine(_loc1_.line6,6,selectLine,doubleClickLine);
         _line7 = new UiGuildBattleHistoryLine(_loc1_.line7,7,selectLine,doubleClickLine);
         _line8 = new UiGuildBattleHistoryLine(_loc1_.line8,8,selectLine,doubleClickLine);
         _line9 = new UiGuildBattleHistoryLine(_loc1_.line9,9,selectLine,doubleClickLine);
         _line10 = new UiGuildBattleHistoryLine(_loc1_.line10,10,selectLine,doubleClickLine);
         _loc1_.line1.visible = false;
         _loc1_.line2.visible = false;
         _loc1_.line3.visible = false;
         _loc1_.line4.visible = false;
         _loc1_.line5.visible = false;
         _loc1_.line6.visible = false;
         _loc1_.line7.visible = false;
         _loc1_.line8.visible = false;
         _loc1_.line9.visible = false;
         _loc1_.line10.visible = false;
         onMouseWheel.add(handleMouseWheel);
         refreshList();
         Environment.application.sendActionRequest("getGuildBattleHistoryFights",{},handleRequests);
      }
      
      private static function sortByBattleTime(param1:GuildBattleHistoryFight, param2:GuildBattleHistoryFight) : int
      {
         if(param1.battleTimestamp < param2.battleTimestamp)
         {
            return 1;
         }
         return param1.battleTimestamp > param2.battleTimestamp?-1:Number(param1.id > param2.id?-1:1);
      }
      
      override public function dispose() : void
      {
         _btnClose.dispose();
         _btnClose = null;
         _btnScrollUp.dispose();
         _btnScrollUp = null;
         _btnScrollDown.dispose();
         _btnScrollDown = null;
         _btnViewFight.dispose();
         _btnViewFight = null;
         _btnViewEnemy.dispose();
         _btnViewEnemy = null;
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
         super.dispose();
      }
      
      private function get guildBattleHistoryFightCount() : int
      {
         return _guildBattleHistoryFights.length;
      }
      
      public function get currentGuildBattleHistoryFight() : GuildBattleHistoryFight
      {
         return _guildBattleHistoryFight;
      }
      
      private function onClickClose(param1:InteractionEvent) : void
      {
         close();
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
         if(!_btnScrollUp.visible)
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
         if(!_btnScrollDown.visible)
         {
            return;
         }
         _offset = _offset + param1;
         if(_offset > guildBattleHistoryFightCount - 10)
         {
            _offset = guildBattleHistoryFightCount - 10;
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
         Environment.application.sendActionRequest("getGuildBattleHistoryFight",{
            "type":_guildBattleHistoryFight.type,
            "id":_guildBattleHistoryFight.id
         },handleRequests);
      }
      
      private function onClickViewEnemy(param1:InteractionEvent) : void
      {
         ViewManager.instance.loadGuild(_guildBattleHistoryFight.enemyGuildId,closeCallback);
      }
      
      private function closeCallback() : void
      {
         close();
      }
      
      private function refreshList() : void
      {
         if(!_btnScrollUp)
         {
            return;
         }
         var _loc1_:SymbolDialogGuildBattleHistoryGeneric = _vo as SymbolDialogGuildBattleHistoryGeneric;
         _loc1_.txtNoBattles.visible = guildBattleHistoryFightCount == 0;
         _btnScrollUp.visible = guildBattleHistoryFightCount > 10;
         _btnScrollDown.visible = guildBattleHistoryFightCount > 10;
         _btnScrollUp.buttonEnabled = _offset > 0;
         _btnScrollDown.buttonEnabled = _offset < guildBattleHistoryFightCount - 10;
         _line1.refresh(true && guildBattleHistoryFightCount >= _offset + 1?_guildBattleHistoryFights[_offset + 0]:null,1);
         _line2.refresh(true && guildBattleHistoryFightCount >= _offset + 2?_guildBattleHistoryFights[_offset + 1]:null,2);
         _line3.refresh(true && guildBattleHistoryFightCount >= _offset + 3?_guildBattleHistoryFights[_offset + 2]:null,3);
         _line4.refresh(true && guildBattleHistoryFightCount >= _offset + 4?_guildBattleHistoryFights[_offset + 3]:null,4);
         _line5.refresh(true && guildBattleHistoryFightCount >= _offset + 5?_guildBattleHistoryFights[_offset + 4]:null,5);
         _line6.refresh(true && guildBattleHistoryFightCount >= _offset + 6?_guildBattleHistoryFights[_offset + 5]:null,6);
         _line7.refresh(true && guildBattleHistoryFightCount >= _offset + 7?_guildBattleHistoryFights[_offset + 6]:null,7);
         _line8.refresh(true && guildBattleHistoryFightCount >= _offset + 8?_guildBattleHistoryFights[_offset + 7]:null,8);
         _line9.refresh(true && guildBattleHistoryFightCount >= _offset + 9?_guildBattleHistoryFights[_offset + 8]:null,9);
         _line10.refresh(true && guildBattleHistoryFightCount >= _offset + 10?_guildBattleHistoryFights[_offset + 9]:null,10);
         if(_guildBattleHistoryFight != null)
         {
            _line1.highlight(_guildBattleHistoryFight == _line1.guildBattleHistoryFight);
            _line2.highlight(_guildBattleHistoryFight == _line2.guildBattleHistoryFight);
            _line3.highlight(_guildBattleHistoryFight == _line3.guildBattleHistoryFight);
            _line4.highlight(_guildBattleHistoryFight == _line4.guildBattleHistoryFight);
            _line5.highlight(_guildBattleHistoryFight == _line5.guildBattleHistoryFight);
            _line6.highlight(_guildBattleHistoryFight == _line6.guildBattleHistoryFight);
            _line7.highlight(_guildBattleHistoryFight == _line7.guildBattleHistoryFight);
            _line8.highlight(_guildBattleHistoryFight == _line8.guildBattleHistoryFight);
            _line9.highlight(_guildBattleHistoryFight == _line9.guildBattleHistoryFight);
            _line10.highlight(_guildBattleHistoryFight == _line10.guildBattleHistoryFight);
         }
         else if(_line1.guildBattleHistoryFight != null)
         {
            selectLine(_line1);
         }
         refreshButtons();
      }
      
      private function selectLine(param1:UiGuildBattleHistoryLine) : void
      {
         _guildBattleHistoryFight = param1.guildBattleHistoryFight;
         _line1.highlight(_guildBattleHistoryFight == _line1.guildBattleHistoryFight);
         _line2.highlight(_guildBattleHistoryFight == _line2.guildBattleHistoryFight);
         _line3.highlight(_guildBattleHistoryFight == _line3.guildBattleHistoryFight);
         _line4.highlight(_guildBattleHistoryFight == _line4.guildBattleHistoryFight);
         _line5.highlight(_guildBattleHistoryFight == _line5.guildBattleHistoryFight);
         _line6.highlight(_guildBattleHistoryFight == _line6.guildBattleHistoryFight);
         _line7.highlight(_guildBattleHistoryFight == _line7.guildBattleHistoryFight);
         _line8.highlight(_guildBattleHistoryFight == _line8.guildBattleHistoryFight);
         _line9.highlight(_guildBattleHistoryFight == _line9.guildBattleHistoryFight);
         _line10.highlight(_guildBattleHistoryFight == _line10.guildBattleHistoryFight);
         refreshButtons();
      }
      
      private function doubleClickLine(param1:UiGuildBattleHistoryLine) : void
      {
         selectLine(param1);
         onClickViewEnemy(null);
      }
      
      private function refreshButtons() : void
      {
         _btnViewFight.buttonEnabled = _guildBattleHistoryFight != null;
         _btnViewEnemy.buttonEnabled = _guildBattleHistoryFight != null;
      }
      
      private function handleRequests(param1:ActionRequestResponse) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc6_:* = param1.action;
         switch(_loc6_)
         {
            case "getGuildBattleHistoryFights":
               if(param1.error == "")
               {
                  Environment.application.updateData(param1.data);
                  if(param1.appResponse.hasData("guild_history_battles"))
                  {
                     _loc6_ = 0;
                     var _loc5_:* = param1.appResponse.guild_history_battles;
                     for each(var _loc4_ in param1.appResponse.guild_history_battles)
                     {
                        _loc2_ = new GuildBattleHistoryFight(_loc4_);
                        _guildBattleHistoryFights.push(_loc2_);
                     }
                  }
                  _guildBattleHistoryFights.sort(sortByBattleTime);
                  refreshList();
               }
               else
               {
                  Environment.reportError(param1.error,param1.request);
               }
               break;
            case "getGuildBattleHistoryFight":
               if(param1.error == "")
               {
                  Environment.application.updateData(param1.data);
                  switch(int(param1.request.getInt("type")) - 1)
                  {
                     case 0:
                     case 1:
                        _loc3_ = new GuildBattle(param1.appResponse.guild_history_battle);
                        if(_loc3_.hasRounds)
                        {
                           PanelBattle.guildHistoryBattle = _loc3_;
                           ViewManager.instance.showPanel("battle");
                           (ViewManager.instance.activePanelInstance as PanelBattle).startGuildBattleVisualization();
                           break;
                        }
                        if(_loc3_.isOwnGuildWinner)
                        {
                           Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/guild_battle_no_attacker_defender_won/title"),LocText.current.text("dialog/guild_battle_no_attacker_defender_won/text",!!_loc3_.isOwnGuildAttack?_loc3_.defender.name:_loc3_.attacker.name),LocText.current.text("general/button_ok")));
                           break;
                        }
                        Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/guild_battle_no_attacker_defender_lost/title"),LocText.current.text("dialog/guild_battle_no_attacker_defender_lost/text",!!_loc3_.isOwnGuildAttack?_loc3_.defender.name:_loc3_.attacker.name),LocText.current.text("general/button_ok")));
                        break;
                  }
                  close();
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
      
      override public function onEscape() : void
      {
         onClickClose(null);
      }
   }
}
