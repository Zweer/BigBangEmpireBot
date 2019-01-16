package visuals.ui.dialogs
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabelArea;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabelArea;
   import flash.display.MovieClip;
   import visuals.ui.base.SymbolPlaceholderGeneric;
   import visuals.ui.base.SymbolUiButtonDefaultGeneric;
   import visuals.ui.elements.backgrounds.SymbolSlice9BackgroundDialogGeneric;
   import visuals.ui.elements.buttons.SymbolButtonPremiumGeneric;
   
   public class SymbolDialogReleaseArtifactGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolDialogReleaseArtifact = null;
      
      public var dialogBackground:SymbolSlice9BackgroundDialogGeneric = null;
      
      public var btnClose:SymbolUiButtonDefaultGeneric = null;
      
      public var btnRelease:SymbolButtonPremiumGeneric = null;
      
      public var txtDialogTitle:ILabelArea = null;
      
      public var txtInfoTop:ILabelArea = null;
      
      public var artifact:SymbolPlaceholderGeneric = null;
      
      public var txtArtifactInfo:ILabelArea = null;
      
      public var txtInfoBottom:ILabelArea = null;
      
      public var txtError:ILabelArea = null;
      
      public function SymbolDialogReleaseArtifactGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolDialogReleaseArtifact;
         }
         else
         {
            _nativeObject = new SymbolDialogReleaseArtifact();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         dialogBackground = new SymbolSlice9BackgroundDialogGeneric(_nativeObject.dialogBackground);
         btnClose = new SymbolUiButtonDefaultGeneric(_nativeObject.btnClose);
         btnRelease = new SymbolButtonPremiumGeneric(_nativeObject.btnRelease);
         txtDialogTitle = FlashLabelArea.fromNative(_nativeObject.txtDialogTitle);
         txtInfoTop = FlashLabelArea.fromNative(_nativeObject.txtInfoTop);
         artifact = new SymbolPlaceholderGeneric(_nativeObject.artifact);
         txtArtifactInfo = FlashLabelArea.fromNative(_nativeObject.txtArtifactInfo);
         txtInfoBottom = FlashLabelArea.fromNative(_nativeObject.txtInfoBottom);
         txtError = FlashLabelArea.fromNative(_nativeObject.txtError);
      }
      
      public function setNativeInstance(param1:SymbolDialogReleaseArtifact) : void
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
         if(_nativeObject.btnClose)
         {
            btnClose.setNativeInstance(_nativeObject.btnClose);
         }
         if(_nativeObject.btnRelease)
         {
            btnRelease.setNativeInstance(_nativeObject.btnRelease);
         }
         FlashLabelArea.setNativeInstance(txtDialogTitle,_nativeObject.txtDialogTitle);
         FlashLabelArea.setNativeInstance(txtInfoTop,_nativeObject.txtInfoTop);
         if(_nativeObject.artifact)
         {
            artifact.setNativeInstance(_nativeObject.artifact);
         }
         FlashLabelArea.setNativeInstance(txtArtifactInfo,_nativeObject.txtArtifactInfo);
         FlashLabelArea.setNativeInstance(txtInfoBottom,_nativeObject.txtInfoBottom);
         FlashLabelArea.setNativeInstance(txtError,_nativeObject.txtError);
      }
   }
}
