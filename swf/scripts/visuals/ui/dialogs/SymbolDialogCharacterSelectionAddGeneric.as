package visuals.ui.dialogs
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabel;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabel;
   import flash.display.MovieClip;
   import visuals.ui.base.SymbolUiButtonDefaultGeneric;
   import visuals.ui.elements.application.SymbolCharacterSelectionAddExistingGeneric;
   import visuals.ui.elements.application.SymbolCharacterSelectionCreateNewGeneric;
   import visuals.ui.elements.backgrounds.SymbolSlice9BackgroundDialogGeneric;
   import visuals.ui.elements.buttons.SymbolButtonCloseGeneric;
   import visuals.ui.elements.buttons.SymbolButtonTabGeneric;
   
   public class SymbolDialogCharacterSelectionAddGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolDialogCharacterSelectionAdd = null;
      
      public var dialogBackground:SymbolSlice9BackgroundDialogGeneric = null;
      
      public var btnOk:SymbolUiButtonDefaultGeneric = null;
      
      public var txtDialogTitle:ILabel = null;
      
      public var btnTabNew:SymbolButtonTabGeneric = null;
      
      public var btnTabExisting:SymbolButtonTabGeneric = null;
      
      public var createNew:SymbolCharacterSelectionCreateNewGeneric = null;
      
      public var addExisting:SymbolCharacterSelectionAddExistingGeneric = null;
      
      public var btnClose:SymbolButtonCloseGeneric = null;
      
      public function SymbolDialogCharacterSelectionAddGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolDialogCharacterSelectionAdd;
         }
         else
         {
            _nativeObject = new SymbolDialogCharacterSelectionAdd();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         dialogBackground = new SymbolSlice9BackgroundDialogGeneric(_nativeObject.dialogBackground);
         btnOk = new SymbolUiButtonDefaultGeneric(_nativeObject.btnOk);
         txtDialogTitle = FlashLabel.fromNative(_nativeObject.txtDialogTitle);
         btnTabNew = new SymbolButtonTabGeneric(_nativeObject.btnTabNew);
         btnTabExisting = new SymbolButtonTabGeneric(_nativeObject.btnTabExisting);
         createNew = new SymbolCharacterSelectionCreateNewGeneric(_nativeObject.createNew);
         addExisting = new SymbolCharacterSelectionAddExistingGeneric(_nativeObject.addExisting);
         btnClose = new SymbolButtonCloseGeneric(_nativeObject.btnClose);
      }
      
      public function setNativeInstance(param1:SymbolDialogCharacterSelectionAdd) : void
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
         if(_nativeObject.btnOk)
         {
            btnOk.setNativeInstance(_nativeObject.btnOk);
         }
         FlashLabel.setNativeInstance(txtDialogTitle,_nativeObject.txtDialogTitle);
         if(_nativeObject.btnTabNew)
         {
            btnTabNew.setNativeInstance(_nativeObject.btnTabNew);
         }
         if(_nativeObject.btnTabExisting)
         {
            btnTabExisting.setNativeInstance(_nativeObject.btnTabExisting);
         }
         if(_nativeObject.createNew)
         {
            createNew.setNativeInstance(_nativeObject.createNew);
         }
         if(_nativeObject.addExisting)
         {
            addExisting.setNativeInstance(_nativeObject.addExisting);
         }
         if(_nativeObject.btnClose)
         {
            btnClose.setNativeInstance(_nativeObject.btnClose);
         }
      }
   }
}
