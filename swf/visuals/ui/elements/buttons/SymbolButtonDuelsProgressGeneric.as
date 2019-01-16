package visuals.ui.elements.buttons
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   
   public class SymbolButtonDuelsProgressGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolButtonDuelsProgress = null;
      
      public var m:SymbolButtonDuelsProgressMaskGeneric = null;
      
      public function SymbolButtonDuelsProgressGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolButtonDuelsProgress;
         }
         else
         {
            _nativeObject = new SymbolButtonDuelsProgress();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         m = new SymbolButtonDuelsProgressMaskGeneric(_nativeObject.m);
      }
      
      public function setNativeInstance(param1:SymbolButtonDuelsProgress) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.m)
         {
            m.setNativeInstance(_nativeObject.m);
         }
      }
   }
}
