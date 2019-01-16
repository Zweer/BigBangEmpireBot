package visuals.ui.elements.buttons
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   
   public class SymbolButtonMainNavGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolButtonMainNav = null;
      
      public var container:SymbolButtonMainNavContainerGeneric = null;
      
      public function SymbolButtonMainNavGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolButtonMainNav;
         }
         else
         {
            _nativeObject = new SymbolButtonMainNav();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         container = new SymbolButtonMainNavContainerGeneric(_nativeObject.container);
      }
      
      public function setNativeInstance(param1:SymbolButtonMainNav) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.container)
         {
            container.setNativeInstance(_nativeObject.container);
         }
      }
   }
}
