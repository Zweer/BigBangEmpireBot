package visuals.ui.dialogs
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabel;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabel;
   import flash.display.MovieClip;
   import visuals.ui.base.SymbolUiButtonDefaultGeneric;
   import visuals.ui.elements.backgrounds.SymbolSlice9BackgroundDialogGeneric;
   import visuals.ui.elements.buttons.SymbolButtonCloseGeneric;
   import visuals.ui.elements.generic.SymbolLocalePickerGeneric;
   import visuals.ui.elements.icons.SymbolIconFlagGeneric;
   import visuals.ui.elements.server_picker.SymbolServerPickerGeneric;
   
   public class SymbolDialogNewCharacterGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolDialogNewCharacter = null;
      
      public var dialogBackground:SymbolSlice9BackgroundDialogGeneric = null;
      
      public var localePicker:SymbolLocalePickerGeneric = null;
      
      public var serverPicker:SymbolServerPickerGeneric = null;
      
      public var txtCurrentServerCaption:ILabel = null;
      
      public var iconLocaleCurrentServer:SymbolIconFlagGeneric = null;
      
      public var txtCurrentServerId:ILabel = null;
      
      public var txtNewServerCaption:ILabel = null;
      
      public var txtDialogTitle:ILabel = null;
      
      public var btnClose:SymbolButtonCloseGeneric = null;
      
      public var btnCreate:SymbolUiButtonDefaultGeneric = null;
      
      public function SymbolDialogNewCharacterGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolDialogNewCharacter;
         }
         else
         {
            _nativeObject = new SymbolDialogNewCharacter();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         dialogBackground = new SymbolSlice9BackgroundDialogGeneric(_nativeObject.dialogBackground);
         localePicker = new SymbolLocalePickerGeneric(_nativeObject.localePicker);
         serverPicker = new SymbolServerPickerGeneric(_nativeObject.serverPicker);
         txtCurrentServerCaption = FlashLabel.fromNative(_nativeObject.txtCurrentServerCaption);
         iconLocaleCurrentServer = new SymbolIconFlagGeneric(_nativeObject.iconLocaleCurrentServer);
         txtCurrentServerId = FlashLabel.fromNative(_nativeObject.txtCurrentServerId);
         txtNewServerCaption = FlashLabel.fromNative(_nativeObject.txtNewServerCaption);
         txtDialogTitle = FlashLabel.fromNative(_nativeObject.txtDialogTitle);
         btnClose = new SymbolButtonCloseGeneric(_nativeObject.btnClose);
         btnCreate = new SymbolUiButtonDefaultGeneric(_nativeObject.btnCreate);
      }
      
      public function setNativeInstance(param1:SymbolDialogNewCharacter) : void
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
         if(_nativeObject.localePicker)
         {
            localePicker.setNativeInstance(_nativeObject.localePicker);
         }
         if(_nativeObject.serverPicker)
         {
            serverPicker.setNativeInstance(_nativeObject.serverPicker);
         }
         FlashLabel.setNativeInstance(txtCurrentServerCaption,_nativeObject.txtCurrentServerCaption);
         if(_nativeObject.iconLocaleCurrentServer)
         {
            iconLocaleCurrentServer.setNativeInstance(_nativeObject.iconLocaleCurrentServer);
         }
         FlashLabel.setNativeInstance(txtCurrentServerId,_nativeObject.txtCurrentServerId);
         FlashLabel.setNativeInstance(txtNewServerCaption,_nativeObject.txtNewServerCaption);
         FlashLabel.setNativeInstance(txtDialogTitle,_nativeObject.txtDialogTitle);
         if(_nativeObject.btnClose)
         {
            btnClose.setNativeInstance(_nativeObject.btnClose);
         }
         if(_nativeObject.btnCreate)
         {
            btnCreate.setNativeInstance(_nativeObject.btnCreate);
         }
      }
   }
}
