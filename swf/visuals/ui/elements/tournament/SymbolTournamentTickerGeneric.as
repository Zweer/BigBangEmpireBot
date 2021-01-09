package visuals.ui.elements.tournament
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   import visuals.ui.base.SymbolDummyGeneric;
   
   public class SymbolTournamentTickerGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolTournamentTicker = null;
      
      public var background:SymbolTournamentTickerBackgroundGeneric = null;
      
      public var elements:SymbolDummyGeneric = null;
      
      public function SymbolTournamentTickerGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolTournamentTicker;
         }
         else
         {
            _nativeObject = new SymbolTournamentTicker();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         background = new SymbolTournamentTickerBackgroundGeneric(_nativeObject.background);
         elements = new SymbolDummyGeneric(_nativeObject.elements);
      }
      
      public function setNativeInstance(param1:SymbolTournamentTicker) : void
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
         if(_nativeObject.elements)
         {
            elements.setNativeInstance(_nativeObject.elements);
         }
      }
   }
}
