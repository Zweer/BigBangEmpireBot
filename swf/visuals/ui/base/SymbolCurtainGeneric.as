package visuals.ui.base
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   
   public class SymbolCurtainGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolCurtain = null;
      
      public var background:SymbolCurtainDarkPlaneGeneric = null;
      
      public var blocker:SymbolGenericBlockerGeneric = null;
      
      public function SymbolCurtainGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolCurtain;
         }
         else
         {
            _nativeObject = new SymbolCurtain();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         background = new SymbolCurtainDarkPlaneGeneric(_nativeObject.background);
         blocker = new SymbolGenericBlockerGeneric(_nativeObject.blocker);
      }
      
      public function setNativeInstance(param1:SymbolCurtain) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.background)
         {
            background.setNativeInstance(_nativeObject.background);
         }
         if(_nativeObject.blocker)
         {
            blocker.setNativeInstance(_nativeObject.blocker);
         }
      }
   }
}
