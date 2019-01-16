package visuals.ui.dialogs
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabel;
   import com.playata.framework.display.lib.flash.FlashLabelArea;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabel;
   import com.playata.framework.display.ui.controls.ILabelArea;
   import flash.display.MovieClip;
   import visuals.ui.elements.backgrounds.SymbolSlice9BackgroundDialogGeneric;
   import visuals.ui.elements.buttons.SymbolButtonCloseGeneric;
   import visuals.ui.elements.buttons.SymbolButtonTabGeneric;
   import visuals.ui.elements.friend.SymbolFriendInviteLinkContentGeneric;
   import visuals.ui.elements.friend.SymbolFriendInviteMailContentGeneric;
   
   public class SymbolDialogFriendInviteGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolDialogFriendInvite = null;
      
      public var dialogBackground:SymbolSlice9BackgroundDialogGeneric = null;
      
      public var mailContent:SymbolFriendInviteMailContentGeneric = null;
      
      public var linkContent:SymbolFriendInviteLinkContentGeneric = null;
      
      public var tabMail:SymbolButtonTabGeneric = null;
      
      public var tabLink:SymbolButtonTabGeneric = null;
      
      public var txtInfo:ILabelArea = null;
      
      public var txtDialogTitle:ILabel = null;
      
      public var btnClose:SymbolButtonCloseGeneric = null;
      
      public function SymbolDialogFriendInviteGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolDialogFriendInvite;
         }
         else
         {
            _nativeObject = new SymbolDialogFriendInvite();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         dialogBackground = new SymbolSlice9BackgroundDialogGeneric(_nativeObject.dialogBackground);
         mailContent = new SymbolFriendInviteMailContentGeneric(_nativeObject.mailContent);
         linkContent = new SymbolFriendInviteLinkContentGeneric(_nativeObject.linkContent);
         tabMail = new SymbolButtonTabGeneric(_nativeObject.tabMail);
         tabLink = new SymbolButtonTabGeneric(_nativeObject.tabLink);
         txtInfo = FlashLabelArea.fromNative(_nativeObject.txtInfo);
         txtDialogTitle = FlashLabel.fromNative(_nativeObject.txtDialogTitle);
         btnClose = new SymbolButtonCloseGeneric(_nativeObject.btnClose);
      }
      
      public function setNativeInstance(param1:SymbolDialogFriendInvite) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.dialogBackground)
         {
            dialogBackground.setNativeInstance(_nativeObject.dialogBackground);
         }
         if(_nativeObject.mailContent)
         {
            mailContent.setNativeInstance(_nativeObject.mailContent);
         }
         if(_nativeObject.linkContent)
         {
            linkContent.setNativeInstance(_nativeObject.linkContent);
         }
         if(_nativeObject.tabMail)
         {
            tabMail.setNativeInstance(_nativeObject.tabMail);
         }
         if(_nativeObject.tabLink)
         {
            tabLink.setNativeInstance(_nativeObject.tabLink);
         }
         FlashLabelArea.setNativeInstance(txtInfo,_nativeObject.txtInfo);
         FlashLabel.setNativeInstance(txtDialogTitle,_nativeObject.txtDialogTitle);
         if(_nativeObject.btnClose)
         {
            btnClose.setNativeInstance(_nativeObject.btnClose);
         }
      }
   }
}
