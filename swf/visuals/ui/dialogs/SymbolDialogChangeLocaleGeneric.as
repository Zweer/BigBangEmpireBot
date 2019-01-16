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
   import visuals.ui.elements.buttons.SymbolButtonCloseGeneric;
   import visuals.ui.elements.generic.SymbolLocalePickerGeneric;
   
   public class SymbolDialogChangeLocaleGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolDialogChangeLocale = null;
      
      public var dialogBackground:SymbolSlice9BackgroundDialogGeneric = null;
      
      public var txtDialogTitle:ILabel = null;
      
      public var btnChangeLocale:SymbolUiButtonWideGeneric = null;
      
      public var btnClose:SymbolButtonCloseGeneric = null;
      
      public var localePicker:SymbolLocalePickerGeneric = null;
      
      public var txtLang:ILabelArea = null;
      
      public function SymbolDialogChangeLocaleGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolDialogChangeLocale;
         }
         else
         {
            _nativeObject = new SymbolDialogChangeLocale();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         dialogBackground = new SymbolSlice9BackgroundDialogGeneric(_nativeObject.dialogBackground);
         txtDialogTitle = FlashLabel.fromNative(_nativeObject.txtDialogTitle);
         btnChangeLocale = new SymbolUiButtonWideGeneric(_nativeObject.btnChangeLocale);
         btnClose = new SymbolButtonCloseGeneric(_nativeObject.btnClose);
         localePicker = new SymbolLocalePickerGeneric(_nativeObject.localePicker);
         txtLang = FlashLabelArea.fromNative(_nativeObject.txtLang);
      }
      
      public function setNativeInstance(param1:SymbolDialogChangeLocale) : void
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
         if(_nativeObject.btnChangeLocale)
         {
            btnChangeLocale.setNativeInstance(_nativeObject.btnChangeLocale);
         }
         if(_nativeObject.btnClose)
         {
            btnClose.setNativeInstance(_nativeObject.btnClose);
         }
         if(_nativeObject.localePicker)
         {
            localePicker.setNativeInstance(_nativeObject.localePicker);
         }
         FlashLabelArea.setNativeInstance(txtLang,_nativeObject.txtLang);
      }
   }
}
