package com.playata.application.ui.dialogs
{
   import com.playata.application.data.dataobject.DOGuildBattleListEntry;
   import com.playata.application.data.guild.GuildBattleSearchResult;
   import com.playata.application.data.user.User;
   import com.playata.application.ui.ViewManager;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.application.ui.elements.generic.button.UiTextButton;
   import com.playata.application.ui.elements.generic.dialog.UiDialog;
   import com.playata.application.ui.elements.generic.dialog.UiInfoDialog;
   import com.playata.application.ui.elements.guild.UiGuildBattleSearchLine;
   import com.playata.framework.application.Environment;
   import com.playata.framework.application.request.ActionRequestResponse;
   import com.playata.framework.core.util.TimeUtil;
   import com.playata.framework.display.ui.controls.Button;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.dialogs.SymbolDialogGuildBattleSearchGeneric;
   
   public class DialogGuildBattleSearch extends UiDialog
   {
      
      private static const SEARCH_REFRESH_TIME:int = 120;
      
      private static var _lastOpen:int = 0;
      
      private static var _guilds:Vector.<GuildBattleSearchResult> = new Vector.<GuildBattleSearchResult>();
      
      private static var _offset:int = 0;
      
      private static var _selectedLine:UiGuildBattleSearchLine = null;
      
      private static var _currentGuild:GuildBattleSearchResult = null;
      
      public static const MAX_LINES:int = 12;
      
      public static const SCROLL_VALUE:int = 5;
       
      
      private var _btnClose:UiButton = null;
      
      private var _btnScrollUp:UiButton = null;
      
      private var _btnScrollDown:UiButton = null;
      
      private var _btnView:UiTextButton = null;
      
      private var _btnAttack:UiTextButton = null;
      
      private var _line1:UiGuildBattleSearchLine = null;
      
      private var _line2:UiGuildBattleSearchLine = null;
      
      private var _line3:UiGuildBattleSearchLine = null;
      
      private var _line4:UiGuildBattleSearchLine = null;
      
      private var _line5:UiGuildBattleSearchLine = null;
      
      private var _line6:UiGuildBattleSearchLine = null;
      
      private var _line7:UiGuildBattleSearchLine = null;
      
      private var _line8:UiGuildBattleSearchLine = null;
      
      private var _line9:UiGuildBattleSearchLine = null;
      
      private var _line10:UiGuildBattleSearchLine = null;
      
      private var _line11:UiGuildBattleSearchLine = null;
      
      private var _line12:UiGuildBattleSearchLine = null;
      
      public function DialogGuildBattleSearch()
      {
         var _loc2_:SymbolDialogGuildBattleSearchGeneric = new SymbolDialogGuildBattleSearchGeneric();
         super(_loc2_);
         _queued = false;
         _loc2_.txtDialogTitle.text = LocText.current.text("dialog/guild_battle_search/title");
         _loc2_.txtNameCaption.text = LocText.current.text("dialog/guild_battle_search/column_name");
         _loc2_.txtLevelCaption.text = LocText.current.text("dialog/guild_battle_search/column_level");
         _loc2_.txtMemberCaption.text = LocText.current.text("dialog/guild_battle_search/column_member");
         _loc2_.txtHonorCaption.text = LocText.current.text("dialog/guild_battle_search/column_honor");
         _btnClose = new UiButton(_loc2_.btnClose,"",onClickClose);
         _btnScrollUp = new UiButton(_loc2_.btnUp,LocText.current.text("dialog/leadboard/button_scroll_up"),onClickScrollUp);
         _btnScrollDown = new UiButton(_loc2_.btnDown,LocText.current.text("dialog/leadboard/button_scroll_down"),onClickScrollDown);
         _btnView = new UiTextButton(_loc2_.btnView,LocText.current.text("dialog/guild_battle_search/button_view"),LocText.current.text("dialog/guild_battle_search/button_view_tooltip"),onClickView);
         _btnAttack = new UiTextButton(_loc2_.btnAttack,LocText.current.text("dialog/guild_battle_search/button_attack"),LocText.current.text("dialog/guild_battle_search/button_attack_tooltip"),onClickAttack);
         var _loc3_:Boolean = false;
         _btnAttack.buttonEnabled = _loc3_;
         _btnView.buttonEnabled = _loc3_;
         _line1 = new UiGuildBattleSearchLine(_loc2_.line1,1,selectLine,doubleClickLine);
         _line2 = new UiGuildBattleSearchLine(_loc2_.line2,2,selectLine,doubleClickLine);
         _line3 = new UiGuildBattleSearchLine(_loc2_.line3,3,selectLine,doubleClickLine);
         _line4 = new UiGuildBattleSearchLine(_loc2_.line4,4,selectLine,doubleClickLine);
         _line5 = new UiGuildBattleSearchLine(_loc2_.line5,5,selectLine,doubleClickLine);
         _line6 = new UiGuildBattleSearchLine(_loc2_.line6,6,selectLine,doubleClickLine);
         _line7 = new UiGuildBattleSearchLine(_loc2_.line7,7,selectLine,doubleClickLine);
         _line8 = new UiGuildBattleSearchLine(_loc2_.line8,8,selectLine,doubleClickLine);
         _line9 = new UiGuildBattleSearchLine(_loc2_.line9,9,selectLine,doubleClickLine);
         _line10 = new UiGuildBattleSearchLine(_loc2_.line10,10,selectLine,doubleClickLine);
         _line11 = new UiGuildBattleSearchLine(_loc2_.line11,11,selectLine,doubleClickLine);
         _line12 = new UiGuildBattleSearchLine(_loc2_.line12,12,selectLine,doubleClickLine);
         onMouseWheel.add(handleMouseWheel);
         refreshList();
         var _loc1_:int = 0;
         if(_lastOpen < TimeUtil.now - 120)
         {
            Environment.application.sendActionRequest("getGuildBattleList",{},handleRequests);
         }
         else if(_selectedLine != null)
         {
            _loc1_ = getOffset(_selectedLine.guild);
            _offset = int(Math.max(0,Math.min(_loc1_ - 12 / 2,currentGuildCount - 12)));
            refreshList();
         }
         else if(_currentGuild != null)
         {
            _loc1_ = getOffset(_currentGuild);
            _offset = int(Math.max(0,Math.min(_loc1_ - 12 / 2,currentGuildCount - 12)));
            refreshList();
         }
         _lastOpen = TimeUtil.now;
      }
      
      public static function reset() : void
      {
         _lastOpen = 0;
         _guilds = new Vector.<GuildBattleSearchResult>();
         _offset = 0;
         _selectedLine = null;
         _currentGuild = null;
      }
      
      override public function dispose() : void
      {
         _btnClose.dispose();
         _btnClose = null;
         _btnScrollUp.dispose();
         _btnScrollUp = null;
         _btnScrollDown.dispose();
         _btnScrollDown = null;
         _btnView.dispose();
         _btnView = null;
         _btnAttack.dispose();
         _btnAttack = null;
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
         _line11.dispose();
         _line11 = null;
         _line12.dispose();
         _line12 = null;
         super.dispose();
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
         if(_offset > currentGuildCount - 12)
         {
            _offset = currentGuildCount - 12;
            param2 = false;
         }
         if(param2)
         {
            Environment.audio.playFX("ui_button_click.mp3");
         }
         refreshList();
      }
      
      private function get currentGuildCount() : int
      {
         return _guilds.length;
      }
      
      private function refreshList(param1:Boolean = false, param2:GuildBattleSearchResult = null) : void
      {
         if(!_btnClose)
         {
            return;
         }
         if(_selectedLine != null)
         {
            _currentGuild = _selectedLine.guild;
         }
         _btnScrollUp.visible = _guilds.length > 12;
         _btnScrollDown.visible = _guilds.length > 12;
         _btnScrollUp.buttonEnabled = _offset > 0;
         _btnScrollDown.buttonEnabled = _offset < currentGuildCount - 12;
         _line1.refresh(_guilds.length >= _offset + 1?_guilds[_offset + 0]:null,1);
         _line2.refresh(_guilds.length >= _offset + 2?_guilds[_offset + 1]:null,2);
         _line3.refresh(_guilds.length >= _offset + 3?_guilds[_offset + 2]:null,3);
         _line4.refresh(_guilds.length >= _offset + 4?_guilds[_offset + 3]:null,4);
         _line5.refresh(_guilds.length >= _offset + 5?_guilds[_offset + 4]:null,5);
         _line6.refresh(_guilds.length >= _offset + 6?_guilds[_offset + 5]:null,6);
         _line7.refresh(_guilds.length >= _offset + 7?_guilds[_offset + 6]:null,7);
         _line8.refresh(_guilds.length >= _offset + 8?_guilds[_offset + 7]:null,8);
         _line9.refresh(_guilds.length >= _offset + 9?_guilds[_offset + 8]:null,9);
         _line10.refresh(_guilds.length >= _offset + 10?_guilds[_offset + 9]:null,10);
         _line11.refresh(_guilds.length >= _offset + 11?_guilds[_offset + 10]:null,11);
         _line12.refresh(_guilds.length >= _offset + 12?_guilds[_offset + 11]:null,12);
         if(_currentGuild != null && !param1)
         {
            if(_line1.guild == _currentGuild)
            {
               selectLine(_line1);
            }
            else if(_line2.guild == _currentGuild)
            {
               selectLine(_line2);
            }
            else if(_line3.guild == _currentGuild)
            {
               selectLine(_line3);
            }
            else if(_line4.guild == _currentGuild)
            {
               selectLine(_line4);
            }
            else if(_line5.guild == _currentGuild)
            {
               selectLine(_line5);
            }
            else if(_line6.guild == _currentGuild)
            {
               selectLine(_line6);
            }
            else if(_line7.guild == _currentGuild)
            {
               selectLine(_line7);
            }
            else if(_line8.guild == _currentGuild)
            {
               selectLine(_line8);
            }
            else if(_line9.guild == _currentGuild)
            {
               selectLine(_line9);
            }
            else if(_line10.guild == _currentGuild)
            {
               selectLine(_line10);
            }
            else if(_line11.guild == _currentGuild)
            {
               selectLine(_line11);
            }
            else if(_line12.guild == _currentGuild)
            {
               selectLine(_line12);
            }
            else
            {
               selectLine(null);
            }
         }
         else if(param1 && param2 != null)
         {
            if(_line1.guild == param2)
            {
               selectLine(_line1);
            }
            else if(_line2.guild == param2)
            {
               selectLine(_line2);
            }
            else if(_line3.guild == param2)
            {
               selectLine(_line3);
            }
            else if(_line4.guild == param2)
            {
               selectLine(_line4);
            }
            else if(_line5.guild == param2)
            {
               selectLine(_line5);
            }
            else if(_line6.guild == param2)
            {
               selectLine(_line6);
            }
            else if(_line7.guild == param2)
            {
               selectLine(_line7);
            }
            else if(_line8.guild == param2)
            {
               selectLine(_line8);
            }
            else if(_line9.guild == param2)
            {
               selectLine(_line9);
            }
            else if(_line10.guild == param2)
            {
               selectLine(_line10);
            }
            else if(_line11.guild == param2)
            {
               selectLine(_line11);
            }
            else if(_line12.guild == param2)
            {
               selectLine(_line12);
            }
            else
            {
               selectLine(null);
            }
         }
         else if(_line1.guild != null && param1)
         {
            selectLine(_line1);
         }
      }
      
      private function selectLine(param1:UiGuildBattleSearchLine) : void
      {
         _selectedLine = param1;
         _line1.highlight(_line1 == _selectedLine);
         _line2.highlight(_line2 == _selectedLine);
         _line3.highlight(_line3 == _selectedLine);
         _line4.highlight(_line4 == _selectedLine);
         _line5.highlight(_line5 == _selectedLine);
         _line6.highlight(_line6 == _selectedLine);
         _line7.highlight(_line7 == _selectedLine);
         _line8.highlight(_line8 == _selectedLine);
         _line9.highlight(_line9 == _selectedLine);
         _line10.highlight(_line10 == _selectedLine);
         _line11.highlight(_line11 == _selectedLine);
         _line12.highlight(_line12 == _selectedLine);
         var _loc2_:Boolean = true;
         _btnAttack.buttonEnabled = _loc2_;
         _btnView.buttonEnabled = _loc2_;
      }
      
      private function doubleClickLine(param1:UiGuildBattleSearchLine) : void
      {
         selectLine(param1);
         onClickView(null);
      }
      
      private function onClickView(param1:InteractionEvent) : void
      {
         if(!_selectedLine)
         {
            return;
         }
         if(_selectedLine.guild.id == User.current.character.guildId)
         {
            ViewManager.instance.showPanel("guild");
            return;
         }
         ViewManager.instance.loadGuild(_selectedLine.guild.id,closeCallback);
      }
      
      private function closeCallback() : void
      {
         close();
      }
      
      private function onClickAttack(param1:InteractionEvent) : void
      {
         if(!_selectedLine)
         {
            return;
         }
         Environment.application.sendActionRequest("checkAttackGuild",{
            "guild_id":_selectedLine.guild.id,
            "time":1
         },handleRequests);
      }
      
      private function sortByMembersLevelHonor(param1:GuildBattleSearchResult, param2:GuildBattleSearchResult) : int
      {
         if(param1.memberCount < param2.memberCount)
         {
            return 1;
         }
         if(param1.memberCount > param2.memberCount)
         {
            return -1;
         }
         if(param1.averageLevel < param2.averageLevel)
         {
            return 1;
         }
         if(param1.averageLevel > param2.averageLevel)
         {
            return -1;
         }
         if(param1.honor < param2.honor)
         {
            return 1;
         }
         if(param1.honor > param2.honor)
         {
            return -1;
         }
         return 0;
      }
      
      private function getClosestMatchingGuild() : GuildBattleSearchResult
      {
         var _loc6_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc2_:Number = NaN;
         var _loc9_:Number = NaN;
         var _loc4_:* = 999999;
         var _loc3_:* = null;
         var _loc7_:int = User.current.character.guild.memberCount;
         var _loc10_:int = User.current.character.guild.honor;
         var _loc5_:int = User.current.character.guild.averageLevel;
         var _loc12_:int = 0;
         var _loc11_:* = _guilds;
         for each(var _loc1_ in _guilds)
         {
            _loc6_ = Math.abs(_loc1_.memberCount - _loc7_);
            _loc8_ = Math.abs(_loc1_.averageLevel - _loc5_);
            _loc2_ = Math.abs(_loc1_.honor - _loc10_);
            _loc9_ = _loc8_ + _loc6_ + _loc2_ / 1000;
            if(_loc9_ < _loc4_)
            {
               _loc4_ = _loc9_;
               _loc3_ = _loc1_;
            }
         }
         return _loc3_;
      }
      
      private function getOffset(param1:GuildBattleSearchResult) : int
      {
         var _loc3_:int = 0;
         var _loc5_:int = 0;
         var _loc4_:* = _guilds;
         for each(var _loc2_ in _guilds)
         {
            if(_loc2_.id == param1.id)
            {
               return _loc3_;
            }
            _loc3_++;
         }
         return -1;
      }
      
      private function onClickClose(param1:InteractionEvent) : void
      {
         close();
      }
      
      private function handleRequests(param1:ActionRequestResponse) : void
      {
         var _loc5_:* = null;
         var _loc3_:* = null;
         var _loc4_:int = 0;
         var _loc6_:* = null;
         var _loc8_:* = param1.action;
         switch(_loc8_)
         {
            case "getGuildBattleList":
               if(param1.error == "")
               {
                  _guilds = new Vector.<GuildBattleSearchResult>();
                  _loc8_ = 0;
                  var _loc7_:* = param1.appResponse.guild_battle_entries;
                  for each(var _loc2_ in param1.appResponse.guild_battle_entries)
                  {
                     if(_loc2_.id != User.current.character.guildId)
                     {
                        _loc5_ = new GuildBattleSearchResult(_loc2_);
                        _guilds.push(_loc5_);
                     }
                  }
                  _offset = 0;
                  _guilds.sort(sortByMembersLevelHonor);
                  _loc3_ = getClosestMatchingGuild();
                  _loc4_ = getOffset(_loc3_);
                  _offset = int(Math.max(0,Math.min(_loc4_ - 12 / 2,currentGuildCount - 12)));
                  refreshList(true,_loc3_);
               }
               else
               {
                  Environment.reportError(param1.error,param1.request);
               }
               break;
            case "checkAttackGuild":
               if(param1.error == "")
               {
                  Environment.application.updateData(param1.data);
                  Environment.panelManager.showDialog(new DialogGuildBattleCreate(_selectedLine.guild.id));
                  close();
               }
               else if(param1.error == "errCreateInvalidGuild")
               {
                  Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/guild_battle_create_invalid_guild/title"),LocText.current.text("dialog/guild_battle_create_invalid_guild/text"),LocText.current.text("general/button_ok")));
               }
               else if(param1.error == "errCreateNoPermission")
               {
                  Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/guild_battle_create_no_permission/title"),LocText.current.text("dialog/guild_battle_create_no_permission/text"),LocText.current.text("general/button_ok")));
               }
               else if(param1.error == "errCreateAlreadyAttacking")
               {
                  Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/guild_battle_create_already_attacking/title"),LocText.current.text("dialog/guild_battle_create_already_attacking/text"),LocText.current.text("general/button_ok")));
               }
               else if(param1.error == "errCreateAttackingUs")
               {
                  Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/guild_battle_create_attacking_us/title"),LocText.current.text("dialog/guild_battle_create_attacking_us/text"),LocText.current.text("general/button_ok")));
               }
               else if(param1.error == "errCreateAlreadyAttacked")
               {
                  Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/guild_battle_create_already_attacked/title"),LocText.current.text("dialog/guild_battle_create_already_attacked/text"),LocText.current.text("general/button_ok")));
               }
               else if(param1.error == "errCreateNotYetAvailable")
               {
                  Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/guild_battle_create_not_yet_available/title"),LocText.current.text("dialog/guild_battle_create_not_yet_available/text"),LocText.current.text("general/button_ok")));
               }
               else if(param1.error.indexOf("errCreateCooldown_") != -1)
               {
                  _loc6_ = param1.error.substr("errCreateCooldown_".length);
                  Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/guild_battle_create_cooldown/title"),LocText.current.text("dialog/guild_battle_create_cooldown/text",_loc6_),LocText.current.text("general/button_ok")));
               }
               else if(param1.error == "errCreateSameGuild")
               {
                  Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/guild_battle_create_same_guild/title"),LocText.current.text("dialog/guild_battle_create_same_guild/text"),LocText.current.text("general/button_ok")));
               }
               else if(param1.error == "errCreateNoHonorTooStrong")
               {
                  Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/guild_battle_create_too_strong/title"),LocText.current.text("dialog/guild_battle_create_too_strong/text"),LocText.current.text("general/button_ok")));
               }
               else if(param1.error == "errCreateNoHonorTooWeak")
               {
                  Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/guild_battle_create_too_weak/title"),LocText.current.text("dialog/guild_battle_create_too_weak/text"),LocText.current.text("general/button_ok")));
               }
               else if(param1.error == "errCreateAlreadyFought")
               {
                  Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/guild_battle_character_already_fought/title"),LocText.current.text("dialog/guild_battle_character_already_fought/text"),LocText.current.text("general/button_ok")));
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
         return _btnAttack;
      }
      
      override public function onEscape() : void
      {
         close();
      }
   }
}
