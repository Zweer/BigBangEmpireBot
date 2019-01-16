package visuals.ui.dialogs
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabel;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabel;
   import flash.display.MovieClip;
   import visuals.ui.base.SymbolDummyGeneric;
   import visuals.ui.base.SymbolUiButtonWideGeneric;
   import visuals.ui.elements.backgrounds.SymbolSlice9BackgroundDialogGeneric;
   import visuals.ui.elements.buttons.SymbolButtonArrowLeftGeneric;
   import visuals.ui.elements.buttons.SymbolButtonArrowRightGeneric;
   import visuals.ui.elements.buttons.SymbolButtonCloseGeneric;
   import visuals.ui.elements.buttons.SymbolButtonHelpGeneric;
   import visuals.ui.elements.optical_changes.SymbolDialogActivateOpticalChangeMaskGeneric;
   
   public class SymbolDialogActivateOpticalChangeGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolDialogActivateOpticalChange = null;
      
      public var dialogBackground:SymbolSlice9BackgroundDialogGeneric = null;
      
      public var txtDialogTitle:ILabel = null;
      
      public var btnClose:SymbolButtonCloseGeneric = null;
      
      public var btnActivate:SymbolUiButtonWideGeneric = null;
      
      public var btnPrevious:SymbolButtonArrowLeftGeneric = null;
      
      public var btnNext:SymbolButtonArrowRightGeneric = null;
      
      public var preview:SymbolDummyGeneric = null;
      
      public var m:SymbolDialogActivateOpticalChangeMaskGeneric = null;
      
      public var btnSourceInfo:SymbolButtonHelpGeneric = null;
      
      public function SymbolDialogActivateOpticalChangeGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolDialogActivateOpticalChange;
         }
         else
         {
            _nativeObject = new SymbolDialogActivateOpticalChange();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         dialogBackground = new SymbolSlice9BackgroundDialogGeneric(_nativeObject.dialogBackground);
         txtDialogTitle = FlashLabel.fromNative(_nativeObject.txtDialogTitle);
         btnClose = new SymbolButtonCloseGeneric(_nativeObject.btnClose);
         btnActivate = new SymbolUiButtonWideGeneric(_nativeObject.btnActivate);
         btnPrevious = new SymbolButtonArrowLeftGeneric(_nativeObject.btnPrevious);
         btnNext = new SymbolButtonArrowRightGeneric(_nativeObject.btnNext);
         preview = new SymbolDummyGeneric(_nativeObject.preview);
         m = new SymbolDialogActivateOpticalChangeMaskGeneric(_nativeObject.m);
         btnSourceInfo = new SymbolButtonHelpGeneric(_nativeObject.btnSourceInfo);
      }
      
      public function setNativeInstance(param1:SymbolDialogActivateOpticalChange) : void
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
         if(_nativeObject.btnClose)
         {
            btnClose.setNativeInstance(_nativeObject.btnClose);
         }
         if(_nativeObject.btnActivate)
         {
            btnActivate.setNativeInstance(_nativeObject.btnActivate);
         }
         if(_nativeObject.btnPrevious)
         {
            btnPrevious.setNativeInstance(_nativeObject.btnPrevious);
         }
         if(_nativeObject.btnNext)
         {
            btnNext.setNativeInstance(_nativeObject.btnNext);
         }
         if(_nativeObject.preview)
         {
            preview.setNativeInstance(_nativeObject.preview);
         }
         if(_nativeObject.m)
         {
            m.setNativeInstance(_nativeObject.m);
         }
         if(_nativeObject.btnSourceInfo)
         {
            btnSourceInfo.setNativeInstance(_nativeObject.btnSourceInfo);
         }
      }
   }
}
