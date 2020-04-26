package visuals.ui.elements.shop
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   
   public class SymbolPaymentOptionFrameGoldenGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolPaymentOptionFrameGolden = null;
      
      public function SymbolPaymentOptionFrameGoldenGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolPaymentOptionFrameGolden;
         }
         else
         {
            _nativeObject = new SymbolPaymentOptionFrameGolden();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
      }
      
      public function setNativeInstance(param1:SymbolPaymentOptionFrameGolden) : void
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
