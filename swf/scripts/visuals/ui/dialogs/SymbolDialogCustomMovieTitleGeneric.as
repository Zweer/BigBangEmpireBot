package visuals.ui.dialogs
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabel;
   import com.playata.framework.display.lib.flash.FlashLabelArea;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.lib.flash.FlashTextInputArea;
   import com.playata.framework.display.ui.controls.ILabel;
   import com.playata.framework.display.ui.controls.ILabelArea;
   import com.playata.framework.display.ui.controls.ITextInputArea;
   import flash.display.MovieClip;
   import visuals.ui.elements.backgrounds.SymbolBackgroundScalableGeneric;
   import visuals.ui.elements.backgrounds.SymbolSlice9BackgroundDialogGeneric;
   import visuals.ui.elements.buttons.SymbolButtonCloseGeneric;
   import visuals.ui.elements.buttons.SymbolButtonPremiumGeneric;
   
   public class SymbolDialogCustomMovieTitleGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolDialogCustomMovieTitle = null;
      
      public var dialogBackground:SymbolSlice9BackgroundDialogGeneric = null;
      
      public var bg:SymbolBackgroundScalableGeneric = null;
      
      public var btnClose:SymbolButtonCloseGeneric = null;
      
      public var txtDialogTitle:ILabel = null;
      
      public var txtInfo:ILabelArea = null;
      
      public var txtCharInfo:ILabel = null;
      
      public var txtDisclaimer:ILabelArea = null;
      
      public var inputMovieTitle:ITextInputArea = null;
      
      public var btnRefreshTitle:SymbolButtonPremiumGeneric = null;
      
      public function SymbolDialogCustomMovieTitleGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolDialogCustomMovieTitle;
         }
         else
         {
            _nativeObject = new SymbolDialogCustomMovieTitle();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         dialogBackground = new SymbolSlice9BackgroundDialogGeneric(_nativeObject.dialogBackground);
         bg = new SymbolBackgroundScalableGeneric(_nativeObject.bg);
         btnClose = new SymbolButtonCloseGeneric(_nativeObject.btnClose);
         txtDialogTitle = FlashLabel.fromNative(_nativeObject.txtDialogTitle);
         txtInfo = FlashLabelArea.fromNative(_nativeObject.txtInfo);
         txtCharInfo = FlashLabel.fromNative(_nativeObject.txtCharInfo);
         txtDisclaimer = FlashLabelArea.fromNative(_nativeObject.txtDisclaimer);
         inputMovieTitle = FlashTextInputArea.fromNative(_nativeObject.inputMovieTitle);
         btnRefreshTitle = new SymbolButtonPremiumGeneric(_nativeObject.btnRefreshTitle);
      }
      
      public function setNativeInstance(param1:SymbolDialogCustomMovieTitle) : void
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
         if(_nativeObject.bg)
         {
            bg.setNativeInstance(_nativeObject.bg);
         }
         if(_nativeObject.btnClose)
         {
            btnClose.setNativeInstance(_nativeObject.btnClose);
         }
         FlashLabel.setNativeInstance(txtDialogTitle,_nativeObject.txtDialogTitle);
         FlashLabelArea.setNativeInstance(txtInfo,_nativeObject.txtInfo);
         FlashLabel.setNativeInstance(txtCharInfo,_nativeObject.txtCharInfo);
         FlashLabelArea.setNativeInstance(txtDisclaimer,_nativeObject.txtDisclaimer);
         FlashTextInputArea.setNativeInstance(inputMovieTitle,_nativeObject.inputMovieTitle);
         if(_nativeObject.btnRefreshTitle)
         {
            btnRefreshTitle.setNativeInstance(_nativeObject.btnRefreshTitle);
         }
      }
   }
}
