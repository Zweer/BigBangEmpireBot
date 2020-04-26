package com.playata.application
{
   import com.playata.application.advertisment.WebAdvertismentFactory;
   import com.playata.application.assets.EmbeddedSpineAssetsFlash;
   import com.playata.application.billing.AppBillingHandler;
   import com.playata.application.request.AppRequestResponseData;
   import com.playata.application.request.ApplicationRequest;
   import com.playata.framework.application.Environment;
   import com.playata.framework.application.ErrorReporting;
   import com.playata.framework.assets.location.EmbeddedAssetLocation;
   import com.playata.framework.assets.location.IAssetLocation;
   import com.playata.framework.billing.lib.standalone.WebBilling;
   import com.playata.framework.core.Core;
   import com.playata.framework.core.TypedObject;
   import com.playata.framework.core.logging.Logger;
   import com.playata.framework.device.lib.web.WebDeviceInfo;
   import com.playata.framework.network.request.RequestData;
   import com.playata.framework.util.mousewheel.MouseWheelEnabler;
   import flash.events.IOErrorEvent;
   import flash.system.ApplicationDomain;
   import flash.system.Capabilities;
   import flash.system.LoaderContext;
   import flash.system.Security;
   import flash.system.SecurityDomain;
   import org.casalib.events.LoadEvent;
   import org.casalib.load.GroupLoad;
   import org.casalib.load.SwfLoad;
   
   public class WebEnvironment extends AppEnvironment
   {
      
      public static const INIT_LOADING_PERCENTGE:int = 33;
       
      
      private var _preloaderGroup:GroupLoad;
      
      public function WebEnvironment()
      {
         super(new AppEnvironmentConfig(Application,false),33);
         Security.allowDomain("*");
         Security.allowInsecureDomain("*");
      }
      
      override protected function initPlatform() : void
      {
         super.initPlatform();
         Core.config.extend(new TypedObject(DefaultConfigWeb.defaultConfig),true);
         var _loc4_:String = Core.config.getString("urlSwfUi");
         var _loc8_:String = Core.config.getString("urlSwfCharacter");
         var _loc9_:String = null;
         if(Core.config.hasCfg("urlSwfCharacterUSK18") && Core.config.cfg("urlSwfCharacterUSK18") != "null" && Core.config.cfg("urlSwfCharacterUSK18") != "" && Core.config.cfg("urlSwfCharacterUSK18").indexOf("unknown") == -1)
         {
            _loc9_ = Core.config.getString("urlSwfCharacterUSK18");
         }
         var _loc3_:String = Core.config.getString("urlSwfMovieCover");
         Logger.debug("[Preloader] urlSwfUi: " + _loc4_);
         Logger.debug("[Preloader] urlSwfCharacter: " + _loc8_);
         Logger.debug("[Preloader] urlSwfMovieCover: " + _loc3_);
         var _loc5_:LoaderContext = new LoaderContext(true,ApplicationDomain.currentDomain);
         if(Security.sandboxType == "remote")
         {
            _loc5_.securityDomain = SecurityDomain.currentDomain;
         }
         _loc5_.checkPolicyFile = false;
         if(Capabilities.playerType != "Desktop" && Capabilities.playerType != "StandAlone")
         {
            _loc5_.securityDomain = SecurityDomain.currentDomain;
         }
         Logger.debug("[Preloader] start loading");
         var _loc6_:SwfLoad = new SwfLoad(_loc4_,_loc5_);
         _loc6_.loader.uncaughtErrorEvents.addEventListener("uncaughtError",ErrorReporting.uncaughtErrorHandler);
         var _loc7_:SwfLoad = new SwfLoad(_loc8_,_loc5_);
         _loc7_.loader.uncaughtErrorEvents.addEventListener("uncaughtError",ErrorReporting.uncaughtErrorHandler);
         var _loc2_:SwfLoad = null;
         if(_loc9_ != null)
         {
            _loc2_ = new SwfLoad(_loc9_,_loc5_);
            _loc2_.loader.uncaughtErrorEvents.addEventListener("uncaughtError",ErrorReporting.uncaughtErrorHandler);
         }
         var _loc1_:SwfLoad = new SwfLoad(_loc3_,_loc5_);
         _loc1_.loader.uncaughtErrorEvents.addEventListener("uncaughtError",ErrorReporting.uncaughtErrorHandler);
         _preloaderGroup = new GroupLoad();
         _preloaderGroup.addLoad(_loc6_);
         _preloaderGroup.addLoad(_loc7_);
         if(_loc2_ != null)
         {
            _preloaderGroup.addLoad(_loc2_);
         }
         _preloaderGroup.addLoad(_loc1_);
         _preloaderGroup.addEventListener("progress",onPreloaderProgress);
         _preloaderGroup.addEventListener("complete",onPreloaderDownloadComplete);
         _preloaderGroup.addEventListener("ioError",onPreloaderDownloadFailed);
         _preloaderGroup.start();
      }
      
      private function onPreloaderProgress(param1:LoadEvent) : void
      {
         _loadingScreen.progress = param1.progress.percentage * 0.66 + 33;
      }
      
      private function onPreloaderDownloadComplete(param1:LoadEvent) : void
      {
         Logger.debug("[Preloader] Download successful!");
         start();
         _preloaderGroup.removeEventListener("progress",onPreloaderProgress);
         _preloaderGroup.removeEventListener("complete",onPreloaderDownloadComplete);
         _preloaderGroup.removeEventListener("ioError",onPreloaderDownloadFailed);
      }
      
      private function onPreloaderDownloadFailed(param1:IOErrorEvent) : void
      {
         Logger.error("[Preloader] Download failed (IO Error)!");
         _loadingScreen.statusMessage = "Loading failed.";
         _preloaderGroup.removeEventListener("progress",onPreloaderProgress);
         _preloaderGroup.removeEventListener("complete",onPreloaderDownloadComplete);
         _preloaderGroup.removeEventListener("ioError",onPreloaderDownloadFailed);
      }
      
      private function start() : void
      {
         Environment.startupParams = Core.config.getString("startupParams");
         var _loc1_:* = Environment.info.isTestMode;
         Logger.dumping = _loc1_;
         Logger.enabled = _loc1_;
      }
      
      private function initEnvironment(param1:String, param2:RequestData, param3:Object, param4:String) : void
      {
         var _loc5_:AppRequestResponseData = new AppRequestResponseData(param3);
         if(param4)
         {
            if(param4 == "errRequestMaintenance" || param4 == "errRequestOutdatedClientVersion")
            {
               AppEnvironment.showMaintenanceInfo();
            }
            else
            {
               Environment.reportError(param4,param2,true,true);
            }
            return;
         }
         Core.config.extend(_loc5_.extendedConfig,true);
         Environment.billing = new WebBilling(new AppBillingHandler());
         Environment.deviceInfo = new WebDeviceInfo();
         AppEnvironment.adFactory = new WebAdvertismentFactory();
         onPlatformInitted();
         MouseWheelEnabler.init(stage);
      }
      
      override protected function get spineDefinitionLocation() : IAssetLocation
      {
         return new EmbeddedAssetLocation(EmbeddedSpineAssetsFlash);
      }
      
      override protected function get textureLocation() : IAssetLocation
      {
         return null;
      }
   }
}
