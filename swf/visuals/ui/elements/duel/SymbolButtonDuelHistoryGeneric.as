package visuals.ui.elements.duel
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   import visuals.ui.elements.generic.SymbolCounterGeneric;
   
   public class SymbolButtonDuelHistoryGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolButtonDuelHistory = null;
      
      public var counterMissedDuels:SymbolCounterGeneric = null;
      
      public function SymbolButtonDuelHistoryGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolButtonDuelHistory;
         }
         else
         {
            _nativeObject = new SymbolButtonDuelHistory();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         counterMissedDuels = new SymbolCounterGeneric(_nativeObject.counterMissedDuels);
      }
      
      public function setNativeInstance(param1:SymbolButtonDuelHistory) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.counterMissedDuels)
         {
            counterMissedDuels.setNativeInstance(_nativeObject.counterMissedDuels);
         }
      }
   }
}
