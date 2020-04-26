package visuals.ui.elements.generic
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   
   public class SymbolCheckmarkHighlightGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolCheckmarkHighlight = null;
      
      public function SymbolCheckmarkHighlightGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolCheckmarkHighlight;
         }
         else
         {
            _nativeObject = new SymbolCheckmarkHighlight();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
      }
      
      public function setNativeInstance(param1:SymbolCheckmarkHighlight) : void
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
