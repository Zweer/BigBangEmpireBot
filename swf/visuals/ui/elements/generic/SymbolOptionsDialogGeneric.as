package visuals.ui.elements.generic
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabelArea;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabelArea;
   import flash.display.MovieClip;
   import visuals.ui.elements.backgrounds.SymbolBackgroundScalableGeneric;
   import visuals.ui.elements.buttons.SymbolButtonAccountSettingsGeneric;
   import visuals.ui.elements.buttons.SymbolButtonAccountSwitchGeneric;
   import visuals.ui.elements.buttons.SymbolButtonAudioSettingsGeneric;
   import visuals.ui.elements.buttons.SymbolButtonCloseGeneric;
   import visuals.ui.elements.buttons.SymbolButtonForumGeneric;
   import visuals.ui.elements.buttons.SymbolButtonFriendInviteGeneric;
   import visuals.ui.elements.buttons.SymbolButtonGameSettingsGeneric;
   import visuals.ui.elements.buttons.SymbolButtonLogoutGeneric;
   import visuals.ui.elements.buttons.SymbolButtonSupportGeneric;
   import visuals.ui.elements.buttons.SymbolButtonVoucherGeneric;
   
   public class SymbolOptionsDialogGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolOptionsDialog = null;
      
      public var bg:SymbolBackgroundScalableGeneric = null;
      
      public var symbolBackgroundScalable:SymbolBackgroundScalableGeneric = null;
      
      public var symbolBackgroundScalable2:SymbolBackgroundScalableGeneric = null;
      
      public var btnLogout:SymbolButtonLogoutGeneric = null;
      
      public var btnSupport:SymbolButtonSupportGeneric = null;
      
      public var btnVoucher:SymbolButtonVoucherGeneric = null;
      
      public var btnAudioSettings:SymbolButtonAudioSettingsGeneric = null;
      
      public var btnAccountSettings:SymbolButtonAccountSettingsGeneric = null;
      
      public var btnForum:SymbolButtonForumGeneric = null;
      
      public var btnInvite:SymbolButtonFriendInviteGeneric = null;
      
      public var btnGameSettings:SymbolButtonGameSettingsGeneric = null;
      
      public var btnClose:SymbolButtonCloseGeneric = null;
      
      public var txtAccount:ILabelArea = null;
      
      public var txtServerId:ILabelArea = null;
      
      public var iconAccountSwitch:SymbolButtonAccountSwitchGeneric = null;
      
      public var txtInfo:ILabelArea = null;
      
      public function SymbolOptionsDialogGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolOptionsDialog;
         }
         else
         {
            _nativeObject = new SymbolOptionsDialog();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         bg = new SymbolBackgroundScalableGeneric(_nativeObject.bg);
         symbolBackgroundScalable = new SymbolBackgroundScalableGeneric(_nativeObject.symbolBackgroundScalable);
         symbolBackgroundScalable2 = new SymbolBackgroundScalableGeneric(_nativeObject.symbolBackgroundScalable2);
         btnLogout = new SymbolButtonLogoutGeneric(_nativeObject.btnLogout);
         btnSupport = new SymbolButtonSupportGeneric(_nativeObject.btnSupport);
         btnVoucher = new SymbolButtonVoucherGeneric(_nativeObject.btnVoucher);
         btnAudioSettings = new SymbolButtonAudioSettingsGeneric(_nativeObject.btnAudioSettings);
         btnAccountSettings = new SymbolButtonAccountSettingsGeneric(_nativeObject.btnAccountSettings);
         btnForum = new SymbolButtonForumGeneric(_nativeObject.btnForum);
         btnInvite = new SymbolButtonFriendInviteGeneric(_nativeObject.btnInvite);
         btnGameSettings = new SymbolButtonGameSettingsGeneric(_nativeObject.btnGameSettings);
         btnClose = new SymbolButtonCloseGeneric(_nativeObject.btnClose);
         txtAccount = FlashLabelArea.fromNative(_nativeObject.txtAccount);
         txtServerId = FlashLabelArea.fromNative(_nativeObject.txtServerId);
         iconAccountSwitch = new SymbolButtonAccountSwitchGeneric(_nativeObject.iconAccountSwitch);
         txtInfo = FlashLabelArea.fromNative(_nativeObject.txtInfo);
      }
      
      public function setNativeInstance(param1:SymbolOptionsDialog) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.bg)
         {
            bg.setNativeInstance(_nativeObject.bg);
         }
         if(_nativeObject.symbolBackgroundScalable)
         {
            symbolBackgroundScalable.setNativeInstance(_nativeObject.symbolBackgroundScalable);
         }
         if(_nativeObject.symbolBackgroundScalable2)
         {
            symbolBackgroundScalable2.setNativeInstance(_nativeObject.symbolBackgroundScalable2);
         }
         if(_nativeObject.btnLogout)
         {
            btnLogout.setNativeInstance(_nativeObject.btnLogout);
         }
         if(_nativeObject.btnSupport)
         {
            btnSupport.setNativeInstance(_nativeObject.btnSupport);
         }
         if(_nativeObject.btnVoucher)
         {
            btnVoucher.setNativeInstance(_nativeObject.btnVoucher);
         }
         if(_nativeObject.btnAudioSettings)
         {
            btnAudioSettings.setNativeInstance(_nativeObject.btnAudioSettings);
         }
         if(_nativeObject.btnAccountSettings)
         {
            btnAccountSettings.setNativeInstance(_nativeObject.btnAccountSettings);
         }
         if(_nativeObject.btnForum)
         {
            btnForum.setNativeInstance(_nativeObject.btnForum);
         }
         if(_nativeObject.btnInvite)
         {
            btnInvite.setNativeInstance(_nativeObject.btnInvite);
         }
         if(_nativeObject.btnGameSettings)
         {
            btnGameSettings.setNativeInstance(_nativeObject.btnGameSettings);
         }
         if(_nativeObject.btnClose)
         {
            btnClose.setNativeInstance(_nativeObject.btnClose);
         }
         FlashLabelArea.setNativeInstance(txtAccount,_nativeObject.txtAccount);
         FlashLabelArea.setNativeInstance(txtServerId,_nativeObject.txtServerId);
         if(_nativeObject.iconAccountSwitch)
         {
            iconAccountSwitch.setNativeInstance(_nativeObject.iconAccountSwitch);
         }
         FlashLabelArea.setNativeInstance(txtInfo,_nativeObject.txtInfo);
      }
   }
}
