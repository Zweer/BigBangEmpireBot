package visuals.ui.base
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabel;
   import com.playata.framework.display.lib.flash.FlashLabelArea;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabel;
   import com.playata.framework.display.ui.controls.ILabelArea;
   import flash.display.MovieClip;
   import visuals.ui.elements.backgrounds.SymbolBackgroundScalableGeneric;
   import visuals.ui.elements.backgrounds.SymbolSlice9BackgroundTooltipGeneric;
   import visuals.ui.elements.movie.SymbolCoverImagePlaceholderGeneric;
   
   public class SymbolUiTooltipLeaderboardMovieGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolUiTooltipLeaderboardMovie = null;
      
      public var background:SymbolSlice9BackgroundTooltipGeneric = null;
      
      public var txtStudioTitle:ILabelArea = null;
      
      public var txtStudioName:ILabel = null;
      
      public var symbolBackgroundScalable:SymbolBackgroundScalableGeneric = null;
      
      public var txtMovieTitle:ILabelArea = null;
      
      public var cover:SymbolCoverImagePlaceholderGeneric = null;
      
      public function SymbolUiTooltipLeaderboardMovieGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolUiTooltipLeaderboardMovie;
         }
         else
         {
            _nativeObject = new SymbolUiTooltipLeaderboardMovie();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         background = new SymbolSlice9BackgroundTooltipGeneric(_nativeObject.background);
         txtStudioTitle = FlashLabelArea.fromNative(_nativeObject.txtStudioTitle);
         txtStudioName = FlashLabel.fromNative(_nativeObject.txtStudioName);
         symbolBackgroundScalable = new SymbolBackgroundScalableGeneric(_nativeObject.symbolBackgroundScalable);
         txtMovieTitle = FlashLabelArea.fromNative(_nativeObject.txtMovieTitle);
         cover = new SymbolCoverImagePlaceholderGeneric(_nativeObject.cover);
      }
      
      public function setNativeInstance(param1:SymbolUiTooltipLeaderboardMovie) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.background)
         {
            background.setNativeInstance(_nativeObject.background);
         }
         FlashLabelArea.setNativeInstance(txtStudioTitle,_nativeObject.txtStudioTitle);
         FlashLabel.setNativeInstance(txtStudioName,_nativeObject.txtStudioName);
         if(_nativeObject.symbolBackgroundScalable)
         {
            symbolBackgroundScalable.setNativeInstance(_nativeObject.symbolBackgroundScalable);
         }
         FlashLabelArea.setNativeInstance(txtMovieTitle,_nativeObject.txtMovieTitle);
         if(_nativeObject.cover)
         {
            cover.setNativeInstance(_nativeObject.cover);
         }
      }
   }
}
