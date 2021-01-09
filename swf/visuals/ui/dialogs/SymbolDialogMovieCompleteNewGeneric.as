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
   import visuals.ui.base.SymbolUiButtonDefaultGeneric;
   import visuals.ui.elements.backgrounds.SymbolBackgroundScalableGeneric;
   import visuals.ui.elements.backgrounds.SymbolSlice9BackgroundDialogGeneric;
   import visuals.ui.elements.icons.SymbolIconFansGeneric;
   import visuals.ui.elements.movie.SymbolCoverImagePlaceholderGeneric;
   import visuals.ui.elements.movie.SymbolMovieRatingStarsGeneric;
   
   public class SymbolDialogMovieCompleteNewGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolDialogMovieCompleteNew = null;
      
      public var dialogBackground:SymbolSlice9BackgroundDialogGeneric = null;
      
      public var symbolBackgroundScalable:SymbolBackgroundScalableGeneric = null;
      
      public var btnClose:SymbolUiButtonDefaultGeneric = null;
      
      public var txtMovieTitle:ILabelArea = null;
      
      public var txtRewardCaption:ILabel = null;
      
      public var txtRewardInfo:ILabelArea = null;
      
      public var iconFans:SymbolIconFansGeneric = null;
      
      public var txtNewFans:ILabelArea = null;
      
      public var cover:SymbolCoverImagePlaceholderGeneric = null;
      
      public var rating:SymbolMovieRatingStarsGeneric = null;
      
      public function SymbolDialogMovieCompleteNewGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolDialogMovieCompleteNew;
         }
         else
         {
            _nativeObject = new SymbolDialogMovieCompleteNew();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         dialogBackground = new SymbolSlice9BackgroundDialogGeneric(_nativeObject.dialogBackground);
         symbolBackgroundScalable = new SymbolBackgroundScalableGeneric(_nativeObject.symbolBackgroundScalable);
         btnClose = new SymbolUiButtonDefaultGeneric(_nativeObject.btnClose);
         txtMovieTitle = FlashLabelArea.fromNative(_nativeObject.txtMovieTitle);
         txtRewardCaption = FlashLabel.fromNative(_nativeObject.txtRewardCaption);
         txtRewardInfo = FlashLabelArea.fromNative(_nativeObject.txtRewardInfo);
         iconFans = new SymbolIconFansGeneric(_nativeObject.iconFans);
         txtNewFans = FlashLabelArea.fromNative(_nativeObject.txtNewFans);
         cover = new SymbolCoverImagePlaceholderGeneric(_nativeObject.cover);
         rating = new SymbolMovieRatingStarsGeneric(_nativeObject.rating);
      }
      
      public function setNativeInstance(param1:SymbolDialogMovieCompleteNew) : void
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
         FlashLabelArea.setNativeInstance(txtMovieTitle,_nativeObject.txtMovieTitle);
         FlashLabel.setNativeInstance(txtRewardCaption,_nativeObject.txtRewardCaption);
         FlashLabelArea.setNativeInstance(txtRewardInfo,_nativeObject.txtRewardInfo);
         if(_nativeObject.iconFans)
         {
            iconFans.setNativeInstance(_nativeObject.iconFans);
         }
         FlashLabelArea.setNativeInstance(txtNewFans,_nativeObject.txtNewFans);
         if(_nativeObject.cover)
         {
            cover.setNativeInstance(_nativeObject.cover);
         }
         if(_nativeObject.rating)
         {
            rating.setNativeInstance(_nativeObject.rating);
         }
      }
   }
}
