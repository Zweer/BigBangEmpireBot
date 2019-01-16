package visuals.ui.elements.buttons
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   
   public class SymbolButtonQuestsProgressGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolButtonQuestsProgress = null;
      
      public var m:SymbolButtonQuestsProgressMaskGeneric = null;
      
      public function SymbolButtonQuestsProgressGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolButtonQuestsProgress;
         }
         else
         {
            _nativeObject = new SymbolButtonQuestsProgress();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         m = new SymbolButtonQuestsProgressMaskGeneric(_nativeObject.m);
      }
      
      public function setNativeInstance(param1:SymbolButtonQuestsProgress) : void
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
