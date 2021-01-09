package visuals.ui.dialogs
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabel;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.lib.flash.FlashTextInput;
   import com.playata.framework.display.ui.controls.ILabel;
   import com.playata.framework.display.ui.controls.ITextInput;
   import flash.display.MovieClip;
   import visuals.ui.base.SymbolIconButtonCharacterGeneric;
   import visuals.ui.base.SymbolIconButtonGuildGeneric;
   import visuals.ui.base.SymbolUiButtonShortGeneric;
   import visuals.ui.elements.backgrounds.SymbolSlice9BackgroundDialogGeneric;
   import visuals.ui.elements.buttons.SymbolButtonArrowDownGeneric;
   import visuals.ui.elements.buttons.SymbolButtonArrowUpGeneric;
   import visuals.ui.elements.buttons.SymbolButtonCloseGeneric;
   import visuals.ui.elements.buttons.SymbolButtonGoalFilterGeneric;
   import visuals.ui.elements.buttons.SymbolButtonHelpGeneric;
   import visuals.ui.elements.buttons.SymbolButtonTabGeneric;
   import visuals.ui.elements.leaderboard.SymbolLeaderboardCharacterContentGeneric;
   import visuals.ui.elements.leaderboard.SymbolLeaderboardFilterGeneric;
   import visuals.ui.elements.leaderboard.SymbolLeaderboardGlobalTournamentContentGeneric;
   import visuals.ui.elements.leaderboard.SymbolLeaderboardGuildCompetitionContainerGeneric;
   import visuals.ui.elements.leaderboard.SymbolLeaderboardGuildContentGeneric;
   import visuals.ui.elements.leaderboard.SymbolLeaderboardMovieContentGeneric;
   
   public class SymbolDialogLeaderboardGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolDialogLeaderboard = null;
      
      public var dialogBackground:SymbolSlice9BackgroundDialogGeneric = null;
      
      public var txtDialogTitle:ILabel = null;
      
      public var btnClose:SymbolButtonCloseGeneric = null;
      
      public var btnViewPlayer:SymbolIconButtonCharacterGeneric = null;
      
      public var btnViewGuild:SymbolIconButtonGuildGeneric = null;
      
      public var guildContent:SymbolLeaderboardGuildContentGeneric = null;
      
      public var characterContent:SymbolLeaderboardCharacterContentGeneric = null;
      
      public var movieContent:SymbolLeaderboardMovieContentGeneric = null;
      
      public var globalTournamentContent:SymbolLeaderboardGlobalTournamentContentGeneric = null;
      
      public var guildCompetitionContainer:SymbolLeaderboardGuildCompetitionContainerGeneric = null;
      
      public var btnViewTop:SymbolUiButtonShortGeneric = null;
      
      public var inputSearch:ITextInput = null;
      
      public var btnSearch:SymbolUiButtonShortGeneric = null;
      
      public var btnHelp:SymbolButtonHelpGeneric = null;
      
      public var btnUp:SymbolButtonArrowUpGeneric = null;
      
      public var btnDown:SymbolButtonArrowDownGeneric = null;
      
      public var btnTabCharacters:SymbolButtonTabGeneric = null;
      
      public var btnTabGuilds:SymbolButtonTabGeneric = null;
      
      public var btnTabMovies:SymbolButtonTabGeneric = null;
      
      public var btnTabGuildCompetition:SymbolButtonTabGeneric = null;
      
      public var btnTabCharacterGlobalTournament:SymbolButtonTabGeneric = null;
      
      public var btnFilter:SymbolButtonGoalFilterGeneric = null;
      
      public var filter:SymbolLeaderboardFilterGeneric = null;
      
      public function SymbolDialogLeaderboardGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolDialogLeaderboard;
         }
         else
         {
            _nativeObject = new SymbolDialogLeaderboard();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         dialogBackground = new SymbolSlice9BackgroundDialogGeneric(_nativeObject.dialogBackground);
         txtDialogTitle = FlashLabel.fromNative(_nativeObject.txtDialogTitle);
         btnClose = new SymbolButtonCloseGeneric(_nativeObject.btnClose);
         btnViewPlayer = new SymbolIconButtonCharacterGeneric(_nativeObject.btnViewPlayer);
         btnViewGuild = new SymbolIconButtonGuildGeneric(_nativeObject.btnViewGuild);
         guildContent = new SymbolLeaderboardGuildContentGeneric(_nativeObject.guildContent);
         characterContent = new SymbolLeaderboardCharacterContentGeneric(_nativeObject.characterContent);
         movieContent = new SymbolLeaderboardMovieContentGeneric(_nativeObject.movieContent);
         globalTournamentContent = new SymbolLeaderboardGlobalTournamentContentGeneric(_nativeObject.globalTournamentContent);
         guildCompetitionContainer = new SymbolLeaderboardGuildCompetitionContainerGeneric(_nativeObject.guildCompetitionContainer);
         btnViewTop = new SymbolUiButtonShortGeneric(_nativeObject.btnViewTop);
         inputSearch = FlashTextInput.fromNative(_nativeObject.inputSearch);
         btnSearch = new SymbolUiButtonShortGeneric(_nativeObject.btnSearch);
         btnHelp = new SymbolButtonHelpGeneric(_nativeObject.btnHelp);
         btnUp = new SymbolButtonArrowUpGeneric(_nativeObject.btnUp);
         btnDown = new SymbolButtonArrowDownGeneric(_nativeObject.btnDown);
         btnTabCharacters = new SymbolButtonTabGeneric(_nativeObject.btnTabCharacters);
         btnTabGuilds = new SymbolButtonTabGeneric(_nativeObject.btnTabGuilds);
         btnTabMovies = new SymbolButtonTabGeneric(_nativeObject.btnTabMovies);
         btnTabGuildCompetition = new SymbolButtonTabGeneric(_nativeObject.btnTabGuildCompetition);
         btnTabCharacterGlobalTournament = new SymbolButtonTabGeneric(_nativeObject.btnTabCharacterGlobalTournament);
         btnFilter = new SymbolButtonGoalFilterGeneric(_nativeObject.btnFilter);
         filter = new SymbolLeaderboardFilterGeneric(_nativeObject.filter);
      }
      
      public function setNativeInstance(param1:SymbolDialogLeaderboard) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.dialogBackground)
         {
            dialogBackground.setNativeInstance(_nativeObject.dialogBackground);
         }
         FlashLabel.setNativeInstance(txtDialogTitle,_nativeObject.txtDialogTitle);
         if(_nativeObject.btnClose)
         {
            btnClose.setNativeInstance(_nativeObject.btnClose);
         }
         if(_nativeObject.btnViewPlayer)
         {
            btnViewPlayer.setNativeInstance(_nativeObject.btnViewPlayer);
         }
         if(_nativeObject.btnViewGuild)
         {
            btnViewGuild.setNativeInstance(_nativeObject.btnViewGuild);
         }
         if(_nativeObject.guildContent)
         {
            guildContent.setNativeInstance(_nativeObject.guildContent);
         }
         if(_nativeObject.characterContent)
         {
            characterContent.setNativeInstance(_nativeObject.characterContent);
         }
         if(_nativeObject.movieContent)
         {
            movieContent.setNativeInstance(_nativeObject.movieContent);
         }
         if(_nativeObject.globalTournamentContent)
         {
            globalTournamentContent.setNativeInstance(_nativeObject.globalTournamentContent);
         }
         if(_nativeObject.guildCompetitionContainer)
         {
            guildCompetitionContainer.setNativeInstance(_nativeObject.guildCompetitionContainer);
         }
         if(_nativeObject.btnViewTop)
         {
            btnViewTop.setNativeInstance(_nativeObject.btnViewTop);
         }
         FlashTextInput.setNativeInstance(inputSearch,_nativeObject.inputSearch);
         if(_nativeObject.btnSearch)
         {
            btnSearch.setNativeInstance(_nativeObject.btnSearch);
         }
         if(_nativeObject.btnHelp)
         {
            btnHelp.setNativeInstance(_nativeObject.btnHelp);
         }
         if(_nativeObject.btnUp)
         {
            btnUp.setNativeInstance(_nativeObject.btnUp);
         }
         if(_nativeObject.btnDown)
         {
            btnDown.setNativeInstance(_nativeObject.btnDown);
         }
         if(_nativeObject.btnTabCharacters)
         {
            btnTabCharacters.setNativeInstance(_nativeObject.btnTabCharacters);
         }
         if(_nativeObject.btnTabGuilds)
         {
            btnTabGuilds.setNativeInstance(_nativeObject.btnTabGuilds);
         }
         if(_nativeObject.btnTabMovies)
         {
            btnTabMovies.setNativeInstance(_nativeObject.btnTabMovies);
         }
         if(_nativeObject.btnTabGuildCompetition)
         {
            btnTabGuildCompetition.setNativeInstance(_nativeObject.btnTabGuildCompetition);
         }
         if(_nativeObject.btnTabCharacterGlobalTournament)
         {
            btnTabCharacterGlobalTournament.setNativeInstance(_nativeObject.btnTabCharacterGlobalTournament);
         }
         if(_nativeObject.btnFilter)
         {
            btnFilter.setNativeInstance(_nativeObject.btnFilter);
         }
         if(_nativeObject.filter)
         {
            filter.setNativeInstance(_nativeObject.filter);
         }
      }
   }
}
