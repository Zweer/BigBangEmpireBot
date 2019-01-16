package visuals.ui.elements.duel
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   import visuals.ui.base.SymbolDummyGeneric;
   import visuals.ui.elements.generic.SymbolTimeBarFillGeneric;
   
   public class SymbolDuelStaminaBarGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolDuelStaminaBar = null;
      
      public var fill:SymbolTimeBarFillGeneric = null;
      
      public var m:SymbolDuelBarMaskGeneric = null;
      
      public var delimiterContainer:SymbolDummyGeneric = null;
      
      public function SymbolDuelStaminaBarGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolDuelStaminaBar;
         }
         else
         {
            _nativeObject = new SymbolDuelStaminaBar();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         fill = new SymbolTimeBarFillGeneric(_nativeObject.fill);
         m = new SymbolDuelBarMaskGeneric(_nativeObject.m);
         delimiterContainer = new SymbolDummyGeneric(_nativeObject.delimiterContainer);
      }
      
      public function setNativeInstance(param1:SymbolDuelStaminaBar) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.fill)
         {
            fill.setNativeInstance(_nativeObject.fill);
         }
         if(_nativeObject.m)
         {
            m.setNativeInstance(_nativeObject.m);
         }
         if(_nativeObject.delimiterContainer)
         {
            delimiterContainer.setNativeInstance(_nativeObject.delimiterContainer);
         }
      }
   }
}
