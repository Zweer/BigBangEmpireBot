package visuals.ui.elements.gauge
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   import visuals.ui.base.SymbolDummyGeneric;
   
   public class SymbolGaugeGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolGauge = null;
      
      public var m:SymbolDummyGeneric = null;
      
      public var needle:SymbolGaugeNeedleGeneric = null;
      
      public function SymbolGaugeGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolGauge;
         }
         else
         {
            _nativeObject = new SymbolGauge();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         m = new SymbolDummyGeneric(_nativeObject.m);
         needle = new SymbolGaugeNeedleGeneric(_nativeObject.needle);
      }
      
      public function setNativeInstance(param1:SymbolGauge) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.m)
         {
            m.setNativeInstance(_nativeObject.m);
         }
         if(_nativeObject.needle)
         {
            needle.setNativeInstance(_nativeObject.needle);
         }
      }
   }
}
