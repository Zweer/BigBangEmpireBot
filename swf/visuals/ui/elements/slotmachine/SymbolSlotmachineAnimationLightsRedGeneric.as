package visuals.ui.elements.slotmachine
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   
   public class SymbolSlotmachineAnimationLightsRedGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolSlotmachineAnimationLightsRed = null;
      
      public var lampLeft:SymbolSlotmachineLightRedLeftGeneric = null;
      
      public var lampRight:SymbolSlotmachineLightRedRightGeneric = null;
      
      public function SymbolSlotmachineAnimationLightsRedGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolSlotmachineAnimationLightsRed;
         }
         else
         {
            _nativeObject = new SymbolSlotmachineAnimationLightsRed();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         lampLeft = new SymbolSlotmachineLightRedLeftGeneric(_nativeObject.lampLeft);
         lampRight = new SymbolSlotmachineLightRedRightGeneric(_nativeObject.lampRight);
      }
      
      public function setNativeInstance(param1:SymbolSlotmachineAnimationLightsRed) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.lampLeft)
         {
            lampLeft.setNativeInstance(_nativeObject.lampLeft);
         }
         if(_nativeObject.lampRight)
         {
            lampRight.setNativeInstance(_nativeObject.lampRight);
         }
      }
   }
}
