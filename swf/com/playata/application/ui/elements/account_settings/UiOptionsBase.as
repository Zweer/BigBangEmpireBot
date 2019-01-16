package com.playata.application.ui.elements.account_settings
{
   import com.playata.application.AppConfig;
   import com.playata.application.AppEnvironment;
   import com.playata.application.Application;
   import com.playata.application.data.character.Character;
   import com.playata.application.data.user.User;
   import com.playata.application.platform.ServerInfo;
   import com.playata.application.ui.ViewManager;
   import com.playata.application.ui.dialogs.DialogAccountSettings;
   import com.playata.application.ui.dialogs.DialogAudioSettings;
   import com.playata.application.ui.dialogs.DialogCharacterSelection;
   import com.playata.application.ui.dialogs.DialogGameSettings;
   import com.playata.application.ui.dialogs.DialogRedeemVoucher;
   import com.playata.application.ui.elements.generic.dialog.UiTwoChoiceDialog;
   import com.playata.framework.application.ApplicationConfig;
   import com.playata.framework.application.Environment;
   import com.playata.framework.core.Core;
   import com.playata.framework.core.util.StringUtil;
   import com.playata.framework.core.util.TimeUtil;
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.ui.controls.ILabel;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import com.playata.framework.network.NetworkCore;
   import com.playata.framework.platform.PlatformConfig;
   import flash.net.URLVariables;
   
   public class UiOptionsBase
   {
       
      
      protected var _vo:Sprite = null;
      
      protected var _btnLogout:UiOptionButton = null;
      
      protected var _btnAudioSettings:UiOptionButton = null;
      
      protected var _btnAccountSettings:UiOptionButton = null;
      
      protected var _btnGameSettings:UiOptionButton = null;
      
      protected var _btnVoucher:UiOptionButton = null;
      
      protected var _btnForum:UiOptionButton = null;
      
      protected var _btnSupport:UiOptionButton = null;
      
      protected var _btnInvite:UiOptionButton = null;
      
      protected var _buttonSlots:int = 0;
      
      protected var _shownSlots:int = 0;
      
      public function UiOptionsBase(param1:Sprite)
      {
         super();
         _vo = param1;
         _btnInvite = new UiOptionButton(_vo.getChildByName("btnInvite"),LocText.current.text("general/base_panel/invite_caption"),onClickInvite);
         _btnAccountSettings = new UiOptionButton(_vo.getChildByName("btnAccountSettings"),LocText.current.text("general/base_panel/config_account_caption"),onClickAccountSettings);
         _btnGameSettings = new UiOptionButton(_vo.getChildByName("btnGameSettings"),LocText.current.text("general/base_panel/config_game_caption"),onClickGameSettings);
         _btnAudioSettings = new UiOptionButton(_vo.getChildByName("btnAudioSettings"),LocText.current.text("general/base_panel/config_sound_caption"),onClickAudioSettings);
         _btnVoucher = new UiOptionButton(_vo.getChildByName("btnVoucher"),LocText.current.text("general/base_panel/voucher_caption"),onClickVoucher);
         _btnForum = new UiOptionButton(_vo.getChildByName("btnForum"),LocText.current.text("general/base_panel/forum_caption"),onClickForum);
         _btnSupport = new UiOptionButton(_vo.getChildByName("btnSupport"),LocText.current.text("general/base_panel/support_caption"),onClickSupport);
         _btnLogout = new UiOptionButton(_vo.getChildByName("btnLogout"),LocText.current.text("general/base_panel/logout_caption"),onClickLogout);
         var _loc2_:Vector.<Number> = new Vector.<Number>(0);
         _loc2_.push(_btnInvite.content.y);
         _loc2_.push(_btnAccountSettings.content.y);
         _loc2_.push(_btnGameSettings.content.y);
         _loc2_.push(_btnAudioSettings.content.y);
         _loc2_.push(_btnVoucher.content.y);
         _loc2_.push(_btnForum.content.y);
         _loc2_.push(_btnSupport.content.y);
         _loc2_.push(_btnLogout.content.y);
         _btnForum.visible = AppEnvironment.appPlatform.isForumLinkAllowed;
         _btnSupport.visible = AppEnvironment.appPlatform.isSupportLinkAllowed;
         _btnInvite.visible = AppEnvironment.appPlatform.isFriendInviteAllowed;
         _btnVoucher.visible = AppEnvironment.appPlatform.isVoucherAllowed;
         var _loc3_:Vector.<UiOptionButton> = new Vector.<UiOptionButton>(0);
         if(_btnInvite.visible)
         {
            _loc3_.push(_btnInvite);
         }
         if(_btnAccountSettings.visible)
         {
            _loc3_.push(_btnAccountSettings);
         }
         if(_btnGameSettings.visible)
         {
            _loc3_.push(_btnGameSettings);
         }
         if(_btnAudioSettings.visible)
         {
            _loc3_.push(_btnAudioSettings);
         }
         if(_btnVoucher.visible)
         {
            _loc3_.push(_btnVoucher);
         }
         if(_btnForum.visible)
         {
            _loc3_.push(_btnForum);
         }
         if(_btnSupport.visible)
         {
            _loc3_.push(_btnSupport);
         }
         if(_btnLogout.visible)
         {
            _loc3_.push(_btnLogout);
         }
         var _loc4_:int = 0;
         if(!Environment.info.isTouchScreen)
         {
            _loc4_ = 0;
            var _loc7_:int = 0;
            var _loc6_:* = _loc3_;
            for each(var _loc5_ in _loc3_)
            {
               _loc5_.content.y = _loc2_[_loc4_];
               _loc4_++;
            }
         }
         if(!AppEnvironment.appPlatform.isFriendInviteAllowed && !AppEnvironment.appPlatform.isVoucherAllowed)
         {
            var _loc9_:int = 0;
            var _loc8_:* = _loc3_;
            for each(_loc5_ in _loc3_)
            {
               _loc5_.content.y = _loc5_.content.y - 30;
               _loc4_++;
            }
         }
         _buttonSlots = _loc2_.length;
         _shownSlots = _loc3_.length;
      }
      
      public static function openForum() : void
      {
         AppEnvironment.appPlatform.openLink(AppConfig.urlForum);
      }
      
      public static function openSupport() : void
      {
         var _loc3_:String = AppConfig.urlSupport;
         _loc3_ = StringUtil.replace(_loc3_,"<server_id>",ServerInfo.serverId);
         var _loc1_:URLVariables = new URLVariables();
         _loc1_.platform = AppEnvironment.appPlatform.id;
         if(Core.config.hasCfg("ssoInfo"))
         {
            _loc1_.platform_user_id = PlatformConfig.ssoInfo;
         }
         _loc1_.server_id = ServerInfo.serverId;
         var _loc2_:User = User.current;
         if(_loc2_)
         {
            _loc1_.user = _loc2_.id.toString();
            if(_loc2_.hasStandaloneLogin)
            {
               _loc1_.user_email = _loc2_.email;
            }
            if(_loc2_.character)
            {
               _loc1_.character_name = _loc2_.character.name;
            }
         }
         if(_loc3_.indexOf("?") != -1)
         {
            _loc3_ = _loc3_ + ("&" + _loc1_.toString());
         }
         else
         {
            _loc3_ = _loc3_ + ("?" + _loc1_.toString());
         }
         if(AppEnvironment.appPlatform.openSupportInIFrame)
         {
            AppEnvironment.appPlatform.openSupportInIframe(_loc3_);
         }
         else
         {
            AppEnvironment.appPlatform.openLink(_loc3_);
         }
      }
      
      public function refreshLocalization() : void
      {
         _btnInvite.caption = LocText.current.text("general/base_panel/invite_caption");
         _btnAccountSettings.caption = LocText.current.text("general/base_panel/config_account_caption");
         _btnGameSettings.caption = LocText.current.text("general/base_panel/config_game_caption");
         _btnAudioSettings.caption = LocText.current.text("general/base_panel/config_sound_caption");
         _btnVoucher.caption = LocText.current.text("general/base_panel/voucher_caption");
         _btnForum.caption = LocText.current.text("general/base_panel/forum_caption");
         _btnSupport.caption = LocText.current.text("general/base_panel/support_caption");
         _btnLogout.caption = LocText.current.text("general/base_panel/logout_caption");
      }
      
      public function refresh() : void
      {
         _btnLogout.visible = !AppEnvironment.appPlatform.isSSO || Environment.info.isNativeMobile && !AppEnvironment.appPlatform.isNutaku;
         getLabel("txtAccount").text = User.current != null && User.current.character != null?User.current.character.name:"-";
         getLabel("txtServerId").text = "(" + ServerInfo.serverId + ")";
         _vo.getChildByName("iconAccountSwitch").visible = Environment.info.isNativeMobile && !AppEnvironment.appPlatform.isNutaku || AppEnvironment.appPlatform.isCharacterSelectionAllowed;
         if(!Environment.info.isNativeMobile && AppEnvironment.appPlatform.isCharacterSelectionAllowed)
         {
            _vo.getChildByName("txtAccount").width = 125;
         }
         getLabel("txtAccount").autoFontSize = true;
      }
      
      public function show() : void
      {
         throw new Error("to be implemented");
      }
      
      public function hide() : void
      {
         throw new Error("to be implemented");
      }
      
      public function dispose() : void
      {
         _btnLogout.dispose();
         _btnAudioSettings.dispose();
         _btnVoucher.dispose();
         _btnAccountSettings.dispose();
         _btnGameSettings.dispose();
         _btnForum.dispose();
         _btnSupport.dispose();
         _btnInvite.dispose();
         _btnLogout = null;
         _btnAudioSettings = null;
         _btnVoucher = null;
         _btnAccountSettings = null;
         _btnGameSettings = null;
         _btnForum = null;
         _btnSupport = null;
         _btnInvite = null;
      }
      
      protected function get clientInfo() : String
      {
         var _loc1_:String = LocText.current.text("general/base_panel/server_info",ApplicationConfig.clientVersion,TimeUtil.serverDateTime.format("h:m"));
         _loc1_ = _loc1_ + ("\nConnection: " + (!!NetworkCore.current.serverConnection.isSocketTransportActive?"Socket":"Web"));
         return _loc1_;
      }
      
      protected function onClickLogout(param1:InteractionEvent) : void
      {
         var _loc2_:Character = User.current.character;
         if(!_loc2_.hasTutorialFlag("tutorial_finished") || _loc2_.currentWorkReward == 0 || _loc2_.workProgress < 10)
         {
            logout();
         }
         else
         {
            Environment.panelManager.showDialog(new UiTwoChoiceDialog(LocText.current.text("dialog/logout_no_work/title"),LocText.current.text("dialog/logout_work_collectable/text"),LocText.current.text("dialog/logout_no_work/button_go_to_work"),LocText.current.text("dialog/logout_no_work/button_logout"),showWorkPanel,logout));
         }
         hide();
      }
      
      private function logout() : void
      {
         Application.userController.logoutUser(null,true);
      }
      
      protected function showWorkPanel() : void
      {
         ViewManager.instance.showPanel("work_new");
      }
      
      protected function onClickAccountSettings(param1:InteractionEvent) : void
      {
         Environment.panelManager.showDialog(new DialogAccountSettings());
         hide();
      }
      
      protected function onClickGameSettings(param1:InteractionEvent) : void
      {
         Environment.panelManager.showDialog(new DialogGameSettings());
         hide();
      }
      
      protected function onClickAudioSettings(param1:InteractionEvent) : void
      {
         Environment.panelManager.showDialog(new DialogAudioSettings());
         hide();
      }
      
      protected function onClickVoucher(param1:InteractionEvent) : void
      {
         Environment.panelManager.showDialog(new DialogRedeemVoucher());
         hide();
      }
      
      protected function onClickForum(param1:InteractionEvent) : void
      {
         openForum();
         hide();
      }
      
      protected function onClickCharacterSelection(param1:InteractionEvent) : void
      {
         Environment.panelManager.showDialog(new DialogCharacterSelection());
         hide();
      }
      
      protected function onClickInvite(param1:InteractionEvent) : void
      {
         ViewManager.instance.showFriendInvitationDialog();
         hide();
      }
      
      protected function onClickSupport(param1:InteractionEvent) : void
      {
         openSupport();
         hide();
      }
      
      protected function getLabel(param1:String) : ILabel
      {
         return _vo.getChildByName(param1) as ILabel;
      }
   }
}
