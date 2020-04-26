package visuals.ui.elements.avatar
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabelArea;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabelArea;
   import flash.display.MovieClip;
   import visuals.ui.elements.buttons.SymbolButtonPremiumAndGameCurrencyGeneric;
   import visuals.ui.elements.goal.SymbolButtonCancelGeneric;
   import visuals.ui.elements.goal.SymbolButtonShareFacebookGeneric;
   
   public class SymbolCharacterConfiguratorPhotographerContentGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolCharacterConfiguratorPhotographerContent = null;
      
      public var avatar:SymbolAvatarGeneric = null;
      
      public var configurator:SymbolCharacterConfiguratorPhotographerGeneric = null;
      
      public var imageAvatarPlaceholder:SymbolAvatarImagePlaceholderGeneric = null;
      
      public var txtInfo:ILabelArea = null;
      
      public var btnCancel:SymbolButtonCancelGeneric = null;
      
      public var btnShareFacebook:SymbolButtonShareFacebookGeneric = null;
      
      public var btnChange:SymbolButtonPremiumAndGameCurrencyGeneric = null;
      
      public function SymbolCharacterConfiguratorPhotographerContentGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolCharacterConfiguratorPhotographerContent;
         }
         else
         {
            _nativeObject = new SymbolCharacterConfiguratorPhotographerContent();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         avatar = new SymbolAvatarGeneric(_nativeObject.avatar);
         configurator = new SymbolCharacterConfiguratorPhotographerGeneric(_nativeObject.configurator);
         imageAvatarPlaceholder = new SymbolAvatarImagePlaceholderGeneric(_nativeObject.imageAvatarPlaceholder);
         txtInfo = FlashLabelArea.fromNative(_nativeObject.txtInfo);
         btnCancel = new SymbolButtonCancelGeneric(_nativeObject.btnCancel);
         btnShareFacebook = new SymbolButtonShareFacebookGeneric(_nativeObject.btnShareFacebook);
         btnChange = new SymbolButtonPremiumAndGameCurrencyGeneric(_nativeObject.btnChange);
      }
      
      public function setNativeInstance(param1:SymbolCharacterConfiguratorPhotographerContent) : void
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
         if(_nativeObject.configurator)
         {
            configurator.setNativeInstance(_nativeObject.configurator);
         }
         if(_nativeObject.imageAvatarPlaceholder)
         {
            imageAvatarPlaceholder.setNativeInstance(_nativeObject.imageAvatarPlaceholder);
         }
         FlashLabelArea.setNativeInstance(txtInfo,_nativeObject.txtInfo);
         if(_nativeObject.btnCancel)
         {
            btnCancel.setNativeInstance(_nativeObject.btnCancel);
         }
         if(_nativeObject.btnShareFacebook)
         {
            btnShareFacebook.setNativeInstance(_nativeObject.btnShareFacebook);
         }
         if(_nativeObject.btnChange)
         {
            btnChange.setNativeInstance(_nativeObject.btnChange);
         }
      }
   }
}
