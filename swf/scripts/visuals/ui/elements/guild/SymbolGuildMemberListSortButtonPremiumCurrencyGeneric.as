package visuals.ui.elements.guild
{
   import com.playata.framework.display.MovieClip;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashMovieClip;
   import visuals.ui.elements.icons.SymbolIconPremiumCurrencyGeneric;
   
   public class SymbolGuildMemberListSortButtonPremiumCurrencyGeneric extends com.playata.framework.display.MovieClip
   {
       
      
      private var _nativeObject:SymbolGuildMemberListSortButtonPremiumCurrency = null;
      
      public var symbolIconPremiumCurrency:SymbolIconPremiumCurrencyGeneric = null;
      
      public function SymbolGuildMemberListSortButtonPremiumCurrencyGeneric(param1:flash.display.MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolGuildMemberListSortButtonPremiumCurrency;
         }
         else
         {
            _nativeObject = new SymbolGuildMemberListSortButtonPremiumCurrency();
         }
         super(null,FlashMovieClip.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         symbolIconPremiumCurrency = new SymbolIconPremiumCurrencyGeneric(_nativeObject.symbolIconPremiumCurrency);
      }
      
      public function setNativeInstance(param1:SymbolGuildMemberListSortButtonPremiumCurrency) : void
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
         if(_nativeObject.symbolIconPremiumCurrency)
         {
            symbolIconPremiumCurrency.setNativeInstance(_nativeObject.symbolIconPremiumCurrency);
         }
      }
   }
}
