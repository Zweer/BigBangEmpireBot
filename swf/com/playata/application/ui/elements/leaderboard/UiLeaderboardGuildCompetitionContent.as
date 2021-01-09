package com.playata.application.ui.elements.leaderboard
{
   import com.playata.application.data.dataobject.DOLeaderboardGuildCompetition;
   import com.playata.application.data.guild.LeaderboardGuildCompetition;
   import com.playata.application.data.leaderboard.GuildCompetitionLeaderboardContext;
   import com.playata.application.ui.elements.generic.dialog.UiInfoDialog;
   import com.playata.framework.application.Environment;
   import com.playata.framework.application.request.ActionRequestResponse;
   import com.playata.framework.core.util.TimeUtil;
   import com.playata.framework.localization.LocText;
   import visuals.ui.elements.leaderboard.SymbolLeaderboardGuildCompetitionContentGeneric;
   
   public class UiLeaderboardGuildCompetitionContent
   {
      
      public static const MAX_LINES:int = 9;
      
      private static const GUILD_COMPETITION_LEADERBOARD_REFRESH_TIME:int = 30;
       
      
      private var _content:SymbolLeaderboardGuildCompetitionContentGeneric = null;
      
      private var _refreshButtons:Function = null;
      
      private var _onClick:Function = null;
      
      private var _context:GuildCompetitionLeaderboardContext = null;
      
      private var _selectedGuildLine:UiLeaderboardGuildCompetitionLine = null;
      
      private var _refreshTicker:Function = null;
      
      private var _guildLine1:UiLeaderboardGuildCompetitionLine = null;
      
      private var _guildLine2:UiLeaderboardGuildCompetitionLine = null;
      
      private var _guildLine3:UiLeaderboardGuildCompetitionLine = null;
      
      private var _guildLine4:UiLeaderboardGuildCompetitionLine = null;
      
      private var _guildLine5:UiLeaderboardGuildCompetitionLine = null;
      
      private var _guildLine6:UiLeaderboardGuildCompetitionLine = null;
      
      private var _guildLine7:UiLeaderboardGuildCompetitionLine = null;
      
      private var _guildLine8:UiLeaderboardGuildCompetitionLine = null;
      
      private var _guildLine9:UiLeaderboardGuildCompetitionLine = null;
      
      public function UiLeaderboardGuildCompetitionContent(param1:SymbolLeaderboardGuildCompetitionContentGeneric, param2:Function, param3:Function, param4:Function, param5:GuildCompetitionLeaderboardContext)
      {
         super();
         _content = param1;
         _refreshButtons = param2;
         _onClick = param3;
         _refreshTicker = param4;
         _context = param5;
         param1.txtNoGuilds.text = LocText.current.text("dialog/leaderboard_guild_competition/no_guilds");
         param1.txtPositionCaption.text = LocText.current.text("dialog/leaderboard_guild/column_rank");
         param1.txtGuildCaption.text = LocText.current.text("dialog/leaderboard_guild/column_name");
         param1.txtGuildCompetitionCaption.text = LocText.current.text("dialog/leaderboard_guild_competition/column_score");
         param1.txtRewardCaption.htmlText = LocText.current.text("dialog/leaderboard_guild_competition/column_reward");
         param1.txtNoGuilds.visible = false;
         _guildLine1 = new UiLeaderboardGuildCompetitionLine(param1.line1,1,selectGuildLine,doubleClickGuildLine);
         _guildLine2 = new UiLeaderboardGuildCompetitionLine(param1.line2,2,selectGuildLine,doubleClickGuildLine);
         _guildLine3 = new UiLeaderboardGuildCompetitionLine(param1.line3,3,selectGuildLine,doubleClickGuildLine);
         _guildLine4 = new UiLeaderboardGuildCompetitionLine(param1.line4,4,selectGuildLine,doubleClickGuildLine);
         _guildLine5 = new UiLeaderboardGuildCompetitionLine(param1.line5,5,selectGuildLine,doubleClickGuildLine);
         _guildLine6 = new UiLeaderboardGuildCompetitionLine(param1.line6,6,selectGuildLine,doubleClickGuildLine);
         _guildLine7 = new UiLeaderboardGuildCompetitionLine(param1.line7,7,selectGuildLine,doubleClickGuildLine);
         _guildLine8 = new UiLeaderboardGuildCompetitionLine(param1.line8,8,selectGuildLine,doubleClickGuildLine);
         _guildLine9 = new UiLeaderboardGuildCompetitionLine(param1.line9,9,selectGuildLine,doubleClickGuildLine);
      }
      
      public function dispose() : void
      {
         _guildLine1.dispose();
         _guildLine1 = null;
         _guildLine2.dispose();
         _guildLine2 = null;
         _guildLine3.dispose();
         _guildLine3 = null;
         _guildLine4.dispose();
         _guildLine4 = null;
         _guildLine5.dispose();
         _guildLine5 = null;
         _guildLine6.dispose();
         _guildLine6 = null;
         _guildLine7.dispose();
         _guildLine7 = null;
         _guildLine8.dispose();
         _guildLine8 = null;
         _guildLine9.dispose();
         _guildLine9 = null;
      }
      
      public function show() : void
      {
         var _loc1_:Boolean = false;
         if(_context.lastGuildCompetitionLeaderboardRefresh < TimeUtil.now - 30)
         {
            _loc1_ = true;
         }
         _content.txtNoGuilds.visible = false;
         if(_context.currentGuild == null)
         {
            Environment.application.sendActionRequest("retrieveGuildCompetitionTournamentLeaderboard",{},handleRequests);
         }
         else if(_loc1_ || _context.maxGuilds == 0)
         {
            Environment.application.sendActionRequest("retrieveGuildCompetitionTournamentLeaderboard",{"guild_name":_context.currentGuild.name},handleRequests);
         }
         else
         {
            refreshGuildList();
         }
      }
      
      public function get currentGuild() : LeaderboardGuildCompetition
      {
         return _context.currentGuild;
      }
      
      public function set currentGuild(param1:LeaderboardGuildCompetition) : void
      {
         _context.currentGuild = param1;
      }
      
      private function getGuildLine(param1:int) : UiLeaderboardGuildCompetitionLine
      {
         switch(int(param1) - 1)
         {
            case 0:
               return _guildLine1;
            case 1:
               return _guildLine2;
            case 2:
               return _guildLine3;
            case 3:
               return _guildLine4;
            case 4:
               return _guildLine5;
            case 5:
               return _guildLine6;
            case 6:
               return _guildLine7;
            case 7:
               return _guildLine8;
            case 8:
               return _guildLine9;
         }
      }
      
      public function get guildCount() : int
      {
         return _context.guilds.length;
      }
      
      private function selectGuildLine(param1:UiLeaderboardGuildCompetitionLine) : void
      {
         _selectedGuildLine = param1;
         if(_selectedGuildLine != null)
         {
            _context.currentGuild = _selectedGuildLine.guild;
         }
         _guildLine1.highlight(_guildLine1 == _selectedGuildLine);
         _guildLine2.highlight(_guildLine2 == _selectedGuildLine);
         _guildLine3.highlight(_guildLine3 == _selectedGuildLine);
         _guildLine4.highlight(_guildLine4 == _selectedGuildLine);
         _guildLine5.highlight(_guildLine5 == _selectedGuildLine);
         _guildLine6.highlight(_guildLine6 == _selectedGuildLine);
         _guildLine7.highlight(_guildLine7 == _selectedGuildLine);
         _guildLine8.highlight(_guildLine8 == _selectedGuildLine);
         _guildLine9.highlight(_guildLine9 == _selectedGuildLine);
      }
      
      private function doubleClickGuildLine(param1:UiLeaderboardGuildCompetitionLine) : void
      {
         selectGuildLine(param1);
      }
      
      public function scrollToTop() : void
      {
         _context.selectGuildLine = true;
         Environment.application.sendActionRequest("retrieveGuildCompetitionTournamentLeaderboard",{"rank":1},handleRequests);
      }
      
      public function refreshGuildList(param1:Boolean = false) : void
      {
         if(!_guildLine1)
         {
            return;
         }
         _content.txtNoGuilds.visible = guildCount == 0 && !param1;
         if(_refreshButtons != null)
         {
            _refreshButtons();
         }
         if(_selectedGuildLine != null)
         {
            _context.currentGuild = _selectedGuildLine.guild;
         }
         _guildLine1.refresh(_context.guilds.length >= _context.offsetGuilds + 1?_context.guilds[_context.offsetGuilds + 0]:null,1,_context.guildsWithReward);
         _guildLine2.refresh(_context.guilds.length >= _context.offsetGuilds + 2?_context.guilds[_context.offsetGuilds + 1]:null,2,_context.guildsWithReward);
         _guildLine3.refresh(_context.guilds.length >= _context.offsetGuilds + 3?_context.guilds[_context.offsetGuilds + 2]:null,3,_context.guildsWithReward);
         _guildLine4.refresh(_context.guilds.length >= _context.offsetGuilds + 4?_context.guilds[_context.offsetGuilds + 3]:null,4,_context.guildsWithReward);
         _guildLine5.refresh(_context.guilds.length >= _context.offsetGuilds + 5?_context.guilds[_context.offsetGuilds + 4]:null,5,_context.guildsWithReward);
         _guildLine6.refresh(_context.guilds.length >= _context.offsetGuilds + 6?_context.guilds[_context.offsetGuilds + 5]:null,6,_context.guildsWithReward);
         _guildLine7.refresh(_context.guilds.length >= _context.offsetGuilds + 7?_context.guilds[_context.offsetGuilds + 6]:null,7,_context.guildsWithReward);
         _guildLine8.refresh(_context.guilds.length >= _context.offsetGuilds + 8?_context.guilds[_context.offsetGuilds + 7]:null,8,_context.guildsWithReward);
         _guildLine9.refresh(_context.guilds.length >= _context.offsetGuilds + 9?_context.guilds[_context.offsetGuilds + 8]:null,9,_context.guildsWithReward);
         if(_context.currentGuild)
         {
            if(_guildLine1.guild && _guildLine1.guild.id == _context.currentGuild.id)
            {
               selectGuildLine(_guildLine1);
            }
            else if(_guildLine2.guild && _guildLine2.guild.id == _context.currentGuild.id)
            {
               selectGuildLine(_guildLine2);
            }
            else if(_guildLine3.guild && _guildLine3.guild.id == _context.currentGuild.id)
            {
               selectGuildLine(_guildLine3);
            }
            else if(_guildLine4.guild && _guildLine4.guild.id == _context.currentGuild.id)
            {
               selectGuildLine(_guildLine4);
            }
            else if(_guildLine5.guild && _guildLine5.guild.id == _context.currentGuild.id)
            {
               selectGuildLine(_guildLine5);
            }
            else if(_guildLine6.guild && _guildLine6.guild.id == _context.currentGuild.id)
            {
               selectGuildLine(_guildLine6);
            }
            else if(_guildLine7.guild && _guildLine7.guild.id == _context.currentGuild.id)
            {
               selectGuildLine(_guildLine7);
            }
            else if(_guildLine8.guild && _guildLine8.guild.id == _context.currentGuild.id)
            {
               selectGuildLine(_guildLine8);
            }
            else if(_guildLine9.guild && _guildLine9.guild.id == _context.currentGuild.id)
            {
               selectGuildLine(_guildLine9);
            }
            else
            {
               selectGuildLine(null);
            }
         }
         else if(_guildLine1.guild)
         {
            selectGuildLine(_guildLine1);
         }
      }
      
      public function scrollUp(param1:int, param2:Boolean) : void
      {
         var _loc3_:* = null;
         if(_context.guilds.length <= 0)
         {
            return;
         }
         _context.offsetGuilds = _context.offsetGuilds - param1;
         if(_context.offsetGuilds < 0)
         {
            _context.offsetGuilds = 0;
            _loc3_ = _context.guilds[0];
            if(_loc3_.rank <= 1)
            {
               refreshGuildList();
               return;
            }
            if(param2)
            {
               Environment.audio.playFX("ui_button_click.mp3");
            }
            _context.scrollUp = true;
            _context.selectGuildLine = false;
            Environment.application.sendActionRequest("retrieveGuildCompetitionTournamentLeaderboard",{"rank":_loc3_.rank - 1},handleRequests);
            return;
         }
         if(param2)
         {
            Environment.audio.playFX("ui_button_click.mp3");
         }
         refreshGuildList();
      }
      
      public function scrollDown(param1:int, param2:Boolean) : void
      {
         var _loc3_:* = null;
         if(_context.guilds.length <= 0)
         {
            return;
         }
         _context.offsetGuilds = _context.offsetGuilds + param1;
         if(_context.offsetGuilds > guildCount - 9)
         {
            _context.offsetGuilds = guildCount - 9;
            _loc3_ = _context.guilds[_context.guilds.length - 1];
            if(_loc3_.rank >= _context.maxGuilds)
            {
               refreshGuildList();
               return;
            }
            if(param2)
            {
               Environment.audio.playFX("ui_button_click.mp3");
            }
            _context.scrollUp = false;
            _context.selectGuildLine = false;
            Environment.application.sendActionRequest("retrieveGuildCompetitionTournamentLeaderboard",{"rank":_loc3_.rank + 1},handleRequests);
            return;
         }
         if(param2)
         {
            Environment.audio.playFX("ui_button_click.mp3");
         }
         refreshGuildList();
      }
      
      public function search(param1:String) : void
      {
         var _loc2_:int = 0;
         _context.selectGuildLine = true;
         if(isNaN(parseInt(param1)))
         {
            Environment.application.sendActionRequest("retrieveGuildCompetitionTournamentLeaderboard",{"guild_name":param1},handleRequests);
         }
         else
         {
            _loc2_ = parseInt(param1);
            if(_loc2_.toString() != param1)
            {
               _loc2_ = 2147483647;
            }
            Environment.application.sendActionRequest("retrieveGuildCompetitionTournamentLeaderboard",{"rank":_loc2_},handleRequests);
         }
      }
      
      private function handleRequests(param1:ActionRequestResponse) : void
      {
         var _loc2_:* = null;
         var _loc7_:int = 0;
         var _loc6_:* = null;
         var _loc5_:int = 1;
         var _loc9_:* = param1.action;
         if("retrieveGuildCompetitionTournamentLeaderboard" !== _loc9_)
         {
            throw new Error("Unsupported request action \'" + param1.action + "\'!");
         }
         if(param1.error == "")
         {
            Environment.application.updateData(param1.data);
            if(!_guildLine1)
            {
               return;
            }
            _context.lastGuildCompetitionLeaderboardRefresh = TimeUtil.now;
            _context.guilds = new Vector.<LeaderboardGuildCompetition>();
            _loc9_ = 0;
            var _loc8_:* = param1.appResponse.leaderboard_guild_competitions;
            for each(var _loc3_ in param1.appResponse.leaderboard_guild_competitions)
            {
               _loc2_ = new LeaderboardGuildCompetition(_loc3_);
               _context.guilds.push(_loc2_);
            }
            _context.maxGuilds = param1.appResponse.max_guild_competitions;
            _context.guildsWithReward = param1.appResponse.guilds_with_rewards;
            _loc7_ = param1.appResponse.centered_rank;
            if(param1.appResponse.guild_competition_tournament_end_timestamp && param1.appResponse.guild_competition_tournament_end_timestamp > 0 && _context.endTimestamp != param1.appResponse.guild_competition_tournament_end_timestamp)
            {
               _context.endTimestamp = param1.appResponse.guild_competition_tournament_end_timestamp;
               _refreshTicker();
            }
            refreshGuildList();
            if(_context.selectGuildLine)
            {
               var _loc11_:int = 0;
               var _loc10_:* = _context.guilds;
               for each(var _loc4_ in _context.guilds)
               {
                  if(_loc4_.rank == _loc7_)
                  {
                     if(_loc5_ > 9)
                     {
                        _context.offsetGuilds = int(_loc5_ - 9 / 2 + 1);
                        if(_context.offsetGuilds > guildCount - 9)
                        {
                           _context.offsetGuilds = guildCount - 9;
                        }
                        refreshGuildList();
                     }
                     else
                     {
                        _context.offsetGuilds = 0;
                        refreshGuildList();
                     }
                     selectGuildLine(getGuildLine(_loc5_ - _context.offsetGuilds));
                     break;
                  }
                  _loc5_++;
               }
            }
            else if(param1.request.hasData("rank"))
            {
               _loc5_ = 1;
               var _loc13_:int = 0;
               var _loc12_:* = _context.guilds;
               for each(_loc4_ in _context.guilds)
               {
                  if(_loc4_.rank == param1.request.getInt("rank"))
                  {
                     if(_loc5_ > 9)
                     {
                        if(_context.scrollUp)
                        {
                           _context.offsetGuilds = _loc5_ - 1;
                        }
                        else
                        {
                           _context.offsetGuilds = _loc5_ - 9;
                        }
                        if(_context.offsetGuilds > guildCount - 9)
                        {
                           _context.offsetGuilds = guildCount - 9;
                        }
                        refreshGuildList();
                     }
                     else
                     {
                        _context.offsetGuilds = 0;
                        refreshGuildList();
                     }
                     break;
                  }
                  _loc5_++;
               }
            }
         }
         else if(param1.error == "errTournamentLocked")
         {
            refreshGuildList();
         }
         else if(param1.error.indexOf("errRetrieveLeaderboardEmpty_") != -1)
         {
            _context.reset();
            _loc6_ = param1.error.substr("errRetrieveLeaderboardEmpty_".length);
            _context.endTimestamp = parseInt(_loc6_);
            refreshGuildList();
         }
         else if(param1.error == "errRetrieveLeaderboardInvalidGuild")
         {
            Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("error/retrieve_guild_leaderboard_invalid_guild_title"),LocText.current.text("error/retrieve_guild_leaderboard_invalid_guild_text"),LocText.current.text("general/button_ok")));
         }
         else if(param1.error == "errRetrieveLeaderboardInvalidRank")
         {
            Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("error/retrieve_guild_leaderboard_invalid_rank_title"),LocText.current.text("error/retrieve_guild_leaderboard_invalid_rank_text"),LocText.current.text("general/button_ok")));
         }
         else
         {
            Environment.reportError(param1.error,param1.request);
         }
      }
      
      public function get context() : GuildCompetitionLeaderboardContext
      {
         return _context;
      }
      
      public function set visible(param1:Boolean) : void
      {
         _content.visible = param1;
      }
   }
}
