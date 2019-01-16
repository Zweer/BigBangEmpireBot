package com.playata.application.ui.elements.movie
{
   import com.greensock.easing.Linear;
   import com.playata.application.AppEnvironment;
   import com.playata.application.data.movie.Movie;
   import com.playata.application.data.user.User;
   import com.playata.application.ui.dialogs.DialogReportMovies;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.application.ui.elements.generic.textfield.UiTextTooltip;
   import com.playata.framework.application.Environment;
   import com.playata.framework.display.InteractiveDisplayObject;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.elements.movie.SymbolMovieCompleteGeneric;
   
   public class UiMovieInfo extends InteractiveDisplayObject
   {
      
      public static const PLAYER_HISTORY:int = 0;
      
      public static const GUILD_HISTORY:int = 1;
       
      
      private var _content:SymbolMovieCompleteGeneric;
      
      private var _tooltip:UiTextTooltip;
      
      private var _cover:UiMovieCover;
      
      private var _movie:Movie;
      
      private var _btnReport:UiButton;
      
      public function UiMovieInfo(param1:SymbolMovieCompleteGeneric)
      {
         _content = param1;
         super(_content);
         _tooltip = new UiTextTooltip(_content,"");
         _cover = new UiMovieCover(_content.cover);
         onInteractionOver.add(onOver);
         onInteractionOut.add(onOut);
         _content.txtDateCaption.text = LocText.current.text("dialog/movie_history/date_caption");
         _content.txtSetCaption.text = LocText.current.text("dialog/movie_history/set_caption");
         _content.txtFansCaption.text = LocText.current.text("dialog/movie_history/fans_caption");
         _content.shareInfo.alpha = 0;
         _content.shareInfo.visible = false;
         _btnReport = new UiButton(_content.btnReport,"",onClickReportMovie);
      }
      
      private function onOut(param1:InteractionEvent) : void
      {
         if(AppEnvironment.appPlatform.isFacebook)
         {
            _content.shareInfo.tweenTo(0.2,{
               "autoAlpha":0,
               "ease":Linear.easeNone
            });
         }
      }
      
      private function onOver(param1:InteractionEvent) : void
      {
         _content.bringToTop();
         if(AppEnvironment.appPlatform.isFacebook)
         {
            _content.shareInfo.tweenTo(0.7,{
               "autoAlpha":1,
               "ease":Linear.easeNone
            });
         }
      }
      
      public function get content() : SymbolMovieCompleteGeneric
      {
         return _content;
      }
      
      public function refresh(param1:Movie, param2:int, param3:Boolean = true) : void
      {
         _movie = param1;
         _content.txtDate.text = param1.dateTime;
         _content.txtSet.text = LocText.current.text("movie/setting/" + param1.setIdentifier + "/name");
         _content.txtFans.text = LocText.current.formatHugeNumber(param1.fans);
         _content.rating.gotoAndStop(_movie.starsBasedOnRating + 1);
         if(_movie.rank > 0)
         {
            _content.tournament.visible = true;
            _content.tournament.txtRank.text = _movie.rank + ".";
            _content.rating.x = 135;
         }
         else
         {
            _content.tournament.visible = false;
            _content.rating.x = 177;
         }
         _tooltip.text = param1.title;
         if(param2 == 0)
         {
            _content.txtStudioOrActorCaption.text = LocText.current.text("dialog/movie_history/studio_caption");
            _content.txtStudioOrActor.text = param1.guildName != ""?param1.guildName:LocText.current.text("dialog/movie_history/no_studio");
            _btnReport.visible = param3;
         }
         else
         {
            _content.txtStudioOrActorCaption.text = LocText.current.text("dialog/movie_history/name_caption");
            _content.txtStudioOrActor.text = param1.characterName;
            _btnReport.visible = param3 && User.current.character.name != param1.characterName;
         }
         _cover.showWithSettings(param1.coverSettings);
         if(param3)
         {
            _btnReport.tooltip = LocText.current.text("dialog/movie_history/report_movie_tooltip",_movie.title);
         }
      }
      
      private function onClickReportMovie(param1:InteractionEvent) : void
      {
         Environment.panelManager.showDialog(new DialogReportMovies(_movie));
      }
      
      override public function dispose() : void
      {
         _tooltip.dispose();
         _btnReport.dispose();
         _btnReport = null;
         super.dispose();
      }
      
      override public function get rotation() : Number
      {
         return _content.cover.rotation;
      }
      
      override public function set rotation(param1:Number) : void
      {
         _content.cover.rotation = param1;
      }
   }
}
