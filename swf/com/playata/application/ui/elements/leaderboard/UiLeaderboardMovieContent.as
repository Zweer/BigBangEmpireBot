package com.playata.application.ui.elements.leaderboard
{
   import com.playata.application.data.leaderboard.MovieLeaderboardContext;
   import com.playata.application.data.movie.LeaderboardMovie;
   import com.playata.application.data.tournament.MovieTournament;
   import com.playata.application.ui.elements.generic.dialog.UiInfoDialog;
   import com.playata.framework.application.Environment;
   import com.playata.framework.application.request.ActionRequestResponse;
   import com.playata.framework.core.util.TimeUtil;
   import com.playata.framework.localization.LocText;
   import visuals.ui.elements.leaderboard.SymbolLeaderboardMovieContentGeneric;
   
   public class UiLeaderboardMovieContent
   {
      
      public static const MAX_LINES:int = 10;
      
      private static const MOVIE_LEADERBOARD_REFRESH_TIME:int = 30;
       
      
      private var _content:SymbolLeaderboardMovieContentGeneric = null;
      
      private var _refreshButtons:Function = null;
      
      private var _onClick:Function = null;
      
      private var _context:MovieLeaderboardContext = null;
      
      private var _selectedMovieLine:UiLeaderboardMovieLine = null;
      
      private var _movieLine1:UiLeaderboardMovieLine = null;
      
      private var _movieLine2:UiLeaderboardMovieLine = null;
      
      private var _movieLine3:UiLeaderboardMovieLine = null;
      
      private var _movieLine4:UiLeaderboardMovieLine = null;
      
      private var _movieLine5:UiLeaderboardMovieLine = null;
      
      private var _movieLine6:UiLeaderboardMovieLine = null;
      
      private var _movieLine7:UiLeaderboardMovieLine = null;
      
      private var _movieLine8:UiLeaderboardMovieLine = null;
      
      private var _movieLine9:UiLeaderboardMovieLine = null;
      
      private var _movieLine10:UiLeaderboardMovieLine = null;
      
      private var _lastSearched:String = "";
      
      private var _searchCount:int = 0;
      
      public function UiLeaderboardMovieContent(param1:SymbolLeaderboardMovieContentGeneric, param2:Function, param3:Function, param4:MovieLeaderboardContext)
      {
         super();
         _content = param1;
         _refreshButtons = param2;
         _onClick = param3;
         _context = param4;
         param1.txtNoMovies.text = LocText.current.text("dialog/leaderboard_movie/no_movies");
         param1.txtPositionCaption.text = LocText.current.text("dialog/leaderboard_movie/column_rank");
         param1.txtNameCaption.text = LocText.current.text("dialog/leaderboard_movie/column_name");
         param1.txtCharacterCaption.text = LocText.current.text("dialog/leaderboard_movie/column_character");
         param1.txtRewardCaption.text = LocText.current.text("dialog/leaderboard_movie/column_reward");
         param1.txtTournamentInfo.visible = false;
         param1.txtNoMovies.visible = false;
         _movieLine1 = new UiLeaderboardMovieLine(param1.line1,1,selectMovieLine,doubleClickMovieLine);
         _movieLine2 = new UiLeaderboardMovieLine(param1.line2,2,selectMovieLine,doubleClickMovieLine);
         _movieLine3 = new UiLeaderboardMovieLine(param1.line3,3,selectMovieLine,doubleClickMovieLine);
         _movieLine4 = new UiLeaderboardMovieLine(param1.line4,4,selectMovieLine,doubleClickMovieLine);
         _movieLine5 = new UiLeaderboardMovieLine(param1.line5,5,selectMovieLine,doubleClickMovieLine);
         _movieLine6 = new UiLeaderboardMovieLine(param1.line6,6,selectMovieLine,doubleClickMovieLine);
         _movieLine7 = new UiLeaderboardMovieLine(param1.line7,7,selectMovieLine,doubleClickMovieLine);
         _movieLine8 = new UiLeaderboardMovieLine(param1.line8,8,selectMovieLine,doubleClickMovieLine);
         _movieLine9 = new UiLeaderboardMovieLine(param1.line9,9,selectMovieLine,doubleClickMovieLine);
         _movieLine10 = new UiLeaderboardMovieLine(param1.line10,10,selectMovieLine,doubleClickMovieLine);
      }
      
      public function dispose() : void
      {
         _movieLine1.dispose();
         _movieLine1 = null;
         _movieLine2.dispose();
         _movieLine2 = null;
         _movieLine3.dispose();
         _movieLine3 = null;
         _movieLine4.dispose();
         _movieLine4 = null;
         _movieLine5.dispose();
         _movieLine5 = null;
         _movieLine6.dispose();
         _movieLine6 = null;
         _movieLine7.dispose();
         _movieLine7 = null;
         _movieLine8.dispose();
         _movieLine8 = null;
         _movieLine9.dispose();
         _movieLine9 = null;
         _movieLine10.dispose();
         _movieLine10 = null;
      }
      
      public function show() : void
      {
         var _loc1_:Boolean = false;
         if(_context.lastMovieLeaderboardRefresh < TimeUtil.now - 30)
         {
            _loc1_ = true;
            _lastSearched = "";
            _searchCount = 0;
         }
         _content.txtNoMovies.visible = false;
         if(_context.currentMovie == null)
         {
            Environment.application.sendActionRequest("retrieveMovieTournamentLeaderboard",{},handleRequests);
         }
         else if(_loc1_ || _context.maxMovies == 0)
         {
            Environment.application.sendActionRequest("retrieveMovieTournamentLeaderboard",{"rank":_context.currentMovie.rank},handleRequests);
         }
         else
         {
            refreshMovieList();
         }
      }
      
      public function get currentMovie() : LeaderboardMovie
      {
         return _context.currentMovie;
      }
      
      public function set currentMovie(param1:LeaderboardMovie) : void
      {
         _context.currentMovie = param1;
      }
      
      private function getMovieLine(param1:int) : UiLeaderboardMovieLine
      {
         switch(int(param1) - 1)
         {
            case 0:
               return _movieLine1;
            case 1:
               return _movieLine2;
            case 2:
               return _movieLine3;
            case 3:
               return _movieLine4;
            case 4:
               return _movieLine5;
            case 5:
               return _movieLine6;
            case 6:
               return _movieLine7;
            case 7:
               return _movieLine8;
            case 8:
               return _movieLine9;
            case 9:
               return _movieLine10;
         }
      }
      
      public function get movieCount() : int
      {
         return _context.movies.length;
      }
      
      private function selectMovieLine(param1:UiLeaderboardMovieLine) : void
      {
         _selectedMovieLine = param1;
         if(_selectedMovieLine != null)
         {
            _context.currentMovie = _selectedMovieLine.movie;
         }
         _movieLine1.highlight(_movieLine1 == _selectedMovieLine);
         _movieLine2.highlight(_movieLine2 == _selectedMovieLine);
         _movieLine3.highlight(_movieLine3 == _selectedMovieLine);
         _movieLine4.highlight(_movieLine4 == _selectedMovieLine);
         _movieLine5.highlight(_movieLine5 == _selectedMovieLine);
         _movieLine6.highlight(_movieLine6 == _selectedMovieLine);
         _movieLine7.highlight(_movieLine7 == _selectedMovieLine);
         _movieLine8.highlight(_movieLine8 == _selectedMovieLine);
         _movieLine9.highlight(_movieLine9 == _selectedMovieLine);
         _movieLine10.highlight(_movieLine10 == _selectedMovieLine);
      }
      
      private function doubleClickMovieLine(param1:UiLeaderboardMovieLine) : void
      {
         selectMovieLine(param1);
      }
      
      public function scrollToTop() : void
      {
         _context.selectMovieLine = true;
         Environment.application.sendActionRequest("retrieveMovieTournamentLeaderboard",{"rank":1},handleRequests);
      }
      
      public function refreshMovieList() : void
      {
         if(!_movieLine1)
         {
            return;
         }
         _content.txtNoMovies.visible = movieCount == 0;
         _content.txtTournamentInfo.visible = MovieTournament.movieTournamentEndTimestamp > 0;
         _content.txtTournamentInfo.text = LocText.current.text("dialog/leadboard_movie/end_datetime",MovieTournament.tournamentEndDateTime);
         if(_refreshButtons != null)
         {
            _refreshButtons();
         }
         if(_selectedMovieLine != null)
         {
            _context.currentMovie = _selectedMovieLine.movie;
         }
         _movieLine1.refresh(_context.movies.length >= _context.offsetMovies + 1?_context.movies[_context.offsetMovies + 0]:null,1);
         _movieLine2.refresh(_context.movies.length >= _context.offsetMovies + 2?_context.movies[_context.offsetMovies + 1]:null,2);
         _movieLine3.refresh(_context.movies.length >= _context.offsetMovies + 3?_context.movies[_context.offsetMovies + 2]:null,3);
         _movieLine4.refresh(_context.movies.length >= _context.offsetMovies + 4?_context.movies[_context.offsetMovies + 3]:null,4);
         _movieLine5.refresh(_context.movies.length >= _context.offsetMovies + 5?_context.movies[_context.offsetMovies + 4]:null,5);
         _movieLine6.refresh(_context.movies.length >= _context.offsetMovies + 6?_context.movies[_context.offsetMovies + 5]:null,6);
         _movieLine7.refresh(_context.movies.length >= _context.offsetMovies + 7?_context.movies[_context.offsetMovies + 6]:null,7);
         _movieLine8.refresh(_context.movies.length >= _context.offsetMovies + 8?_context.movies[_context.offsetMovies + 7]:null,8);
         _movieLine9.refresh(_context.movies.length >= _context.offsetMovies + 9?_context.movies[_context.offsetMovies + 8]:null,9);
         _movieLine10.refresh(_context.movies.length >= _context.offsetMovies + 10?_context.movies[_context.offsetMovies + 9]:null,10);
         if(_context.currentMovie)
         {
            if(_movieLine1.movie && _movieLine1.movie.id == _context.currentMovie.id)
            {
               selectMovieLine(_movieLine1);
            }
            else if(_movieLine2.movie && _movieLine2.movie.id == _context.currentMovie.id)
            {
               selectMovieLine(_movieLine2);
            }
            else if(_movieLine3.movie && _movieLine3.movie.id == _context.currentMovie.id)
            {
               selectMovieLine(_movieLine3);
            }
            else if(_movieLine4.movie && _movieLine4.movie.id == _context.currentMovie.id)
            {
               selectMovieLine(_movieLine4);
            }
            else if(_movieLine5.movie && _movieLine5.movie.id == _context.currentMovie.id)
            {
               selectMovieLine(_movieLine5);
            }
            else if(_movieLine6.movie && _movieLine6.movie.id == _context.currentMovie.id)
            {
               selectMovieLine(_movieLine6);
            }
            else if(_movieLine7.movie && _movieLine7.movie.id == _context.currentMovie.id)
            {
               selectMovieLine(_movieLine7);
            }
            else if(_movieLine8.movie && _movieLine8.movie.id == _context.currentMovie.id)
            {
               selectMovieLine(_movieLine8);
            }
            else if(_movieLine9.movie && _movieLine9.movie.id == _context.currentMovie.id)
            {
               selectMovieLine(_movieLine9);
            }
            else if(_movieLine10.movie && _movieLine10.movie.id == _context.currentMovie.id)
            {
               selectMovieLine(_movieLine10);
            }
            else
            {
               selectMovieLine(null);
            }
         }
         else if(_movieLine1.movie)
         {
            selectMovieLine(_movieLine1);
         }
      }
      
      public function scrollUp(param1:int, param2:Boolean) : void
      {
         var _loc3_:* = null;
         if(_context.movies.length <= 0)
         {
            return;
         }
         _context.offsetMovies = _context.offsetMovies - param1;
         if(_context.offsetMovies < 0 && _context.movies.length > 0)
         {
            _context.offsetMovies = 0;
            _loc3_ = _context.movies[0];
            if(_loc3_.rank <= 1)
            {
               refreshMovieList();
               return;
            }
            if(param2)
            {
               Environment.audio.playFX("ui_button_click.mp3");
            }
            _context.scrollUp = true;
            _context.selectMovieLine = false;
            Environment.application.sendActionRequest("retrieveMovieTournamentLeaderboard",{"rank":_loc3_.rank - 1},handleRequests);
            return;
         }
         if(param2)
         {
            Environment.audio.playFX("ui_button_click.mp3");
         }
         refreshMovieList();
      }
      
      public function scrollDown(param1:int, param2:Boolean) : void
      {
         var _loc3_:* = null;
         if(_context.movies.length <= 0)
         {
            return;
         }
         _context.offsetMovies = _context.offsetMovies + param1;
         if(_context.offsetMovies > movieCount - 10)
         {
            _context.offsetMovies = movieCount - 10;
            _loc3_ = _context.movies[_context.movies.length - 1];
            if(_loc3_.rank >= _context.maxMovies)
            {
               refreshMovieList();
               return;
            }
            if(param2)
            {
               Environment.audio.playFX("ui_button_click.mp3");
            }
            _context.scrollUp = false;
            _context.selectMovieLine = false;
            Environment.application.sendActionRequest("retrieveMovieTournamentLeaderboard",{"rank":_loc3_.rank + 1},handleRequests);
            return;
         }
         if(param2)
         {
            Environment.audio.playFX("ui_button_click.mp3");
         }
         refreshMovieList();
      }
      
      public function search(param1:String) : void
      {
         var _loc2_:int = 0;
         _context.selectMovieLine = true;
         if(param1 == _lastSearched)
         {
            _searchCount = _searchCount + 1;
         }
         else
         {
            _searchCount = 0;
         }
         _lastSearched = param1;
         if(isNaN(parseInt(param1)))
         {
            Environment.application.sendActionRequest("retrieveMovieTournamentLeaderboard",{
               "character_name":param1,
               "entry":_searchCount
            },handleRequests);
         }
         else
         {
            _loc2_ = parseInt(param1);
            if(_loc2_.toString() != param1)
            {
               _loc2_ = 2147483647;
            }
            Environment.application.sendActionRequest("retrieveMovieTournamentLeaderboard",{
               "rank":_loc2_,
               "entry":_searchCount
            },handleRequests);
         }
      }
      
      private function handleRequests(param1:ActionRequestResponse) : void
      {
         var _loc4_:* = null;
         var _loc6_:int = 0;
         var _loc5_:int = 0;
         var _loc8_:* = param1.action;
         if("retrieveMovieTournamentLeaderboard" !== _loc8_)
         {
            throw new Error("Unsupported request action \'" + param1.action + "\'!");
         }
         if(param1.error == "")
         {
            Environment.application.updateData(param1.data);
            if(!_movieLine1)
            {
               return;
            }
            _context.lastMovieLeaderboardRefresh = TimeUtil.now;
            _context.movies = new Vector.<LeaderboardMovie>();
            _loc8_ = 0;
            var _loc7_:* = param1.appResponse.leaderboard_movies;
            for each(var _loc2_ in param1.appResponse.leaderboard_movies)
            {
               _loc4_ = new LeaderboardMovie(_loc2_);
               _context.movies.push(_loc4_);
            }
            _context.maxMovies = param1.appResponse.max_movies;
            _loc6_ = param1.appResponse.centered_rank;
            refreshMovieList();
            _loc5_ = 1;
            if(_context.selectMovieLine)
            {
               var _loc10_:int = 0;
               var _loc9_:* = _context.movies;
               for each(var _loc3_ in _context.movies)
               {
                  if(_loc3_.rank == _loc6_)
                  {
                     if(_loc5_ > 10)
                     {
                        _context.offsetMovies = _loc5_ - 10 / 2 + 1;
                        if(_context.offsetMovies > movieCount - 10)
                        {
                           _context.offsetMovies = movieCount - 10;
                        }
                        refreshMovieList();
                     }
                     else
                     {
                        _context.offsetMovies = 0;
                        refreshMovieList();
                     }
                     selectMovieLine(getMovieLine(_loc5_ - _context.offsetMovies));
                     break;
                  }
                  _loc5_++;
               }
            }
            else if(param1.request.hasData("rank"))
            {
               _loc5_ = 1;
               var _loc12_:int = 0;
               var _loc11_:* = _context.movies;
               for each(_loc3_ in _context.movies)
               {
                  if(_loc3_.rank == param1.request.getInt("rank"))
                  {
                     if(_loc5_ > 10)
                     {
                        if(_context.scrollUp)
                        {
                           _context.offsetMovies = _loc5_ - 1;
                        }
                        else
                        {
                           _context.offsetMovies = _loc5_ - 10;
                        }
                        if(_context.offsetMovies > movieCount - 10)
                        {
                           _context.offsetMovies = movieCount - 10;
                        }
                        refreshMovieList();
                     }
                     else
                     {
                        _context.offsetMovies = 0;
                        refreshMovieList();
                     }
                     break;
                  }
                  _loc5_++;
               }
            }
         }
         else if(param1.error == "errTournamentLocked")
         {
            refreshMovieList();
         }
         else if(param1.error == "errRetrieveLeaderboardEmpty")
         {
            refreshMovieList();
         }
         else if(param1.error == "errRetrieveLeaderboardInvalidCharacter")
         {
            Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("error/retrieve_movie_leaderboard_invalid_character_title"),LocText.current.text("error/retrieve_movie_leaderboard_invalid_character_text",param1.request.getString("character_name")),LocText.current.text("general/button_ok")));
         }
         else if(param1.error == "errRetrieveLeaderboardInvalidRank")
         {
            Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("error/retrieve_movie_leaderboard_invalid_rank_title"),LocText.current.text("error/retrieve_movie_leaderboard_invalid_rank_text"),LocText.current.text("general/button_ok")));
         }
         else
         {
            Environment.reportError(param1.error,param1.request);
         }
      }
   }
}
