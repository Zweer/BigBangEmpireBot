package com.playata.application.ui.elements.movie
{
   import com.playata.application.AppConfig;
   import com.playata.application.data.character.Character;
   import com.playata.application.data.user.User;
   import com.playata.application.ui.ViewManager;
   import com.playata.application.ui.dialogs.DialogSelectMovie;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.framework.application.Environment;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import visuals.ui.elements.icons.SymbolIconSelectMovieGeneric;
   
   public class UiSelectMovieButton extends UiButton
   {
       
      
      private var _realContent:SymbolIconSelectMovieGeneric;
      
      public function UiSelectMovieButton(param1:SymbolIconSelectMovieGeneric)
      {
         _realContent = param1;
         super(param1,"",onClickSelectMovie);
         visible = false;
         _enabled = AppConfig.movieTournamentsEnabled;
      }
      
      public function refresh() : void
      {
         if(!_enabled)
         {
            return;
         }
         var _loc1_:Character = User.current.character;
         visible = _loc1_.selectableMoviesCount > 1;
         _realContent.info.caption.text = _loc1_.selectableMoviesCount.toString();
         tooltip = LocText.current.text("dialog/select_movie/btn_movie_vote_button",_loc1_.selectableMoviesCount);
      }
      
      private function onClickSelectMovie(param1:InteractionEvent) : void
      {
         ViewManager.instance.tutorialArrow.hide();
         Environment.panelManager.showDialog(new DialogSelectMovie());
      }
   }
}
