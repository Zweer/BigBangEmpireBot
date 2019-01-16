package com.playata.application.ui.elements.leaderboard
{
   import com.playata.application.data.movie.LeaderboardMovie;
   import com.playata.application.ui.elements.generic.UiClosableTooltip;
   import com.playata.application.ui.elements.movie.UiMovieCover;
   import com.playata.framework.display.IInteractiveDisplayObject;
   import com.playata.framework.display.ui.TextFieldAutoAdjustWidthHeight;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.base.SymbolUiTooltipLeaderboardMovieGeneric;
   
   public class UiLeaderboardMovieTooltip extends UiClosableTooltip
   {
      
      private static var _tooltipContent:SymbolUiTooltipLeaderboardMovieGeneric;
      
      private static var _cover:UiMovieCover;
      
      private static var _currentMovie:LeaderboardMovie;
       
      
      private var _coverRefreshed:Boolean;
      
      private var _movie:LeaderboardMovie;
      
      public function UiLeaderboardMovieTooltip(param1:IInteractiveDisplayObject)
      {
         if(!_tooltipContent)
         {
            _tooltipContent = new SymbolUiTooltipLeaderboardMovieGeneric();
            _tooltipContent.txtMovieTitle.autoAdjustWidthHeight = TextFieldAutoAdjustWidthHeight.VERTICAL;
            _cover = new UiMovieCover(_tooltipContent.cover);
            _tooltipContent.txtStudioTitle.text = LocText.current.text("dialog/movie_history/studio_caption");
         }
         super(param1,_tooltipContent);
      }
      
      override public function get height() : Number
      {
         return _tooltipContent.background.height * _tooltipContent.scale;
      }
      
      override public function get width() : Number
      {
         return _tooltipContent.background.width * _tooltipContent.scale;
      }
      
      override public function onAssigned() : void
      {
         if(_currentMovie == _movie)
         {
            return;
         }
         _currentMovie = _movie;
         if(_movie == null)
         {
            _tooltipContent.visible = false;
            return;
         }
         _coverRefreshed = false;
         _tooltipContent.txtMovieTitle.text = _movie.title;
         _tooltipContent.txtMovieTitle.y = 13 + (100 - _tooltipContent.txtMovieTitle.height) * 0.5;
         _tooltipContent.txtStudioName.text = !!_movie.hasGuild?_movie.guildName:LocText.current.text("dialog/movie_history/no_studio");
         _tooltipContent.txtStudioName.textColor = !!_movie.isMyGuild?245728:14342874;
      }
      
      public function refresh(param1:LeaderboardMovie) : void
      {
         _movie = param1;
      }
      
      override public function dispose() : void
      {
         _movie = null;
         super.dispose();
      }
      
      override protected function handleInteractionOver(param1:InteractionEvent) : void
      {
         super.handleInteractionOver(param1);
         if(!_coverRefreshed && _movie)
         {
            _cover.showWithSettings(_movie.coverSettings);
            _coverRefreshed = true;
         }
      }
   }
}
