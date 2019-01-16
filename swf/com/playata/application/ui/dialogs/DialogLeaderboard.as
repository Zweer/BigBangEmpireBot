package com.playata.application.ui.dialogs
{
   import com.playata.application.AppConfig;
   import com.playata.application.data.character.LeaderboardCharacter;
   import com.playata.application.data.guild.LeaderboardSoloGuildCompetition;
   import com.playata.application.data.leaderboard.CharacterLeaderboardContext;
   import com.playata.application.data.leaderboard.GuildCompetitionLeaderboardContext;
   import com.playata.application.data.leaderboard.GuildLeaderboardContext;
   import com.playata.application.data.leaderboard.MovieLeaderboardContext;
   import com.playata.application.data.leaderboard.SoloGuildCompetitionLeaderboardContext;
   import com.playata.application.data.user.User;
   import com.playata.application.ui.ViewManager;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.application.ui.elements.generic.button.UiTextButton;
   import com.playata.application.ui.elements.generic.dialog.UiDialog;
   import com.playata.application.ui.elements.generic.tab.UiTabButton;
   import com.playata.application.ui.elements.generic.textfield.UiTextTooltip;
   import com.playata.application.ui.elements.leaderboard.UiLeaderboardCharacterContent;
   import com.playata.application.ui.elements.leaderboard.UiLeaderboardGuildCompetitionContainer;
   import com.playata.application.ui.elements.leaderboard.UiLeaderboardGuildContent;
   import com.playata.application.ui.elements.leaderboard.UiLeaderboardMovieContent;
   import com.playata.framework.application.Environment;
   import com.playata.framework.core.util.StringUtil;
   import com.playata.framework.display.ui.controls.Button;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.dialogs.SymbolDialogLeaderboardGeneric;
   
   public class DialogLeaderboard extends UiDialog
   {
      
      public static const SCROLL_VALUE:int = 5;
      
      private static var _activeLeaderboard:int = 1;
      
      private static var _characterLeaderboardContext:CharacterLeaderboardContext = null;
      
      private static var _guildLeaderboardContext:GuildLeaderboardContext = null;
      
      private static var _guildCompetitionLeaderboardContext:GuildCompetitionLeaderboardContext = null;
      
      private static var _soloGuildCompetitionLeaderboardContext:SoloGuildCompetitionLeaderboardContext = null;
      
      private static var _movieLeaderboardContext:MovieLeaderboardContext = null;
      
      private static var _isOpen:Boolean = false;
       
      
      private var _characterContent:UiLeaderboardCharacterContent = null;
      
      private var _guildContent:UiLeaderboardGuildContent = null;
      
      private var _guildCompetitionContainer:UiLeaderboardGuildCompetitionContainer = null;
      
      private var _movieContent:UiLeaderboardMovieContent = null;
      
      private var _btnHelp:UiButton = null;
      
      private var _btnClose:UiButton = null;
      
      private var _btnScrollUp:UiButton = null;
      
      private var _btnScrollDown:UiButton = null;
      
      private var _btnTabCharacters:UiTabButton = null;
      
      private var _btnTabGuilds:UiTabButton = null;
      
      private var _btnTabMovies:UiTabButton = null;
      
      private var _btnTabGuildCompetition:UiTabButton = null;
      
      private var _btnViewPlayer:UiButton;
      
      private var _btnViewGuild:UiButton;
      
      private var _btnViewTop:UiTextButton = null;
      
      private var _btnSearch:UiTextButton = null;
      
      private var _tooltipSearch:UiTextTooltip = null;
      
      public function DialogLeaderboard()
      {
         _isOpen = true;
         var _loc1_:SymbolDialogLeaderboardGeneric = new SymbolDialogLeaderboardGeneric();
         super(_loc1_);
         _queued = false;
         DialogGuildSearch.autoOpen = false;
         _loc1_.txtDialogTitle.text = LocText.current.text("dialog/leaderboard/title");
         if(!_characterLeaderboardContext)
         {
            _characterLeaderboardContext = new CharacterLeaderboardContext();
         }
         if(!_guildLeaderboardContext)
         {
            _guildLeaderboardContext = new GuildLeaderboardContext();
         }
         if(!_guildCompetitionLeaderboardContext)
         {
            _guildCompetitionLeaderboardContext = new GuildCompetitionLeaderboardContext();
         }
         if(!_soloGuildCompetitionLeaderboardContext)
         {
            _soloGuildCompetitionLeaderboardContext = new SoloGuildCompetitionLeaderboardContext();
         }
         if(!_movieLeaderboardContext)
         {
            _movieLeaderboardContext = new MovieLeaderboardContext();
         }
         _characterContent = new UiLeaderboardCharacterContent(_loc1_.characterContent,refreshButtons,onClickViewPlayer,onClickSelectCharacter,_characterLeaderboardContext);
         _guildContent = new UiLeaderboardGuildContent(_loc1_.guildContent,refreshButtons,onClickViewGuild,_guildLeaderboardContext);
         _guildCompetitionContainer = new UiLeaderboardGuildCompetitionContainer(_loc1_.guildCompetitionContainer,refreshButtons,onClickViewGuild,onClickSelectSoloGuildCompetitionCharacter,refreshContentButtons,_guildCompetitionLeaderboardContext,_soloGuildCompetitionLeaderboardContext);
         _movieContent = new UiLeaderboardMovieContent(_loc1_.movieContent,refreshButtons,onClickViewPlayer,_movieLeaderboardContext);
         _btnHelp = new UiButton(_loc1_.btnHelp,LocText.current.text("general/button_help"),onClickHelp);
         _btnClose = new UiButton(_loc1_.btnClose,"",onClickClose);
         _btnScrollUp = new UiButton(_loc1_.btnUp,LocText.current.text("dialog/leadboard/button_scroll_up"),onClickScrollUp);
         _btnScrollDown = new UiButton(_loc1_.btnDown,LocText.current.text("dialog/leadboard/button_scroll_down"),onClickScrollDown);
         _btnTabCharacters = new UiTabButton(_loc1_.btnTabCharacters,LocText.current.text("dialog/leadboard/button_tab_characters"),"",onClickTabCharacters);
         _btnTabGuilds = new UiTabButton(_loc1_.btnTabGuilds,LocText.current.text("dialog/leadboard/button_tab_guilds"),"",onClickTabGuilds);
         _btnTabMovies = new UiTabButton(_loc1_.btnTabMovies,LocText.current.text("dialog/leadboard/button_tab_movies"),"",onClickTabMovies);
         _btnTabGuildCompetition = new UiTabButton(_loc1_.btnTabGuildCompetition,LocText.current.text("dialog/leadboard/button_tab_guild_competition"),"",onClickTabGuildCompetition);
         _btnTabMovies.visible = AppConfig.movieTournamentsEnabled == true;
         _btnViewPlayer = new UiButton(_loc1_.btnViewPlayer,LocText.current.text("dialog/leaderboard/button_show_player_tooltip"),onClickViewPlayer);
         _btnViewGuild = new UiButton(_loc1_.btnViewGuild,"",onClickViewGuild);
         _btnViewTop = new UiTextButton(_loc1_.btnViewTop,LocText.current.text("dialog/leaderboard/button_top_ten"),LocText.current.text("dialog/leaderboard/button_top_ten_tooltip"),onClickViewTop);
         _btnSearch = new UiTextButton(_loc1_.btnSearch,LocText.current.text("dialog/leaderboard/button_search"),LocText.current.text("dialog/leaderboard/button_search_tooltip"),onClickSearch);
         _tooltipSearch = new UiTextTooltip(_loc1_.inputSearch,LocText.current.text("dialog/leaderboard/search_text_tooltip"));
         onMouseWheel.add(handleMouseWheel);
         _loc1_.inputSearch.text = LocText.current.text("dialog/leaderboard/search_text");
         _loc1_.inputSearch.onClick.add(handleSearchClick);
         _characterContent.refreshCharacterList();
         _guildContent.refreshGuildList();
         _guildCompetitionContainer.refreshList();
         _movieContent.refreshMovieList();
         switch(int(activeLeaderboard) - 1)
         {
            case 0:
               onClickTabCharacters(null);
               break;
            case 1:
               onClickTabGuilds(null);
               break;
            default:
               onClickTabGuilds(null);
               break;
            case 3:
               onClickTabMovies(null);
               break;
            case 4:
               onClickTabGuildCompetition(null);
         }
      }
      
      public static function get activeLeaderboard() : int
      {
         return _activeLeaderboard;
      }
      
      public static function set activeLeaderboard(param1:int) : void
      {
         _activeLeaderboard = param1;
      }
      
      public static function get characterLeaderboardContext() : CharacterLeaderboardContext
      {
         return _characterLeaderboardContext;
      }
      
      public static function reset() : void
      {
         _activeLeaderboard = 1;
         if(_characterLeaderboardContext)
         {
            _characterLeaderboardContext.reset();
         }
         if(_guildLeaderboardContext)
         {
            _guildLeaderboardContext.reset();
         }
         if(_guildCompetitionLeaderboardContext)
         {
            _guildCompetitionLeaderboardContext.reset();
         }
         if(_soloGuildCompetitionLeaderboardContext)
         {
            _soloGuildCompetitionLeaderboardContext.reset();
         }
         if(_movieLeaderboardContext)
         {
            _movieLeaderboardContext.reset();
         }
      }
      
      public static function get isOpen() : Boolean
      {
         return _isOpen;
      }
      
      override public function dispose() : void
      {
         var _loc1_:SymbolDialogLeaderboardGeneric = _vo as SymbolDialogLeaderboardGeneric;
         _btnHelp.dispose();
         _btnHelp = null;
         _btnClose.dispose();
         _btnClose = null;
         _btnScrollUp.dispose();
         _btnScrollUp = null;
         _btnScrollDown.dispose();
         _btnScrollDown = null;
         _btnTabCharacters.dispose();
         _btnTabCharacters = null;
         _btnTabGuilds.dispose();
         _btnTabGuilds = null;
         _btnTabGuildCompetition.dispose();
         _btnTabGuildCompetition = null;
         _btnTabMovies.dispose();
         _btnTabMovies = null;
         _btnViewPlayer.dispose();
         _btnViewPlayer = null;
         _btnViewGuild.dispose();
         _btnViewGuild = null;
         _btnViewTop.dispose();
         _btnViewTop = null;
         _btnSearch.dispose();
         _btnSearch = null;
         _tooltipSearch.dispose();
         _tooltipSearch = null;
         _characterContent.dispose();
         _characterContent = null;
         _guildContent.dispose();
         _guildContent = null;
         _guildCompetitionContainer.dispose();
         _guildCompetitionContainer = null;
         _movieContent.dispose();
         _movieContent = null;
         super.dispose();
      }
      
      private function onClickTabCharacters(param1:InteractionEvent) : void
      {
         _activeLeaderboard = 1;
         _btnTabCharacters.tabbed = true;
         _btnTabGuilds.tabbed = false;
         _btnTabGuildCompetition.tabbed = false;
         _btnTabMovies.tabbed = false;
         refreshContentButtons();
         var _loc2_:SymbolDialogLeaderboardGeneric = _vo as SymbolDialogLeaderboardGeneric;
         _loc2_.characterContent.visible = _btnTabCharacters.tabbed;
         _loc2_.guildContent.visible = _btnTabGuilds.tabbed;
         _loc2_.guildCompetitionContainer.visible = _btnTabGuildCompetition.tabbed;
         _loc2_.movieContent.visible = _btnTabMovies.tabbed;
         _btnScrollUp.content.y = -195;
         _characterContent.show();
      }
      
      private function onClickTabGuilds(param1:InteractionEvent) : void
      {
         _activeLeaderboard = 2;
         _btnTabCharacters.tabbed = false;
         _btnTabGuilds.tabbed = true;
         _btnTabGuildCompetition.tabbed = false;
         _btnTabMovies.tabbed = false;
         refreshContentButtons();
         var _loc2_:SymbolDialogLeaderboardGeneric = _vo as SymbolDialogLeaderboardGeneric;
         _loc2_.characterContent.visible = _btnTabCharacters.tabbed;
         _loc2_.guildContent.visible = _btnTabGuilds.tabbed;
         _loc2_.guildCompetitionContainer.visible = _btnTabGuildCompetition.tabbed;
         _loc2_.movieContent.visible = _btnTabMovies.tabbed;
         _btnScrollUp.content.y = -195;
         _guildContent.show();
      }
      
      private function onClickTabGuildCompetition(param1:InteractionEvent) : void
      {
         _activeLeaderboard = 5;
         _btnTabCharacters.tabbed = false;
         _btnTabGuilds.tabbed = false;
         _btnTabGuildCompetition.tabbed = true;
         _btnTabMovies.tabbed = false;
         refreshContentButtons();
         var _loc2_:SymbolDialogLeaderboardGeneric = _vo as SymbolDialogLeaderboardGeneric;
         _loc2_.characterContent.visible = _btnTabCharacters.tabbed;
         _loc2_.guildContent.visible = _btnTabGuilds.tabbed;
         _loc2_.guildCompetitionContainer.visible = _btnTabGuildCompetition.tabbed;
         _loc2_.movieContent.visible = _btnTabMovies.tabbed;
         _btnScrollUp.content.y = -195;
         _guildCompetitionContainer.show();
      }
      
      private function onClickTabMovies(param1:InteractionEvent) : void
      {
         _activeLeaderboard = 4;
         _btnTabCharacters.tabbed = false;
         _btnTabGuilds.tabbed = false;
         _btnTabGuildCompetition.tabbed = false;
         _btnTabMovies.tabbed = true;
         refreshContentButtons();
         var _loc2_:SymbolDialogLeaderboardGeneric = _vo as SymbolDialogLeaderboardGeneric;
         _loc2_.characterContent.visible = _btnTabCharacters.tabbed;
         _loc2_.guildContent.visible = _btnTabGuilds.tabbed;
         _loc2_.guildCompetitionContainer.visible = _btnTabGuildCompetition.tabbed;
         _loc2_.movieContent.visible = _btnTabMovies.tabbed;
         _btnScrollUp.content.y = -195;
         _movieContent.show();
      }
      
      private function refreshContentButtons() : void
      {
         var _loc1_:Boolean = _btnTabCharacters.tabbed;
         if(_loc1_)
         {
            _btnViewGuild.visible = true;
            _btnViewGuild.tooltip = LocText.current.text("dialog/leaderboard/button_show_player_guild_tooltip");
            _btnViewTop.tooltip = LocText.current.text("dialog/leaderboard/button_top_ten_tooltip");
            _btnSearch.tooltip = LocText.current.text("dialog/leaderboard/button_search_tooltip");
            _btnViewPlayer.visible = true;
            _btnViewGuild.x = -290;
            _btnViewGuild.buttonEnabled = false;
         }
         else if(_btnTabGuilds.tabbed)
         {
            _btnViewGuild.visible = true;
            _btnViewGuild.tooltip = LocText.current.text("dialog/leaderboard/button_show_guild_tooltip");
            _btnViewTop.tooltip = LocText.current.text("dialog/leaderboard/button_top_ten_guild_tooltip");
            _btnSearch.tooltip = LocText.current.text("dialog/leaderboard/button_search_guild_tooltip");
            _btnViewPlayer.visible = false;
            _btnViewGuild.x = -360;
            _btnViewGuild.buttonEnabled = true;
         }
         else if(_btnTabGuildCompetition.tabbed)
         {
            if(_guildCompetitionContainer.isGuildCompetition)
            {
               _btnViewGuild.visible = true;
               _btnViewGuild.tooltip = LocText.current.text("dialog/leaderboard/button_show_guild_tooltip");
               _btnViewTop.tooltip = LocText.current.text("dialog/leaderboard/button_top_ten_guild_tooltip");
               _btnSearch.tooltip = LocText.current.text("dialog/leaderboard/button_search_guild_tooltip");
               _btnViewPlayer.visible = false;
               _btnViewGuild.x = -360;
               _btnViewGuild.buttonEnabled = true;
            }
            else if(_guildCompetitionContainer.isSoloGuildCompetition)
            {
               _btnViewGuild.visible = true;
               _btnViewGuild.tooltip = LocText.current.text("dialog/leaderboard/button_show_player_guild_tooltip");
               _btnViewTop.tooltip = LocText.current.text("dialog/leaderboard/button_top_ten_tooltip");
               _btnSearch.tooltip = LocText.current.text("dialog/leaderboard/button_search_tooltip");
               _btnViewPlayer.visible = true;
               _btnViewGuild.x = -290;
               _btnViewGuild.buttonEnabled = false;
            }
         }
         else if(_btnTabMovies.tabbed)
         {
            _btnViewTop.tooltip = LocText.current.text("dialog/leaderboard/button_top_ten_movies_tooltip");
            _btnSearch.tooltip = LocText.current.text("dialog/leaderboard/button_search_movies_tooltip");
            _btnViewPlayer.visible = true;
            _btnViewGuild.visible = false;
         }
         _tooltipSearch.text = _btnSearch.tooltip;
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
         if(_btnTabCharacters.tabbed)
         {
            _characterContent.scrollUp(param1,param2);
         }
         else if(_btnTabGuilds.tabbed)
         {
            _guildContent.scrollUp(param1,param2);
         }
         else if(_btnTabGuildCompetition.tabbed)
         {
            _guildCompetitionContainer.scrollUp(param1,param2);
         }
         else if(_btnTabMovies.tabbed)
         {
            _movieContent.scrollUp(param1,param2);
         }
      }
      
      private function scrollDown(param1:int, param2:Boolean) : void
      {
         if(!_btnScrollDown.visible)
         {
            return;
         }
         if(_btnTabCharacters.tabbed)
         {
            _characterContent.scrollDown(param1,param2);
         }
         else if(_btnTabGuilds.tabbed)
         {
            _guildContent.scrollDown(param1,param2);
         }
         else if(_btnTabGuildCompetition.tabbed)
         {
            _guildCompetitionContainer.scrollDown(param1,param2);
         }
         else if(_btnTabMovies.tabbed)
         {
            _movieContent.scrollDown(param1,param2);
         }
      }
      
      private function handleSearchClick(param1:InteractionEvent) : void
      {
         var _loc2_:SymbolDialogLeaderboardGeneric = _vo as SymbolDialogLeaderboardGeneric;
         if(_loc2_.inputSearch.text == LocText.current.text("dialog/leaderboard/search_text"))
         {
            _loc2_.inputSearch.text = "";
         }
      }
      
      private function onClickHelp(param1:InteractionEvent) : void
      {
         showTutorialDialog();
      }
      
      private function onClickViewPlayer(param1:InteractionEvent) : void
      {
         var _loc2_:int = 0;
         if(_btnTabCharacters.tabbed)
         {
            _loc2_ = _characterContent.currentCharacter.id;
         }
         else if(_btnTabMovies.tabbed)
         {
            _loc2_ = _movieContent.currentMovie.characterId;
         }
         else if(_btnTabGuildCompetition.tabbed)
         {
            _loc2_ = _guildCompetitionContainer.currentCharacterId;
         }
         ViewManager.instance.loadCharacter(_loc2_,closeCallback);
      }
      
      private function onClickSelectSoloGuildCompetitionCharacter(param1:LeaderboardSoloGuildCompetition) : void
      {
         _btnViewGuild.buttonEnabled = param1 != null && param1.guildId > 0;
      }
      
      private function onClickSelectCharacter(param1:LeaderboardCharacter) : void
      {
         _btnViewGuild.buttonEnabled = param1 != null && param1.guildId > 0;
      }
      
      private function onClickViewGuild(param1:InteractionEvent) : void
      {
         var _loc2_:int = 0;
         if(_btnTabCharacters.tabbed)
         {
            _loc2_ = _characterContent.currentCharacter.guildId;
         }
         else if(_btnTabGuilds.tabbed)
         {
            _loc2_ = _guildContent.currentGuild.id;
         }
         else if(_btnTabGuildCompetition.tabbed)
         {
            _loc2_ = _guildCompetitionContainer.currentGuildId;
         }
         ViewManager.instance.loadGuild(_loc2_,closeCallback);
      }
      
      private function closeCallback() : void
      {
         close();
      }
      
      override public function close(param1:Function = null) : void
      {
         _isOpen = false;
         super.close(param1);
      }
      
      private function onClickViewTop(param1:InteractionEvent) : void
      {
         if(_btnTabCharacters.tabbed)
         {
            _characterContent.scrollToTop();
         }
         else if(_btnTabGuilds.tabbed)
         {
            _guildContent.scrollToTop();
         }
         else if(_btnTabGuildCompetition.tabbed)
         {
            _guildCompetitionContainer.scrollToTop();
         }
         else if(_btnTabMovies.tabbed)
         {
            _movieContent.scrollToTop();
         }
      }
      
      private function onClickSearch(param1:InteractionEvent) : void
      {
         var _loc2_:SymbolDialogLeaderboardGeneric = _vo as SymbolDialogLeaderboardGeneric;
         if(StringUtil.isEmpty(_loc2_.inputSearch.text) || _loc2_.inputSearch.text == LocText.current.text("dialog/leaderboard/search_text"))
         {
            return;
         }
         if(_btnTabCharacters.tabbed)
         {
            _characterContent.search(_loc2_.inputSearch.text);
         }
         else if(_btnTabGuilds.tabbed)
         {
            _guildContent.search(_loc2_.inputSearch.text);
         }
         else if(_btnTabGuildCompetition.tabbed)
         {
            _guildCompetitionContainer.search(_loc2_.inputSearch.text);
         }
         else if(_btnTabMovies.tabbed)
         {
            _movieContent.search(_loc2_.inputSearch.text);
         }
      }
      
      private function refreshButtons() : void
      {
         if(_btnTabCharacters && _btnTabCharacters.tabbed)
         {
            _btnViewPlayer.buttonEnabled = _characterContent.characterCount > 0;
            _btnViewGuild.buttonEnabled = _characterContent.characterCount > 0;
            _btnViewTop.buttonEnabled = _characterContent.characterCount > 0;
            _btnSearch.buttonEnabled = _characterContent.characterCount > 0;
            _btnScrollUp.visible = _characterContent.characterCount > UiLeaderboardCharacterContent.MAX_LINES;
            _btnScrollDown.visible = _characterContent.characterCount > UiLeaderboardCharacterContent.MAX_LINES;
         }
         else if(_btnTabGuilds && _btnTabGuilds.tabbed)
         {
            _btnViewGuild.buttonEnabled = _guildContent.guildCount > 0;
            _btnViewTop.buttonEnabled = _guildContent.guildCount > 0;
            _btnSearch.buttonEnabled = _guildContent.guildCount > 0;
            _btnScrollUp.visible = _guildContent.guildCount > UiLeaderboardGuildContent.MAX_LINES;
            _btnScrollDown.visible = _guildContent.guildCount > UiLeaderboardGuildContent.MAX_LINES;
         }
         else if(_btnTabGuildCompetition && _btnTabGuildCompetition.tabbed)
         {
            if(_guildCompetitionContainer.isGuildCompetition)
            {
               _btnViewGuild.buttonEnabled = _guildCompetitionContainer.guildCompetitionContent.guildCount > 0;
               _btnViewTop.buttonEnabled = _guildCompetitionContainer.guildCompetitionContent.guildCount > 0;
               _btnSearch.buttonEnabled = _guildCompetitionContainer.guildCompetitionContent.guildCount > 0;
               _btnScrollUp.visible = _guildCompetitionContainer.guildCompetitionContent.guildCount > 9;
               _btnScrollDown.visible = _guildCompetitionContainer.guildCompetitionContent.guildCount > 9;
            }
            else
            {
               _btnViewPlayer.buttonEnabled = _guildCompetitionContainer.soloGuildCompetitionContent.characterCount > 0;
               _btnViewGuild.buttonEnabled = _guildCompetitionContainer.soloGuildCompetitionContent.characterCount > 0;
               _btnViewTop.buttonEnabled = _guildCompetitionContainer.soloGuildCompetitionContent.characterCount > 0;
               _btnSearch.buttonEnabled = _guildCompetitionContainer.soloGuildCompetitionContent.characterCount > 0;
               _btnScrollUp.visible = _guildCompetitionContainer.soloGuildCompetitionContent.characterCount > 9;
               _btnScrollDown.visible = _guildCompetitionContainer.soloGuildCompetitionContent.characterCount > 9;
            }
         }
         else if(_btnTabMovies && _btnTabMovies.tabbed)
         {
            _btnViewPlayer.buttonEnabled = _movieContent.movieCount > 0;
            _btnViewTop.buttonEnabled = _movieContent.movieCount > 0;
            _btnSearch.buttonEnabled = _movieContent.movieCount > 0;
            _btnScrollUp.visible = _movieContent.movieCount > 10;
            _btnScrollDown.visible = _movieContent.movieCount > 10;
         }
      }
      
      private function showTutorialDialog() : void
      {
         Environment.panelManager.showDialog(new DialogTutorialPopup(LocText.current.text("dialog/tutorial/leaderboard/title"),LocText.current.text("dialog/tutorial/leaderboard/text"),onTutorialDialogClosed));
      }
      
      private function onTutorialDialogClosed() : void
      {
         User.current.character.setTutorialFlag("leaderboard");
      }
      
      private function onClickClose(param1:InteractionEvent) : void
      {
         close();
      }
      
      override public function get defaultButton() : Button
      {
         return _btnSearch;
      }
      
      override public function onEscape() : void
      {
         close();
      }
   }
}
