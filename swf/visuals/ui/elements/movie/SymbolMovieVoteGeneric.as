package visuals.ui.elements.movie
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   
   public class SymbolMovieVoteGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolMovieVote = null;
      
      public var cover:SymbolCoverImagePlaceholderGeneric = null;
      
      public var iconOwnGuild:SymbolMovieVoteOwnGuildGeneric = null;
      
      public var iconCustomTitle:SymbolMovieVoteCustomTitleGeneric = null;
      
      public function SymbolMovieVoteGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolMovieVote;
         }
         else
         {
            _nativeObject = new SymbolMovieVote();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         cover = new SymbolCoverImagePlaceholderGeneric(_nativeObject.cover);
         iconOwnGuild = new SymbolMovieVoteOwnGuildGeneric(_nativeObject.iconOwnGuild);
         iconCustomTitle = new SymbolMovieVoteCustomTitleGeneric(_nativeObject.iconCustomTitle);
      }
      
      public function setNativeInstance(param1:SymbolMovieVote) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.cover)
         {
            cover.setNativeInstance(_nativeObject.cover);
         }
         if(_nativeObject.iconOwnGuild)
         {
            iconOwnGuild.setNativeInstance(_nativeObject.iconOwnGuild);
         }
         if(_nativeObject.iconCustomTitle)
         {
            iconCustomTitle.setNativeInstance(_nativeObject.iconCustomTitle);
         }
      }
   }
}
