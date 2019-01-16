package visuals.ui.elements.slotmachine
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   
   public class SymbolSlotmachineAnimationLightsWhiteGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolSlotmachineAnimationLightsWhite = null;
      
      public var left:SymbolSlotmachineLightWhiteLeftGeneric = null;
      
      public var right:SymbolSlotmachineLightWhiteRightGeneric = null;
      
      public function SymbolSlotmachineAnimationLightsWhiteGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolSlotmachineAnimationLightsWhite;
         }
         else
         {
            _nativeObject = new SymbolSlotmachineAnimationLightsWhite();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         left = new SymbolSlotmachineLightWhiteLeftGeneric(_nativeObject.left);
         right = new SymbolSlotmachineLightWhiteRightGeneric(_nativeObject.right);
      }
      
      public function setNativeInstance(param1:SymbolSlotmachineAnimationLightsWhite) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.left)
         {
            left.setNativeInstance(_nativeObject.left);
         }
         if(_nativeObject.right)
         {
            right.setNativeInstance(_nativeObject.right);
         }
      }
   }
}
