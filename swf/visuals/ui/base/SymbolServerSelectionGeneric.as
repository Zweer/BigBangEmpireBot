package visuals.ui.base
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   import visuals.ui.elements.backgrounds.SymbolSlice9BackgroundDialogGeneric;
   import visuals.ui.elements.generic.SymbolLocalePickerGeneric;
   import visuals.ui.elements.server_picker.SymbolServerPickerGeneric;
   
   public class SymbolServerSelectionGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolServerSelection = null;
      
      public var background:SymbolSlice9BackgroundDialogGeneric = null;
      
      public var localePicker:SymbolLocalePickerGeneric = null;
      
      public var serverPicker:SymbolServerPickerGeneric = null;
      
      public function SymbolServerSelectionGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolServerSelection;
         }
         else
         {
            _nativeObject = new SymbolServerSelection();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         background = new SymbolSlice9BackgroundDialogGeneric(_nativeObject.background);
         localePicker = new SymbolLocalePickerGeneric(_nativeObject.localePicker);
         serverPicker = new SymbolServerPickerGeneric(_nativeObject.serverPicker);
      }
      
      public function setNativeInstance(param1:SymbolServerSelection) : void
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
         if(_nativeObject.localePicker)
         {
            localePicker.setNativeInstance(_nativeObject.localePicker);
         }
         if(_nativeObject.serverPicker)
         {
            serverPicker.setNativeInstance(_nativeObject.serverPicker);
         }
      }
   }
}
