package visuals.ui.elements.backgrounds
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   
   public class SymbolSlice9BackgroundRoundedGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolSlice9BackgroundRounded = null;
      
      public function SymbolSlice9BackgroundRoundedGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolSlice9BackgroundRounded;
         }
         else
         {
            _nativeObject = new SymbolSlice9BackgroundRounded();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
      }
      
      public function setNativeInstance(param1:SymbolSlice9BackgroundRounded) : void
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
