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
      
      private var _ownGuildTootlip:UiTextTooltip;
      
      private var _customTitleTootlip:UiTextTooltip;
      
      public function UiMovieVoteInfo(param1:SymbolMovieVoteGeneric)
      {
         super();
         _content = param1;
         _tooltip = new UiTextTooltip(_content.cover,"");
         _cover = new UiMovieCover(_content.cover);
         _content.iconOwnGuild.visible = false;
         _content.iconCustomTitle.visible = false;
         _ownGuildTootlip = new UiTextTooltip(_content.iconOwnGuild,LocText.current.text("dialog/movie_vote/your_studio_tooltip"));
         _customTitleTootlip = new UiTextTooltip(_content.iconCustomTitle,LocText.current.text("dialog/movie_vote/custom_title_tooltip"));
      }
      
      public function get content() : SymbolMovieVoteGeneric
      {
         return _content;
      }
      
      public function refresh(param1:Movie) : void
      {
         _movie = param1;
         _tooltip.text = param1.title;
         _content.iconOwnGuild.visible = isMyGuild;
         _content.iconCustomTitle.visible = param1.isCustomTitle;
         _content.iconCustomTitle.x = !!_content.iconOwnGuild.visible?_content.iconOwnGuild.x + _content.iconOwnGuild.width + 10:Number(_content.iconOwnGuild.x);
         _cover.showWithSettings(param1.coverSettings);
      }
      
      private function get isMe() : Boolean
      {
         return User.current.character.name == _movie.characterName;
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
         _ownGuildTootlip.dispose();
         _customTitleTootlip.dispose();
         _ownGuildTootlip = null;
         _customTitleTootlip = null;
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
