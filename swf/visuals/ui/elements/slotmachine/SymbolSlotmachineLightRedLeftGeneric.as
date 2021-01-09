package visuals.ui.elements.slotmachine
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   
   public class SymbolSlotmachineLightRedLeftGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolSlotmachineLightRedLeft = null;
      
      public function SymbolSlotmachineLightRedLeftGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolSlotmachineLightRedLeft;
         }
         else
         {
            _nativeObject = new SymbolSlotmachineLightRedLeft();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
      }
      
      public function setNativeInstance(param1:SymbolSlotmachineLightRedLeft) : void
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
