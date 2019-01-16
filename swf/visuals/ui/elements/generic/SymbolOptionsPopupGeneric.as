package visuals.ui.elements.generic
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabelArea;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabelArea;
   import flash.display.MovieClip;
   import visuals.ui.base.SymbolDummyGeneric;
   import visuals.ui.elements.buttons.SymbolButtonAccountSettingsGeneric;
   import visuals.ui.elements.buttons.SymbolButtonAudioSettingsGeneric;
   import visuals.ui.elements.buttons.SymbolButtonForumGeneric;
   import visuals.ui.elements.buttons.SymbolButtonFriendInviteGeneric;
   import visuals.ui.elements.buttons.SymbolButtonGameSettingsGeneric;
   import visuals.ui.elements.buttons.SymbolButtonLogoutGeneric;
   import visuals.ui.elements.buttons.SymbolButtonSupportGeneric;
   import visuals.ui.elements.buttons.SymbolButtonVoucherGeneric;
   import visuals.ui.elements.icons.SymbolIconAccountSwitchGeneric;
   
   public class SymbolOptionsPopupGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolOptionsPopup = null;
      
      public var btnLogout:SymbolButtonLogoutGeneric = null;
      
      public var btnSupport:SymbolButtonSupportGeneric = null;
      
      public var btnVoucher:SymbolButtonVoucherGeneric = null;
      
      public var btnAudioSettings:SymbolButtonAudioSettingsGeneric = null;
      
      public var btnAccountSettings:SymbolButtonAccountSettingsGeneric = null;
      
      public var btnForum:SymbolButtonForumGeneric = null;
      
      public var btnInvite:SymbolButtonFriendInviteGeneric = null;
      
      public var btnGameSettings:SymbolButtonGameSettingsGeneric = null;
      
      public var txtAccount:ILabelArea = null;
      
      public var txtServerId:ILabelArea = null;
      
      public var iconAccountSwitch:SymbolIconAccountSwitchGeneric = null;
      
      public var tooltipLayer:SymbolDummyGeneric = null;
      
      public var tooltipServer:SymbolDummyGeneric = null;
      
      public var usernameLayer:SymbolDummyGeneric = null;
      
      public function SymbolOptionsPopupGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolOptionsPopup;
         }
         else
         {
            _nativeObject = new SymbolOptionsPopup();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         btnLogout = new SymbolButtonLogoutGeneric(_nativeObject.btnLogout);
         btnSupport = new SymbolButtonSupportGeneric(_nativeObject.btnSupport);
         btnVoucher = new SymbolButtonVoucherGeneric(_nativeObject.btnVoucher);
         btnAudioSettings = new SymbolButtonAudioSettingsGeneric(_nativeObject.btnAudioSettings);
         btnAccountSettings = new SymbolButtonAccountSettingsGeneric(_nativeObject.btnAccountSettings);
         btnForum = new SymbolButtonForumGeneric(_nativeObject.btnForum);
         btnInvite = new SymbolButtonFriendInviteGeneric(_nativeObject.btnInvite);
         btnGameSettings = new SymbolButtonGameSettingsGeneric(_nativeObject.btnGameSettings);
         txtAccount = FlashLabelArea.fromNative(_nativeObject.txtAccount);
         txtServerId = FlashLabelArea.fromNative(_nativeObject.txtServerId);
         iconAccountSwitch = new SymbolIconAccountSwitchGeneric(_nativeObject.iconAccountSwitch);
         tooltipLayer = new SymbolDummyGeneric(_nativeObject.tooltipLayer);
         tooltipServer = new SymbolDummyGeneric(_nativeObject.tooltipServer);
         usernameLayer = new SymbolDummyGeneric(_nativeObject.usernameLayer);
      }
      
      public function setNativeInstance(param1:SymbolOptionsPopup) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
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
         FlashLabelArea.setNativeInstance(txtAccount,_nativeObject.txtAccount);
         FlashLabelArea.setNativeInstance(txtServerId,_nativeObject.txtServerId);
         if(_nativeObject.iconAccountSwitch)
         {
            iconAccountSwitch.setNativeInstance(_nativeObject.iconAccountSwitch);
         }
         if(_nativeObject.tooltipLayer)
         {
            tooltipLayer.setNativeInstance(_nativeObject.tooltipLayer);
         }
         if(_nativeObject.tooltipServer)
         {
            tooltipServer.setNativeInstance(_nativeObject.tooltipServer);
         }
         if(_nativeObject.usernameLayer)
         {
            usernameLayer.setNativeInstance(_nativeObject.usernameLayer);
         }
      }
   }
}
