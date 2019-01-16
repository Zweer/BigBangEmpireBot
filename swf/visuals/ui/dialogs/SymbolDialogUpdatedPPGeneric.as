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
   import visuals.ui.base.SymbolUiButtonWideGeneric;
   import visuals.ui.elements.backgrounds.SymbolSlice9BackgroundDialogGeneric;
   import visuals.ui.elements.generic.SymbolCharacterDescriptionTextfieldGeneric;
   
   public class SymbolDialogUpdatedPPGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolDialogUpdatedPP = null;
      
      public var dialogBackground:SymbolSlice9BackgroundDialogGeneric = null;
      
      public var txtDialogTitle:ILabel = null;
      
      public var txtTerms:ILabelArea = null;
      
      public var btnContinue:SymbolUiButtonWideGeneric = null;
      
      public var textBackground:SymbolCharacterDescriptionTextfieldGeneric = null;
      
      public var txtInfo:ILabelArea = null;
      
      public function SymbolDialogUpdatedPPGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolDialogUpdatedPP;
         }
         else
         {
            _nativeObject = new SymbolDialogUpdatedPP();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         dialogBackground = new SymbolSlice9BackgroundDialogGeneric(_nativeObject.dialogBackground);
         txtDialogTitle = FlashLabel.fromNative(_nativeObject.txtDialogTitle);
         txtTerms = FlashLabelArea.fromNative(_nativeObject.txtTerms);
         btnContinue = new SymbolUiButtonWideGeneric(_nativeObject.btnContinue);
         textBackground = new SymbolCharacterDescriptionTextfieldGeneric(_nativeObject.textBackground);
         txtInfo = FlashLabelArea.fromNative(_nativeObject.txtInfo);
      }
      
      public function setNativeInstance(param1:SymbolDialogUpdatedPP) : void
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
         FlashLabelArea.setNativeInstance(txtTerms,_nativeObject.txtTerms);
         if(_nativeObject.btnContinue)
         {
            btnContinue.setNativeInstance(_nativeObject.btnContinue);
         }
         if(_nativeObject.textBackground)
         {
            textBackground.setNativeInstance(_nativeObject.textBackground);
         }
         FlashLabelArea.setNativeInstance(txtInfo,_nativeObject.txtInfo);
      }
   }
}
