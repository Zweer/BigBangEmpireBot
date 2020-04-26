package com.playata.application.platform
{
   import com.playata.application.AppConfig;
   import com.playata.application.AppEnvironment;
   import com.playata.application.Application;
   import com.playata.application.WindowsApplication;
   import com.playata.application.data.user.User;
   import com.playata.application.ui.dialogs.DialogOfferwallSelection;
   import com.playata.application.ui.elements.payment.UiMobilePaymentBlocker;
   import com.playata.framework.application.Environment;
   import com.playata.framework.core.Core;
   import com.playata.framework.core.TypedObject;
   import com.playata.framework.core.logging.Logger;
   import com.playata.framework.core.util.QueryString;
   import com.playata.framework.network.request.RequestResponseData;
   import com.playata.framework.platform.Platform;
   import flash.external.ExternalInterface;
   
   public class AppPlatform extends Platform
   {
       
      
      private var _advertismentInfo:TypedObject = null;
      
      private var _onResponseBuyCurrency:Function = null;
      
      private var _pageViewHandler:PageViewHandler = null;
      
      private var _activityTimeHandler:ActivityTimeHandler = null;
      
      public function AppPlatform()
      {
         super();
      }
      
      public function setAdvertismentInfo(param1:Object) : void
      {
         _advertismentInfo = new TypedObject(param1);
      }
      
      public function getAdvertismentInfoInt(param1:String = null, param2:int = 0) : int
      {
         return getAdvertismentInfo(param1,param2) as int;
      }
      
      public function getAdvertismentInfo(param1:String = null, param2:Object = null) : Object
      {
         if(!_advertismentInfo)
         {
            return param2;
         }
         if(param1 && _advertismentInfo.hasData(param1,true))
         {
            return _advertismentInfo.getData(param1);
         }
         return param2;
      }
      
      public function get hasAppFriendBar() : Boolean
      {
         return isSteam || isIOS || isAndroid;
      }
      
      public function get isPaymentGiftingAllowed() : Boolean
      {
         initialize();
         var _loc1_:Boolean = getPlatformSettingBoolean("isPaymentGiftingAllowed");
         if(!_loc1_)
         {
            return false;
         }
         return true;
      }
      
      public function get isFriendbarSupported() : Boolean
      {
         return getPlatformSettingBoolean("isFriendbarSupported");
      }
      
      public function get isPremiumItemShopAllowed() : Boolean
      {
         return getPlatformSettingBoolean("isPremiumItemShopAllowed");
      }
      
      public function get isCustomAdvertismentAllowed() : Boolean
      {
         return getPlatformSettingBoolean("isCustomAdvertismentAllowed");
      }
      
      public function get isResourceRequestAllowed() : Boolean
      {
         return getPlatformSettingBoolean("isResourceRequestAllowed");
      }
      
      public function get isResourceRequestViaLinkAllowed() : Boolean
      {
         return getPlatformSettingBoolean("isResourceRequestViaLinkAllowed");
      }
      
      public function get isForumLinkAllowed() : Boolean
      {
         return getPlatformSettingBoolean("isForumLinkAllowed");
      }
      
      public function get isHideBraAllowed() : Boolean
      {
         return getPlatformSettingBoolean("hideBraAllowed") && Core.config.getBoolean("hide_bra_allowed");
      }
      
      public function get isHidePantiesAllowed() : Boolean
      {
         if(!Core.config.hasCfg("platform_settings") || !Core.config.hasCfg("hide_panties_allowed"))
         {
            return Core.config.hasCfg("urlSwfCharacterUSK18") && Core.config.cfg("urlSwfCharacterUSK18") != "" && Core.config.cfg("urlSwfCharacterUSK18") != null && Core.config.cfg("urlSwfCharacterUSK18") != "null" && Core.config.cfg("urlSwfCharacterUSK18").indexOf("unknown") == -1;
         }
         return getPlatformSettingBoolean("hidePantiesAllowed") && Core.config.getBoolean("hide_panties_allowed");
      }
      
      public function get datingFeatureEnabled() : Boolean
      {
         return getPlatformSettingBoolean("datingFeatureEnabled");
      }
      
      public function get fanFotoFeatureEnabled() : Boolean
      {
         return getPlatformSettingBoolean("fanFotoEnabled");
      }
      
      public function get showIngameServerSelection() : Boolean
      {
         if(ServerInfo.serverId == "approval")
         {
            return false;
         }
         if(Environment.info.isNativeMobile && !AppEnvironment.appPlatform.isNutaku)
         {
            return true;
         }
         if(Environment.application is WindowsApplication)
         {
            return true;
         }
         return !ServerInfo.isTest && getPlatformSettingBoolean("showIngameServerSelection");
      }
      
      public function get isCharacterSelectionAllowed() : Boolean
      {
         if(Environment.info.isNativeMobile && !AppEnvironment.appPlatform.isNutaku)
         {
            return true;
         }
         if(Environment.application is WindowsApplication)
         {
            return true;
         }
         return getPlatformSettingBoolean("isCharacterSelectionAllowed");
      }
      
      public function get isTeleviaRef() : Boolean
      {
         return User.current.ref == "461-000-000-800";
      }
      
      public function writeSessionCookie(param1:String, param2:int, param3:String, param4:String, param5:String, param6:Boolean) : void
      {
         callExtern("setSessionCookie",param1,param2,param3,param4,param5,param6);
      }
      
      public function deleteSessionCookie() : void
      {
         callExtern("deleteSessionCookie");
      }
      
      public function setPageTitle(param1:String, param2:String) : void
      {
         callExtern("setPageTitle",param1,param2);
      }
      
      public function setActivityTimeTitle(param1:int, param2:String, param3:String) : void
      {
         if(Environment.info.isNativeMobile)
         {
            return;
         }
         if(!_activityTimeHandler)
         {
            _activityTimeHandler = new ActivityTimeHandler();
            _activityTimeHandler.start();
         }
         _activityTimeHandler.setActivityTimeTitle(param1,param2,param3);
      }
      
      public function setActivityTime(param1:String, param2:String, param3:int, param4:int, param5:String) : void
      {
         callExtern("setActivityTime",param1,param2,param3,param4,param5);
      }
      
      public function trackRegConversion(param1:String, param2:String, param3:String, param4:String) : void
      {
         callExtern("trackRegConversion",param1,param2,param3,param4);
      }
      
      public function trackPayConversion(param1:String, param2:String, param3:String, param4:int, param5:Object) : void
      {
         callExtern("trackPayConversion",param1,param2,param3,param4,param5);
      }
      
      public function trackLoginConversion(param1:String, param2:String, param3:String, param4:int) : void
      {
         callExtern("trackLoginConversion",param1,param2,param3,param4);
      }
      
      public function trackLogoutConversion(param1:String, param2:String, param3:String) : void
      {
         callExtern("trackLogoutConversion",param1,param2,param3);
      }
      
      public function trackLevelUpConversion(param1:String, param2:String, param3:String, param4:int) : void
      {
         callExtern("trackLevelUpConversion",param1,param2,param3,param4);
      }
      
      public function trackIngameAction(param1:String, param2:String, param3:String) : void
      {
         callExtern("trackIngameAction",param1,param2,param3);
      }
      
      public function onLogin(param1:String, param2:String, param3:String) : void
      {
         if(isEspritGames && User.current && User.current.character)
         {
            callExtern("onEspritGamesLogin",User.current.character.name);
         }
         else
         {
            callExtern("onLogin",param1,param2,param3);
         }
      }
      
      override public function reload() : void
      {
         if(isEspritGames)
         {
            callExtern("espritGamesReload");
         }
         else
         {
            super.reload();
         }
      }
      
      public function buyCurrency(param1:String, param2:Function) : void
      {
         var _loc3_:* = null;
         if(Environment.info.isNativeMobile)
         {
            _onResponseBuyCurrency = param2;
            _loc3_ = new UiMobilePaymentBlocker(_onResponseBuyCurrency);
            openLink(param1);
            return;
         }
         if(ExternalInterface.available)
         {
            Logger.debug("[Application] Making call to external interface: buyCurrency...");
            _onResponseBuyCurrency = param2;
            ExternalInterface.addCallback("callbackBuyCurrency",callbackBuyCurrency);
            ExternalInterface.call("buyCurrency",param1);
         }
      }
      
      override public function openBillingDialog(param1:RequestResponseData, param2:Function) : void
      {
         var _loc11_:* = null;
         var _loc3_:* = null;
         var _loc8_:* = null;
         var _loc10_:* = null;
         var _loc9_:QueryString = null;
         var _loc5_:String = null;
         var _loc4_:int = 0;
         var _loc6_:String = null;
         var _loc7_:String = null;
         if(isNutaku)
         {
            _loc9_ = new QueryString(param1.getString("payment_link"));
            _loc5_ = _loc9_.parameters.getString("user");
            _loc4_ = parseFloat(_loc9_.parameters.getString("amount"));
            _loc6_ = _loc9_.parameters.getString("item");
            _loc11_ = _loc9_.parameters.getString("skuId");
            _loc7_ = _loc9_.parameters.getString("imageUrl");
            openNutakuPayDialog(_loc5_,_loc4_.toString(),_loc6_,_loc11_,_loc7_,param2);
         }
         else if(isNaszaKlasa)
         {
            _loc9_ = new QueryString(param1.getString("payment_link"));
            _loc5_ = _loc9_.parameters.getString("user");
            _loc4_ = parseFloat(_loc9_.parameters.getString("amount")) * 10;
            _loc6_ = _loc9_.parameters.getString("item");
            openNaszaKlasaPayDialog(_loc5_,_loc4_.toString(),_loc6_,param2);
         }
         else if(isEspritGames)
         {
            _loc9_ = new QueryString(param1.getString("payment_link"));
            _loc5_ = _loc9_.parameters.getString("user");
            _loc3_ = _loc9_.parameters.getString("packId");
            openEspritGamesPayDialog(_loc5_,_loc3_,param2);
         }
         else if(isEroges)
         {
            _loc9_ = new QueryString(param1.getString("payment_link"));
            _loc5_ = _loc9_.parameters.getString("user");
            _loc8_ = _loc9_.parameters.getString("publicKey");
            _loc10_ = _loc9_.parameters.getString("hash");
            _loc4_ = parseFloat(_loc9_.parameters.getString("amount"));
            _loc6_ = _loc9_.parameters.getString("item");
            _loc7_ = null;
            openErogesPayDialog(_loc5_,_loc8_,_loc10_,_loc4_.toString(),_loc6_,_loc7_,param2);
         }
         else
         {
            buyCurrency(param1.getString("payment_link"),param2);
         }
      }
      
      public function openEspritGamesPayDialog(param1:String, param2:String, param3:Function) : void
      {
         if(ExternalInterface.available)
         {
            Logger.debug("[Application] Making call to external interface: openEspritGamesPayDialog...");
            _onResponseBuyCurrency = param3;
            ExternalInterface.addCallback("callbackBuyCurrency",callbackBuyCurrency);
            ExternalInterface.call("openEspritGamesPayDialog",param1,param2);
         }
      }
      
      public function openNaszaKlasaPayDialog(param1:String, param2:String, param3:String, param4:Function) : void
      {
         if(ExternalInterface.available)
         {
            Logger.debug("[Application] Making call to external interface: openNaszaKlasaPayDialog...");
            _onResponseBuyCurrency = param4;
            ExternalInterface.addCallback("callbackBuyCurrency",callbackBuyCurrency);
            ExternalInterface.call("openNaszaKlasaPayDialog",param1,param2,param3);
         }
      }
      
      public function openNutakuPayDialog(param1:String, param2:String, param3:String, param4:String, param5:String, param6:Function) : void
      {
         if(ExternalInterface.available)
         {
            Logger.debug("[Application] Making call to external interface: openNutakuPayDialog...");
            _onResponseBuyCurrency = param6;
            ExternalInterface.addCallback("callbackBuyCurrency",callbackBuyCurrency);
            ExternalInterface.call("openNutakuPayDialog",param1,param2,param3,param4,param5);
         }
      }
      
      public function openErogesPayDialog(param1:String, param2:String, param3:String, param4:String, param5:String, param6:String, param7:Function) : void
      {
         Logger.debug("[Application] Making call to external interface: buy currency...");
         if(ExternalInterface.available)
         {
            _onResponseBuyCurrency = param7;
            ExternalInterface.addCallback("callbackBuyCurrency",callbackBuyCurrency);
            ExternalInterface.call("openErogesPayDialog",param1,param2,param3,param4,param5,param6);
         }
      }
      
      public function openSupportInIframe(param1:String) : void
      {
         callExtern("openSupportInIframe",param1);
      }
      
      public function redirectServer(param1:String) : void
      {
         callExtern("redirectServer",param1);
      }
      
      public function showOfferwall(param1:int) : void
      {
         if(Environment.info.isNativeMobile)
         {
            Environment.panelManager.showDialog(new DialogOfferwallSelection());
         }
         else
         {
            callExtern("showOfferwall",param1);
         }
      }
      
      public function trackPageView(param1:String) : void
      {
         if(!_pageViewHandler)
         {
            _pageViewHandler = new PageViewHandler();
            _pageViewHandler.start();
         }
         _pageViewHandler.trackPageView(param1);
      }
      
      private function callbackBuyCurrency(param1:Boolean) : void
      {
         Logger.debug("[Application] Received response from external interface...");
         if(_onResponseBuyCurrency != null)
         {
            _onResponseBuyCurrency(param1);
         }
      }
      
      public function showAdvertisment(param1:int) : void
      {
         callExtern("showAdvertisment",_advertismentInfo.rawData,param1);
      }
      
      public function hideAdvertisment() : void
      {
         callExtern("hideAdvertisment");
      }
      
      public function refreshAdvertisment() : void
      {
         callExtern("refreshAdvertisment");
      }
      
      public function showLogoutAdvertisment() : void
      {
         callExtern("showLogoutAdvertisment");
      }
      
      public function showPrerollAdvertisment() : void
      {
         callExtern("showPrerollAdvertisment");
      }
      
      public function publishFeed(param1:String, param2:String, param3:String, param4:String = null, param5:String = null, param6:String = null, param7:String = null, param8:String = null) : void
      {
         if(!param4)
         {
            param4 = AppConfig.urlPublic;
         }
         if(!param5)
         {
            param5 = AppConfig.applicationTitle;
         }
         callExtern("publishFeed",param1,param2,param3,param4,param5,param6,param7,param8);
      }
      
      public function inviteFriends(param1:String, param2:String, param3:String, param4:String) : void
      {
         callExtern("inviteFriends",param1,param2,param3,param4);
      }
      
      public function sendRequest(param1:String, param2:String, param3:String, param4:String) : void
      {
         callExtern("sendRequest",param1,param2,param3,param4);
      }
      
      public function autoLogoff() : void
      {
         callExtern("autoLogoff");
      }
      
      public function refreshInfoMessage() : void
      {
         if(Environment.info.isNativeMobile)
         {
            (Environment.application as Application).infoMessage.refresh();
         }
         else
         {
            callExtern("refreshInfoMessage");
         }
      }
      
      public function enableInfoMessageSync(param1:Boolean) : void
      {
         if(Environment.info.isNativeMobile)
         {
            try
            {
               (Environment.application as Application).infoMessage.enableSync = param1;
            }
            catch(e:Error)
            {
            }
         }
         else
         {
            callExtern("enableInfoMessageSync",param1);
         }
      }
      
      public function blockRegistration() : void
      {
         callExtern("blockRegistration");
      }
      
      public function get isPlayata() : Boolean
      {
         return !isEroges && !isJacquieetMichelGaming && !isNaughtyEmpire && !isNutakuNet;
      }
   }
}
