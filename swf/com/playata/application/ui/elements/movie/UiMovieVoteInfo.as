package com.playata.application.ui.elements.movie
{
   import com.playata.application.data.movie.Movie;
   import com.playata.application.data.user.User;
   import com.playata.application.ui.elements.generic.textfield.UiTextTooltip;
   import com.playata.framework.localization.LocText;
   import visuals.ui.elements.movie.SymbolMovieVoteGeneric;
   
   public class UiMovieVoteInfo
   {
       
      
      private var _content:SymbolMovieVoteGeneric;
      
      private var _tooltip:UiTextTooltip;
      
      private var _cover:UiMovieCover;
      
      private var _movie:Movie;
      
      public function UiMovieVoteInfo(param1:SymbolMovieVoteGeneric)
      {
         super();
         _content = param1;
         _tooltip = new UiTextTooltip(_content,"");
         _cover = new UiMovieCover(_content.cover);
      }
      
      public function get content() : SymbolMovieVoteGeneric
      {
         return _content;
      }
      
      public function refresh(param1:Movie) : void
      {
         _movie = param1;
         _tooltip.text = param1.title;
         if(isMyGuild)
         {
            _content.txtMovieTitle.visible = true;
            _content.txtMovieTitle.text = LocText.current.text("dialog/movie_vote/your_studio");
         }
         else
         {
            _content.txtMovieTitle.visible = false;
         }
         _cover.showWithSettings(param1.coverSettings);
      }
      
      private function get isMe() : Boolean
      {
         return User.current.character.name == _movie.characterName;
      }
      
      private function get isMyGuildMember() : Boolean
      {
         if(isMe)
         {
            return false;
         }
         if(!User.current.character.hasGuild)
         {
            return false;
         }
         return User.current.character.guild.getMember(_movie.characterName) !== null;
      }
      
      private function get isMyGuild() : Boolean
      {
         if(!User.current.character.hasGuild)
         {
            return false;
         }
         return User.current.character.guild.name == _movie.guildName;
      }
      
      public function dispose() : void
      {
         _tooltip.dispose();
         _tooltip = null;
         _cover = null;
      }
      
      public function get rotation() : Number
      {
         return _content.cover.rotation;
      }
      
      public function set rotation(param1:Number) : void
      {
         _content.cover.rotation = param1;
      }
   }
}
