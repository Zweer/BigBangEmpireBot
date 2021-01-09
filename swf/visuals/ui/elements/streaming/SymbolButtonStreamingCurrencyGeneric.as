package visuals.ui.elements.streaming
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabel;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabel;
   import flash.display.MovieClip;
   import visuals.ui.elements.backgrounds.SymbolSlice9BackgroundButtonGeneric;
   import visuals.ui.elements.buttons.SymbolButtonGameCurrencyCostGeneric;
   
   public class SymbolButtonStreamingCurrencyGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolButtonStreamingCurrency = null;
      
      public var bg:SymbolSlice9BackgroundButtonGeneric = null;
      
      public var caption:ILabel = null;
      
      public var cost:SymbolButtonGameCurrencyCostGeneric = null;
      
      public var symbolIconStreamingResource:SymbolIconStreamingResourceGeneric = null;
      
      public function SymbolButtonStreamingCurrencyGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolButtonStreamingCurrency;
         }
         else
         {
            _nativeObject = new SymbolButtonStreamingCurrency();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         bg = new SymbolSlice9BackgroundButtonGeneric(_nativeObject.bg);
         caption = FlashLabel.fromNative(_nativeObject.caption);
         cost = new SymbolButtonGameCurrencyCostGeneric(_nativeObject.cost);
         symbolIconStreamingResource = new SymbolIconStreamingResourceGeneric(_nativeObject.symbolIconStreamingResource);
      }
      
      public function setNativeInstance(param1:SymbolButtonStreamingCurrency) : void
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
         if(_nativeObject.cost)
         {
            cost.setNativeInstance(_nativeObject.cost);
         }
         if(_nativeObject.symbolIconStreamingResource)
         {
            symbolIconStreamingResource.setNativeInstance(_nativeObject.symbolIconStreamingResource);
         }
      }
   }
}
