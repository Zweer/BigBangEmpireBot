package visuals.ui.elements.friend
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabelArea;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabelArea;
   import flash.display.MovieClip;
   
   public class SymbolFriendInviteFacebookButtonGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolFriendInviteFacebookButton = null;
      
      public var txtFacebookShare:ILabelArea = null;
      
      public function SymbolFriendInviteFacebookButtonGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolFriendInviteFacebookButton;
         }
         else
         {
            _nativeObject = new SymbolFriendInviteFacebookButton();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         txtFacebookShare = FlashLabelArea.fromNative(_nativeObject.txtFacebookShare);
      }
      
      public function setNativeInstance(param1:SymbolFriendInviteFacebookButton) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         FlashLabelArea.setNativeInstance(txtFacebookShare,_nativeObject.txtFacebookShare);
      }
   }
}
