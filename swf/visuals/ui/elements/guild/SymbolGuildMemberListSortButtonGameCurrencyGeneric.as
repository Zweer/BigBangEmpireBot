package visuals.ui.elements.guild
{
   import com.playata.framework.display.MovieClip;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashMovieClip;
   import visuals.ui.elements.icons.SymbolIconGameCurrencyGeneric;
   
   public class SymbolGuildMemberListSortButtonGameCurrencyGeneric extends com.playata.framework.display.MovieClip
   {
       
      
      private var _nativeObject:SymbolGuildMemberListSortButtonGameCurrency = null;
      
      public var symbolIconGameCurrency:SymbolIconGameCurrencyGeneric = null;
      
      public function SymbolGuildMemberListSortButtonGameCurrencyGeneric(param1:flash.display.MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolGuildMemberListSortButtonGameCurrency;
         }
         else
         {
            _nativeObject = new SymbolGuildMemberListSortButtonGameCurrency();
         }
         super(null,FlashMovieClip.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         symbolIconGameCurrency = new SymbolIconGameCurrencyGeneric(_nativeObject.symbolIconGameCurrency);
      }
      
      public function setNativeInstance(param1:SymbolGuildMemberListSortButtonGameCurrency) : void
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
         if(_nativeObject.symbolIconGameCurrency)
         {
            symbolIconGameCurrency.setNativeInstance(_nativeObject.symbolIconGameCurrency);
         }
      }
   }
}
