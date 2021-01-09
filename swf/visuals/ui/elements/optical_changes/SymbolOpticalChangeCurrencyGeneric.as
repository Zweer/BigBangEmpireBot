package visuals.ui.elements.optical_changes
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabel;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabel;
   import flash.display.MovieClip;
   import visuals.ui.base.SymbolDummyGeneric;
   
   public class SymbolOpticalChangeCurrencyGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolOpticalChangeCurrency = null;
      
      public var txtOpticalChangeCurrency:ILabel = null;
      
      public var m:SymbolDummyGeneric = null;
      
      public function SymbolOpticalChangeCurrencyGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolOpticalChangeCurrency;
         }
         else
         {
            _nativeObject = new SymbolOpticalChangeCurrency();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         txtOpticalChangeCurrency = FlashLabel.fromNative(_nativeObject.txtOpticalChangeCurrency);
         m = new SymbolDummyGeneric(_nativeObject.m);
      }
      
      public function setNativeInstance(param1:SymbolOpticalChangeCurrency) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         FlashLabel.setNativeInstance(txtOpticalChangeCurrency,_nativeObject.txtOpticalChangeCurrency);
         if(_nativeObject.m)
         {
            m.setNativeInstance(_nativeObject.m);
         }
      }
   }
}
