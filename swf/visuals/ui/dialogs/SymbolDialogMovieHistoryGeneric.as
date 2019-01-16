package visuals.ui.dialogs
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
   import visuals.ui.elements.backgrounds.SymbolSlice9BackgroundDialogGeneric;
   import visuals.ui.elements.buttons.SymbolButtonArrowDownGeneric;
   import visuals.ui.elements.buttons.SymbolButtonArrowUpGeneric;
   import visuals.ui.elements.buttons.SymbolButtonCloseGeneric;
   import visuals.ui.elements.movie.SymbolMovieCompleteGeneric;
   
   public class SymbolDialogMovieHistoryGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolDialogMovieHistory = null;
      
      public var dialogBackground:SymbolSlice9BackgroundDialogGeneric = null;
      
      public var symbolBackgroundScalable:SymbolBackgroundScalableGeneric = null;
      
      public var btnClose:SymbolButtonCloseGeneric = null;
      
      public var txtDialogTitle:ILabel = null;
      
      public var txtMovies:ILabelArea = null;
      
      public var txtFans:ILabelArea = null;
      
      public var movie2:SymbolMovieCompleteGeneric = null;
      
      public var movie4:SymbolMovieCompleteGeneric = null;
      
      public var btnUp:SymbolButtonArrowUpGeneric = null;
      
      public var btnDown:SymbolButtonArrowDownGeneric = null;
      
      public var movie1:SymbolMovieCompleteGeneric = null;
      
      public var movie3:SymbolMovieCompleteGeneric = null;
      
      public function SymbolDialogMovieHistoryGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolDialogMovieHistory;
         }
         else
         {
            _nativeObject = new SymbolDialogMovieHistory();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         dialogBackground = new SymbolSlice9BackgroundDialogGeneric(_nativeObject.dialogBackground);
         symbolBackgroundScalable = new SymbolBackgroundScalableGeneric(_nativeObject.symbolBackgroundScalable);
         btnClose = new SymbolButtonCloseGeneric(_nativeObject.btnClose);
         txtDialogTitle = FlashLabel.fromNative(_nativeObject.txtDialogTitle);
         txtMovies = FlashLabelArea.fromNative(_nativeObject.txtMovies);
         txtFans = FlashLabelArea.fromNative(_nativeObject.txtFans);
         movie2 = new SymbolMovieCompleteGeneric(_nativeObject.movie2);
         movie4 = new SymbolMovieCompleteGeneric(_nativeObject.movie4);
         btnUp = new SymbolButtonArrowUpGeneric(_nativeObject.btnUp);
         btnDown = new SymbolButtonArrowDownGeneric(_nativeObject.btnDown);
         movie1 = new SymbolMovieCompleteGeneric(_nativeObject.movie1);
         movie3 = new SymbolMovieCompleteGeneric(_nativeObject.movie3);
      }
      
      public function setNativeInstance(param1:SymbolDialogMovieHistory) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.dialogBackground)
         {
            dialogBackground.setNativeInstance(_nativeObject.dialogBackground);
         }
         if(_nativeObject.symbolBackgroundScalable)
         {
            symbolBackgroundScalable.setNativeInstance(_nativeObject.symbolBackgroundScalable);
         }
         if(_nativeObject.btnClose)
         {
            btnClose.setNativeInstance(_nativeObject.btnClose);
         }
         FlashLabel.setNativeInstance(txtDialogTitle,_nativeObject.txtDialogTitle);
         FlashLabelArea.setNativeInstance(txtMovies,_nativeObject.txtMovies);
         FlashLabelArea.setNativeInstance(txtFans,_nativeObject.txtFans);
         if(_nativeObject.movie2)
         {
            movie2.setNativeInstance(_nativeObject.movie2);
         }
         if(_nativeObject.movie4)
         {
            movie4.setNativeInstance(_nativeObject.movie4);
         }
         if(_nativeObject.btnUp)
         {
            btnUp.setNativeInstance(_nativeObject.btnUp);
         }
         if(_nativeObject.btnDown)
         {
            btnDown.setNativeInstance(_nativeObject.btnDown);
         }
         if(_nativeObject.movie1)
         {
            movie1.setNativeInstance(_nativeObject.movie1);
         }
         if(_nativeObject.movie3)
         {
            movie3.setNativeInstance(_nativeObject.movie3);
         }
      }
   }
}
