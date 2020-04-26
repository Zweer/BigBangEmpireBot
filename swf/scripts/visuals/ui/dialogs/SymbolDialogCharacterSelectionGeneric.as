package visuals.ui.dialogs
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabel;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabel;
   import flash.display.MovieClip;
   import visuals.ui.base.SymbolBlockerAnimationGeneric;
   import visuals.ui.base.SymbolIconButtonDeleteGeneric;
   import visuals.ui.base.SymbolUiButtonDefaultGeneric;
   import visuals.ui.elements.backgrounds.SymbolBackgroundScalableGeneric;
   import visuals.ui.elements.backgrounds.SymbolSlice9BackgroundDialogGeneric;
   import visuals.ui.elements.buttons.SymbolButtonArrowLeftGeneric;
   import visuals.ui.elements.buttons.SymbolButtonArrowRightGeneric;
   import visuals.ui.elements.buttons.SymbolButtonCloseGeneric;
   import visuals.ui.elements.character_selection.SymbolCharacterSelectionAddGeneric;
   import visuals.ui.elements.character_selection.SymbolCharacterSelectionPhotoGeneric;
   
   public class SymbolDialogCharacterSelectionGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolDialogCharacterSelection = null;
      
      public var dialogBackground:SymbolSlice9BackgroundDialogGeneric = null;
      
      public var bgElements:SymbolBackgroundScalableGeneric = null;
      
      public var character1:SymbolCharacterSelectionPhotoGeneric = null;
      
      public var character2:SymbolCharacterSelectionPhotoGeneric = null;
      
      public var character3:SymbolCharacterSelectionPhotoGeneric = null;
      
      public var btnAddCharacter:SymbolCharacterSelectionAddGeneric = null;
      
      public var txtDialogTitle:ILabel = null;
      
      public var btnClose:SymbolButtonCloseGeneric = null;
      
      public var btnRemove:SymbolIconButtonDeleteGeneric = null;
      
      public var btnChange:SymbolUiButtonDefaultGeneric = null;
      
      public var btnLeft:SymbolButtonArrowLeftGeneric = null;
      
      public var btnRight:SymbolButtonArrowRightGeneric = null;
      
      public var loading:SymbolBlockerAnimationGeneric = null;
      
      public function SymbolDialogCharacterSelectionGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolDialogCharacterSelection;
         }
         else
         {
            _nativeObject = new SymbolDialogCharacterSelection();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         dialogBackground = new SymbolSlice9BackgroundDialogGeneric(_nativeObject.dialogBackground);
         bgElements = new SymbolBackgroundScalableGeneric(_nativeObject.bgElements);
         character1 = new SymbolCharacterSelectionPhotoGeneric(_nativeObject.character1);
         character2 = new SymbolCharacterSelectionPhotoGeneric(_nativeObject.character2);
         character3 = new SymbolCharacterSelectionPhotoGeneric(_nativeObject.character3);
         btnAddCharacter = new SymbolCharacterSelectionAddGeneric(_nativeObject.btnAddCharacter);
         txtDialogTitle = FlashLabel.fromNative(_nativeObject.txtDialogTitle);
         btnClose = new SymbolButtonCloseGeneric(_nativeObject.btnClose);
         btnRemove = new SymbolIconButtonDeleteGeneric(_nativeObject.btnRemove);
         btnChange = new SymbolUiButtonDefaultGeneric(_nativeObject.btnChange);
         btnLeft = new SymbolButtonArrowLeftGeneric(_nativeObject.btnLeft);
         btnRight = new SymbolButtonArrowRightGeneric(_nativeObject.btnRight);
         loading = new SymbolBlockerAnimationGeneric(_nativeObject.loading);
      }
      
      public function setNativeInstance(param1:SymbolDialogCharacterSelection) : void
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
         if(_nativeObject.bgElements)
         {
            bgElements.setNativeInstance(_nativeObject.bgElements);
         }
         if(_nativeObject.character1)
         {
            character1.setNativeInstance(_nativeObject.character1);
         }
         if(_nativeObject.character2)
         {
            character2.setNativeInstance(_nativeObject.character2);
         }
         if(_nativeObject.character3)
         {
            character3.setNativeInstance(_nativeObject.character3);
         }
         if(_nativeObject.btnAddCharacter)
         {
            btnAddCharacter.setNativeInstance(_nativeObject.btnAddCharacter);
         }
         FlashLabel.setNativeInstance(txtDialogTitle,_nativeObject.txtDialogTitle);
         if(_nativeObject.btnClose)
         {
            btnClose.setNativeInstance(_nativeObject.btnClose);
         }
         if(_nativeObject.btnRemove)
         {
            btnRemove.setNativeInstance(_nativeObject.btnRemove);
         }
         if(_nativeObject.btnChange)
         {
            btnChange.setNativeInstance(_nativeObject.btnChange);
         }
         if(_nativeObject.btnLeft)
         {
            btnLeft.setNativeInstance(_nativeObject.btnLeft);
         }
         if(_nativeObject.btnRight)
         {
            btnRight.setNativeInstance(_nativeObject.btnRight);
         }
         if(_nativeObject.loading)
         {
            loading.setNativeInstance(_nativeObject.loading);
         }
      }
   }
}
