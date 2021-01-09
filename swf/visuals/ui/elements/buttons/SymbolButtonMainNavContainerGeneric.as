package visuals.ui.elements.buttons
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   import visuals.ui.base.SymbolPlaceholderGeneric;
   
   public class SymbolButtonMainNavContainerGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolButtonMainNavContainer = null;
      
      public var dummy:SymbolPlaceholderGeneric = null;
      
      public function SymbolButtonMainNavContainerGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolButtonMainNavContainer;
         }
         else
         {
            _nativeObject = new SymbolButtonMainNavContainer();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         dummy = new SymbolPlaceholderGeneric(_nativeObject.dummy);
      }
      
      public function setNativeInstance(param1:SymbolButtonMainNavContainer) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.dummy)
         {
            dummy.setNativeInstance(_nativeObject.dummy);
         }
      }
   }
}
