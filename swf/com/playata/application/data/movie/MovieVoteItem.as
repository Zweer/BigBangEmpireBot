package com.playata.application.data.movie
{
   import com.playata.framework.localization.LocText;
   import visuals.ui.elements.movie.SymbolMovieVoteIconGeneric;
   
   public class MovieVoteItem
   {
       
      
      private var _movieVotes:int;
      
      private var _icon:SymbolMovieVoteIconGeneric;
      
      public function MovieVoteItem(param1:int)
      {
         super();
         _movieVotes = 1;
         _icon = new SymbolMovieVoteIconGeneric();
      }
      
      public function get name() : String
      {
         return LocText.current.text("movie_votes/movie_votes/name");
      }
      
      public function get description() : String
      {
         return LocText.current.text("movie_votes/movie_votes/description",_movieVotes);
      }
      
      public function get icon() : SymbolMovieVoteIconGeneric
      {
         return _icon;
      }
   }
}
