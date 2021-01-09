package visuals.ui.elements.item
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   
   public class SymbolItemSlotBorderHighlightWarforgedGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolItemSlotBorderHighlightWarforged = null;
      
      public function SymbolItemSlotBorderHighlightWarforgedGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolItemSlotBorderHighlightWarforged;
         }
         else
         {
            _nativeObject = new SymbolItemSlotBorderHighlightWarforged();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
      }
      
      public function setNativeInstance(param1:SymbolItemSlotBorderHighlightWarforged) : void
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
