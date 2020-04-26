package visuals.ui.elements.friendbar
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   
   public class FriendbarSymbolBlockerLayerGeneric extends Sprite
   {
       
      
      private var _nativeObject:FriendbarSymbolBlockerLayer = null;
      
      public function FriendbarSymbolBlockerLayerGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as FriendbarSymbolBlockerLayer;
         }
         else
         {
            _nativeObject = new FriendbarSymbolBlockerLayer();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
      }
      
      public function setNativeInstance(param1:FriendbarSymbolBlockerLayer) : void
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
