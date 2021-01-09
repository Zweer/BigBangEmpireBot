package visuals.ui.panels
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabel;
   import com.playata.framework.display.lib.flash.FlashLabelArea;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabel;
   import com.playata.framework.display.ui.controls.ILabelArea;
   import flash.display.MovieClip;
   import visuals.ui.base.SymbolDummyGeneric;
   import visuals.ui.base.SymbolServerSelectionGeneric;
   import visuals.ui.base.SymbolUiButtonDefaultGeneric;
   import visuals.ui.elements.avatar.SymbolAvatarGeneric;
   import visuals.ui.elements.avatar.SymbolCharacterConfiguratorCreateGeneric;
   import visuals.ui.elements.backgrounds.SymbolSlice9BackgroundDialogGeneric;
   import visuals.ui.elements.buttons.SymbolButtonLoginGeneric;
   import visuals.ui.elements.generic.SymbolLocalePickerGeneric;
   
   public class SymbolPanelCreateCharacterGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolPanelCreateCharacter = null;
      
      public var avatar:SymbolAvatarGeneric = null;
      
      public var configurator:SymbolCharacterConfiguratorCreateGeneric = null;
      
      public var btnSaveCharacter:SymbolUiButtonDefaultGeneric = null;
      
      public var bgLogin:SymbolSlice9BackgroundDialogGeneric = null;
      
      public var txtLoginCaption:ILabel = null;
      
      public var clickLayerLogin:SymbolDummyGeneric = null;
      
      public var btnLogin:SymbolButtonLoginGeneric = null;
      
      public var txtInstructions:ILabelArea = null;
      
      public var serverSelection:SymbolServerSelectionGeneric = null;
      
      public var bgLocale:SymbolSlice9BackgroundDialogGeneric = null;
      
      public var localePicker:SymbolLocalePickerGeneric = null;
      
      public function SymbolPanelCreateCharacterGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolPanelCreateCharacter;
         }
         else
         {
            _nativeObject = new SymbolPanelCreateCharacter();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         avatar = new SymbolAvatarGeneric(_nativeObject.avatar);
         configurator = new SymbolCharacterConfiguratorCreateGeneric(_nativeObject.configurator);
         btnSaveCharacter = new SymbolUiButtonDefaultGeneric(_nativeObject.btnSaveCharacter);
         bgLogin = new SymbolSlice9BackgroundDialogGeneric(_nativeObject.bgLogin);
         txtLoginCaption = FlashLabel.fromNative(_nativeObject.txtLoginCaption);
         clickLayerLogin = new SymbolDummyGeneric(_nativeObject.clickLayerLogin);
         btnLogin = new SymbolButtonLoginGeneric(_nativeObject.btnLogin);
         txtInstructions = FlashLabelArea.fromNative(_nativeObject.txtInstructions);
         serverSelection = new SymbolServerSelectionGeneric(_nativeObject.serverSelection);
         bgLocale = new SymbolSlice9BackgroundDialogGeneric(_nativeObject.bgLocale);
         localePicker = new SymbolLocalePickerGeneric(_nativeObject.localePicker);
      }
      
      public function setNativeInstance(param1:SymbolPanelCreateCharacter) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.avatar)
         {
            avatar.setNativeInstance(_nativeObject.avatar);
         }
         if(_nativeObject.configurator)
         {
            configurator.setNativeInstance(_nativeObject.configurator);
         }
         if(_nativeObject.btnSaveCharacter)
         {
            btnSaveCharacter.setNativeInstance(_nativeObject.btnSaveCharacter);
         }
         if(_nativeObject.bgLogin)
         {
            bgLogin.setNativeInstance(_nativeObject.bgLogin);
         }
         FlashLabel.setNativeInstance(txtLoginCaption,_nativeObject.txtLoginCaption);
         if(_nativeObject.clickLayerLogin)
         {
            clickLayerLogin.setNativeInstance(_nativeObject.clickLayerLogin);
         }
         if(_nativeObject.btnLogin)
         {
            btnLogin.setNativeInstance(_nativeObject.btnLogin);
         }
         FlashLabelArea.setNativeInstance(txtInstructions,_nativeObject.txtInstructions);
         if(_nativeObject.serverSelection)
         {
            serverSelection.setNativeInstance(_nativeObject.serverSelection);
         }
         if(_nativeObject.bgLocale)
         {
            bgLocale.setNativeInstance(_nativeObject.bgLocale);
         }
         if(_nativeObject.localePicker)
         {
            localePicker.setNativeInstance(_nativeObject.localePicker);
         }
      }
   }
}
