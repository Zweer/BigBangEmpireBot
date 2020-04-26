package visuals.ui.elements.gauge
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   
   public class SymbolGaugeNeedleInnerGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolGaugeNeedleInner = null;
      
      public function SymbolGaugeNeedleInnerGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolGaugeNeedleInner;
         }
         else
         {
            _nativeObject = new SymbolGaugeNeedleInner();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
      }
      
      public function setNativeInstance(param1:SymbolGaugeNeedleInner) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
      }
   }
}
