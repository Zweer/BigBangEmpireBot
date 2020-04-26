package visuals.ui.base
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   
   public class SymbolTextfieldVeryWideGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolTextfieldVeryWide = null;
      
      public function SymbolTextfieldVeryWideGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolTextfieldVeryWide;
         }
         else
         {
            _nativeObject = new SymbolTextfieldVeryWide();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
      }
      
      public function setNativeInstance(param1:SymbolTextfieldVeryWide) : void
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
