package visuals.ui.elements.slotmachine
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   
   public class SymbolSlotmachineGirlRightGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolSlotmachineGirlRight = null;
      
      public function SymbolSlotmachineGirlRightGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolSlotmachineGirlRight;
         }
         else
         {
            _nativeObject = new SymbolSlotmachineGirlRight();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
      }
      
      public function setNativeInstance(param1:SymbolSlotmachineGirlRight) : void
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
