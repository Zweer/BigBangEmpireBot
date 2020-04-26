package visuals.ui.elements.buttons
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   
   public class SymbolButtonDatingMinimizeGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolButtonDatingMinimize = null;
      
      public function SymbolButtonDatingMinimizeGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolButtonDatingMinimize;
         }
         else
         {
            _nativeObject = new SymbolButtonDatingMinimize();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
      }
      
      public function setNativeInstance(param1:SymbolButtonDatingMinimize) : void
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
