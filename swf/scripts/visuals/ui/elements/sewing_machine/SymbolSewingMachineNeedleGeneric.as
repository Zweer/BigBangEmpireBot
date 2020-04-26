package visuals.ui.elements.sewing_machine
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   
   public class SymbolSewingMachineNeedleGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolSewingMachineNeedle = null;
      
      public function SymbolSewingMachineNeedleGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolSewingMachineNeedle;
         }
         else
         {
            _nativeObject = new SymbolSewingMachineNeedle();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
      }
      
      public function setNativeInstance(param1:SymbolSewingMachineNeedle) : void
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
