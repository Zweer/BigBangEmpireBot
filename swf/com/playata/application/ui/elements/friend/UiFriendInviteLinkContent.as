package com.playata.application.ui.elements.friend
{
   import com.playata.application.AppConfig;
   import com.playata.application.data.user.User;
   import com.playata.application.platform.ServerInfo;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.application.ui.elements.generic.dialog.UiInfoDialog;
   import com.playata.application.ui.elements.generic.textfield.UiTextTooltip;
   import com.playata.framework.application.Environment;
   import com.playata.framework.core.Core;
   import com.playata.framework.core.util.StringUtil;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import flash.system.System;
   import visuals.ui.elements.friend.SymbolFriendInviteLinkContentGeneric;
   
   public class UiFriendInviteLinkContent
   {
       
      
      private var _content:SymbolFriendInviteLinkContentGeneric = null;
      
      private var _tooltipLink:UiTextTooltip = null;
      
      private var _facebookButton:UiButton = null;
      
      public function UiFriendInviteLinkContent(param1:SymbolFriendInviteLinkContentGeneric)
      {
         var _loc2_:* = null;
         super();
         _content = param1;
         _content.txtInfoLink.text = LocText.current.text("dialog/friend_invite/link_info");
         _content.txtInfoFacebook.text = LocText.current.text("dialog/friend_invite/facebook_info");
         _content.txtLinkCaption.text = LocText.current.text("dialog/friend_invite/link_caption_url");
         _content.btnFacebook.txtFacebookShare.text = LocText.current.text("dialog/friend_invite/facebook_button_text");
         var _loc3_:String = User.current.getWhiteLabelId();
         if(_loc3_ && Core.config.getTypedObject("whitelabel_config").getTypedObject(_loc3_).hasData("public_url",true))
         {
            _loc2_ = StringUtil.replace(Core.config.getTypedObject("whitelabel_config").getTypedObject(_loc3_).getString("public_url"),"<serverid>",ServerInfo.serverId);
            _content.inputLink.text = _loc2_ + "?invitation=" + User.current.id + "_" + 2;
         }
         else
         {
            _content.inputLink.text = "https://" + ServerInfo.serverId + "." + AppConfig.urlDomain + "/?invitation=" + User.current.id + "_" + 2;
         }
         _content.inputLink.readOnly = true;
         _tooltipLink = new UiTextTooltip(_content.inputLink,LocText.current.text("dialog/friend_invite/link_tooltip"));
         _content.inputLink.onClick.add(handleInputLinkClick);
         _facebookButton = new UiButton(_content.btnFacebook,"",onClickFacebookShare);
         if(_loc3_ && Core.config.getTypedObject("whitelabel_config").getTypedObject(_loc3_).getBoolean("ingame_facebook_links") === false)
         {
            _facebookButton.visible = false;
            _content.txtInfoFacebook.visible = false;
         }
      }
      
      public function dispose() : void
      {
         _facebookButton.dispose();
         _facebookButton = null;
         _tooltipLink.dispose();
         _tooltipLink = null;
      }
      
      private function handleInputLinkClick(param1:InteractionEvent) : void
      {
         System.setClipboard(_content.inputLink.text);
         Environment.display.focus = null;
         Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/friend_invite/link_in_clipboard/title"),LocText.current.text("dialog/friend_invite/link_in_clipboard/text"),LocText.current.text("general/button_ok")));
      }
      
      private function onClickFacebookShare(param1:InteractionEvent) : void
      {
         var _loc2_:String = AppConfig.urlPublic;
         _loc2_ = StringUtil.replace(_loc2_,"index.php","");
         Environment.platform.openLink(_loc2_ + "invite.php?type=facebook&user_id=" + User.current.id.toString());
      }
      
      public function get content() : SymbolFriendInviteLinkContentGeneric
      {
         return _content;
      }
   }
}
