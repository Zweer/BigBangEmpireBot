package com.playata.application.ui.dialogs
{
   import com.playata.application.data.character.Character;
   import com.playata.application.data.guild.Guild;
   import com.playata.application.data.movie.Movie;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.application.ui.elements.generic.dialog.UiDialog;
   import com.playata.application.ui.elements.movie.UiMovieInfo;
   import com.playata.framework.application.Environment;
   import com.playata.framework.application.request.ActionRequestResponse;
   import com.playata.framework.core.util.NumberUtil;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.dialogs.SymbolDialogMovieHistoryGeneric;
   
   public class DialogMovieHistory extends UiDialog
   {
      
      private static const ITEMS_PER_ROW:int = 2;
      
      private static const MAX_ROWS:int = 2;
       
      
      private var _btnClose:UiButton;
      
      private var _movie1:UiMovieInfo;
      
      private var _movie2:UiMovieInfo;
      
      private var _movie3:UiMovieInfo;
      
      private var _movie4:UiMovieInfo;
      
      private var _btnScrollUp:UiButton;
      
      private var _btnScrollDown:UiButton;
      
      private var _offset:int = 0;
      
      private var _movieInfos:Vector.<UiMovieInfo>;
      
      private var _movies:Vector.<Movie>;
      
      private var _mode:int;
      
      private var _showReportButton:Boolean;
      
      private var _moviesCount:int = 0;
      
      private var _characterOrGuild;
      
      public function DialogMovieHistory(param1:*)
      {
         var _loc3_:* = null;
         var _loc2_:* = null;
         var _loc4_:SymbolDialogMovieHistoryGeneric = new SymbolDialogMovieHistoryGeneric();
         super(_loc4_);
         _characterOrGuild = param1;
         _btnClose = new UiButton(_loc4_.btnClose,"",onClickClose);
         _btnScrollUp = new UiButton(_loc4_.btnUp,"",onClickScrollUp);
         _btnScrollDown = new UiButton(_loc4_.btnDown,"",onClickScrollDown);
         var _loc5_:Boolean = false;
         _btnScrollDown.buttonEnabled = _loc5_;
         _btnScrollUp.buttonEnabled = _loc5_;
         _loc4_.movie1.visible = false;
         _loc4_.movie2.visible = false;
         _loc4_.movie3.visible = false;
         _loc4_.movie4.visible = false;
         _movie1 = new UiMovieInfo(_loc4_.movie1);
         _movie2 = new UiMovieInfo(_loc4_.movie2);
         _movie3 = new UiMovieInfo(_loc4_.movie3);
         _movie4 = new UiMovieInfo(_loc4_.movie4);
         _movieInfos = new <UiMovieInfo>[_movie1,_movie2,_movie3,_movie4];
         _showReportButton = true;
         _movies = new Vector.<Movie>(0);
         if(_characterOrGuild is Character)
         {
            _mode = 0;
            _loc3_ = _characterOrGuild as Character;
            _loc4_.txtDialogTitle.text = LocText.current.text("dialog/movie_history/title",_loc3_.name);
            Environment.application.sendActionRequest("getMovies",{
               "character_id":_loc3_.id,
               "offset":0
            },handleRequests);
            _loc4_.txtMovies.text = LocText.current.text("dialog/guild_statistics/movies",_loc3_.moviesTotal);
            _loc4_.txtFans.text = LocText.current.text("dialog/guild_statistics/fans",_loc3_.fansTotal);
            _showReportButton = !_loc3_.isMe;
         }
         else
         {
            _mode = 1;
            _loc2_ = _characterOrGuild as Guild;
            _loc4_.txtDialogTitle.text = LocText.current.text("dialog/movie_history/title",_loc2_.name);
            Environment.application.sendActionRequest("getGuildMovies",{
               "guild_id":_loc2_.id,
               "offset":0
            },handleRequests);
            _loc4_.txtMovies.text = LocText.current.text("dialog/guild_statistics/movies",_loc2_.movies);
            _loc4_.txtFans.text = LocText.current.text("dialog/guild_statistics/fans",_loc2_.fans);
         }
      }
      
      private function onClickScrollUp(param1:InteractionEvent) : void
      {
         scrollUp(2,false);
      }
      
      private function onClickScrollDown(param1:InteractionEvent) : void
      {
         scrollDown(2,false);
      }
      
      private function scrollUp(param1:int, param2:Boolean) : void
      {
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
         refreshMovies("up");
      }
      
      private function scrollDown(param1:int, param2:Boolean) : void
      {
         var _loc4_:* = null;
         var _loc3_:* = null;
         _offset = _offset + param1;
         var _loc5_:int = _movies.length;
         var _loc6_:int = getMaxOffset(_loc5_);
         if(_offset > _loc6_)
         {
            if(_movies.length < _moviesCount)
            {
               if(_characterOrGuild is Character)
               {
                  _loc4_ = _characterOrGuild as Character;
                  Environment.application.sendActionRequest("getMovies",{
                     "character_id":_loc4_.id,
                     "offset":_loc5_
                  },handleRequests);
               }
               else
               {
                  _loc3_ = _characterOrGuild as Guild;
                  Environment.application.sendActionRequest("getGuildMovies",{
                     "guild_id":_loc3_.id,
                     "offset":_loc5_
                  },handleRequests);
               }
               return;
            }
            _offset = _loc6_;
            param2 = false;
         }
         if(param2)
         {
            Environment.audio.playFX("ui_button_click.mp3");
         }
         refreshMovies("down");
      }
      
      private function refreshMovies(param1:String) : void
      {
         var _loc4_:int = 0;
         var _loc2_:UiMovieInfo = null;
         var _loc3_:int = 0;
         _loc4_ = 0;
         while(_loc4_ < 2 * 2)
         {
            _loc2_ = _movieInfos[_loc4_];
            _loc3_ = _loc4_ + _offset;
            if(_loc3_ < _movies.length)
            {
               var _loc5_:* = param1;
               switch(_loc5_)
               {
                  case "up":
                     _loc2_.rotation = _loc4_ >= 2?_movieInfos[_loc4_ - 2].rotation:NumberUtil.randomNumber(-3,3);
                     break;
                  case "down":
                     _loc2_.rotation = _loc4_ < 2 * (2 - 1)?_movieInfos[_loc4_ + 2].rotation:NumberUtil.randomNumber(-3,3);
                     break;
                  case "init":
                     _loc2_.rotation = NumberUtil.randomNumber(-3,3);
               }
            }
            _loc4_++;
         }
         _loc4_ = 0;
         while(_loc4_ < 2 * 2)
         {
            _loc2_ = _movieInfos[_loc4_];
            _loc3_ = _loc4_ + _offset;
            if(_loc3_ < _movies.length)
            {
               _loc2_.content.visible = true;
               _loc2_.refresh(_movies[_loc3_],_mode,_showReportButton);
            }
            else
            {
               _loc2_.content.visible = false;
            }
            _loc4_++;
         }
         _btnScrollUp.buttonEnabled = _offset > 0;
         _btnScrollDown.buttonEnabled = _offset < getMaxOffset(_moviesCount);
      }
      
      private function getMaxOffset(param1:int) : int
      {
         return Math.ceil(param1 / 2) * 2 - 2 * 2;
      }
      
      private function onClickClose(param1:InteractionEvent) : void
      {
         close();
      }
      
      override public function dispose() : void
      {
         _btnClose.dispose();
         _btnClose = null;
         _btnScrollDown.dispose();
         _btnScrollDown = null;
         _btnScrollUp.dispose();
         _btnScrollUp = null;
         _movie1.dispose();
         _movie2.dispose();
         _movie3.dispose();
         _movie4.dispose();
         super.dispose();
      }
      
      private function parseMovieData(param1:Array) : void
      {
         var _loc2_:* = _movies.length == 0;
         var _loc5_:int = 0;
         var _loc4_:* = param1;
         for each(var _loc3_ in param1)
         {
            _movies.push(new Movie(_loc3_));
         }
         _movies.sort(sortByTsCompleted);
         refreshMovies(!!_loc2_?"init":"none");
      }
      
      private function sortByTsCompleted(param1:Movie, param2:Movie) : int
      {
         return param2.tsCompleted - param1.tsCompleted;
      }
      
      private function handleRequests(param1:ActionRequestResponse) : void
      {
         var _loc2_:* = param1.action;
         switch(_loc2_)
         {
            case "getMovies":
               if(param1.error == "")
               {
                  Environment.application.updateData(param1.data);
                  _moviesCount = param1.appResponse.movies_count;
                  parseMovieData(param1.data.movie_history);
               }
               else
               {
                  Environment.reportError(param1.error,param1.request);
               }
               break;
            case "getGuildMovies":
               if(param1.error == "")
               {
                  Environment.application.updateData(param1.data);
                  _moviesCount = param1.appResponse.movies_count;
                  parseMovieData(param1.data.movie_history);
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
         close();
      }
   }
}
