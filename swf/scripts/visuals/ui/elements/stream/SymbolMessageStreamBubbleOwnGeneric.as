package visuals.ui.elements.stream
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   
   public class SymbolMessageStreamBubbleOwnGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolMessageStreamBubbleOwn = null;
      
      public function SymbolMessageStreamBubbleOwnGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolMessageStreamBubbleOwn;
         }
         else
         {
            _nativeObject = new SymbolMessageStreamBubbleOwn();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
      }
      
      public function setNativeInstance(param1:SymbolMessageStreamBubbleOwn) : void
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
