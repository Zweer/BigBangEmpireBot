package com.playata.application.ui.dialogs
{
   import com.playata.application.data.dataobject.DOMovie;
   import com.playata.application.data.movie.Movie;
   import com.playata.application.data.user.User;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.application.ui.elements.generic.dialog.UiDialog;
   import com.playata.application.ui.elements.movie.UiSelectMovieInfo;
   import com.playata.framework.application.Environment;
   import com.playata.framework.application.request.ActionRequestResponse;
   import com.playata.framework.core.util.NumberUtil;
   import com.playata.framework.data.DataObjectArray;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.dialogs.SymbolDialogSelectMovieGeneric;
   
   public class DialogSelectMovie extends UiDialog
   {
      
      private static const ITEMS_PER_ROW:int = 2;
      
      private static const MAX_ROWS:int = 2;
       
      
      private var _btnClose:UiButton;
      
      private var _movie1:UiSelectMovieInfo;
      
      private var _movie2:UiSelectMovieInfo;
      
      private var _movie3:UiSelectMovieInfo;
      
      private var _movie4:UiSelectMovieInfo;
      
      private var _btnScrollUp:UiButton;
      
      private var _btnScrollDown:UiButton;
      
      private var _offset:int = 0;
      
      private var _movieInfos:Vector.<UiSelectMovieInfo>;
      
      private var _movies:Vector.<Movie>;
      
      private var _selectedMovie:Movie;
      
      public function DialogSelectMovie()
      {
         var _loc1_:SymbolDialogSelectMovieGeneric = new SymbolDialogSelectMovieGeneric();
         super(_loc1_);
         _btnClose = new UiButton(_loc1_.btnClose,"",onClickClose);
         _btnScrollUp = new UiButton(_loc1_.btnUp,"",onClickScrollUp);
         _btnScrollDown = new UiButton(_loc1_.btnDown,"",onClickScrollDown);
         var _loc3_:Boolean = false;
         _btnScrollDown.buttonEnabled = _loc3_;
         _btnScrollUp.buttonEnabled = _loc3_;
         _loc1_.movie1.visible = false;
         _loc1_.movie2.visible = false;
         _loc1_.movie3.visible = false;
         _loc1_.movie4.visible = false;
         _movie1 = new UiSelectMovieInfo(_loc1_.movie1,onSelect);
         _movie2 = new UiSelectMovieInfo(_loc1_.movie2,onSelect);
         _movie3 = new UiSelectMovieInfo(_loc1_.movie3,onSelect);
         _movie4 = new UiSelectMovieInfo(_loc1_.movie4,onSelect);
         _movieInfos = new <UiSelectMovieInfo>[_movie1,_movie2,_movie3,_movie4];
         var _loc2_:int = User.current.character.selectableMoviesCount;
         _loc1_.txtDialogTitle.text = LocText.current.text("dialog/select_movie/title",_loc2_);
         _loc1_.txtDialogTitle.autoFontSize = true;
         _loc1_.txtInfo.text = LocText.current.text("dialog/select_movie/info",(Math.min(_loc2_,21) - 1) * 10);
         Environment.application.sendActionRequest("getMoviesToSelect",{},handleRequests);
      }
      
      private function onSelect(param1:UiSelectMovieInfo) : void
      {
         _selectedMovie = param1.movie;
         Environment.application.sendActionRequest("selectMovie",{"movie_id":_selectedMovie.id},handleRequests);
         refreshMovies("");
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
         _offset = _offset + param1;
         var _loc3_:int = _movies.length;
         var _loc4_:int = getMaxOffset(_loc3_);
         if(_offset > _loc4_)
         {
            _offset = _loc4_;
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
         var _loc2_:UiSelectMovieInfo = null;
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
               _loc2_.refresh(_movies[_loc3_],_movies[_loc3_] == _selectedMovie);
            }
            else
            {
               _loc2_.content.visible = false;
            }
            _loc4_++;
         }
         _btnScrollUp.buttonEnabled = _offset > 0;
         _btnScrollDown.buttonEnabled = _offset < getMaxOffset(_movies.length);
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
      
      private function parseMovieData(param1:DataObjectArray, param2:DOMovie) : void
      {
         _movies = new Vector.<Movie>(0);
         var _loc5_:int = 0;
         var _loc4_:* = param1;
         for each(var _loc3_ in param1)
         {
            _movies.unshift(new Movie(_loc3_));
         }
         if(param2)
         {
            _movies.unshift(new Movie(param2));
         }
         if(_movies.length > 0)
         {
            _selectedMovie = _movies[0];
         }
         if(_selectedMovie && !param2)
         {
            Environment.application.sendActionRequest("selectMovie",{"movie_id":_selectedMovie.id},handleRequests);
         }
         refreshText();
         refreshMovies("init");
      }
      
      private function refreshText() : void
      {
         var _loc1_:* = null;
         if(_movies)
         {
            _loc1_ = _vo as SymbolDialogSelectMovieGeneric;
            _loc1_.txtDialogTitle.text = LocText.current.text("dialog/select_movie/title",_movies.length);
            _loc1_.txtDialogTitle.autoFontSize = true;
            _loc1_.txtInfo.text = LocText.current.text("dialog/select_movie/info",(Math.min(_movies.length,21) - 1) * 10);
         }
      }
      
      private function handleRequests(param1:ActionRequestResponse) : void
      {
         var _loc2_:* = param1.action;
         switch(_loc2_)
         {
            case "getMoviesToSelect":
               if(param1.error == "")
               {
                  Environment.application.updateData(param1.data);
                  parseMovieData(param1.appResponse.movies_to_select,param1.appResponse.selected_movie);
               }
               else
               {
                  Environment.reportError(param1.error,param1.request);
               }
               break;
            case "selectMovie":
               if(param1.error == "")
               {
                  Environment.application.updateData(param1.data);
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
