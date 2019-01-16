package com.playata.application
{
   import com.playata.application.main.FriendBar;
   import com.playata.application.notification.LocalNotificationHandler;
   import com.playata.application.platform.AppPlatform;
   import com.playata.application.request.JsonActionRemoteRequest;
   import com.playata.application.task.ApplicationTaskHandler;
   import com.playata.application.ui.ViewManager;
   import com.playata.application.ui.elements.application.UiLoadingScreen;
   import com.playata.framework.advertisement.IAdvertismentFactory;
   import com.playata.framework.application.ApplicationConfig;
   import com.playata.framework.application.Environment;
   import com.playata.framework.assets.AssetType;
   import com.playata.framework.assets.IAssetLoader;
   import com.playata.framework.assets.definition.AssetDefinition;
   import com.playata.framework.assets.location.IAssetLocation;
   import com.playata.framework.core.Core;
   import com.playata.framework.core.Runtime;
   import com.playata.framework.core.cache.ICacheFile;
   import com.playata.framework.core.logging.Logger;
   import com.playata.framework.data.constants.ConstantsAssetLocation;
   import com.playata.framework.data.constants.ConstantsLoader;
   import com.playata.framework.display.assets.SpineAssetDefinitionData;
   import com.playata.framework.localization.LocText;
   import com.playata.framework.localization.assets.LocTextAssetLocation;
   import com.playata.framework.localization.assets.LocTextLoader;
   import com.playata.framework.services.facebook.IFacebook;
   import flash.events.Event;
   
   public class AppEnvironment extends Environment
   {
      
      public static var appPlatform:AppPlatform = null;
      
      public static var adFactory:IAdvertismentFactory = null;
      
      public static var facebook:IFacebook = null;
      
      public static var localNotificationHandler:LocalNotificationHandler = null;
      
      public static var friendBar:FriendBar = null;
       
      
      protected var _loadingScreen:UiLoadingScreen = null;
      
      public function AppEnvironment(param1:AppEnvironmentConfig, param2:int = 0)
      {
         appPlatform = new AppPlatform();
         Environment.platform = new AppPlatform();
         localNotificationHandler = new LocalNotificationHandler();
         Application.userController = new AppUserController();
         super(param1);
         _loadingScreen = new UiLoadingScreen(true,null);
         _loadingScreen.show(this);
         _loadingScreen.progress = param2;
      }
      
      public static function showMaintenanceInfo() : void
      {
         var _loc1_:String = Core.config.getTypedObject("title_maintenance").getString(Environment.info.defaultLocale);
         _loc1_ = _loc1_ + ("\n" + Core.config.getTypedObject("text_maintenance").getString(Environment.info.defaultLocale));
         showInfo(_loc1_);
      }
      
      public static function showReloadInfo() : void
      {
         if(LocText.current)
         {
            showInfo(LocText.current.text("general/common_error_dialog/text"));
         }
         else
         {
            showInfo("Sorry, something went wrong. Please reload the game.");
         }
      }
      
      public static function showInfo(param1:String) : void
      {
         var _loc2_:* = null;
         try
         {
            if(Environment.platform.isWeb)
            {
               return;
            }
            _loc2_ = new UiLoadingScreen(false,param1);
            _loc2_.show(null,true);
            return;
         }
         catch(e:Error)
         {
            Logger.error("showInfo failed: " + e.message);
            return;
         }
      }
      
      override protected function addedToStageHandler(param1:Event) : void
      {
         stage.color = 0;
         if(Environment.layout.allowResize)
         {
            stage.align = "TL";
         }
         super.addedToStageHandler(param1);
         Environment.taskManager = Runtime.newInstance(Environment._config.taskManagerClass,[root.loaderInfo.bytes,ApplicationTaskHandler]);
         _loadingScreen.refreshLayout();
      }
      
      override protected function initPlatform() : void
      {
         JsonActionRemoteRequest.clientVersion = ApplicationConfig.clientVersionString;
      }
      
      override public function setAppSize(param1:int, param2:int) : void
      {
         super.setAppSize(param1,param2);
         if(ViewManager.instance)
         {
            ViewManager.instance.refreshAppSize();
         }
      }
      
      protected function get locTextLocation() : IAssetLocation
      {
         return new LocTextAssetLocation(Environment.info.isTestMode);
      }
      
      protected function get constantsLocation() : IAssetLocation
      {
         return new ConstantsAssetLocation(Environment.info.isTestMode);
      }
      
      protected function get spineDefinitionLocation() : IAssetLocation
      {
         throw new Error("to implement");
      }
      
      protected function get textureLocation() : IAssetLocation
      {
         throw new Error("to implement");
      }
      
      protected function get locTextCacheFile() : ICacheFile
      {
         return null;
      }
      
      protected function get constantsCacheFile() : ICacheFile
      {
         return null;
      }
      
      override protected function setupPlatformAssetLoaders() : void
      {
         var _loc1_:LocTextLoader = new LocTextLoader(locTextCacheFile);
         _loc1_.addAssetLocation(locTextLocation);
         Environment.assetManager.addLoader(AssetType.LOC_TEXT,_loc1_);
         var _loc3_:ConstantsLoader = new ConstantsLoader(constantsCacheFile);
         _loc3_.addAssetLocation(constantsLocation);
         Environment.assetManager.addLoader(AssetType.CONSTANTS,_loc3_);
         var _loc2_:IAssetLoader = Environment.assetManager.getLoader(AssetType.SPINE_DEFINITION);
         _loc2_.addAssetLocation(spineDefinitionLocation);
         hideLaunchScreen();
         loadAssets();
      }
      
      protected function loadAssets() : void
      {
         onSpineLoaded = function():void
         {
            Environment.application.initUi();
            Environment.application.start(onLoadProgress);
            Environment.display.displayContext.nativeStage.addChild(_loadingScreen.content);
         };
         onTexturesLoaded = function():void
         {
            spineLoader.load(null,onSpineLoaded);
         };
         var textureLoader:IAssetLoader = Environment.assetManager.getLoader(AssetType.TEXTURE);
         var spineLoader:IAssetLoader = Environment.assetManager.getLoader(AssetType.SPINE_DEFINITION);
         var _loc3_:int = 0;
         var _loc2_:* = AssetListCommon.SPINE_DEFINITIONS;
         for each(spineDefinitionData in AssetListCommon.SPINE_DEFINITIONS)
         {
            spineLoader.enqueue(new AssetDefinition(spineDefinitionData.identifier,spineDefinitionData));
         }
         textureLoader.load(null,onTexturesLoaded);
      }
      
      protected function onLoadProgress(param1:Number) : void
      {
         if(param1 == 1 && _loadingScreen.content.visible)
         {
            _loadingScreen.fadeOut(onPreloadComplete);
         }
      }
      
      protected function onPreloadComplete() : void
      {
         _loadingScreen.hide(Environment.display.displayContext.nativeStage);
         _loadingScreen.content.visible = false;
      }
   }
}
