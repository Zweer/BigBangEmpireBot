package visuals.ui.base
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   import visuals.ui.elements.avatar.SymbolAvatarImagePlaceholderGeneric;
   
   public class SymbolAvatarContainerGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolAvatarContainer = null;
      
      public var avatarImage:SymbolAvatarImagePlaceholderGeneric = null;
      
      public function SymbolAvatarContainerGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolAvatarContainer;
         }
         else
         {
            _nativeObject = new SymbolAvatarContainer();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         avatarImage = new SymbolAvatarImagePlaceholderGeneric(_nativeObject.avatarImage);
      }
      
      public function setNativeInstance(param1:SymbolAvatarContainer) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.avatarImage)
         {
            avatarImage.setNativeInstance(_nativeObject.avatarImage);
         }
      }
   }
}
