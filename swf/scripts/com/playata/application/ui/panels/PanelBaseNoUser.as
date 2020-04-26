package com.playata.application.ui.panels
{
   import com.playata.application.AppConfig;
   import com.playata.application.AppEnvironment;
   import com.playata.application.platform.ServerInfo;
   import com.playata.application.ui.elements.account_settings.UiOptionButton;
   import com.playata.framework.application.Environment;
   import com.playata.framework.core.Core;
   import com.playata.framework.display.AnchorPoint;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import com.playata.framework.platform.PlatformConfig;
   import flash.net.URLVariables;
   import visuals.ui.panels.SymbolPanelBaseNoUserGeneric;
   
   public class PanelBaseNoUser extends DefaultPanel
   {
      
      public static var soundEnabled:Boolean = true;
       
      
      private var _btnForum:UiOptionButton = null;
      
      private var _btnSupport:UiOptionButton = null;
      
      private var _btnSoundToggle:UiOptionButton;
      
      public function PanelBaseNoUser(param1:SymbolPanelBaseNoUserGeneric)
      {
         super(param1);
         _btnForum = new UiOptionButton(param1.btnForum,"",onClickForum);
         _btnForum.tooltip = LocText.current.text("general/base_panel/forum_caption");
         _btnSupport = new UiOptionButton(param1.btnSupport,"",onClickSupport);
         _btnSupport.tooltip = LocText.current.text("general/base_panel/support_caption");
         _btnSoundToggle = new UiOptionButton(param1.btnSoundToggle,"",onClickSoundToggle);
         _btnSoundToggle.tooltip = LocText.current.text("general/base_panel/config_sound_caption");
         param1.iconSoundMuted.visible = false;
         if(!AppEnvironment.appPlatform.isForumLinkAllowed)
         {
            _btnForum.visible = false;
            _btnSupport.visible = false;
         }
         _anchorContainer.add(param1.btnForum,AnchorPoint.BOTTOM_RIGHT);
         _anchorContainer.add(param1.btnSupport,AnchorPoint.BOTTOM_RIGHT);
         _anchorContainer.add(param1.btnSoundToggle,AnchorPoint.BOTTOM_RIGHT);
         _anchorContainer.add(param1.iconSoundMuted,AnchorPoint.BOTTOM_RIGHT);
      }
      
      override public function refreshPanelLocalization() : void
      {
         _btnForum.tooltip = LocText.current.text("general/base_panel/forum_caption");
         _btnSupport.tooltip = LocText.current.text("general/base_panel/support_caption");
         _btnSoundToggle.tooltip = LocText.current.text("general/base_panel/config_sound_caption");
      }
      
      override public function dispose() : void
      {
         _btnForum.dispose();
         _btnSupport.dispose();
         _btnForum = null;
         _btnSupport = null;
         super.dispose();
      }
      
      private function onClickForum(param1:InteractionEvent) : void
      {
         Environment.platform.openLink(AppConfig.urlForum);
      }
      
      private function onClickSupport(param1:InteractionEvent) : void
      {
         var _loc3_:String = AppConfig.urlSupport;
         _loc3_ = _loc3_.replace("<server_id>",ServerInfo.serverId);
         var _loc2_:URLVariables = new URLVariables();
         _loc2_.platform = Environment.platform.id;
         if(Core.config.hasCfg("ssoInfo"))
         {
            _loc2_.platform_user_id = PlatformConfig.ssoInfo;
         }
         _loc2_.server_id = ServerInfo.serverId;
         if(_loc3_.indexOf("?") != -1)
         {
            _loc3_ = _loc3_ + ("&" + _loc2_.toString());
         }
         else
         {
            _loc3_ = _loc3_ + ("?" + _loc2_.toString());
         }
         if(AppEnvironment.appPlatform.openSupportInIFrame)
         {
            AppEnvironment.appPlatform.openSupportInIframe(_loc3_);
         }
         else
         {
            Environment.platform.openLink(_loc3_);
         }
      }
      
      private function onClickSoundToggle(param1:InteractionEvent) : void
      {
         soundEnabled = !soundEnabled;
         refreshSoundButton();
      }
      
      override public function show(param1:* = null) : void
      {
         super.show(param1);
         refreshSoundButton();
      }
      
      private function refreshSoundButton() : void
      {
         var _loc1_:SymbolPanelBaseNoUserGeneric = _vo as SymbolPanelBaseNoUserGeneric;
         _loc1_.iconSoundMuted.visible = !soundEnabled;
         Environment.audio.volumeMaster = !!soundEnabled?1:0;
      }
   }
}
