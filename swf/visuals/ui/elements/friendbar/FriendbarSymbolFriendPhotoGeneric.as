package visuals.ui.elements.friendbar
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabel;
   import com.playata.framework.display.lib.flash.FlashLabelArea;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabel;
   import com.playata.framework.display.ui.controls.ILabelArea;
   import flash.display.MovieClip;
   import visuals.ui.base.SymbolBlockerAnimationGeneric;
   import visuals.ui.elements.icons.SymbolIconOnlineGeneric;
   
   public class FriendbarSymbolFriendPhotoGeneric extends Sprite
   {
       
      
      private var _nativeObject:FriendbarSymbolFriendPhoto = null;
      
      public var loading:SymbolBlockerAnimationGeneric = null;
      
      public var characterImage:FriendbarSymbolDummyGeneric = null;
      
      public var platformImage:FriendbarSymbolDummyGeneric = null;
      
      public var txtLevel:ILabel = null;
      
      public var txtCharacterName:ILabelArea = null;
      
      public var txtPlatformName:ILabelArea = null;
      
      public var iconOnline:SymbolIconOnlineGeneric = null;
      
      public var mouseLayer:FriendbarSymbolMouseLayerGeneric = null;
      
      public function FriendbarSymbolFriendPhotoGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as FriendbarSymbolFriendPhoto;
         }
         else
         {
            _nativeObject = new FriendbarSymbolFriendPhoto();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         loading = new SymbolBlockerAnimationGeneric(_nativeObject.loading);
         characterImage = new FriendbarSymbolDummyGeneric(_nativeObject.characterImage);
         platformImage = new FriendbarSymbolDummyGeneric(_nativeObject.platformImage);
         txtLevel = FlashLabel.fromNative(_nativeObject.txtLevel);
         txtCharacterName = FlashLabelArea.fromNative(_nativeObject.txtCharacterName);
         txtPlatformName = FlashLabelArea.fromNative(_nativeObject.txtPlatformName);
         iconOnline = new SymbolIconOnlineGeneric(_nativeObject.iconOnline);
         mouseLayer = new FriendbarSymbolMouseLayerGeneric(_nativeObject.mouseLayer);
      }
      
      public function setNativeInstance(param1:FriendbarSymbolFriendPhoto) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.loading)
         {
            loading.setNativeInstance(_nativeObject.loading);
         }
         if(_nativeObject.characterImage)
         {
            characterImage.setNativeInstance(_nativeObject.characterImage);
         }
         if(_nativeObject.platformImage)
         {
            platformImage.setNativeInstance(_nativeObject.platformImage);
         }
         FlashLabel.setNativeInstance(txtLevel,_nativeObject.txtLevel);
         FlashLabelArea.setNativeInstance(txtCharacterName,_nativeObject.txtCharacterName);
         FlashLabelArea.setNativeInstance(txtPlatformName,_nativeObject.txtPlatformName);
         if(_nativeObject.iconOnline)
         {
            iconOnline.setNativeInstance(_nativeObject.iconOnline);
         }
         if(_nativeObject.mouseLayer)
         {
            mouseLayer.setNativeInstance(_nativeObject.mouseLayer);
         }
      }
   }
}
