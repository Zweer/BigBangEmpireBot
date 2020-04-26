package visuals.ui.base
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabel;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabel;
   import flash.display.MovieClip;
   import visuals.ui.elements.backgrounds.SymbolSlice9BackgroundButtonGeneric;
   
   public class SymbolUiButtonDefaultCheckedGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolUiButtonDefaultChecked = null;
      
      public var bg:SymbolSlice9BackgroundButtonGeneric = null;
      
      public var caption:ILabel = null;
      
      public var checked:SymbolUiCheckboxCheckedGeneric = null;
      
      public function SymbolUiButtonDefaultCheckedGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolUiButtonDefaultChecked;
         }
         else
         {
            _nativeObject = new SymbolUiButtonDefaultChecked();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         bg = new SymbolSlice9BackgroundButtonGeneric(_nativeObject.bg);
         caption = FlashLabel.fromNative(_nativeObject.caption);
         checked = new SymbolUiCheckboxCheckedGeneric(_nativeObject.checked);
      }
      
      public function setNativeInstance(param1:SymbolUiButtonDefaultChecked) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.bg)
         {
            bg.setNativeInstance(_nativeObject.bg);
         }
         FlashLabel.setNativeInstance(caption,_nativeObject.caption);
         if(_nativeObject.checked)
         {
            checked.setNativeInstance(_nativeObject.checked);
         }
      }
   }
}
