package visuals.ui.elements.payment
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   import visuals.ui.elements.avatar.SymbolAvatarGeneric;
   
   public class SymbolAvatarPreviewGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolAvatarPreview = null;
      
      public var avatar:SymbolAvatarGeneric = null;
      
      public function SymbolAvatarPreviewGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolAvatarPreview;
         }
         else
         {
            _nativeObject = new SymbolAvatarPreview();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         avatar = new SymbolAvatarGeneric(_nativeObject.avatar);
      }
      
      public function setNativeInstance(param1:SymbolAvatarPreview) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.avatar)
         {
            avatar.setNativeInstance(_nativeObject.avatar);
         }
      }
   }
}
