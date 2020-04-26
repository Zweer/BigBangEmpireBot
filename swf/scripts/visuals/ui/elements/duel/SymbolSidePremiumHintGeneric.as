package visuals.ui.elements.duel
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabel;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabel;
   import flash.display.MovieClip;
   import visuals.ui.elements.icons.SymbolIconPremiumCurrencyGeneric;
   
   public class SymbolSidePremiumHintGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolSidePremiumHint = null;
      
      public var bg:SymbolDuelRefillHintBackgroundGeneric = null;
      
      public var caption:ILabel = null;
      
      public var cost:ILabel = null;
      
      public var iconPremiumCurrency:SymbolIconPremiumCurrencyGeneric = null;
      
      public function SymbolSidePremiumHintGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolSidePremiumHint;
         }
         else
         {
            _nativeObject = new SymbolSidePremiumHint();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         bg = new SymbolDuelRefillHintBackgroundGeneric(_nativeObject.bg);
         caption = FlashLabel.fromNative(_nativeObject.caption);
         cost = FlashLabel.fromNative(_nativeObject.cost);
         iconPremiumCurrency = new SymbolIconPremiumCurrencyGeneric(_nativeObject.iconPremiumCurrency);
      }
      
      public function setNativeInstance(param1:SymbolSidePremiumHint) : void
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
         FlashLabel.setNativeInstance(cost,_nativeObject.cost);
         if(_nativeObject.iconPremiumCurrency)
         {
            iconPremiumCurrency.setNativeInstance(_nativeObject.iconPremiumCurrency);
         }
      }
   }
}
