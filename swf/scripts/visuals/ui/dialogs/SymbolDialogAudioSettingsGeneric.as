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
   import visuals.ui.base.SymbolUiCheckboxGeneric;
   import visuals.ui.elements.backgrounds.SymbolSlice9BackgroundDialogGeneric;
   import visuals.ui.elements.buttons.SymbolButtonArrowLeftGeneric;
   import visuals.ui.elements.buttons.SymbolButtonArrowRightGeneric;
   import visuals.ui.elements.buttons.SymbolButtonCloseGeneric;
   import visuals.ui.elements.generic.SymbolUiSliderSoundPackageGeneric;
   
   public class SymbolDialogAudioSettingsGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolDialogAudioSettings = null;
      
      public var dialogBackground:SymbolSlice9BackgroundDialogGeneric = null;
      
      public var txtSoundNotifications:ILabelArea = null;
      
      public var checkSoundAmbiences:SymbolUiCheckboxGeneric = null;
      
      public var checkSoundNotifications:SymbolUiCheckboxGeneric = null;
      
      public var txtSoundAmbiences:ILabelArea = null;
      
      public var txtVolumeCaption:ILabelArea = null;
      
      public var checkGuildNotifications:SymbolUiCheckboxGeneric = null;
      
      public var checkSoundUi:SymbolUiCheckboxGeneric = null;
      
      public var txtSoundUi:ILabelArea = null;
      
      public var txtVolumeValue:ILabelArea = null;
      
      public var btnVolumeDown:SymbolButtonArrowLeftGeneric = null;
      
      public var btnVolumeUp:SymbolButtonArrowRightGeneric = null;
      
      public var txtGuildNotifications:ILabelArea = null;
      
      public var txtDialogTitle:ILabel = null;
      
      public var btnClose:SymbolButtonCloseGeneric = null;
      
      public var txtSoundPackage:ILabelArea = null;
      
      public var sldSoundPackage:SymbolUiSliderSoundPackageGeneric = null;
      
      public function SymbolDialogAudioSettingsGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolDialogAudioSettings;
         }
         else
         {
            _nativeObject = new SymbolDialogAudioSettings();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         dialogBackground = new SymbolSlice9BackgroundDialogGeneric(_nativeObject.dialogBackground);
         txtSoundNotifications = FlashLabelArea.fromNative(_nativeObject.txtSoundNotifications);
         checkSoundAmbiences = new SymbolUiCheckboxGeneric(_nativeObject.checkSoundAmbiences);
         checkSoundNotifications = new SymbolUiCheckboxGeneric(_nativeObject.checkSoundNotifications);
         txtSoundAmbiences = FlashLabelArea.fromNative(_nativeObject.txtSoundAmbiences);
         txtVolumeCaption = FlashLabelArea.fromNative(_nativeObject.txtVolumeCaption);
         checkGuildNotifications = new SymbolUiCheckboxGeneric(_nativeObject.checkGuildNotifications);
         checkSoundUi = new SymbolUiCheckboxGeneric(_nativeObject.checkSoundUi);
         txtSoundUi = FlashLabelArea.fromNative(_nativeObject.txtSoundUi);
         txtVolumeValue = FlashLabelArea.fromNative(_nativeObject.txtVolumeValue);
         btnVolumeDown = new SymbolButtonArrowLeftGeneric(_nativeObject.btnVolumeDown);
         btnVolumeUp = new SymbolButtonArrowRightGeneric(_nativeObject.btnVolumeUp);
         txtGuildNotifications = FlashLabelArea.fromNative(_nativeObject.txtGuildNotifications);
         txtDialogTitle = FlashLabel.fromNative(_nativeObject.txtDialogTitle);
         btnClose = new SymbolButtonCloseGeneric(_nativeObject.btnClose);
         txtSoundPackage = FlashLabelArea.fromNative(_nativeObject.txtSoundPackage);
         sldSoundPackage = new SymbolUiSliderSoundPackageGeneric(_nativeObject.sldSoundPackage);
      }
      
      public function setNativeInstance(param1:SymbolDialogAudioSettings) : void
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
         FlashLabelArea.setNativeInstance(txtSoundNotifications,_nativeObject.txtSoundNotifications);
         if(_nativeObject.checkSoundAmbiences)
         {
            checkSoundAmbiences.setNativeInstance(_nativeObject.checkSoundAmbiences);
         }
         if(_nativeObject.checkSoundNotifications)
         {
            checkSoundNotifications.setNativeInstance(_nativeObject.checkSoundNotifications);
         }
         FlashLabelArea.setNativeInstance(txtSoundAmbiences,_nativeObject.txtSoundAmbiences);
         FlashLabelArea.setNativeInstance(txtVolumeCaption,_nativeObject.txtVolumeCaption);
         if(_nativeObject.checkGuildNotifications)
         {
            checkGuildNotifications.setNativeInstance(_nativeObject.checkGuildNotifications);
         }
         if(_nativeObject.checkSoundUi)
         {
            checkSoundUi.setNativeInstance(_nativeObject.checkSoundUi);
         }
         FlashLabelArea.setNativeInstance(txtSoundUi,_nativeObject.txtSoundUi);
         FlashLabelArea.setNativeInstance(txtVolumeValue,_nativeObject.txtVolumeValue);
         if(_nativeObject.btnVolumeDown)
         {
            btnVolumeDown.setNativeInstance(_nativeObject.btnVolumeDown);
         }
         if(_nativeObject.btnVolumeUp)
         {
            btnVolumeUp.setNativeInstance(_nativeObject.btnVolumeUp);
         }
         FlashLabelArea.setNativeInstance(txtGuildNotifications,_nativeObject.txtGuildNotifications);
         FlashLabel.setNativeInstance(txtDialogTitle,_nativeObject.txtDialogTitle);
         if(_nativeObject.btnClose)
         {
            btnClose.setNativeInstance(_nativeObject.btnClose);
         }
         FlashLabelArea.setNativeInstance(txtSoundPackage,_nativeObject.txtSoundPackage);
         if(_nativeObject.sldSoundPackage)
         {
            sldSoundPackage.setNativeInstance(_nativeObject.sldSoundPackage);
         }
      }
   }
}
