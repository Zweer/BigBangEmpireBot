package visuals.ui.elements.buttons
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   
   public class SymbolButtonWorkProgressGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolButtonWorkProgress = null;
      
      public var m:SymbolButtonWorkProgressMaskGeneric = null;
      
      public function SymbolButtonWorkProgressGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolButtonWorkProgress;
         }
         else
         {
            _nativeObject = new SymbolButtonWorkProgress();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         m = new SymbolButtonWorkProgressMaskGeneric(_nativeObject.m);
      }
      
      public function setNativeInstance(param1:SymbolButtonWorkProgress) : void
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
