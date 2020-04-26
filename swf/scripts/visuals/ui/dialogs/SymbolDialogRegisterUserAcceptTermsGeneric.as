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
   import visuals.ui.base.SymbolUiButtonMultilineGeneric;
   import visuals.ui.elements.backgrounds.SymbolSlice9BackgroundDialogGeneric;
   import visuals.ui.elements.buttons.SymbolButtonCloseGeneric;
   import visuals.ui.elements.generic.SymbolCharacterDescriptionTextfieldGeneric;
   
   public class SymbolDialogRegisterUserAcceptTermsGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolDialogRegisterUserAcceptTerms = null;
      
      public var dialogBackground:SymbolSlice9BackgroundDialogGeneric = null;
      
      public var txtDialogTitle:ILabel = null;
      
      public var textBackground:SymbolCharacterDescriptionTextfieldGeneric = null;
      
      public var btnClose:SymbolButtonCloseGeneric = null;
      
      public var txtInfo:ILabelArea = null;
      
      public var txtTerms:ILabelArea = null;
      
      public var btnSave:SymbolUiButtonMultilineGeneric = null;
      
      public function SymbolDialogRegisterUserAcceptTermsGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolDialogRegisterUserAcceptTerms;
         }
         else
         {
            _nativeObject = new SymbolDialogRegisterUserAcceptTerms();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         dialogBackground = new SymbolSlice9BackgroundDialogGeneric(_nativeObject.dialogBackground);
         txtDialogTitle = FlashLabel.fromNative(_nativeObject.txtDialogTitle);
         textBackground = new SymbolCharacterDescriptionTextfieldGeneric(_nativeObject.textBackground);
         btnClose = new SymbolButtonCloseGeneric(_nativeObject.btnClose);
         txtInfo = FlashLabelArea.fromNative(_nativeObject.txtInfo);
         txtTerms = FlashLabelArea.fromNative(_nativeObject.txtTerms);
         btnSave = new SymbolUiButtonMultilineGeneric(_nativeObject.btnSave);
      }
      
      public function setNativeInstance(param1:SymbolDialogRegisterUserAcceptTerms) : void
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
         if(_nativeObject.textBackground)
         {
            textBackground.setNativeInstance(_nativeObject.textBackground);
         }
         if(_nativeObject.btnClose)
         {
            btnClose.setNativeInstance(_nativeObject.btnClose);
         }
         FlashLabelArea.setNativeInstance(txtInfo,_nativeObject.txtInfo);
         FlashLabelArea.setNativeInstance(txtTerms,_nativeObject.txtTerms);
         if(_nativeObject.btnSave)
         {
            btnSave.setNativeInstance(_nativeObject.btnSave);
         }
      }
   }
}
