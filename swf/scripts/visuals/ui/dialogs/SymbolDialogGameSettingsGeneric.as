package visuals.ui.dialogs
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabel;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabel;
   import flash.display.MovieClip;
   import visuals.ui.elements.backgrounds.SymbolSlice9BackgroundDialogGeneric;
   import visuals.ui.elements.buttons.SymbolButtonCloseGeneric;
   import visuals.ui.elements.buttons.SymbolButtonTabGeneric;
   import visuals.ui.elements.settings.SymbolGameSettingsBattleAnimationsContentGeneric;
   import visuals.ui.elements.settings.SymbolGameSettingsGeneralContentGeneric;
   import visuals.ui.elements.settings.SymbolGameSettingsStatAnimationsContentGeneric;
   
   public class SymbolDialogGameSettingsGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolDialogGameSettings = null;
      
      public var dialogBackground:SymbolSlice9BackgroundDialogGeneric = null;
      
      public var txtDialogTitle:ILabel = null;
      
      public var generalSettings:SymbolGameSettingsGeneralContentGeneric = null;
      
      public var battleAnimationSettings:SymbolGameSettingsBattleAnimationsContentGeneric = null;
      
      public var statAnimationSettings:SymbolGameSettingsStatAnimationsContentGeneric = null;
      
      public var btnGeneralSettings:SymbolButtonTabGeneric = null;
      
      public var btnBattleAnimationSettings:SymbolButtonTabGeneric = null;
      
      public var btnStatAnimationSettings:SymbolButtonTabGeneric = null;
      
      public var btnClose:SymbolButtonCloseGeneric = null;
      
      public function SymbolDialogGameSettingsGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolDialogGameSettings;
         }
         else
         {
            _nativeObject = new SymbolDialogGameSettings();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         dialogBackground = new SymbolSlice9BackgroundDialogGeneric(_nativeObject.dialogBackground);
         txtDialogTitle = FlashLabel.fromNative(_nativeObject.txtDialogTitle);
         generalSettings = new SymbolGameSettingsGeneralContentGeneric(_nativeObject.generalSettings);
         battleAnimationSettings = new SymbolGameSettingsBattleAnimationsContentGeneric(_nativeObject.battleAnimationSettings);
         statAnimationSettings = new SymbolGameSettingsStatAnimationsContentGeneric(_nativeObject.statAnimationSettings);
         btnGeneralSettings = new SymbolButtonTabGeneric(_nativeObject.btnGeneralSettings);
         btnBattleAnimationSettings = new SymbolButtonTabGeneric(_nativeObject.btnBattleAnimationSettings);
         btnStatAnimationSettings = new SymbolButtonTabGeneric(_nativeObject.btnStatAnimationSettings);
         btnClose = new SymbolButtonCloseGeneric(_nativeObject.btnClose);
      }
      
      public function setNativeInstance(param1:SymbolDialogGameSettings) : void
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
         if(_nativeObject.generalSettings)
         {
            generalSettings.setNativeInstance(_nativeObject.generalSettings);
         }
         if(_nativeObject.battleAnimationSettings)
         {
            battleAnimationSettings.setNativeInstance(_nativeObject.battleAnimationSettings);
         }
         if(_nativeObject.statAnimationSettings)
         {
            statAnimationSettings.setNativeInstance(_nativeObject.statAnimationSettings);
         }
         if(_nativeObject.btnGeneralSettings)
         {
            btnGeneralSettings.setNativeInstance(_nativeObject.btnGeneralSettings);
         }
         if(_nativeObject.btnBattleAnimationSettings)
         {
            btnBattleAnimationSettings.setNativeInstance(_nativeObject.btnBattleAnimationSettings);
         }
         if(_nativeObject.btnStatAnimationSettings)
         {
            btnStatAnimationSettings.setNativeInstance(_nativeObject.btnStatAnimationSettings);
         }
         if(_nativeObject.btnClose)
         {
            btnClose.setNativeInstance(_nativeObject.btnClose);
         }
      }
   }
}
