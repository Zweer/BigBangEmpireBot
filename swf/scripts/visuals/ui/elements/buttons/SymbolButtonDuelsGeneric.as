package visuals.ui.elements.buttons
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   import visuals.ui.elements.generic.SymbolCounterGeneric;
   
   public class SymbolButtonDuelsGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolButtonDuels = null;
      
      public var progressMask:SymbolButtonDuelsProgressGeneric = null;
      
      public var counterMissedDuels:SymbolCounterGeneric = null;
      
      public function SymbolButtonDuelsGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolButtonDuels;
         }
         else
         {
            _nativeObject = new SymbolButtonDuels();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         progressMask = new SymbolButtonDuelsProgressGeneric(_nativeObject.progressMask);
         counterMissedDuels = new SymbolCounterGeneric(_nativeObject.counterMissedDuels);
      }
      
      public function setNativeInstance(param1:SymbolButtonDuels) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.progressMask)
         {
            progressMask.setNativeInstance(_nativeObject.progressMask);
         }
         if(_nativeObject.counterMissedDuels)
         {
            counterMissedDuels.setNativeInstance(_nativeObject.counterMissedDuels);
         }
      }
   }
}
