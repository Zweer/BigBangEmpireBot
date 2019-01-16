package com.playata.application.ui.elements.leaderboard
{
   import com.playata.application.AppConfig;
   import com.playata.application.data.character.LeaderboardCharacter;
   import com.playata.application.data.dataobject.DOLeaderboardCharacter;
   import com.playata.application.data.leaderboard.CharacterLeaderboardContext;
   import com.playata.application.ui.elements.generic.checkbox.UiCheckBox;
   import com.playata.application.ui.elements.generic.dialog.UiInfoDialog;
   import com.playata.framework.application.Environment;
   import com.playata.framework.application.request.ActionRequestResponse;
   import com.playata.framework.core.util.TimeUtil;
   import com.playata.framework.display.InteractiveDisplayObject;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.elements.leaderboard.SymbolLeaderboardCharacterContentGeneric;
   import visuals.ui.elements.leaderboard.SymbolLeaderboardLineGeneric;
   
   public class UiLeaderboardCharacterContent
   {
      
      public static var MAX_LINES:int = 12;
      
      private static const CHARACTER_LEADERBOARD_REFRESH_TIME:int = 30;
       
      
      private var _content:SymbolLeaderboardCharacterContentGeneric = null;
      
      private var _refreshButtons:Function = null;
      
      private var _onClick:Function = null;
      
      private var _context:CharacterLeaderboardContext = null;
      
      private var _selectedCharacterLine:UiLeaderboardCharacterLine = null;
      
      private var _characterLines:Vector.<UiLeaderboardCharacterLine> = null;
      
      private var _iconSortByHonor:InteractiveDisplayObject = null;
      
      private var _icoSortByLevel:InteractiveDisplayObject = null;
      
      private var _icoSortByFans:InteractiveDisplayObject = null;
      
      private var _onSelectLine:Function;
      
      private var _checkSameLocale:UiCheckBox = null;
      
      public function UiLeaderboardCharacterContent(param1:SymbolLeaderboardCharacterContentGeneric, param2:Function, param3:Function, param4:Function, param5:CharacterLeaderboardContext)
      {
         var _loc6_:int = 0;
         super();
         _content = param1;
         _refreshButtons = param2;
         _onClick = param3;
         _onSelectLine = param4;
         _context = param5;
         param1.txtPositionCaption.text = LocText.current.text("dialog/leaderboard/column_rank");
         param1.txtNameCaption.text = LocText.current.text("dialog/leaderboard/column_name");
         param1.txtGuildCaption.text = LocText.current.text("dialog/leaderboard/column_team");
         param1.txtHonorCaption.htmlText = "<a href=\'event:null\'>" + LocText.current.text("dialog/leaderboard/column_honor") + "</a>";
         param1.txtLevelCaption.htmlText = "<a href=\'event:null\'>" + LocText.current.text("dialog/leaderboard/column_level") + "</a>";
         param1.txtFansCaption.htmlText = "<a href=\'event:null\'>" + LocText.current.text("dialog/leaderboard/column_fans") + "</a>";
         _iconSortByHonor = new InteractiveDisplayObject(param1.iconSortByHonor);
         _iconSortByHonor.alpha = _context.sortType == 1?0.2:1;
         _iconSortByHonor.onClick.add(handleCharacterHonorSortClick);
         param1.txtHonorCaption.onClick.add(handleCharacterHonorSortClick);
         _icoSortByLevel = new InteractiveDisplayObject(param1.iconSortByLevel);
         _icoSortByLevel.alpha = _context.sortType == 2?1:0.2;
         _icoSortByLevel.onClick.add(handleCharacterLevelSortClick);
         param1.txtLevelCaption.onClick.add(handleCharacterLevelSortClick);
         _icoSortByFans = new InteractiveDisplayObject(param1.iconSortByFans);
         _icoSortByFans.alpha = _context.sortType == 3?1:0.2;
         _icoSortByFans.onClick.add(handleCharacterFansSortClick);
         param1.txtFansCaption.onClick.add(handleCharacterFansSortClick);
         if(AppConfig.teamLocaleEnabled)
         {
            MAX_LINES = 10;
            _checkSameLocale = new UiCheckBox(param1.checkOnlySameLocale,_context.showOnlySameLocale,"",onSameLocaleChanged,null,param1.txtOnlySameLocale);
            param1.txtOnlySameLocale.text = LocText.current.text("dialog/leaderboard/only_same_locale_characters");
            param1.line11.visible = false;
            param1.line12.visible = false;
         }
         else
         {
            param1.checkOnlySameLocale.visible = false;
            param1.txtOnlySameLocale.visible = false;
         }
         _characterLines = new Vector.<UiLeaderboardCharacterLine>();
         _loc6_ = 1;
         while(_loc6_ <= MAX_LINES)
         {
            _characterLines.push(new UiLeaderboardCharacterLine(param1.getChildByName("line" + _loc6_) as SymbolLeaderboardLineGeneric,_loc6_,selectCharacterLine,doubleClickCharacterLine));
            _loc6_++;
         }
      }
      
      public function dispose() : void
      {
         var _loc1_:int = 0;
         _iconSortByHonor.dispose();
         _icoSortByLevel.dispose();
         _icoSortByFans.dispose();
         _loc1_ = 0;
         while(_loc1_ < _characterLines.length)
         {
            _characterLines[_loc1_].dispose();
            _loc1_++;
         }
         _characterLines = null;
         if(_checkSameLocale)
         {
            _checkSameLocale.dispose();
            _checkSameLocale = null;
         }
      }
      
      public function show() : void
      {
         var _loc1_:Boolean = false;
         if(_context.lastCharacterLeaderboardRefresh < TimeUtil.now - 30)
         {
            _loc1_ = true;
         }
         if(_context.currentCharacter == null)
         {
            Environment.application.sendActionRequest("retrieveLeaderboard",{
               "sort_type":_context.sortType,
               "same_locale":_context.showOnlySameLocale
            },handleRequests);
         }
         else if(_loc1_ || _context.maxCharacters == 0)
         {
            Environment.application.sendActionRequest("retrieveLeaderboard",{
               "character_name":_context.currentCharacter.name,
               "sort_type":_context.sortType,
               "same_locale":_context.showOnlySameLocale
            },handleRequests);
         }
         else
         {
            refreshCharacterList();
         }
      }
      
      private function onSameLocaleChanged(param1:Boolean) : void
      {
         _context.showOnlySameLocale = param1;
         _context.currentCharacter = null;
         _selectedCharacterLine = null;
         _context.selectCharacterLine = false;
         Environment.application.sendActionRequest("retrieveLeaderboard",{
            "sort_type":_context.sortType,
            "same_locale":_context.showOnlySameLocale
         },handleRequests);
      }
      
      public function get currentCharacter() : LeaderboardCharacter
      {
         return _context.currentCharacter;
      }
      
      public function set currentCharacter(param1:LeaderboardCharacter) : void
      {
         _context.currentCharacter = param1;
      }
      
      private function getCharacterLine(param1:int) : UiLeaderboardCharacterLine
      {
         if(param1 >= _characterLines.length || param1 < 0)
         {
            return null;
         }
         return _characterLines[param1 - 1];
      }
      
      public function get characterCount() : int
      {
         return _context.characters.length;
      }
      
      private function selectCharacterLine(param1:UiLeaderboardCharacterLine) : void
      {
         var _loc2_:int = 0;
         _selectedCharacterLine = param1;
         if(_selectedCharacterLine != null)
         {
            _context.currentCharacter = _selectedCharacterLine.character;
         }
         _loc2_ = 0;
         while(_loc2_ < _characterLines.length)
         {
            _characterLines[_loc2_].highlight(_characterLines[_loc2_] == _selectedCharacterLine);
            _loc2_++;
         }
      }
      
      private function doubleClickCharacterLine(param1:UiLeaderboardCharacterLine) : void
      {
         selectCharacterLine(param1);
      }
      
      public function scrollToTop() : void
      {
         _context.selectCharacterLine = true;
         Environment.application.sendActionRequest("retrieveLeaderboard",{
            "rank":1,
            "sort_type":_context.sortType,
            "same_locale":_context.showOnlySameLocale
         },handleRequests);
      }
      
      public function refreshCharacterList() : void
      {
         var _loc2_:int = 0;
         var _loc3_:Boolean = false;
         if(!_characterLines)
         {
            return;
         }
         if(_refreshButtons != null)
         {
            _refreshButtons();
         }
         if(_selectedCharacterLine != null)
         {
            _context.currentCharacter = _selectedCharacterLine.character;
         }
         var _loc1_:int = _context.offsetCharacters;
         if(_loc1_ < 0)
         {
            _loc1_ = 0;
         }
         _loc2_ = 0;
         while(_loc2_ < _characterLines.length)
         {
            _characterLines[_loc2_].refresh(_context.characters.length >= _loc1_ + _loc2_ + 1?_context.characters[_loc1_ + _loc2_]:null,_loc2_ + 1);
            _loc2_++;
         }
         if(_context.currentCharacter)
         {
            _loc3_ = false;
            _loc2_ = 0;
            while(_loc2_ < _characterLines.length)
            {
               if(_characterLines[_loc2_].character && _characterLines[_loc2_].character.id == _context.currentCharacter.id)
               {
                  selectCharacterLine(_characterLines[_loc2_]);
                  _loc3_ = true;
                  break;
               }
               _loc2_++;
            }
            if(!_loc3_)
            {
               selectCharacterLine(null);
            }
         }
         else if(_characterLines[1].character)
         {
            selectCharacterLine(_characterLines[1]);
         }
      }
      
      private function handleCharacterHonorSortClick(param1:InteractionEvent) : void
      {
         Environment.audio.playFX("ui_button_click.mp3");
         if(_context.sortType == 1)
         {
            return;
         }
         _context.sortType = 1;
         Environment.application.sendActionRequest("retrieveLeaderboard",{
            "character_name":_context.currentCharacter.name,
            "sort_type":_context.sortType,
            "same_locale":_context.showOnlySameLocale
         },handleRequests);
         _content.iconSortByLevel.alpha = 0.2;
         _content.iconSortByHonor.alpha = 1;
         _content.iconSortByFans.alpha = 0.2;
      }
      
      private function handleCharacterLevelSortClick(param1:InteractionEvent) : void
      {
         Environment.audio.playFX("ui_button_click.mp3");
         if(_context.sortType == 2)
         {
            return;
         }
         _context.sortType = 2;
         Environment.application.sendActionRequest("retrieveLeaderboard",{
            "character_name":_context.currentCharacter.name,
            "sort_type":_context.sortType,
            "same_locale":_context.showOnlySameLocale
         },handleRequests);
         _content.iconSortByLevel.alpha = 1;
         _content.iconSortByHonor.alpha = 0.2;
         _content.iconSortByFans.alpha = 0.2;
      }
      
      private function handleCharacterFansSortClick(param1:InteractionEvent) : void
      {
         Environment.audio.playFX("ui_button_click.mp3");
         if(_context.sortType == 3)
         {
            return;
         }
         _context.sortType = 3;
         Environment.application.sendActionRequest("retrieveLeaderboard",{
            "character_name":_context.currentCharacter.name,
            "sort_type":_context.sortType,
            "same_locale":_context.showOnlySameLocale
         },handleRequests);
         _content.iconSortByLevel.alpha = 0.2;
         _content.iconSortByHonor.alpha = 0.2;
         _content.iconSortByFans.alpha = 1;
      }
      
      public function scrollUp(param1:int, param2:Boolean) : void
      {
         var _loc3_:* = null;
         _context.offsetCharacters = _context.offsetCharacters - param1;
         if(_context.offsetCharacters < 0)
         {
            _context.offsetCharacters = 0;
            if(_context.characters.length == 0)
            {
               return;
            }
            _loc3_ = _context.characters[0];
            if(_loc3_.rank <= 1)
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
            Environment.application.sendActionRequest("retrieveLeaderboard",{
               "rank":_loc3_.rank - 1,
               "sort_type":_context.sortType,
               "same_locale":_context.showOnlySameLocale
            },handleRequests);
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
         _context.offsetCharacters = _context.offsetCharacters + param1;
         if(_context.offsetCharacters > characterCount - MAX_LINES)
         {
            _context.offsetCharacters = characterCount - MAX_LINES;
            if(_context.characters.length == 0)
            {
               return;
            }
            _loc3_ = _context.characters[_context.characters.length - 1];
            if(_loc3_.rank >= _context.maxCharacters)
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
            Environment.application.sendActionRequest("retrieveLeaderboard",{
               "rank":_loc3_.rank + 1,
               "sort_type":_context.sortType,
               "same_locale":_context.showOnlySameLocale
            },handleRequests);
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
            Environment.application.sendActionRequest("retrieveLeaderboard",{
               "character_name":param1,
               "sort_type":_context.sortType,
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
            Environment.application.sendActionRequest("retrieveLeaderboard",{
               "rank":_loc2_,
               "sort_type":_context.sortType,
               "same_locale":_context.showOnlySameLocale
            },handleRequests);
         }
      }
      
      private function handleRequests(param1:ActionRequestResponse) : void
      {
         var _loc3_:* = null;
         var _loc6_:int = 0;
         var _loc5_:int = 1;
         var _loc8_:* = param1.action;
         if("retrieveLeaderboard" !== _loc8_)
         {
            throw new Error("Unsupported request action \'" + param1.action + "\'!");
         }
         if(param1.error == "")
         {
            Environment.application.updateData(param1.data);
            if(!_characterLines)
            {
               return;
            }
            _context.lastCharacterLeaderboardRefresh = TimeUtil.now;
            _context.characters = new Vector.<LeaderboardCharacter>();
            _loc8_ = 0;
            var _loc7_:* = param1.appResponse.leaderboard_characters;
            for each(var _loc2_ in param1.appResponse.leaderboard_characters)
            {
               _loc3_ = new LeaderboardCharacter(_loc2_);
               _context.characters.push(_loc3_);
            }
            _context.maxCharacters = param1.appResponse.max_characters;
            _loc6_ = param1.appResponse.centered_rank;
            if(_context.offsetCharacters > characterCount - MAX_LINES)
            {
               _context.offsetCharacters = int(Math.max(0,characterCount - MAX_LINES));
            }
            refreshCharacterList();
            if(_context.selectCharacterLine)
            {
               var _loc10_:int = 0;
               var _loc9_:* = _context.characters;
               for each(var _loc4_ in _context.characters)
               {
                  if(_loc4_.rank == _loc6_ || param1.request.hasData("rank") && _loc4_.rank == param1.request.getInt("rank"))
                  {
                     if(_loc5_ > MAX_LINES)
                     {
                        _context.offsetCharacters = int(_loc5_ - MAX_LINES / 2 + 1);
                        if(_context.offsetCharacters > characterCount - MAX_LINES)
                        {
                           _context.offsetCharacters = characterCount - MAX_LINES;
                        }
                        refreshCharacterList();
                     }
                     else
                     {
                        _context.offsetCharacters = 0;
                        refreshCharacterList();
                     }
                     selectCharacterLine(getCharacterLine(_loc5_ - _context.offsetCharacters));
                     break;
                  }
                  _loc5_++;
               }
            }
            else if(param1.request.hasData("rank"))
            {
               _loc5_ = 1;
               var _loc12_:int = 0;
               var _loc11_:* = _context.characters;
               for each(_loc4_ in _context.characters)
               {
                  if(_loc4_.rank == param1.request.getInt("rank"))
                  {
                     if(_loc5_ > MAX_LINES)
                     {
                        if(_context.scrollUp)
                        {
                           _context.offsetCharacters = _loc5_ - 1;
                        }
                        else
                        {
                           _context.offsetCharacters = _loc5_ - MAX_LINES;
                        }
                        if(_context.offsetCharacters > characterCount - MAX_LINES)
                        {
                           _context.offsetCharacters = characterCount - MAX_LINES;
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
         else if(param1.error == "errRetrieveLeaderboardInvalidCharacter")
         {
            Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("error/retrieve_leaderboard_invalid_character_title"),LocText.current.text("error/retrieve_leaderboard_invalid_character_text"),LocText.current.text("general/button_ok")));
         }
         else if(param1.error == "errRetrieveLeaderboardInvalidRank")
         {
            Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("error/retrieve_leaderboard_invalid_rank_title"),LocText.current.text("error/retrieve_leaderboard_invalid_rank_text"),LocText.current.text("general/button_ok")));
         }
         else
         {
            Environment.reportError(param1.error,param1.request);
         }
      }
   }
}
