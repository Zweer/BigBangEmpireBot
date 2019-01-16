package com.playata.application.data.leaderboard
{
   import com.playata.application.data.movie.LeaderboardMovie;
   
   public class MovieLeaderboardContext
   {
       
      
      public var lastMovieLeaderboardRefresh:int = 0;
      
      public var currentMovie:LeaderboardMovie = null;
      
      public var movies:Vector.<LeaderboardMovie>;
      
      public var maxMovies:int = 0;
      
      public var selectMovieLine:Boolean = true;
      
      public var offsetMovies:int = 0;
      
      public var scrollUp:Boolean = true;
      
      public function MovieLeaderboardContext()
      {
         movies = new Vector.<LeaderboardMovie>();
         super();
      }
      
      public function reset() : void
      {
         lastMovieLeaderboardRefresh = 0;
         currentMovie = null;
         movies = new Vector.<LeaderboardMovie>();
         maxMovies = 0;
         selectMovieLine = true;
         offsetMovies = 0;
      }
   }
}
