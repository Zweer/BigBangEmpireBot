package visuals.ui.elements.slotmachine
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   
   public class SymbolSlotmachineAnimationXXXGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolSlotmachineAnimationXXX = null;
      
      public var left:SymbolSlotmachineXXX1Generic = null;
      
      public var middle:SymbolSlotmachineXXX2Generic = null;
      
      public var right:SymbolSlotmachineXXX3Generic = null;
      
      public function SymbolSlotmachineAnimationXXXGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolSlotmachineAnimationXXX;
         }
         else
         {
            _nativeObject = new SymbolSlotmachineAnimationXXX();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         left = new SymbolSlotmachineXXX1Generic(_nativeObject.left);
         middle = new SymbolSlotmachineXXX2Generic(_nativeObject.middle);
         right = new SymbolSlotmachineXXX3Generic(_nativeObject.right);
      }
      
      public function setNativeInstance(param1:SymbolSlotmachineAnimationXXX) : void
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
         if(_nativeObject.middle)
         {
            middle.setNativeInstance(_nativeObject.middle);
         }
         if(_nativeObject.right)
         {
            right.setNativeInstance(_nativeObject.right);
         }
      }
   }
}
