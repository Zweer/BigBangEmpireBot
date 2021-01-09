package visuals.ui.elements.buttons
{
   import com.playata.framework.display.MovieClip;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabel;
   import com.playata.framework.display.lib.flash.FlashMovieClip;
   import com.playata.framework.display.ui.controls.ILabel;
   import visuals.ui.elements.backgrounds.SymbolSlice9BackgroundButtonGeneric;
   import visuals.ui.elements.icons.SymbolIconPremiumCurrencyGeneric;
   
   public class SymbolButtonPremiumGeneric extends com.playata.framework.display.MovieClip
   {
       
      
      private var _nativeObject:SymbolButtonPremium = null;
      
      public var background:SymbolSlice9BackgroundButtonGeneric = null;
      
      public var caption:ILabel = null;
      
      public var cost:SymbolButtonPremiumCostGeneric = null;
      
      public var iconPremiumCurrency:SymbolIconPremiumCurrencyGeneric = null;
      
      public function SymbolButtonPremiumGeneric(param1:flash.display.MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolButtonPremium;
         }
         else
         {
            _nativeObject = new SymbolButtonPremium();
         }
         super(null,FlashMovieClip.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         background = new SymbolSlice9BackgroundButtonGeneric(_nativeObject.background);
         caption = FlashLabel.fromNative(_nativeObject.caption);
         cost = new SymbolButtonPremiumCostGeneric(_nativeObject.cost);
         iconPremiumCurrency = new SymbolIconPremiumCurrencyGeneric(_nativeObject.iconPremiumCurrency);
      }
      
      public function setNativeInstance(param1:SymbolButtonPremium) : void
      {
         FlashMovieClip.setNativeInstance(_movieClip,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      override public function play() : void
      {
         super.play();
         syncInstances();
      }
      
      override public function stop() : void
      {
         super.stop();
         syncInstances();
      }
      
      override public function gotoAndStop(param1:Object) : void
      {
         super.gotoAndStop(param1);
         syncInstances();
      }
      
      override public function gotoAndPlay(param1:Object) : void
      {
         _movieClip.gotoAndPlay(param1);
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.background)
         {
            background.setNativeInstance(_nativeObject.background);
         }
         FlashLabel.setNativeInstance(caption,_nativeObject.caption);
         if(_nativeObject.cost)
         {
            cost.setNativeInstance(_nativeObject.cost);
         }
         if(_nativeObject.iconPremiumCurrency)
         {
            iconPremiumCurrency.setNativeInstance(_nativeObject.iconPremiumCurrency);
         }
      }
   }
}
