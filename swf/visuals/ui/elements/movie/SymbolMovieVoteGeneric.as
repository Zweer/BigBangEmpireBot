package visuals.ui.elements.movie
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabel;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabel;
   import flash.display.MovieClip;
   
   public class SymbolMovieVoteGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolMovieVote = null;
      
      public var cover:SymbolCoverImagePlaceholderGeneric = null;
      
      public var txtMovieTitle:ILabel = null;
      
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
         txtMovieTitle = FlashLabel.fromNative(_nativeObject.txtMovieTitle);
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
         FlashLabel.setNativeInstance(txtMovieTitle,_nativeObject.txtMovieTitle);
      }
   }
}
