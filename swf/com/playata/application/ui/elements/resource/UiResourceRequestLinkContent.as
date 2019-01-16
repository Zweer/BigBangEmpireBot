package com.playata.application.ui.elements.resource
{
   import com.playata.application.AppConfig;
   import com.playata.application.AppEnvironment;
   import com.playata.application.data.advertisment.CustomBannerAdvertisment;
   import com.playata.application.data.advertisment.CustomBannerAdvertisments;
   import com.playata.application.data.user.User;
   import com.playata.application.platform.ServerInfo;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.application.ui.elements.generic.dialog.UiInfoDialog;
   import com.playata.application.ui.elements.generic.textfield.UiTextTooltip;
   import com.playata.framework.application.Environment;
   import com.playata.framework.application.request.ActionRequestResponse;
   import com.playata.framework.core.Core;
   import com.playata.framework.core.util.StringUtil;
   import com.playata.framework.display.InteractiveDisplayObject;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import flash.system.System;
   import visuals.ui.elements.resource_request.SymbolResourceRequestLinkContentGeneric;
   
   public class UiResourceRequestLinkContent
   {
       
      
      private var _content:SymbolResourceRequestLinkContentGeneric = null;
      
      private var _tooltipLink:UiTextTooltip = null;
      
      private var _facebookButton:UiButton = null;
      
      private var _featureType:int = 0;
      
      private var _customBannerAdvertisment:CustomBannerAdvertisment = null;
      
      private var _customBannerAdvertisments:Vector.<CustomBannerAdvertisment> = null;
      
      private var _banner:InteractiveDisplayObject;
      
      public function UiResourceRequestLinkContent(param1:SymbolResourceRequestLinkContentGeneric, param2:int)
      {
         var _loc3_:* = null;
         super();
         _content = param1;
         _featureType = param2;
         _content.txtInfoLink.text = "";
         _content.txtInfoFacebook.text = LocText.current.text("dialog/resource_request/facebook_info");
         _content.txtLinkCaption.text = LocText.current.text("dialog/resource_request/link_caption_url");
         _content.btnFacebook.txtFacebookShare.text = LocText.current.text("dialog/resource_request/facebook_button_text");
         var _loc4_:String = User.current.getWhiteLabelId();
         if(_loc4_ && Core.config.getTypedObject("whitelabel_config").getTypedObject(_loc4_).hasData("public_url",true))
         {
            _loc3_ = StringUtil.replace(Core.config.getTypedObject("whitelabel_config").getTypedObject(_loc4_).getString("public_url"),"<serverid>",ServerInfo.serverId);
            _content.inputLink.text = _loc3_ + "?resource_request=" + User.current.id + "_" + 2 + "_" + _featureType;
            _content.banner.visible = false;
         }
         else
         {
            _content.inputLink.text = "https://" + ServerInfo.serverId + "." + AppConfig.urlDomain + "/?resource_request=" + User.current.id + "_" + 2 + "_" + _featureType;
         }
         _content.inputLink.readOnly = true;
         _tooltipLink = new UiTextTooltip(_content.inputLink,LocText.current.text("dialog/resource_request/link_tooltip"));
         _content.inputLink.onClick.add(handleInputLinkClick);
         _banner = new InteractiveDisplayObject(_content.banner);
         _banner.onClick.add(handleAdvertismentClick);
         _banner.x = _banner.x + 25;
         _facebookButton = new UiButton(_content.btnFacebook,"",onClickFacebookShare);
         _content.banner.removeAllChildren();
         if(_loc4_ && Core.config.getTypedObject("whitelabel_config").getTypedObject(_loc4_).getBoolean("ingame_facebook_links") === false)
         {
            _facebookButton.visible = false;
            _content.txtInfoFacebook.visible = false;
         }
      }
      
      public function dispose() : void
      {
         _banner.dispose();
         _facebookButton.dispose();
         _facebookButton = null;
         _tooltipLink.dispose();
         _tooltipLink = null;
      }
      
      private function handleInputLinkClick(param1:InteractionEvent) : void
      {
         System.setClipboard(_content.inputLink.text);
         Environment.display.focus = null;
         Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/resource_request/link_in_clipboard/title"),LocText.current.text("dialog/resource_request/link_in_clipboard/text"),LocText.current.text("general/button_ok")));
      }
      
      private function handleAdvertismentClick(param1:InteractionEvent) : void
      {
         if(!_customBannerAdvertisment)
         {
            return;
         }
         if(_customBannerAdvertisment.displayInterval > 0)
         {
            _customBannerAdvertisment.trackClick();
         }
         if(_customBannerAdvertisment.url == "offerwall")
         {
            AppEnvironment.appPlatform.showOfferwall(User.current.id);
         }
         else
         {
            AppEnvironment.appPlatform.openLink(_customBannerAdvertisment.url);
         }
         if(_customBannerAdvertisment.displayInterval > 0)
         {
            _content.banner.removeAllChildren();
            _content.txtInfoLink.text = "";
         }
      }
      
      private function onClickFacebookShare(param1:InteractionEvent) : void
      {
         var _loc2_:String = AppConfig.urlPublic;
         _loc2_ = StringUtil.replace(_loc2_,"index.php","");
         AppEnvironment.appPlatform.openLink(_loc2_ + "resourceRequest.php?type=facebook&user_id=" + User.current.id.toString() + "&rft=" + _featureType.toString());
      }
      
      public function get content() : SymbolResourceRequestLinkContentGeneric
      {
         return _content;
      }
      
      public function refreshAdvertisment() : void
      {
         if(!_customBannerAdvertisments)
         {
            Environment.application.sendActionRequest("getCustomBannerAdvertisments",{},handleRequests,false);
         }
      }
      
      private function handleRequests(param1:ActionRequestResponse) : void
      {
         var _loc2_:* = param1.action;
         if("getCustomBannerAdvertisments" !== _loc2_)
         {
            throw new Error("Unsupported request action \'" + param1.action + "\'!");
         }
         if(param1.error == "")
         {
            Environment.application.updateData(param1.data);
            CustomBannerAdvertisments.instance.setData(param1.appResponse.custom_banner_advertisments);
            _customBannerAdvertisments = CustomBannerAdvertisments.instance.getCustomBannerAdvertisments();
            if(_customBannerAdvertisments.length > 0)
            {
               _customBannerAdvertisment = _customBannerAdvertisments[0];
               _content.txtInfoLink.text = _customBannerAdvertisment.rewardString;
               _content.banner.setUriSprite(_customBannerAdvertisment.bannerImage,500,100,true);
            }
         }
         else
         {
            Environment.reportError(param1.error,param1.request);
         }
      }
   }
}
