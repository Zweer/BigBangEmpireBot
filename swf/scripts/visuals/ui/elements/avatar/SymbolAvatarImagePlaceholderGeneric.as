package visuals.ui.elements.avatar
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   
   public class SymbolAvatarImagePlaceholderGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolAvatarImagePlaceholder = null;
      
      public function SymbolAvatarImagePlaceholderGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolAvatarImagePlaceholder;
         }
         else
         {
            _nativeObject = new SymbolAvatarImagePlaceholder();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
      }
      
      public function setNativeInstance(param1:SymbolAvatarImagePlaceholder) : void
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
