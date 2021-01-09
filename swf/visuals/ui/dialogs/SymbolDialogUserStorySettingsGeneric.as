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
   import visuals.ui.base.SymbolPlaceholderGeneric;
   import visuals.ui.base.SymbolUiButtonDefaultGeneric;
   import visuals.ui.elements.backgrounds.SymbolSlice9BackgroundDialogGeneric;
   import visuals.ui.elements.backgrounds.SymbolSlice9BackgroundDialogSeperatorGeneric;
   import visuals.ui.elements.buttons.SymbolButtonCloseGeneric;
   
   public class SymbolDialogUserStorySettingsGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolDialogUserStorySettings = null;
      
      public var background:SymbolSlice9BackgroundDialogGeneric = null;
      
      public var textInfo:ILabel = null;
      
      public var placeholder:SymbolPlaceholderGeneric = null;
      
      public var textTitle:ILabelArea = null;
      
      public var btnSave:SymbolUiButtonDefaultGeneric = null;
      
      public var btnClose:SymbolButtonCloseGeneric = null;
      
      public var backgroundSeperator:SymbolSlice9BackgroundDialogSeperatorGeneric = null;
      
      public var textDeactivate:ILabelArea = null;
      
      public var btnDeactivate:SymbolUiButtonDefaultGeneric = null;
      
      public function SymbolDialogUserStorySettingsGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolDialogUserStorySettings;
         }
         else
         {
            _nativeObject = new SymbolDialogUserStorySettings();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         background = new SymbolSlice9BackgroundDialogGeneric(_nativeObject.background);
         textInfo = FlashLabel.fromNative(_nativeObject.textInfo);
         placeholder = new SymbolPlaceholderGeneric(_nativeObject.placeholder);
         textTitle = FlashLabelArea.fromNative(_nativeObject.textTitle);
         btnSave = new SymbolUiButtonDefaultGeneric(_nativeObject.btnSave);
         btnClose = new SymbolButtonCloseGeneric(_nativeObject.btnClose);
         backgroundSeperator = new SymbolSlice9BackgroundDialogSeperatorGeneric(_nativeObject.backgroundSeperator);
         textDeactivate = FlashLabelArea.fromNative(_nativeObject.textDeactivate);
         btnDeactivate = new SymbolUiButtonDefaultGeneric(_nativeObject.btnDeactivate);
      }
      
      public function setNativeInstance(param1:SymbolDialogUserStorySettings) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.background)
         {
            background.setNativeInstance(_nativeObject.background);
         }
         FlashLabel.setNativeInstance(textInfo,_nativeObject.textInfo);
         if(_nativeObject.placeholder)
         {
            placeholder.setNativeInstance(_nativeObject.placeholder);
         }
         FlashLabelArea.setNativeInstance(textTitle,_nativeObject.textTitle);
         if(_nativeObject.btnSave)
         {
            btnSave.setNativeInstance(_nativeObject.btnSave);
         }
         if(_nativeObject.btnClose)
         {
            btnClose.setNativeInstance(_nativeObject.btnClose);
         }
         if(_nativeObject.backgroundSeperator)
         {
            backgroundSeperator.setNativeInstance(_nativeObject.backgroundSeperator);
         }
         FlashLabelArea.setNativeInstance(textDeactivate,_nativeObject.textDeactivate);
         if(_nativeObject.btnDeactivate)
         {
            btnDeactivate.setNativeInstance(_nativeObject.btnDeactivate);
         }
      }
   }
}
