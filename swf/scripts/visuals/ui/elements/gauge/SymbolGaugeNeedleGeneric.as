package visuals.ui.elements.gauge
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   
   public class SymbolGaugeNeedleGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolGaugeNeedle = null;
      
      public var inner:SymbolGaugeNeedleInnerGeneric = null;
      
      public function SymbolGaugeNeedleGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolGaugeNeedle;
         }
         else
         {
            _nativeObject = new SymbolGaugeNeedle();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         inner = new SymbolGaugeNeedleInnerGeneric(_nativeObject.inner);
      }
      
      public function setNativeInstance(param1:SymbolGaugeNeedle) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.inner)
         {
            inner.setNativeInstance(_nativeObject.inner);
         }
      }
   }
}
