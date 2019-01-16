package visuals.ui.elements.avatar
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   
   public class SymbolAvatarIconAnimationGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolAvatarIconAnimation = null;
      
      public var icon:SymbolAvatarIconGeneric = null;
      
      public function SymbolAvatarIconAnimationGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolAvatarIconAnimation;
         }
         else
         {
            _nativeObject = new SymbolAvatarIconAnimation();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         icon = new SymbolAvatarIconGeneric(_nativeObject.icon);
      }
      
      public function setNativeInstance(param1:SymbolAvatarIconAnimation) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.icon)
         {
            icon.setNativeInstance(_nativeObject.icon);
         }
      }
   }
}
