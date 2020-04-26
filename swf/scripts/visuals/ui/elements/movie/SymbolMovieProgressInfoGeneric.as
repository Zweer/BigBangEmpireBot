package visuals.ui.elements.movie
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabelArea;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabelArea;
   import flash.display.MovieClip;
   import visuals.ui.base.SymbolUiButtonDefaultGeneric;
   import visuals.ui.elements.backgrounds.SymbolBackgroundScalableGeneric;
   import visuals.ui.elements.backgrounds.SymbolSlice9BackgroundDialogGeneric;
   import visuals.ui.elements.icons.SymbolIconLockBigGeneric;
   
   public class SymbolMovieProgressInfoGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolMovieProgressInfo = null;
      
      public var bg:SymbolSlice9BackgroundDialogGeneric = null;
      
      public var symbolBackgroundScalable:SymbolBackgroundScalableGeneric = null;
      
      public var txtMovieTitle:ILabelArea = null;
      
      public var btnTitle:SymbolUiButtonDefaultGeneric = null;
      
      public var symbolBackgroundScalable2:SymbolBackgroundScalableGeneric = null;
      
      public var cover:SymbolCoverImagePlaceholderGeneric = null;
      
      public var btnCover:SymbolUiButtonDefaultGeneric = null;
      
      public var symbolBackgroundScalable3:SymbolBackgroundScalableGeneric = null;
      
      public var txtTournamentInfo:ILabelArea = null;
      
      public var progress:SymbolMovieMeterGeneric = null;
      
      public var lockTitle:SymbolIconLockBigGeneric = null;
      
      public var lockCover:SymbolIconLockBigGeneric = null;
      
      public var lockTournament:SymbolIconLockBigGeneric = null;
      
      public function SymbolMovieProgressInfoGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolMovieProgressInfo;
         }
         else
         {
            _nativeObject = new SymbolMovieProgressInfo();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         bg = new SymbolSlice9BackgroundDialogGeneric(_nativeObject.bg);
         symbolBackgroundScalable = new SymbolBackgroundScalableGeneric(_nativeObject.symbolBackgroundScalable);
         txtMovieTitle = FlashLabelArea.fromNative(_nativeObject.txtMovieTitle);
         btnTitle = new SymbolUiButtonDefaultGeneric(_nativeObject.btnTitle);
         symbolBackgroundScalable2 = new SymbolBackgroundScalableGeneric(_nativeObject.symbolBackgroundScalable2);
         cover = new SymbolCoverImagePlaceholderGeneric(_nativeObject.cover);
         btnCover = new SymbolUiButtonDefaultGeneric(_nativeObject.btnCover);
         symbolBackgroundScalable3 = new SymbolBackgroundScalableGeneric(_nativeObject.symbolBackgroundScalable3);
         txtTournamentInfo = FlashLabelArea.fromNative(_nativeObject.txtTournamentInfo);
         progress = new SymbolMovieMeterGeneric(_nativeObject.progress);
         lockTitle = new SymbolIconLockBigGeneric(_nativeObject.lockTitle);
         lockCover = new SymbolIconLockBigGeneric(_nativeObject.lockCover);
         lockTournament = new SymbolIconLockBigGeneric(_nativeObject.lockTournament);
      }
      
      public function setNativeInstance(param1:SymbolMovieProgressInfo) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.bg)
         {
            bg.setNativeInstance(_nativeObject.bg);
         }
         if(_nativeObject.symbolBackgroundScalable)
         {
            symbolBackgroundScalable.setNativeInstance(_nativeObject.symbolBackgroundScalable);
         }
         FlashLabelArea.setNativeInstance(txtMovieTitle,_nativeObject.txtMovieTitle);
         if(_nativeObject.btnTitle)
         {
            btnTitle.setNativeInstance(_nativeObject.btnTitle);
         }
         if(_nativeObject.symbolBackgroundScalable2)
         {
            symbolBackgroundScalable2.setNativeInstance(_nativeObject.symbolBackgroundScalable2);
         }
         if(_nativeObject.cover)
         {
            cover.setNativeInstance(_nativeObject.cover);
         }
         if(_nativeObject.btnCover)
         {
            btnCover.setNativeInstance(_nativeObject.btnCover);
         }
         if(_nativeObject.symbolBackgroundScalable3)
         {
            symbolBackgroundScalable3.setNativeInstance(_nativeObject.symbolBackgroundScalable3);
         }
         FlashLabelArea.setNativeInstance(txtTournamentInfo,_nativeObject.txtTournamentInfo);
         if(_nativeObject.progress)
         {
            progress.setNativeInstance(_nativeObject.progress);
         }
         if(_nativeObject.lockTitle)
         {
            lockTitle.setNativeInstance(_nativeObject.lockTitle);
         }
         if(_nativeObject.lockCover)
         {
            lockCover.setNativeInstance(_nativeObject.lockCover);
         }
         if(_nativeObject.lockTournament)
         {
            lockTournament.setNativeInstance(_nativeObject.lockTournament);
         }
      }
   }
}
