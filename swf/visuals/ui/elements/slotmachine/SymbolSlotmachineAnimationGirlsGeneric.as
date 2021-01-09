package visuals.ui.elements.slotmachine
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   
   public class SymbolSlotmachineAnimationGirlsGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolSlotmachineAnimationGirls = null;
      
      public var girlLeft:SymbolSlotmachineGirlLeftGeneric = null;
      
      public var girlRight:SymbolSlotmachineGirlRightGeneric = null;
      
      public function SymbolSlotmachineAnimationGirlsGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolSlotmachineAnimationGirls;
         }
         else
         {
            _nativeObject = new SymbolSlotmachineAnimationGirls();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         girlLeft = new SymbolSlotmachineGirlLeftGeneric(_nativeObject.girlLeft);
         girlRight = new SymbolSlotmachineGirlRightGeneric(_nativeObject.girlRight);
      }
      
      public function setNativeInstance(param1:SymbolSlotmachineAnimationGirls) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.girlLeft)
         {
            girlLeft.setNativeInstance(_nativeObject.girlLeft);
         }
         if(_nativeObject.girlRight)
         {
            girlRight.setNativeInstance(_nativeObject.girlRight);
         }
      }
   }
}
