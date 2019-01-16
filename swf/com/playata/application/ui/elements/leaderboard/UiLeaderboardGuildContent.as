package com.playata.application.ui.elements.leaderboard
{
   import com.playata.application.AppConfig;
   import com.playata.application.data.dataobject.DOLeaderboardGuild;
   import com.playata.application.data.guild.LeaderboardGuild;
   import com.playata.application.data.leaderboard.GuildLeaderboardContext;
   import com.playata.application.ui.elements.generic.checkbox.UiCheckBox;
   import com.playata.application.ui.elements.generic.dialog.UiInfoDialog;
   import com.playata.framework.application.Environment;
   import com.playata.framework.application.request.ActionRequestResponse;
   import com.playata.framework.core.util.TimeUtil;
   import com.playata.framework.display.InteractiveDisplayObject;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.elements.leaderboard.SymbolLeaderboardGuildContentGeneric;
   import visuals.ui.elements.leaderboard.SymbolLeaderboardGuildLineGeneric;
   
   public class UiLeaderboardGuildContent
   {
      
      public static var MAX_LINES:int = 12;
      
      private static const GUILD_LEADERBOARD_REFRESH_TIME:int = 30;
       
      
      private var _content:SymbolLeaderboardGuildContentGeneric = null;
      
      private var _refreshButtons:Function = null;
      
      private var _onClick:Function = null;
      
      private var _context:GuildLeaderboardContext = null;
      
      private var _selectedGuildLine:UiLeaderboardGuildLine = null;
      
      private var _guildLines:Vector.<UiLeaderboardGuildLine> = null;
      
      private var _iconSortByHonor:InteractiveDisplayObject = null;
      
      private var _iconSortByTotalPercentage:InteractiveDisplayObject = null;
      
      private var _icobSortByFans:InteractiveDisplayObject = null;
      
      private var _checkSameLocale:UiCheckBox = null;
      
      public function UiLeaderboardGuildContent(param1:SymbolLeaderboardGuildContentGeneric, param2:Function, param3:Function, param4:GuildLeaderboardContext)
      {
         var _loc5_:int = 0;
         super();
         _content = param1;
         _refreshButtons = param2;
         _onClick = param3;
         _context = param4;
         param1.txtNoGuilds.text = LocText.current.text("dialog/leaderboard_guild/no_guilds");
         param1.txtPositionCaption.text = LocText.current.text("dialog/leaderboard_guild/column_rank");
         param1.txtGuildCaption.text = LocText.current.text("dialog/leaderboard_guild/column_name");
         param1.txtHonorCaption.htmlText = "<a href=\'event:null\'>" + LocText.current.text("dialog/leaderboard_guild/column_honor") + "</a>";
         param1.txtTotalPercentageCaption.htmlText = "<a href=\'event:null\'>" + LocText.current.text("dialog/leaderboard_guild/column_total_percentage") + "</a>";
         param1.txtFansCaption.htmlText = "<a href=\'event:null\'>" + LocText.current.text("dialog/leaderboard_guild/column_fans") + "</a>";
         param1.txtNoGuilds.visible = false;
         _iconSortByHonor = new InteractiveDisplayObject(param1.iconSortByHonor);
         _iconSortByHonor.alpha = _context.guildSortType == 1?0.2:1;
         _iconSortByHonor.onClick.add(handleGuildHonorSortClick);
         param1.txtHonorCaption.onClick.add(handleGuildHonorSortClick);
         _iconSortByTotalPercentage = new InteractiveDisplayObject(param1.iconSortByTotalPercentage);
         _iconSortByTotalPercentage.alpha = _context.guildSortType == 2?1:0.2;
         _iconSortByTotalPercentage.onClick.add(handleGuildTotalPercentageSortClick);
         param1.txtTotalPercentageCaption.onClick.add(handleGuildTotalPercentageSortClick);
         _icobSortByFans = new InteractiveDisplayObject(param1.iconSortByFans);
         _icobSortByFans.alpha = _context.guildSortType == 3?1:0.2;
         _icobSortByFans.onClick.add(handleGuildFansSortClick);
         param1.txtFansCaption.onClick.add(handleGuildFansSortClick);
         if(AppConfig.teamLocaleEnabled)
         {
            MAX_LINES = 10;
            _checkSameLocale = new UiCheckBox(param1.checkOnlySameLocale,_context.showOnlySameLocale,"",onSameLocaleChanged,null,param1.txtOnlySameLocale);
            param1.txtOnlySameLocale.text = LocText.current.text("dialog/leaderboard/only_same_locale_guilds");
            param1.line11.visible = false;
            param1.line12.visible = false;
         }
         else
         {
            param1.checkOnlySameLocale.visible = false;
            param1.txtOnlySameLocale.visible = false;
         }
         _guildLines = new Vector.<UiLeaderboardGuildLine>();
         _loc5_ = 1;
         while(_loc5_ <= MAX_LINES)
         {
            _guildLines.push(new UiLeaderboardGuildLine(param1.getChildByName("line" + _loc5_) as SymbolLeaderboardGuildLineGeneric,_loc5_,selectGuildLine,doubleClickGuildLine));
            _loc5_++;
         }
      }
      
      public function dispose() : void
      {
         var _loc1_:int = 0;
         _iconSortByHonor.dispose();
         _iconSortByTotalPercentage.dispose();
         _icobSortByFans.dispose();
         _loc1_ = 0;
         while(_loc1_ < _guildLines.length)
         {
            _guildLines[_loc1_].dispose();
            _loc1_++;
         }
         _guildLines = null;
         if(_checkSameLocale)
         {
            _checkSameLocale.dispose();
            _checkSameLocale = null;
         }
      }
      
      public function show() : void
      {
         var _loc1_:Boolean = false;
         if(_context.lastGuildLeaderboardRefresh < TimeUtil.now - 30)
         {
            _loc1_ = true;
         }
         _content.txtNoGuilds.visible = false;
         if(_context.currentGuild == null)
         {
            Environment.application.sendActionRequest("retrieveGuildLeaderboard",{
               "sort_type":_context.guildSortType,
               "same_locale":_context.showOnlySameLocale
            },handleRequests);
         }
         else if(_loc1_ || _context.maxGuilds == 0)
         {
            Environment.application.sendActionRequest("retrieveGuildLeaderboard",{
               "guild_name":_context.currentGuild.name,
               "sort_type":_context.guildSortType,
               "same_locale":_context.showOnlySameLocale
            },handleRequests);
         }
         else
         {
            refreshGuildList();
         }
      }
      
      private function onSameLocaleChanged(param1:Boolean) : void
      {
         _context.showOnlySameLocale = param1;
         _context.currentGuild = null;
         _selectedGuildLine = null;
         _context.selectGuildLine = false;
         Environment.application.sendActionRequest("retrieveGuildLeaderboard",{
            "sort_type":_context.guildSortType,
            "same_locale":_context.showOnlySameLocale
         },handleRequests);
      }
      
      public function get currentGuild() : LeaderboardGuild
      {
         return _context.currentGuild;
      }
      
      public function set currentGuild(param1:LeaderboardGuild) : void
      {
         _context.currentGuild = param1;
      }
      
      private function getGuildLine(param1:int) : UiLeaderboardGuildLine
      {
         if(param1 >= _guildLines.length || param1 < 0)
         {
            return null;
         }
         return _guildLines[param1 - 1];
      }
      
      public function get guildCount() : int
      {
         return _context.guilds.length;
      }
      
      private function selectGuildLine(param1:UiLeaderboardGuildLine) : void
      {
         var _loc2_:int = 0;
         _selectedGuildLine = param1;
         if(_selectedGuildLine != null)
         {
            _context.currentGuild = _selectedGuildLine.guild;
         }
         _loc2_ = 0;
         while(_loc2_ < _guildLines.length)
         {
            _guildLines[_loc2_].highlight(_guildLines[_loc2_] == _selectedGuildLine);
            _loc2_++;
         }
      }
      
      private function doubleClickGuildLine(param1:UiLeaderboardGuildLine) : void
      {
         selectGuildLine(param1);
      }
      
      public function scrollToTop() : void
      {
         _context.selectGuildLine = true;
         Environment.application.sendActionRequest("retrieveGuildLeaderboard",{
            "rank":1,
            "sort_type":_context.guildSortType,
            "same_locale":_context.showOnlySameLocale
         },handleRequests);
      }
      
      public function refreshGuildList() : void
      {
         var _loc1_:int = 0;
         var _loc2_:Boolean = false;
         if(!_guildLines)
         {
            return;
         }
         _content.txtNoGuilds.visible = guildCount == 0;
         if(_refreshButtons != null)
         {
            _refreshButtons();
         }
         if(_selectedGuildLine != null)
         {
            _context.currentGuild = _selectedGuildLine.guild;
         }
         _loc1_ = 0;
         while(_loc1_ < _guildLines.length)
         {
            _guildLines[_loc1_].refresh(_context.guilds.length >= _context.offsetGuilds + _loc1_ + 1?_context.guilds[_context.offsetGuilds + _loc1_]:null,_loc1_ + 1);
            _loc1_++;
         }
         if(_context.currentGuild)
         {
            _loc2_ = false;
            _loc1_ = 0;
            while(_loc1_ < _guildLines.length)
            {
               if(_guildLines[_loc1_].guild && _guildLines[_loc1_].guild.id == _context.currentGuild.id)
               {
                  selectGuildLine(_guildLines[_loc1_]);
                  _loc2_ = true;
                  break;
               }
               _loc1_++;
            }
            if(!_loc2_)
            {
               selectGuildLine(null);
            }
         }
         else if(_guildLines[1].guild)
         {
            selectGuildLine(_guildLines[1]);
         }
      }
      
      private function handleGuildHonorSortClick(param1:InteractionEvent) : void
      {
         Environment.audio.playFX("ui_button_click.mp3");
         if(_context.guildSortType == 1)
         {
            return;
         }
         _context.guildSortType = 1;
         Environment.application.sendActionRequest("retrieveGuildLeaderboard",{
            "guild_name":_context.currentGuild.name,
            "sort_type":_context.guildSortType,
            "same_locale":_context.showOnlySameLocale
         },handleRequests);
         _content.iconSortByTotalPercentage.alpha = 0.2;
         _content.iconSortByHonor.alpha = 1;
         _content.iconSortByFans.alpha = 0.2;
      }
      
      private function handleGuildTotalPercentageSortClick(param1:InteractionEvent) : void
      {
         Environment.audio.playFX("ui_button_click.mp3");
         if(_context.guildSortType == 2)
         {
            return;
         }
         _context.guildSortType = 2;
         Environment.application.sendActionRequest("retrieveGuildLeaderboard",{
            "guild_name":_context.currentGuild.name,
            "sort_type":_context.guildSortType,
            "same_locale":_context.showOnlySameLocale
         },handleRequests);
         _content.iconSortByTotalPercentage.alpha = 1;
         _content.iconSortByHonor.alpha = 0.2;
         _content.iconSortByFans.alpha = 0.2;
      }
      
      private function handleGuildFansSortClick(param1:InteractionEvent) : void
      {
         Environment.audio.playFX("ui_button_click.mp3");
         if(_context.guildSortType == 3)
         {
            return;
         }
         _context.guildSortType = 3;
         Environment.application.sendActionRequest("retrieveGuildLeaderboard",{
            "guild_name":_context.currentGuild.name,
            "sort_type":_context.guildSortType,
            "same_locale":_context.showOnlySameLocale
         },handleRequests);
         _content.iconSortByTotalPercentage.alpha = 0.2;
         _content.iconSortByHonor.alpha = 0.2;
         _content.iconSortByFans.alpha = 1;
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
            Environment.application.sendActionRequest("retrieveGuildLeaderboard",{
               "rank":_loc3_.rank - 1,
               "sort_type":_context.guildSortType,
               "same_locale":_context.showOnlySameLocale
            },handleRequests);
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
         if(_context.offsetGuilds > guildCount - MAX_LINES)
         {
            _context.offsetGuilds = guildCount - MAX_LINES;
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
            Environment.application.sendActionRequest("retrieveGuildLeaderboard",{
               "rank":_loc3_.rank + 1,
               "sort_type":_context.guildSortType,
               "same_locale":_context.showOnlySameLocale
            },handleRequests);
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
            Environment.application.sendActionRequest("retrieveGuildLeaderboard",{
               "guild_name":param1,
               "sort_type":_context.guildSortType,
               "same_locale":_context.showOnlySameLocale
            },handleRequests);
         }
         else
         {
            _loc2_ = parseInt(param1);
            if(_loc2_.toString() != param1)
            {
               _loc2_ = 2147483647;
            }
            Environment.application.sendActionRequest("retrieveGuildLeaderboard",{
               "rank":_loc2_,
               "sort_type":_context.guildSortType,
               "same_locale":_context.showOnlySameLocale
            },handleRequests);
         }
      }
      
      private function handleRequests(param1:ActionRequestResponse) : void
      {
         var _loc2_:* = null;
         var _loc6_:int = 0;
         var _loc5_:int = 0;
         var _loc8_:* = param1.action;
         if("retrieveGuildLeaderboard" !== _loc8_)
         {
            throw new Error("Unsupported request action \'" + param1.action + "\'!");
         }
         if(param1.error == "")
         {
            Environment.application.updateData(param1.data);
            if(!_guildLines)
            {
               return;
            }
            _context.lastGuildLeaderboardRefresh = TimeUtil.now;
            _context.guilds = new Vector.<LeaderboardGuild>();
            _loc8_ = 0;
            var _loc7_:* = param1.appResponse.leaderboard_guilds;
            for each(var _loc3_ in param1.appResponse.leaderboard_guilds)
            {
               _loc2_ = new LeaderboardGuild(_loc3_);
               _context.guilds.push(_loc2_);
            }
            _context.maxGuilds = param1.appResponse.max_guilds;
            _loc6_ = param1.appResponse.centered_rank;
            if(_context.offsetGuilds > guildCount - MAX_LINES)
            {
               _context.offsetGuilds = Math.max(0,guildCount - MAX_LINES);
            }
            refreshGuildList();
            _loc5_ = 1;
            if(_context.selectGuildLine)
            {
               var _loc10_:int = 0;
               var _loc9_:* = _context.guilds;
               for each(var _loc4_ in _context.guilds)
               {
                  if(_loc4_.rank == _loc6_ || param1.request.hasData("rank") && _loc4_.rank == param1.request.getInt("rank"))
                  {
                     if(_loc5_ > MAX_LINES)
                     {
                        _context.offsetGuilds = _loc5_ - MAX_LINES / 2 + 1;
                        if(_context.offsetGuilds > guildCount - MAX_LINES)
                        {
                           _context.offsetGuilds = guildCount - MAX_LINES;
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
               var _loc12_:int = 0;
               var _loc11_:* = _context.guilds;
               for each(_loc4_ in _context.guilds)
               {
                  if(_loc4_.rank == param1.request.getInt("rank"))
                  {
                     if(_loc5_ > MAX_LINES)
                     {
                        if(_context.scrollUp)
                        {
                           _context.offsetGuilds = _loc5_ - 1;
                        }
                        else
                        {
                           _context.offsetGuilds = _loc5_ - MAX_LINES;
                        }
                        if(_context.offsetGuilds > guildCount - MAX_LINES)
                        {
                           _context.offsetGuilds = guildCount - MAX_LINES;
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
         else if(param1.error == "errRetrieveGuildLeaderboardInvalidGuild")
         {
            Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("error/retrieve_guild_leaderboard_invalid_guild_title"),LocText.current.text("error/retrieve_guild_leaderboard_invalid_guild_text"),LocText.current.text("general/button_ok")));
         }
         else if(param1.error == "errRetrieveGuildLeaderboardInvalidRank")
         {
            Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("error/retrieve_guild_leaderboard_invalid_rank_title"),LocText.current.text("error/retrieve_guild_leaderboard_invalid_rank_text"),LocText.current.text("general/button_ok")));
         }
         else
         {
            Environment.reportError(param1.error,param1.request);
         }
      }
   }
}
