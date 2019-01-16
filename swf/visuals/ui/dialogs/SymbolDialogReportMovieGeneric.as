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
   import visuals.ui.base.SymbolUiCheckboxGeneric;
   import visuals.ui.elements.backgrounds.SymbolSlice9BackgroundDialogGeneric;
   import visuals.ui.elements.buttons.SymbolButtonCloseGeneric;
   
   public class SymbolDialogReportMovieGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolDialogReportMovie = null;
      
      public var dialogBackground:SymbolSlice9BackgroundDialogGeneric = null;
      
      public var txtInfo:ILabelArea = null;
      
      public var txtWarning:ILabelArea = null;
      
      public var txtDialogTitle:ILabel = null;
      
      public var chkMovie1:SymbolUiCheckboxGeneric = null;
      
      public var txtMovie1Title:ILabelArea = null;
      
      public var chkMovie2:SymbolUiCheckboxGeneric = null;
      
      public var txtMovie2Title:ILabelArea = null;
      
      public var btnClose:SymbolButtonCloseGeneric = null;
      
      public var btnReport:SymbolUiButtonDefaultGeneric = null;
      
      public function SymbolDialogReportMovieGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolDialogReportMovie;
         }
         else
         {
            _nativeObject = new SymbolDialogReportMovie();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         dialogBackground = new SymbolSlice9BackgroundDialogGeneric(_nativeObject.dialogBackground);
         txtInfo = FlashLabelArea.fromNative(_nativeObject.txtInfo);
         txtWarning = FlashLabelArea.fromNative(_nativeObject.txtWarning);
         txtDialogTitle = FlashLabel.fromNative(_nativeObject.txtDialogTitle);
         chkMovie1 = new SymbolUiCheckboxGeneric(_nativeObject.chkMovie1);
         txtMovie1Title = FlashLabelArea.fromNative(_nativeObject.txtMovie1Title);
         chkMovie2 = new SymbolUiCheckboxGeneric(_nativeObject.chkMovie2);
         txtMovie2Title = FlashLabelArea.fromNative(_nativeObject.txtMovie2Title);
         btnClose = new SymbolButtonCloseGeneric(_nativeObject.btnClose);
         btnReport = new SymbolUiButtonDefaultGeneric(_nativeObject.btnReport);
      }
      
      public function setNativeInstance(param1:SymbolDialogReportMovie) : void
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
         FlashLabelArea.setNativeInstance(txtInfo,_nativeObject.txtInfo);
         FlashLabelArea.setNativeInstance(txtWarning,_nativeObject.txtWarning);
         FlashLabel.setNativeInstance(txtDialogTitle,_nativeObject.txtDialogTitle);
         if(_nativeObject.chkMovie1)
         {
            chkMovie1.setNativeInstance(_nativeObject.chkMovie1);
         }
         FlashLabelArea.setNativeInstance(txtMovie1Title,_nativeObject.txtMovie1Title);
         if(_nativeObject.chkMovie2)
         {
            chkMovie2.setNativeInstance(_nativeObject.chkMovie2);
         }
         FlashLabelArea.setNativeInstance(txtMovie2Title,_nativeObject.txtMovie2Title);
         if(_nativeObject.btnClose)
         {
            btnClose.setNativeInstance(_nativeObject.btnClose);
         }
         if(_nativeObject.btnReport)
         {
            btnReport.setNativeInstance(_nativeObject.btnReport);
         }
      }
   }
}
