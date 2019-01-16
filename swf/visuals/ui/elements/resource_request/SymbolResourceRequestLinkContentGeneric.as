package visuals.ui.elements.resource_request
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabel;
   import com.playata.framework.display.lib.flash.FlashLabelArea;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.lib.flash.FlashTextInput;
   import com.playata.framework.display.ui.controls.ILabel;
   import com.playata.framework.display.ui.controls.ILabelArea;
   import com.playata.framework.display.ui.controls.ITextInput;
   import flash.display.MovieClip;
   import visuals.ui.base.SymbolPlaceholderGeneric;
   import visuals.ui.base.SymbolTextfieldVeryWideGeneric;
   import visuals.ui.elements.friend.SymbolFriendInviteFacebookButtonGeneric;
   
   public class SymbolResourceRequestLinkContentGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolResourceRequestLinkContent = null;
      
      public var txtInfoFacebook:ILabelArea = null;
      
      public var btnFacebook:SymbolFriendInviteFacebookButtonGeneric = null;
      
      public var txtLinkCaption:ILabel = null;
      
      public var bgReceiver:SymbolTextfieldVeryWideGeneric = null;
      
      public var inputLink:ITextInput = null;
      
      public var txtInfoLink:ILabelArea = null;
      
      public var banner:SymbolPlaceholderGeneric = null;
      
      public function SymbolResourceRequestLinkContentGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolResourceRequestLinkContent;
         }
         else
         {
            _nativeObject = new SymbolResourceRequestLinkContent();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         txtInfoFacebook = FlashLabelArea.fromNative(_nativeObject.txtInfoFacebook);
         btnFacebook = new SymbolFriendInviteFacebookButtonGeneric(_nativeObject.btnFacebook);
         txtLinkCaption = FlashLabel.fromNative(_nativeObject.txtLinkCaption);
         bgReceiver = new SymbolTextfieldVeryWideGeneric(_nativeObject.bgReceiver);
         inputLink = FlashTextInput.fromNative(_nativeObject.inputLink);
         txtInfoLink = FlashLabelArea.fromNative(_nativeObject.txtInfoLink);
         banner = new SymbolPlaceholderGeneric(_nativeObject.banner);
      }
      
      public function setNativeInstance(param1:SymbolResourceRequestLinkContent) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         FlashLabelArea.setNativeInstance(txtInfoFacebook,_nativeObject.txtInfoFacebook);
         if(_nativeObject.btnFacebook)
         {
            btnFacebook.setNativeInstance(_nativeObject.btnFacebook);
         }
         FlashLabel.setNativeInstance(txtLinkCaption,_nativeObject.txtLinkCaption);
         if(_nativeObject.bgReceiver)
         {
            bgReceiver.setNativeInstance(_nativeObject.bgReceiver);
         }
         FlashTextInput.setNativeInstance(inputLink,_nativeObject.inputLink);
         FlashLabelArea.setNativeInstance(txtInfoLink,_nativeObject.txtInfoLink);
         if(_nativeObject.banner)
         {
            banner.setNativeInstance(_nativeObject.banner);
         }
      }
   }
}
