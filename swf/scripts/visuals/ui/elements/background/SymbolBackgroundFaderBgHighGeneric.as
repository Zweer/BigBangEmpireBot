package visuals.ui.elements.background
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   import visuals.ui.base.SymbolDummyGeneric;
   
   public class SymbolBackgroundFaderBgHighGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolBackgroundFaderBgHigh = null;
      
      public var dummy:SymbolDummyGeneric = null;
      
      public function SymbolBackgroundFaderBgHighGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolBackgroundFaderBgHigh;
         }
         else
         {
            _nativeObject = new SymbolBackgroundFaderBgHigh();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         dummy = new SymbolDummyGeneric(_nativeObject.dummy);
      }
      
      public function setNativeInstance(param1:SymbolBackgroundFaderBgHigh) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.dummy)
         {
            dummy.setNativeInstance(_nativeObject.dummy);
         }
      }
   }
}
