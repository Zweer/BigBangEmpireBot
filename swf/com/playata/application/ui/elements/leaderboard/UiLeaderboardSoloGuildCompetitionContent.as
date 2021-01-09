package com.playata.application.ui.elements.leaderboard
{
   import com.playata.application.data.dataobject.DOLeaderboardSoloGuildCompetition;
   import com.playata.application.data.guild.LeaderboardSoloGuildCompetition;
   import com.playata.application.data.leaderboard.SoloGuildCompetitionLeaderboardContext;
   import com.playata.application.ui.elements.generic.dialog.UiInfoDialog;
   import com.playata.framework.application.Environment;
   import com.playata.framework.application.request.ActionRequestResponse;
   import com.playata.framework.core.util.TimeUtil;
   import com.playata.framework.localization.LocText;
   import visuals.ui.elements.leaderboard.SymbolLeaderboardSoloGuildCompetitionContentGeneric;
   
   public class UiLeaderboardSoloGuildCompetitionContent
   {
      
      public static const MAX_LINES:int = 9;
      
      private static const SOLO_GUILD_COMPETITION_LEADERBOARD_REFRESH_TIME:int = 30;
       
      
      private var _content:SymbolLeaderboardSoloGuildCompetitionContentGeneric = null;
      
      private var _refreshButtons:Function = null;
      
      private var _onClick:Function = null;
      
      private var _refreshTicker:Function;
      
      private var _onSelectCharacter:Function;
      
      private var _context:SoloGuildCompetitionLeaderboardContext = null;
      
      private var _selectedLine:UiLeaderboardSoloGuildCompetitionLine = null;
      
      private var _line1:UiLeaderboardSoloGuildCompetitionLine = null;
      
      private var _line2:UiLeaderboardSoloGuildCompetitionLine = null;
      
      private var _line3:UiLeaderboardSoloGuildCompetitionLine = null;
      
      private var _line4:UiLeaderboardSoloGuildCompetitionLine = null;
      
      private var _line5:UiLeaderboardSoloGuildCompetitionLine = null;
      
      private var _line6:UiLeaderboardSoloGuildCompetitionLine = null;
      
      private var _line7:UiLeaderboardSoloGuildCompetitionLine = null;
      
      private var _line8:UiLeaderboardSoloGuildCompetitionLine = null;
      
      private var _line9:UiLeaderboardSoloGuildCompetitionLine = null;
      
      public function UiLeaderboardSoloGuildCompetitionContent(param1:SymbolLeaderboardSoloGuildCompetitionContentGeneric, param2:Function, param3:Function, param4:Function, param5:Function, param6:SoloGuildCompetitionLeaderboardContext)
      {
         super();
         _content = param1;
         _refreshButtons = param2;
         _refreshTicker = param4;
         _onClick = param3;
         _context = param6;
         _onSelectCharacter = param5;
         param1.txtNoData.text = LocText.current.text("dialog/leaderboard_solo_guild_competition/no_characters");
         param1.txtPositionCaption.text = LocText.current.text("dialog/leaderboard_guild/column_rank");
         param1.txtPlayerCaption.text = LocText.current.text("dialog/leaderboard/column_name");
         param1.txtGuildCaption.text = LocText.current.text("dialog/leaderboard_guild/column_name");
         param1.txtScoreCaption.text = LocText.current.text("dialog/leaderboard_guild_competition/column_score");
         param1.txtValueCaption.text = LocText.current.text("dialog/leaderboard_guild_competition/column_reward");
         param1.txtNoData.visible = false;
         _line1 = new UiLeaderboardSoloGuildCompetitionLine(param1.line1,1,selectCharacterLine,doubleClickCharacterLine);
         _line2 = new UiLeaderboardSoloGuildCompetitionLine(param1.line2,2,selectCharacterLine,doubleClickCharacterLine);
         _line3 = new UiLeaderboardSoloGuildCompetitionLine(param1.line3,3,selectCharacterLine,doubleClickCharacterLine);
         _line4 = new UiLeaderboardSoloGuildCompetitionLine(param1.line4,4,selectCharacterLine,doubleClickCharacterLine);
         _line5 = new UiLeaderboardSoloGuildCompetitionLine(param1.line5,5,selectCharacterLine,doubleClickCharacterLine);
         _line6 = new UiLeaderboardSoloGuildCompetitionLine(param1.line6,6,selectCharacterLine,doubleClickCharacterLine);
         _line7 = new UiLeaderboardSoloGuildCompetitionLine(param1.line7,7,selectCharacterLine,doubleClickCharacterLine);
         _line8 = new UiLeaderboardSoloGuildCompetitionLine(param1.line8,8,selectCharacterLine,doubleClickCharacterLine);
         _line9 = new UiLeaderboardSoloGuildCompetitionLine(param1.line9,9,selectCharacterLine,doubleClickCharacterLine);
      }
      
      public function dispose() : void
      {
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
      }
      
      public function show() : void
      {
         var _loc1_:Boolean = false;
         if(_context.lastSoloGuildCompetitionLeaderboardRefresh < TimeUtil.now - 30)
         {
            _loc1_ = true;
         }
         _content.txtNoData.visible = false;
         if(_context.currentCharacter == null)
         {
            Environment.application.sendActionRequest("retrieveSoloGuildCompetitionTournamentLeaderboard",{},handleRequests);
         }
         else if(_loc1_ || _context.maxCharacters == 0)
         {
            Environment.application.sendActionRequest("retrieveSoloGuildCompetitionTournamentLeaderboard",{"character_name":_context.currentCharacter.name},handleRequests);
         }
         else
         {
            refreshCharacterList();
         }
      }
      
      public function get currentCharacter() : LeaderboardSoloGuildCompetition
      {
         return _context.currentCharacter;
      }
      
      public function set currentCharacter(param1:LeaderboardSoloGuildCompetition) : void
      {
         _context.currentCharacter = param1;
      }
      
      private function getGuildLine(param1:int) : UiLeaderboardSoloGuildCompetitionLine
      {
         switch(int(param1) - 1)
         {
            case 0:
               return _line1;
            case 1:
               return _line2;
            case 2:
               return _line3;
            case 3:
               return _line4;
            case 4:
               return _line5;
            case 5:
               return _line6;
            case 6:
               return _line7;
            case 7:
               return _line8;
            case 8:
               return _line9;
         }
      }
      
      public function get characterCount() : int
      {
         return _context.characters.length;
      }
      
      private function selectCharacterLine(param1:UiLeaderboardSoloGuildCompetitionLine) : void
      {
         _selectedLine = param1;
         if(_selectedLine != null)
         {
            currentCharacter = _selectedLine.character;
         }
         _line1.highlight(_line1 == _selectedLine);
         _line2.highlight(_line2 == _selectedLine);
         _line3.highlight(_line3 == _selectedLine);
         _line4.highlight(_line4 == _selectedLine);
         _line5.highlight(_line5 == _selectedLine);
         _line6.highlight(_line6 == _selectedLine);
         _line7.highlight(_line7 == _selectedLine);
         _line8.highlight(_line8 == _selectedLine);
         _line9.highlight(_line9 == _selectedLine);
      }
      
      private function doubleClickCharacterLine(param1:UiLeaderboardSoloGuildCompetitionLine) : void
      {
         selectCharacterLine(param1);
      }
      
      public function scrollToTop() : void
      {
         _context.selectCharacterLine = true;
         Environment.application.sendActionRequest("retrieveSoloGuildCompetitionTournamentLeaderboard",{"rank":1},handleRequests);
      }
      
      public function refreshCharacterList(param1:Boolean = false) : void
      {
         if(!_line1)
         {
            return;
         }
         _content.txtNoData.visible = characterCount == 0 && !param1;
         if(_refreshButtons != null)
         {
            _refreshButtons();
         }
         if(_selectedLine != null)
         {
            currentCharacter = _selectedLine.character;
         }
         _line1.refresh(_context.characters.length >= _context.offsetCharacters + 1?_context.characters[_context.offsetCharacters + 0]:null,1);
         _line2.refresh(_context.characters.length >= _context.offsetCharacters + 2?_context.characters[_context.offsetCharacters + 1]:null,2);
         _line3.refresh(_context.characters.length >= _context.offsetCharacters + 3?_context.characters[_context.offsetCharacters + 2]:null,3);
         _line4.refresh(_context.characters.length >= _context.offsetCharacters + 4?_context.characters[_context.offsetCharacters + 3]:null,4);
         _line5.refresh(_context.characters.length >= _context.offsetCharacters + 5?_context.characters[_context.offsetCharacters + 4]:null,5);
         _line6.refresh(_context.characters.length >= _context.offsetCharacters + 6?_context.characters[_context.offsetCharacters + 5]:null,6);
         _line7.refresh(_context.characters.length >= _context.offsetCharacters + 7?_context.characters[_context.offsetCharacters + 6]:null,7);
         _line8.refresh(_context.characters.length >= _context.offsetCharacters + 8?_context.characters[_context.offsetCharacters + 7]:null,8);
         _line9.refresh(_context.characters.length >= _context.offsetCharacters + 9?_context.characters[_context.offsetCharacters + 8]:null,9);
         if(_context.currentCharacter)
         {
            if(_line1.character && _line1.character.id == _context.currentCharacter.id)
            {
               selectCharacterLine(_line1);
            }
            else if(_line2.character && _line2.character.id == _context.currentCharacter.id)
            {
               selectCharacterLine(_line2);
            }
            else if(_line3.character && _line3.character.id == _context.currentCharacter.id)
            {
               selectCharacterLine(_line3);
            }
            else if(_line4.character && _line4.character.id == _context.currentCharacter.id)
            {
               selectCharacterLine(_line4);
            }
            else if(_line5.character && _line5.character.id == _context.currentCharacter.id)
            {
               selectCharacterLine(_line5);
            }
            else if(_line6.character && _line6.character.id == _context.currentCharacter.id)
            {
               selectCharacterLine(_line6);
            }
            else if(_line7.character && _line7.character.id == _context.currentCharacter.id)
            {
               selectCharacterLine(_line7);
            }
            else if(_line8.character && _line8.character.id == _context.currentCharacter.id)
            {
               selectCharacterLine(_line8);
            }
            else if(_line9.character && _line9.character.id == _context.currentCharacter.id)
            {
               selectCharacterLine(_line9);
            }
            else
            {
               selectCharacterLine(null);
            }
         }
         else if(_line1.character)
         {
            selectCharacterLine(_line1);
         }
      }
      
      public function scrollUp(param1:int, param2:Boolean) : void
      {
         var _loc3_:* = null;
         if(_context.characters.length <= 0)
         {
            return;
         }
         _context.offsetCharacters = _context.offsetCharacters - param1;
         if(_context.offsetCharacters < 0)
         {
            _context.offsetCharacters = 0;
            _loc3_ = _context.characters[0];
            if(_loc3_.r <= 1)
            {
               refreshCharacterList();
               return;
            }
            if(param2)
            {
               Environment.audio.playFX("ui_button_click.mp3");
            }
            _context.scrollUp = true;
            _context.selectCharacterLine = false;
            Environment.application.sendActionRequest("retrieveSoloGuildCompetitionTournamentLeaderboard",{"rank":_loc3_.r - 1},handleRequests);
            return;
         }
         if(param2)
         {
            Environment.audio.playFX("ui_button_click.mp3");
         }
         refreshCharacterList();
      }
      
      public function scrollDown(param1:int, param2:Boolean) : void
      {
         var _loc3_:* = null;
         if(_context.characters.length <= 0)
         {
            return;
         }
         _context.offsetCharacters = _context.offsetCharacters + param1;
         if(_context.offsetCharacters > characterCount - 9)
         {
            _context.offsetCharacters = characterCount - 9;
            _loc3_ = _context.characters[_context.characters.length - 1];
            if(_loc3_.r >= _context.maxCharacters)
            {
               refreshCharacterList();
               return;
            }
            if(param2)
            {
               Environment.audio.playFX("ui_button_click.mp3");
            }
            _context.scrollUp = false;
            _context.selectCharacterLine = false;
            Environment.application.sendActionRequest("retrieveSoloGuildCompetitionTournamentLeaderboard",{"rank":_loc3_.r + 1},handleRequests);
            return;
         }
         if(param2)
         {
            Environment.audio.playFX("ui_button_click.mp3");
         }
         refreshCharacterList();
      }
      
      public function search(param1:String) : void
      {
         var _loc2_:int = 0;
         _context.selectCharacterLine = true;
         if(isNaN(parseInt(param1)))
         {
            Environment.application.sendActionRequest("retrieveSoloGuildCompetitionTournamentLeaderboard",{"character_name":param1},handleRequests);
         }
         else
         {
            _loc2_ = parseInt(param1);
            if(_loc2_.toString() != param1)
            {
               _loc2_ = 2147483647;
            }
            Environment.application.sendActionRequest("retrieveSoloGuildCompetitionTournamentLeaderboard",{"rank":_loc2_},handleRequests);
         }
      }
      
      private function handleRequests(param1:ActionRequestResponse) : void
      {
         var _loc3_:* = null;
         var _loc7_:int = 0;
         var _loc6_:* = null;
         var _loc5_:int = 1;
         var _loc9_:* = param1.action;
         if("retrieveSoloGuildCompetitionTournamentLeaderboard" !== _loc9_)
         {
            throw new Error("Unsupported request action \'" + param1.action + "\'!");
         }
         if(param1.error == "")
         {
            Environment.application.updateData(param1.data);
            if(!_line1)
            {
               return;
            }
            _context.lastSoloGuildCompetitionLeaderboardRefresh = TimeUtil.now;
            _context.characters = new Vector.<LeaderboardSoloGuildCompetition>();
            _loc9_ = 0;
            var _loc8_:* = param1.appResponse.leaderboard_solo_guild_competitions;
            for each(var _loc2_ in param1.appResponse.leaderboard_solo_guild_competitions)
            {
               _loc3_ = new LeaderboardSoloGuildCompetition(_loc2_);
               _context.characters.push(_loc3_);
            }
            _context.maxCharacters = param1.appResponse.max_solo_guild_competitions;
            _loc7_ = param1.appResponse.centered_rank;
            if(param1.appResponse.guild_competition_tournament_end_timestamp && param1.appResponse.guild_competition_tournament_end_timestamp > 0 && _context.endTimestamp != param1.appResponse.guild_competition_tournament_end_timestamp)
            {
               _context.endTimestamp = param1.appResponse.guild_competition_tournament_end_timestamp;
               _refreshTicker();
            }
            refreshCharacterList();
            if(_context.selectCharacterLine)
            {
               var _loc11_:int = 0;
               var _loc10_:* = _context.characters;
               for each(var _loc4_ in _context.characters)
               {
                  if(_loc4_.r == _loc7_)
                  {
                     if(_loc5_ > 9)
                     {
                        _context.offsetCharacters = int(_loc5_ - 9 / 2 + 1);
                        if(_context.offsetCharacters > characterCount - 9)
                        {
                           _context.offsetCharacters = characterCount - 9;
                        }
                        refreshCharacterList();
                     }
                     else
                     {
                        _context.offsetCharacters = 0;
                        refreshCharacterList();
                     }
                     selectCharacterLine(getGuildLine(_loc5_ - _context.offsetCharacters));
                     break;
                  }
                  _loc5_++;
               }
            }
            else if(param1.request.hasData("rank"))
            {
               _loc5_ = 1;
               var _loc13_:int = 0;
               var _loc12_:* = _context.characters;
               for each(_loc4_ in _context.characters)
               {
                  if(_loc4_.r == param1.request.getInt("rank"))
                  {
                     if(_loc5_ > 9)
                     {
                        if(_context.scrollUp)
                        {
                           _context.offsetCharacters = _loc5_ - 1;
                        }
                        else
                        {
                           _context.offsetCharacters = _loc5_ - 9;
                        }
                        if(_context.offsetCharacters > characterCount - 9)
                        {
                           _context.offsetCharacters = characterCount - 9;
                        }
                        refreshCharacterList();
                     }
                     else
                     {
                        _context.offsetCharacters = 0;
                        refreshCharacterList();
                     }
                     break;
                  }
                  _loc5_++;
               }
            }
         }
         else if(param1.error == "errTournamentLocked")
         {
            refreshCharacterList();
         }
         else if(param1.error.indexOf("errRetrieveLeaderboardEmpty_") != -1)
         {
            _context.reset();
            _loc6_ = param1.error.substr("errRetrieveLeaderboardEmpty_".length);
            _context.endTimestamp = parseInt(_loc6_);
            refreshCharacterList();
         }
         else if(param1.error == "errRetrieveLeaderboardInvalidCharacter")
         {
            Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("error/retrieve_solo_guild_leaderboard_invalid_character_title"),LocText.current.text("error/retrieve_solo_guild_leaderboard_invalid_character_text"),LocText.current.text("general/button_ok")));
         }
         else if(param1.error == "errRetrieveLeaderboardInvalidRank")
         {
            Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("error/retrieve_solo_guild_leaderboard_invalid_rank_title"),LocText.current.text("error/retrieve_solo_guild_leaderboard_invalid_rank_text"),LocText.current.text("general/button_ok")));
         }
         else
         {
            Environment.reportError(param1.error,param1.request);
         }
      }
      
      public function get context() : SoloGuildCompetitionLeaderboardContext
      {
         return _context;
      }
      
      public function set visible(param1:Boolean) : void
      {
         _content.visible = param1;
      }
   }
}
