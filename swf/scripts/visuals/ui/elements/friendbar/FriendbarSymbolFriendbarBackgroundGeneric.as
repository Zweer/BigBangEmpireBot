package visuals.ui.elements.friendbar
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   import visuals.ui.elements.backgrounds.SymbolBackgroundScalableGeneric;
   
   public class FriendbarSymbolFriendbarBackgroundGeneric extends Sprite
   {
       
      
      private var _nativeObject:FriendbarSymbolFriendbarBackground = null;
      
      public var symbolBackgroundScalable:SymbolBackgroundScalableGeneric = null;
      
      public function FriendbarSymbolFriendbarBackgroundGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as FriendbarSymbolFriendbarBackground;
         }
         else
         {
            _nativeObject = new FriendbarSymbolFriendbarBackground();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         symbolBackgroundScalable = new SymbolBackgroundScalableGeneric(_nativeObject.symbolBackgroundScalable);
      }
      
      public function setNativeInstance(param1:FriendbarSymbolFriendbarBackground) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.symbolBackgroundScalable)
         {
            symbolBackgroundScalable.setNativeInstance(_nativeObject.symbolBackgroundScalable);
         }
      }
   }
}
