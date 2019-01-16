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
   import visuals.ui.elements.buttons.SymbolButtonCustomTitleGeneric;
   import visuals.ui.elements.buttons.SymbolButtonPremiumGeneric;
   
   public class SymbolDialogMovieTitleGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolDialogMovieTitle = null;
      
      public var dialogBackground:SymbolSlice9BackgroundDialogGeneric = null;
      
      public var symbolBackgroundScalable:SymbolBackgroundScalableGeneric = null;
      
      public var txtDialogTitle:ILabel = null;
      
      public var txtInfo:ILabelArea = null;
      
      public var txtMovieTitle:ILabelArea = null;
      
      public var btnRefreshTitle:SymbolButtonPremiumGeneric = null;
      
      public var btnClose:SymbolUiButtonDefaultGeneric = null;
      
      public var btnCustomTitle:SymbolButtonCustomTitleGeneric = null;
      
      public function SymbolDialogMovieTitleGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolDialogMovieTitle;
         }
         else
         {
            _nativeObject = new SymbolDialogMovieTitle();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         dialogBackground = new SymbolSlice9BackgroundDialogGeneric(_nativeObject.dialogBackground);
         symbolBackgroundScalable = new SymbolBackgroundScalableGeneric(_nativeObject.symbolBackgroundScalable);
         txtDialogTitle = FlashLabel.fromNative(_nativeObject.txtDialogTitle);
         txtInfo = FlashLabelArea.fromNative(_nativeObject.txtInfo);
         txtMovieTitle = FlashLabelArea.fromNative(_nativeObject.txtMovieTitle);
         btnRefreshTitle = new SymbolButtonPremiumGeneric(_nativeObject.btnRefreshTitle);
         btnClose = new SymbolUiButtonDefaultGeneric(_nativeObject.btnClose);
         btnCustomTitle = new SymbolButtonCustomTitleGeneric(_nativeObject.btnCustomTitle);
      }
      
      public function setNativeInstance(param1:SymbolDialogMovieTitle) : void
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
         FlashLabel.setNativeInstance(txtDialogTitle,_nativeObject.txtDialogTitle);
         FlashLabelArea.setNativeInstance(txtInfo,_nativeObject.txtInfo);
         FlashLabelArea.setNativeInstance(txtMovieTitle,_nativeObject.txtMovieTitle);
         if(_nativeObject.btnRefreshTitle)
         {
            btnRefreshTitle.setNativeInstance(_nativeObject.btnRefreshTitle);
         }
         if(_nativeObject.btnClose)
         {
            btnClose.setNativeInstance(_nativeObject.btnClose);
         }
         if(_nativeObject.btnCustomTitle)
         {
            btnCustomTitle.setNativeInstance(_nativeObject.btnCustomTitle);
         }
      }
   }
}
