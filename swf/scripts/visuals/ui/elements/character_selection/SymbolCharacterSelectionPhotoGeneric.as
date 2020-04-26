package visuals.ui.elements.character_selection
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
   import visuals.ui.base.SymbolDummyGeneric;
   import visuals.ui.elements.avatar.SymbolAvatarImagePlaceholderGeneric;
   import visuals.ui.elements.backgrounds.SymbolBackgroundScalableGeneric;
   import visuals.ui.elements.generic.SymbolBasePanelIconLevelGeneric;
   import visuals.ui.elements.icons.SymbolIconEmailGeneric;
   import visuals.ui.elements.icons.SymbolIconFacebookGeneric;
   import visuals.ui.elements.icons.SymbolIconFlagGeneric;
   import visuals.ui.elements.icons.SymbolIconMobileGeneric;
   
   public class SymbolCharacterSelectionPhotoGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolCharacterSelectionPhoto = null;
      
      public var active:SymbolBackgroundScalableGeneric = null;
      
      public var avatarImage:SymbolAvatarImagePlaceholderGeneric = null;
      
      public var loading:SymbolBlockerAnimationGeneric = null;
      
      public var txtServer:ILabel = null;
      
      public var localeIcon:SymbolIconFlagGeneric = null;
      
      public var iconFacebook:SymbolIconFacebookGeneric = null;
      
      public var iconEmail:SymbolIconEmailGeneric = null;
      
      public var iconMobile:SymbolIconMobileGeneric = null;
      
      public var txtName:ILabelArea = null;
      
      public var iconLevel:SymbolBasePanelIconLevelGeneric = null;
      
      public var txtLevel:ILabel = null;
      
      public var mouseLayer:SymbolDummyGeneric = null;
      
      public function SymbolCharacterSelectionPhotoGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolCharacterSelectionPhoto;
         }
         else
         {
            _nativeObject = new SymbolCharacterSelectionPhoto();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         active = new SymbolBackgroundScalableGeneric(_nativeObject.active);
         avatarImage = new SymbolAvatarImagePlaceholderGeneric(_nativeObject.avatarImage);
         loading = new SymbolBlockerAnimationGeneric(_nativeObject.loading);
         txtServer = FlashLabel.fromNative(_nativeObject.txtServer);
         localeIcon = new SymbolIconFlagGeneric(_nativeObject.localeIcon);
         iconFacebook = new SymbolIconFacebookGeneric(_nativeObject.iconFacebook);
         iconEmail = new SymbolIconEmailGeneric(_nativeObject.iconEmail);
         iconMobile = new SymbolIconMobileGeneric(_nativeObject.iconMobile);
         txtName = FlashLabelArea.fromNative(_nativeObject.txtName);
         iconLevel = new SymbolBasePanelIconLevelGeneric(_nativeObject.iconLevel);
         txtLevel = FlashLabel.fromNative(_nativeObject.txtLevel);
         mouseLayer = new SymbolDummyGeneric(_nativeObject.mouseLayer);
      }
      
      public function setNativeInstance(param1:SymbolCharacterSelectionPhoto) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.active)
         {
            active.setNativeInstance(_nativeObject.active);
         }
         if(_nativeObject.avatarImage)
         {
            avatarImage.setNativeInstance(_nativeObject.avatarImage);
         }
         if(_nativeObject.loading)
         {
            loading.setNativeInstance(_nativeObject.loading);
         }
         FlashLabel.setNativeInstance(txtServer,_nativeObject.txtServer);
         if(_nativeObject.localeIcon)
         {
            localeIcon.setNativeInstance(_nativeObject.localeIcon);
         }
         if(_nativeObject.iconFacebook)
         {
            iconFacebook.setNativeInstance(_nativeObject.iconFacebook);
         }
         if(_nativeObject.iconEmail)
         {
            iconEmail.setNativeInstance(_nativeObject.iconEmail);
         }
         if(_nativeObject.iconMobile)
         {
            iconMobile.setNativeInstance(_nativeObject.iconMobile);
         }
         FlashLabelArea.setNativeInstance(txtName,_nativeObject.txtName);
         if(_nativeObject.iconLevel)
         {
            iconLevel.setNativeInstance(_nativeObject.iconLevel);
         }
         FlashLabel.setNativeInstance(txtLevel,_nativeObject.txtLevel);
         if(_nativeObject.mouseLayer)
         {
            mouseLayer.setNativeInstance(_nativeObject.mouseLayer);
         }
      }
   }
}
