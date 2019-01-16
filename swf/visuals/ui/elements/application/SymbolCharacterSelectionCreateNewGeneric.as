package visuals.ui.elements.application
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabel;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabel;
   import flash.display.MovieClip;
   import visuals.ui.base.SymbolPlaceholderGeneric;
   import visuals.ui.elements.generic.SymbolLocalePickerGeneric;
   import visuals.ui.elements.server_picker.SymbolServerPickerGeneric;
   
   public class SymbolCharacterSelectionCreateNewGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolCharacterSelectionCreateNew = null;
      
      public var localePicker:SymbolLocalePickerGeneric = null;
      
      public var serverPicker:SymbolServerPickerGeneric = null;
      
      public var iconLocaleCurrentServer:SymbolPlaceholderGeneric = null;
      
      public var txtCurrentServerCaption:ILabel = null;
      
      public var txtCurrentServerId:ILabel = null;
      
      public var txtNewServerCaption:ILabel = null;
      
      public function SymbolCharacterSelectionCreateNewGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolCharacterSelectionCreateNew;
         }
         else
         {
            _nativeObject = new SymbolCharacterSelectionCreateNew();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         localePicker = new SymbolLocalePickerGeneric(_nativeObject.localePicker);
         serverPicker = new SymbolServerPickerGeneric(_nativeObject.serverPicker);
         iconLocaleCurrentServer = new SymbolPlaceholderGeneric(_nativeObject.iconLocaleCurrentServer);
         txtCurrentServerCaption = FlashLabel.fromNative(_nativeObject.txtCurrentServerCaption);
         txtCurrentServerId = FlashLabel.fromNative(_nativeObject.txtCurrentServerId);
         txtNewServerCaption = FlashLabel.fromNative(_nativeObject.txtNewServerCaption);
      }
      
      public function setNativeInstance(param1:SymbolCharacterSelectionCreateNew) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.localePicker)
         {
            localePicker.setNativeInstance(_nativeObject.localePicker);
         }
         if(_nativeObject.serverPicker)
         {
            serverPicker.setNativeInstance(_nativeObject.serverPicker);
         }
         if(_nativeObject.iconLocaleCurrentServer)
         {
            iconLocaleCurrentServer.setNativeInstance(_nativeObject.iconLocaleCurrentServer);
         }
         FlashLabel.setNativeInstance(txtCurrentServerCaption,_nativeObject.txtCurrentServerCaption);
         FlashLabel.setNativeInstance(txtCurrentServerId,_nativeObject.txtCurrentServerId);
         FlashLabel.setNativeInstance(txtNewServerCaption,_nativeObject.txtNewServerCaption);
      }
   }
}
