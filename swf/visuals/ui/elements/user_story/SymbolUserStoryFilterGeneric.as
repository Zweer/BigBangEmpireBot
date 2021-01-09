package visuals.ui.elements.user_story
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabelArea;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabelArea;
   import flash.display.MovieClip;
   import visuals.ui.base.SymbolUiCheckboxGeneric;
   import visuals.ui.elements.backgrounds.SymbolBackgroundScalableGeneric;
   import visuals.ui.elements.backgrounds.SymbolSlice9BackgroundDialogGeneric;
   import visuals.ui.elements.generic.SymbolLocalePickerGeneric;
   import visuals.ui.elements.goal.SymbolIconSaveFilterGeneric;
   
   public class SymbolUserStoryFilterGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolUserStoryFilter = null;
      
      public var dialogBackground:SymbolSlice9BackgroundDialogGeneric = null;
      
      public var ckbAllLocale:SymbolUiCheckboxGeneric = null;
      
      public var txtAllLocale:ILabelArea = null;
      
      public var ckbSettingLocale:SymbolUiCheckboxGeneric = null;
      
      public var txtSettingLocale:ILabelArea = null;
      
      public var ckbSpecificLocale:SymbolUiCheckboxGeneric = null;
      
      public var txtSpecificLocale:ILabelArea = null;
      
      public var localeBackground:SymbolBackgroundScalableGeneric = null;
      
      public var txtCaptionLocale:ILabelArea = null;
      
      public var localePicker:SymbolLocalePickerGeneric = null;
      
      public var btnSaveSettings:SymbolIconSaveFilterGeneric = null;
      
      public function SymbolUserStoryFilterGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolUserStoryFilter;
         }
         else
         {
            _nativeObject = new SymbolUserStoryFilter();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         dialogBackground = new SymbolSlice9BackgroundDialogGeneric(_nativeObject.dialogBackground);
         ckbAllLocale = new SymbolUiCheckboxGeneric(_nativeObject.ckbAllLocale);
         txtAllLocale = FlashLabelArea.fromNative(_nativeObject.txtAllLocale);
         ckbSettingLocale = new SymbolUiCheckboxGeneric(_nativeObject.ckbSettingLocale);
         txtSettingLocale = FlashLabelArea.fromNative(_nativeObject.txtSettingLocale);
         ckbSpecificLocale = new SymbolUiCheckboxGeneric(_nativeObject.ckbSpecificLocale);
         txtSpecificLocale = FlashLabelArea.fromNative(_nativeObject.txtSpecificLocale);
         localeBackground = new SymbolBackgroundScalableGeneric(_nativeObject.localeBackground);
         txtCaptionLocale = FlashLabelArea.fromNative(_nativeObject.txtCaptionLocale);
         localePicker = new SymbolLocalePickerGeneric(_nativeObject.localePicker);
         btnSaveSettings = new SymbolIconSaveFilterGeneric(_nativeObject.btnSaveSettings);
      }
      
      public function setNativeInstance(param1:SymbolUserStoryFilter) : void
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
         if(_nativeObject.ckbAllLocale)
         {
            ckbAllLocale.setNativeInstance(_nativeObject.ckbAllLocale);
         }
         FlashLabelArea.setNativeInstance(txtAllLocale,_nativeObject.txtAllLocale);
         if(_nativeObject.ckbSettingLocale)
         {
            ckbSettingLocale.setNativeInstance(_nativeObject.ckbSettingLocale);
         }
         FlashLabelArea.setNativeInstance(txtSettingLocale,_nativeObject.txtSettingLocale);
         if(_nativeObject.ckbSpecificLocale)
         {
            ckbSpecificLocale.setNativeInstance(_nativeObject.ckbSpecificLocale);
         }
         FlashLabelArea.setNativeInstance(txtSpecificLocale,_nativeObject.txtSpecificLocale);
         if(_nativeObject.localeBackground)
         {
            localeBackground.setNativeInstance(_nativeObject.localeBackground);
         }
         FlashLabelArea.setNativeInstance(txtCaptionLocale,_nativeObject.txtCaptionLocale);
         if(_nativeObject.localePicker)
         {
            localePicker.setNativeInstance(_nativeObject.localePicker);
         }
         if(_nativeObject.btnSaveSettings)
         {
            btnSaveSettings.setNativeInstance(_nativeObject.btnSaveSettings);
         }
      }
   }
}
