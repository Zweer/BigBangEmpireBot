package com.playata.framework.application
{
   import com.playata.framework.application.preloader.LaunchScreen;
   import com.playata.framework.assets.AssetManager;
   import com.playata.framework.assets.Assets;
   import com.playata.framework.assets.AssetsConfig;
   import com.playata.framework.audio.IAudioCore;
   import com.playata.framework.billing.IBilling;
   import com.playata.framework.core.Core;
   import com.playata.framework.core.IDisposable;
   import com.playata.framework.core.Runtime;
   import com.playata.framework.core.TypedObject;
   import com.playata.framework.core.config.Config;
   import com.playata.framework.core.error.Exception;
   import com.playata.framework.core.logging.Logger;
   import com.playata.framework.core.timer.ITimer;
   import com.playata.framework.data.LocalDataObject;
   import com.playata.framework.data.PersistentLocalDataObjectPool;
   import com.playata.framework.device.IDevice;
   import com.playata.framework.device.IDeviceInfo;
   import com.playata.framework.display.DisplayCoreConfig;
   import com.playata.framework.display.IDisplayCore;
   import com.playata.framework.display.layout.ILayout;
   import com.playata.framework.display.layout.LayoutUtil;
   import com.playata.framework.display.ui.panels.PanelManager;
   import com.playata.framework.input.IInputCore;
   import com.playata.framework.network.INetworkCore;
   import com.playata.framework.physics.IPhysicsCore;
   import com.playata.framework.platform.Platform;
   import com.playata.framework.services.apprating.IAppRating;
   import com.playata.framework.services.gameservices.IGameServices;
   import com.playata.framework.services.notifications.INotificationManager;
   import com.playata.framework.services.pushnotifications.IPushNotificationManager;
   import com.playata.framework.task.ITaskManager;
   import com.playata.framework.tween.Tween;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.geom.Rectangle;
   import flash.system.Security;
   
   public class Environment extends Sprite implements IDisposable
   {
      
      public static var startupParams:String = "";
      
      public static var textureResolution:int = 640;
      
      public static var isActive:Boolean = true;
      
      public static var errorReporter:IErrorReporter = null;
      
      public static var info:EnvironmentInfo = null;
      
      public static var device:IDevice = null;
      
      public static var deviceInfo:IDeviceInfo = null;
      
      public static var display:IDisplayCore = null;
      
      public static var network:INetworkCore = null;
      
      public static var audio:IAudioCore = null;
      
      public static var input:IInputCore = null;
      
      public static var physics:IPhysicsCore = null;
      
      public static var assetManager:AssetManager = null;
      
      public static var layout:ILayout = null;
      
      public static var application:IApplicationBase = null;
      
      public static var platform:Platform = null;
      
      public static var taskManager:ITaskManager = null;
      
      public static var panelManager:PanelManager = null;
      
      public static var appRating:IAppRating = null;
      
      public static var gameServices:IGameServices = null;
      
      public static var notificationManager:INotificationManager = null;
      
      public static var pushNotificationManager:IPushNotificationManager = null;
      
      public static var billing:IBilling = null;
      
      protected static var _config:EnvironmentConfig;
      
      protected static var _timers:Vector.<ITimer> = null;
       
      
      protected var _launchScreen:LaunchScreen;
      
      public function Environment(param1:EnvironmentConfig)
      {
         super();
         _config = param1;
         _config.defaultConfig.setInt("client_version",_config.clientVersion);
         Tween.init(Runtime.newInstance(_config.tweenClass,[]));
         info = new EnvironmentInfo();
         device = Runtime.newInstance(_config.deviceClass,[]);
         device.onActivate.add(Core.current.heartbeat.activate);
         device.onDeActivate.add(Core.current.heartbeat.deactivate);
         device.onDeActivate.add(PersistentLocalDataObjectPool.saveAll);
         _timers = new Vector.<ITimer>(0);
         Environment.layout = _config.layout;
         DisplayCoreConfig.layout = _config.layout;
         Environment.errorReporter = _config.errorReporter;
         Logger.enabled = false;
      }
      
      public static function clearStartupParams() : void
      {
         startupParams = "";
      }
      
      public static function createTimer(param1:String, param2:int, param3:Function, param4:Function = null, param5:int = 0, param6:Boolean = false) : ITimer
      {
         var _loc7_:ITimer = _config.core.createTimer(param1,param2,param3,param4,param5,param6);
         _timers.push(_loc7_);
         return _loc7_;
      }
      
      public static function reportError(param1:String, param2:TypedObject = null, param3:Boolean = true, param4:Boolean = true, param5:* = null) : void
      {
         Environment.errorReporter.reportError(param1,param2,param3,param4,param5);
      }
      
      public function dispose() : void
      {
         var _loc1_:* = null;
         ThrottleUtil.dispose();
         if(application)
         {
            application.dispose();
            application = null;
         }
         if(assetManager)
         {
            assetManager.dispose();
            assetManager = null;
         }
         if(network)
         {
            network.dispose();
            network = null;
         }
         if(audio)
         {
            audio.dispose();
            audio = null;
         }
         if(input)
         {
            input.dispose();
            input = null;
         }
         if(display)
         {
            display.dispose();
            display = null;
         }
         if(notificationManager)
         {
            notificationManager.dispose();
            notificationManager = null;
         }
         if(pushNotificationManager)
         {
            pushNotificationManager.dispose();
            pushNotificationManager = null;
         }
         if(panelManager)
         {
            panelManager.dispose();
            panelManager = null;
         }
         if(_timers)
         {
            _loc1_ = null;
            var _loc3_:int = 0;
            var _loc2_:* = _timers;
            for each(_loc1_ in _timers)
            {
               _loc1_.dispose();
            }
            _timers.length = 0;
            _timers = null;
         }
      }
      
      public function init(param1:LaunchScreen = null) : void
      {
         this._launchScreen = param1;
         Security.loadPolicyFile("https://scontent.xx.fbcdn.net/crossdomain.xml");
         mouseChildren = false;
         mouseEnabled = false;
         if(stage != null)
         {
            addedToStageHandler(null);
         }
         else
         {
            addEventListener("addedToStage",addedToStageHandler);
         }
      }
      
      public function setAppSize(param1:int, param2:int) : void
      {
         if(!layout.allowResize)
         {
            return;
         }
         LayoutUtil.init(stage);
         var _loc3_:Rectangle = LayoutUtil.deviceAdjustedAppSize;
         var _loc5_:int = Math.round(_loc3_.width);
         var _loc4_:int = Math.round(_loc3_.height);
         layout.appWidth = _loc5_;
         layout.appHeight = _loc4_;
         display.displayContext.setViewPort(_loc5_,_loc4_,stage.stageWidth,stage.stageHeight,1);
         if(panelManager)
         {
            panelManager.refreshAppSize();
         }
      }
      
      protected function addedToStageHandler(param1:Event) : void
      {
         removeEventListener("addedToStage",addedToStageHandler);
         LayoutUtil.init(stage);
         device.onDeActivate.add(onDeactivate);
         device.onActivate.add(onActivate);
         ErrorReporting.addUncaughtErrorHandler(root.loaderInfo);
         assetManager = new AssetManager();
         network = Runtime.newInstance(_config.networkCoreClass,[Runtime.newInstance(_config.networkInfoClass,[])]);
         audio = Runtime.newInstance(_config.audioCoreClass,[]);
         input = Runtime.newInstance(_config.inputCoreClass,[stage]);
         DisplayCoreConfig.assetManager = assetManager;
         display = Runtime.newInstance(_config.displayCoreClass,[stage]);
         display.init(createApplication);
         if(_config.physicsCoreClass != null)
         {
            physics = Runtime.newInstance(_config.physicsCoreClass,[]);
         }
      }
      
      protected function createApplication() : void
      {
         Core.config = new Config(_config.defaultConfig,root.loaderInfo.parameters);
         Security.loadPolicyFile(Core.config.cfg("urlCDNGetImage") + "crossdomain.xml");
         setAppSize(layout.appWidth,layout.appHeight);
         if(layout.allowResize)
         {
            display.displayContext.onResize.add(handleResize);
         }
         initPlatform();
      }
      
      protected function initPlatform() : void
      {
         throw new Exception("need to be overwritten in platform specific main class!");
      }
      
      protected function onPlatformInitted() : void
      {
         ErrorReporting.deviceInfo = Environment.deviceInfo;
         if(gameServices)
         {
            gameServices.init();
         }
         ThrottleUtil.initialize();
         application = Runtime.newInstance(_config.applicationClass,[]);
         application.initApplication();
         setupAssetLoaders();
         setupPlatformAssetLoaders();
      }
      
      public function set launchScreen(param1:LaunchScreen) : void
      {
         _launchScreen = param1;
      }
      
      protected function hideLaunchScreen() : void
      {
         if(!_launchScreen)
         {
            return;
         }
         _launchScreen.dispose();
         _launchScreen = null;
      }
      
      protected function onActivate(param1:int) : void
      {
         var _loc2_:* = null;
         isActive = true;
         Tween.resumeAll();
         if(display)
         {
            display.onActivate(param1);
         }
         if(application)
         {
            application.onActivate(param1);
         }
         if(network)
         {
            network.onActivate(param1);
         }
         if(audio)
         {
            audio.onActivate(param1);
         }
         if(input)
         {
            input.onActivate(param1);
         }
         if(physics)
         {
            physics.onActivate(param1);
         }
         if(_timers)
         {
            _loc2_ = null;
            var _loc4_:int = 0;
            var _loc3_:* = _timers;
            for each(_loc2_ in _timers)
            {
               if(_loc2_.isPaused)
               {
                  _loc2_.resume();
               }
            }
         }
      }
      
      protected function onDeactivate() : void
      {
         var _loc1_:* = null;
         isActive = false;
         Tween.pauseAll();
         if(display)
         {
            display.onDeactivate();
         }
         if(application)
         {
            application.onDeactivate();
         }
         if(network)
         {
            network.onDeactivate();
         }
         if(audio)
         {
            audio.onDeactivate();
         }
         if(input)
         {
            input.onDeactivate();
         }
         if(physics)
         {
            physics.onDeactivate();
         }
         if(_timers)
         {
            _loc1_ = null;
            var _loc3_:int = 0;
            var _loc2_:* = _timers;
            for each(_loc1_ in _timers)
            {
               if(_loc1_.isRunning)
               {
                  _loc1_.pause();
               }
            }
         }
      }
      
      protected function setupAssetLoaders() : void
      {
         Assets.assetBasePath = AssetsConfig.cdnURL;
         textureResolution = 630;
         var _loc1_:Number = textureResolution / Environment.layout.appHeight;
         Logger.info("[Environment] Using resolution of " + textureResolution + " for app size of " + layout.appWidth + "x" + layout.appHeight + " with a scale factor of " + _loc1_);
         display.setupAssetLoaders(assetManager,1);
      }
      
      protected function setupPlatformAssetLoaders() : void
      {
         throw new Exception("Assests must be prepared for every platform! Override this function in platform specific Main Class!");
      }
      
      private function get canUseHighresTextures() : Boolean
      {
         var _loc2_:Boolean = false;
         var _loc1_:LocalDataObject = new LocalDataObject("device");
         if(!_loc1_.hasData("can_use_highres_texures"))
         {
            Logger.debug("[Environment] Checking if high res texture can be used");
            _loc2_ = display.displayContext.canUseHighResTextures;
            _loc1_.setBoolean("can_use_highres_texures",_loc2_);
         }
         else
         {
            _loc2_ = _loc1_.getBoolean("can_use_highres_texures");
            Logger.debug("[Environment] High Res texture check already passed",[_loc2_]);
         }
         _loc1_.dispose();
         return _loc2_;
      }
      
      private function handleResize(param1:int, param2:int) : void
      {
         setAppSize(stage.stageWidth,stage.stageHeight);
      }
   }
}
