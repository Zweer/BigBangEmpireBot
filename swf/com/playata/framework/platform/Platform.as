package com.playata.framework.platform
{
   import com.playata.framework.application.Environment;
   import com.playata.framework.core.Core;
   import com.playata.framework.core.Runtime;
   import com.playata.framework.core.logging.Logger;
   import com.playata.framework.localization.LocText;
   import com.playata.framework.network.request.RequestResponseData;
   import com.playata.framework.platform.settings.ArmorGamesPlatformSettings;
   import com.playata.framework.platform.settings.ClickJogosPlatformSettings;
   import com.playata.framework.platform.settings.DraugasPlatformSettings;
   import com.playata.framework.platform.settings.DraugiemPlatformSettings;
   import com.playata.framework.platform.settings.ErogesPlatformSettings;
   import com.playata.framework.platform.settings.EspritGamesPlatformSettings;
   import com.playata.framework.platform.settings.FOGPlatformSettings;
   import com.playata.framework.platform.settings.FacebookPlatformSettings;
   import com.playata.framework.platform.settings.GamgosPlatformSettings;
   import com.playata.framework.platform.settings.IPlatformSettings;
   import com.playata.framework.platform.settings.IPlayerPlatformSettings;
   import com.playata.framework.platform.settings.IdnetPlatformSettings;
   import com.playata.framework.platform.settings.JacquieetMichelGamingPlatformSettings;
   import com.playata.framework.platform.settings.KongregatePlatformSettings;
   import com.playata.framework.platform.settings.MiniclipPlatformSettings;
   import com.playata.framework.platform.settings.NaszaKlasaPlatformSettings;
   import com.playata.framework.platform.settings.NutakuPlatformSettings;
   import com.playata.framework.platform.settings.OdnoklassnikiPlatformSettings;
   import com.playata.framework.platform.settings.PlaysimoPlatformSettings;
   import com.playata.framework.platform.settings.SpielaffePlatformSettings;
   import com.playata.framework.platform.settings.StandalonePlatformSettings;
   import com.playata.framework.platform.settings.SteamPlatformSettings;
   import com.playata.framework.platform.settings.SyFyGamesPlatformSettings;
   import com.playata.framework.platform.settings.VkontaktePlatformSettings;
   import com.playata.framework.platform.settings.WpplPlatformSettings;
   import flash.net.URLRequest;
   import flash.net.navigateToURL;
   import flash.system.Capabilities;
   
   public class Platform
   {
       
      
      protected var _settings:IPlatformSettings = null;
      
      public function Platform()
      {
         super();
      }
      
      public static function getWhiteLabelId(param1:String) : String
      {
         var _loc2_:Object = Core.config.cfg("whitelabel_config");
         if(!_loc2_.hasOwnProperty(param1))
         {
            return null;
         }
         var _loc3_:Object = _loc2_[param1];
         if(!_loc3_["active"])
         {
            return null;
         }
         if(!Core.config.cfg("testMode") && _loc3_["test"])
         {
            return null;
         }
         return param1;
      }
      
      public function get id() : String
      {
         return PlatformConfig.platform;
      }
      
      public function get name() : String
      {
         if(LocText.current == null)
         {
            return id;
         }
         return LocText.current.text("platform/" + id + "/name");
      }
      
      public function get whiteLabelId() : String
      {
         return getWhiteLabelId(id);
      }
      
      public function get reloadParamString() : String
      {
         initialize();
         if(!_settings)
         {
            return buildReloadParams(null);
         }
         return buildReloadParams(_settings.reloadParams);
      }
      
      public function get isSSO() : Boolean
      {
         return getPlatformSettingBoolean("isSSO");
      }
      
      public function get hasCustomPayment() : Boolean
      {
         return getPlatformSettingBoolean("hasCustomPayment");
      }
      
      public function get isBannerAdvertismentAllowed() : Boolean
      {
         return getPlatformSettingBoolean("isBannerAdvertismentAllowed");
      }
      
      public function get isLogoutAdvertismentAllowed() : Boolean
      {
         return getPlatformSettingBoolean("isLogoutAdvertismentAllowed");
      }
      
      public function get isVideoAdvertismentAllowed() : Boolean
      {
         return getPlatformSettingBoolean("isVideoAdvertismentAllowed");
      }
      
      public function get isOfferwallAllowed() : Boolean
      {
         return getPlatformSettingBoolean("isOfferwallAllowed");
      }
      
      public function get isUnbindAllowed() : Boolean
      {
         return getPlatformSettingBoolean("isUnbindAllowed");
      }
      
      public function get isAutoLoginAllowed() : Boolean
      {
         return getPlatformSettingBoolean("isAutoLoginAllowed");
      }
      
      public function get isStandaloneLoginAllowed() : Boolean
      {
         return getPlatformSettingBoolean("isStandaloneLoginAllowed");
      }
      
      public function get isFriendInviteAllowed() : Boolean
      {
         return getPlatformSettingBoolean("isFriendInviteAllowed");
      }
      
      public function get isVoucherAllowed() : Boolean
      {
         return getPlatformSettingBoolean("isVoucherAllowed");
      }
      
      public function get showTerms() : Boolean
      {
         return getPlatformSettingBoolean("showTerms");
      }
      
      public function get isPrerollAdvertismentAllowed() : Boolean
      {
         return getPlatformSettingBoolean("prerollAdvertismentAllowed");
      }
      
      public function get isSupportLinkAllowed() : Boolean
      {
         return getPlatformSettingBoolean("isSupportLinkAllowed");
      }
      
      public function get openSupportInIFrame() : Boolean
      {
         return getPlatformSettingBoolean("openSupportInIFrame");
      }
      
      public function get isSSOAutoLoginAllowed() : Boolean
      {
         return getPlatformSettingBoolean("isSSOAutoLoginAllowed");
      }
      
      public function get requiredAge() : int
      {
         return getPlatformSettingInt("requiredAge");
      }
      
      public function get hasAgeVerification() : Boolean
      {
         return requiredAge > 0;
      }
      
      public function get isStandalone() : Boolean
      {
         return id == "standalone";
      }
      
      public function get isFacebook() : Boolean
      {
         return id == "facebook";
      }
      
      public function get isSpielaffe() : Boolean
      {
         return id == "spielaffe";
      }
      
      public function get isKongregate() : Boolean
      {
         return id == "kongregate";
      }
      
      public function get isNaszaKlasa() : Boolean
      {
         return id == "naszaklasa";
      }
      
      public function get isNutaku() : Boolean
      {
         return id == "nutaku";
      }
      
      public function get isDraugas() : Boolean
      {
         return id == "draugas";
      }
      
      public function get isClickJogos() : Boolean
      {
         return id == "clickjogos";
      }
      
      public function get isOdnoklassniki() : Boolean
      {
         return id == "odnoklassniki";
      }
      
      public function get isEroges() : Boolean
      {
         return id == "eroges";
      }
      
      public function get isJacquieetMichelGaming() : Boolean
      {
         return id == "jacquieetmichelgaming_wl" || id == "jacquieetmichelgaming" || whiteLabelId == "jacquieetmichelgaming_wl";
      }
      
      public function get isEspritGames() : Boolean
      {
         return id == "espritgames";
      }
      
      public function get isVkontakte() : Boolean
      {
         return id == "vkontakte";
      }
      
      public function get isMiniclip() : Boolean
      {
         return id == "miniclip";
      }
      
      public function get isWppl() : Boolean
      {
         return id == "wppl";
      }
      
      public function get isFOG() : Boolean
      {
         return id == "fog";
      }
      
      public function get isIPlayer() : Boolean
      {
         return id == "iplayer";
      }
      
      public function get isSyFyGames() : Boolean
      {
         return id == "syfygames";
      }
      
      public function get isGamgos() : Boolean
      {
         return id == "gamgos";
      }
      
      public function get isIdNet() : Boolean
      {
         return id == "idnet";
      }
      
      public function get isDraugiem() : Boolean
      {
         return id == "draugiem";
      }
      
      public function get isSteam() : Boolean
      {
         return id == "steam";
      }
      
      public function get isPlaysimo() : Boolean
      {
         return id == "playsimo";
      }
      
      public function get isArmorGames() : Boolean
      {
         return id == "armorgames";
      }
      
      public function get isNaughtyEmpire() : Boolean
      {
         return id == "naughtyempire" || isEroges || isNutaku;
      }
      
      public function get isIOS() : Boolean
      {
         return id == "ios" || id == "gamecenter";
      }
      
      public function get isAndroid() : Boolean
      {
         return id == "android" || id == "playservices";
      }
      
      public function reload() : void
      {
         var _loc2_:* = null;
         var _loc1_:* = null;
         Logger.debug("[Application] Reloading main page \'" + PlatformConfig.urlPublic + "\'...");
         if(isWeb)
         {
            _loc2_ = reloadParamString;
            _loc1_ = PlatformConfig.urlPublic;
            if(_loc2_)
            {
               _loc1_ = _loc1_ + _loc2_;
            }
            openLink(_loc1_,"_self");
         }
      }
      
      public function openLink(param1:String, param2:String = "_blank") : void
      {
         Logger.debug("[Application] Loading URL in browser \'" + param1 + "\'...");
      }
      
      public function openBillingDialog(param1:RequestResponseData, param2:Function) : void
      {
      }
      
      public function callExtern(param1:String, ... rest) : void
      {
         if(Environment.info.isNativeMobile)
         {
            return;
         }
         Runtime.callJavaScript(param1,rest);
      }
      
      protected function getPlatformSettingBoolean(param1:String) : Boolean
      {
         return getPlatformSettingData(param1) as Boolean;
      }
      
      protected function getPlatformSettingInt(param1:String) : int
      {
         return getPlatformSettingData(param1) as int;
      }
      
      protected function getPlatformSettingData(param1:String) : Object
      {
         initialize();
         return PlatformConfig.platformSettings[id][param1];
      }
      
      protected function buildReloadParams(param1:Vector.<String>) : String
      {
         if(!param1 || param1.length == 0)
         {
            return "";
         }
         var _loc2_:Vector.<String> = new Vector.<String>();
         var _loc5_:int = 0;
         var _loc4_:* = param1;
         for each(var _loc3_ in param1)
         {
            if(Core.config.hasCfg(_loc3_))
            {
               _loc2_.push(_loc3_ + "=" + Core.config.getString(_loc3_));
            }
         }
         if(_loc2_.length == 0)
         {
            return "";
         }
         return "?" + _loc2_.join("&");
      }
      
      protected function initialize() : void
      {
         if(_settings != null)
         {
            return;
         }
         if(isStandalone)
         {
            _settings = new StandalonePlatformSettings();
            return;
         }
         if(isFacebook)
         {
            _settings = new FacebookPlatformSettings();
            return;
         }
         if(isSpielaffe)
         {
            _settings = new SpielaffePlatformSettings();
            return;
         }
         if(isKongregate)
         {
            _settings = new KongregatePlatformSettings();
            return;
         }
         if(isNaszaKlasa)
         {
            _settings = new NaszaKlasaPlatformSettings();
            return;
         }
         if(isNutaku)
         {
            _settings = new NutakuPlatformSettings();
            return;
         }
         if(isDraugas)
         {
            _settings = new DraugasPlatformSettings();
            return;
         }
         if(isClickJogos)
         {
            _settings = new ClickJogosPlatformSettings();
            return;
         }
         if(isVkontakte)
         {
            _settings = new VkontaktePlatformSettings();
            return;
         }
         if(isOdnoklassniki)
         {
            _settings = new OdnoklassnikiPlatformSettings();
            return;
         }
         if(isEroges)
         {
            _settings = new ErogesPlatformSettings();
            return;
         }
         if(isJacquieetMichelGaming)
         {
            _settings = new JacquieetMichelGamingPlatformSettings();
            return;
         }
         if(isEspritGames)
         {
            _settings = new EspritGamesPlatformSettings();
            return;
         }
         if(isMiniclip)
         {
            _settings = new MiniclipPlatformSettings();
            return;
         }
         if(isWppl)
         {
            _settings = new WpplPlatformSettings();
            return;
         }
         if(isFOG)
         {
            _settings = new FOGPlatformSettings();
            return;
         }
         if(isIPlayer)
         {
            _settings = new IPlayerPlatformSettings();
            return;
         }
         if(isSyFyGames)
         {
            _settings = new SyFyGamesPlatformSettings();
            return;
         }
         if(isGamgos)
         {
            _settings = new GamgosPlatformSettings();
            return;
         }
         if(isIdNet)
         {
            _settings = new IdnetPlatformSettings();
            return;
         }
         if(isSteam)
         {
            _settings = new SteamPlatformSettings();
            return;
         }
         if(isDraugiem)
         {
            _settings = new DraugiemPlatformSettings();
            return;
         }
         if(isPlaysimo)
         {
            _settings = new PlaysimoPlatformSettings();
            return;
         }
         if(isArmorGames)
         {
            _settings = new ArmorGamesPlatformSettings();
            return;
         }
      }
      
      public function get isAir() : Boolean
      {
         return Capabilities.playerType == "Desktop";
      }
      
      public function get isWeb() : Boolean
      {
         return Capabilities.playerType == "PlugIn" || Capabilities.playerType == "ActiveX";
      }
   }
}
