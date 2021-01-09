package visuals.ui.elements.buttons
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabel;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabel;
   import flash.display.MovieClip;
   import visuals.ui.elements.backgrounds.SymbolSlice9BackgroundButtonGeneric;
   import visuals.ui.elements.icons.SymbolIconPremiumCurrencyGeneric;
   import visuals.ui.elements.resource_request.SymbolIconResourceGeneric;
   
   public class SymbolButtonResourceGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolButtonResource = null;
      
      public var bg:SymbolSlice9BackgroundButtonGeneric = null;
      
      public var caption:ILabel = null;
      
      public var cost:SymbolButtonPremiumCostGeneric = null;
      
      public var iconResource:SymbolIconResourceGeneric = null;
      
      public var iconPremiumCurrency:SymbolIconPremiumCurrencyGeneric = null;
      
      public function SymbolButtonResourceGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolButtonResource;
         }
         else
         {
            _nativeObject = new SymbolButtonResource();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         bg = new SymbolSlice9BackgroundButtonGeneric(_nativeObject.bg);
         caption = FlashLabel.fromNative(_nativeObject.caption);
         cost = new SymbolButtonPremiumCostGeneric(_nativeObject.cost);
         iconResource = new SymbolIconResourceGeneric(_nativeObject.iconResource);
         iconPremiumCurrency = new SymbolIconPremiumCurrencyGeneric(_nativeObject.iconPremiumCurrency);
      }
      
      public function setNativeInstance(param1:SymbolButtonResource) : void
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
         if(_nativeObject.iconResource)
         {
            iconResource.setNativeInstance(_nativeObject.iconResource);
         }
         if(_nativeObject.iconPremiumCurrency)
         {
            iconPremiumCurrency.setNativeInstance(_nativeObject.iconPremiumCurrency);
         }
      }
   }
}
