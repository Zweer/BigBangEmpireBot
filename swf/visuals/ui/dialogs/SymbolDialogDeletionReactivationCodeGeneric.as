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
   import visuals.ui.base.SymbolUiButtonDefaultGeneric;
   import visuals.ui.elements.backgrounds.SymbolBackgroundScalableGeneric;
   import visuals.ui.elements.backgrounds.SymbolSlice9BackgroundDialogGeneric;
   
   public class SymbolDialogDeletionReactivationCodeGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolDialogDeletionReactivationCode = null;
      
      public var dialogBackground:SymbolSlice9BackgroundDialogGeneric = null;
      
      public var txtDialogTitle:ILabel = null;
      
      public var txtInfo:ILabelArea = null;
      
      public var btnClose:SymbolUiButtonDefaultGeneric = null;
      
      public var bonusBackground:SymbolBackgroundScalableGeneric = null;
      
      public var txtReactivationCodeCaption:ILabel = null;
      
      public var txtReactivationCode:ITextInputArea = null;
      
      public function SymbolDialogDeletionReactivationCodeGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolDialogDeletionReactivationCode;
         }
         else
         {
            _nativeObject = new SymbolDialogDeletionReactivationCode();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         dialogBackground = new SymbolSlice9BackgroundDialogGeneric(_nativeObject.dialogBackground);
         txtDialogTitle = FlashLabel.fromNative(_nativeObject.txtDialogTitle);
         txtInfo = FlashLabelArea.fromNative(_nativeObject.txtInfo);
         btnClose = new SymbolUiButtonDefaultGeneric(_nativeObject.btnClose);
         bonusBackground = new SymbolBackgroundScalableGeneric(_nativeObject.bonusBackground);
         txtReactivationCodeCaption = FlashLabel.fromNative(_nativeObject.txtReactivationCodeCaption);
         txtReactivationCode = FlashTextInputArea.fromNative(_nativeObject.txtReactivationCode);
      }
      
      public function setNativeInstance(param1:SymbolDialogDeletionReactivationCode) : void
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
         FlashLabel.setNativeInstance(txtDialogTitle,_nativeObject.txtDialogTitle);
         FlashLabelArea.setNativeInstance(txtInfo,_nativeObject.txtInfo);
         if(_nativeObject.btnClose)
         {
            btnClose.setNativeInstance(_nativeObject.btnClose);
         }
         if(_nativeObject.bonusBackground)
         {
            bonusBackground.setNativeInstance(_nativeObject.bonusBackground);
         }
         FlashLabel.setNativeInstance(txtReactivationCodeCaption,_nativeObject.txtReactivationCodeCaption);
         FlashTextInputArea.setNativeInstance(txtReactivationCode,_nativeObject.txtReactivationCode);
      }
   }
}
