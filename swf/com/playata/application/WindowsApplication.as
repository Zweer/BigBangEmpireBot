package com.playata.application
{
   import com.playata.application.data.application.ApplicationOptions;
   import com.playata.application.data.character.CharacterSelectionEntry;
   import com.playata.application.platform.PlatformData;
   import com.playata.application.platform.ServerInfo;
   import com.playata.application.ui.ViewManager;
   import com.playata.framework.application.Environment;
   import com.playata.framework.core.Core;
   import com.playata.framework.core.TypedObject;
   import com.playata.framework.core.cache.Cache;
   import com.playata.framework.core.io.FileSystem;
   import com.playata.framework.core.logging.Logger;
   import com.playata.framework.display.ui.TooltipLayer;
   import com.playata.framework.platform.PlatformConfig;
   import flash.geom.Rectangle;
   
   public class WindowsApplication extends Application
   {
       
      
      private var _currentLocale:String = null;
      
      private var _pendingLoginCharacter:CharacterSelectionEntry = null;
      
      public function WindowsApplication()
      {
         super();
      }
      
      override public function start(param1:Function) : void
      {
         _currentLocale = Core.config.getString("default_locale");
         Logger.info("[Application] Starting App");
         var _loc2_:ApplicationOptions = new ApplicationOptions();
         _loc2_.dontCacheSounds = true;
         _loc2_.defaultSoundStreamUrl = "file://" + FileSystem.applicationStorageDirectory.fullPath + "/assets/sounds/";
         initGame(_loc2_);
         _panelManager.loadProgressCallback = param1;
         TooltipLayer.instance.validTooltipArea = new Rectangle(0,0,Environment.layout.appDefaultWidth,Environment.layout.appDefaultHeight);
      }
      
      override public function onServerSelectionChange(param1:String, param2:String) : void
      {
         Environment.panelManager.lockApplication();
         PlatformData.setPlatformData("windows",param1,param2,onServerSelectionSet);
      }
      
      override public function onCharacterSelectionChange(param1:String, param2:String, param3:CharacterSelectionEntry = null) : void
      {
         locale = param1;
         serverId = param2;
         characterEntry = param3;
         _pendingLoginCharacter = characterEntry;
         _ui.closeCurtain(function():void
         {
            var onLoggedOut:Function = function():void
            {
               Environment.panelManager.lockApplication();
               PlatformData.setPlatformData("windows",locale,serverId,onCharacterSelectionSet);
            };
            Application.userController.logoutUser(onLoggedOut);
         });
      }
      
      private function onServerSelectionSet(param1:Boolean) : void
      {
         success = param1;
         var cacheKey:String = "pstar_platform_data_windows";
         Cache.setData(cacheKey,new TypedObject({"server_id":ServerInfo.serverId}));
         var onLocaleLoaded:Function = function():void
         {
            ViewManager.instance.refreshPanelLocalization();
            _currentLocale = Environment.info.defaultLocale;
            Environment.panelManager.unlockApplication();
         };
         if(_currentLocale != Environment.info.defaultLocale)
         {
            loadLocale(currentLocale,onLocaleLoaded);
         }
         else
         {
            Environment.panelManager.unlockApplication();
         }
      }
      
      private function onCharacterSelectionSet(param1:Boolean) : void
      {
         success = param1;
         var cacheKey:String = "pstar_platform_data_windows";
         Cache.setData(cacheKey,new TypedObject({"server_id":ServerInfo.serverId}));
         var onLocaleLoaded:Function = function():void
         {
            ViewManager.instance.refreshPanelLocalization();
            _currentLocale = Environment.info.defaultLocale;
            Environment.panelManager.unlockApplication();
            loginPendingCharacter();
         };
         if(_currentLocale != Environment.info.defaultLocale)
         {
            loadLocale(currentLocale,onLocaleLoaded);
         }
         else
         {
            Environment.panelManager.unlockApplication();
            loginPendingCharacter();
         }
      }
      
      private function loginPendingCharacter() : void
      {
         var _loc1_:* = null;
         if(_pendingLoginCharacter)
         {
            if(_pendingLoginCharacter.isEmailAccount)
            {
               Application.userController.loginUserEmail(_pendingLoginCharacter.email,_pendingLoginCharacter.password);
            }
            else
            {
               _loc1_ = _pendingLoginCharacter.platformUserId;
               if(_pendingLoginCharacter.isMobileAccount)
               {
                  _loc1_ = Environment.deviceInfo.uniqueId;
               }
               Application.userController.loginUserSSO(false,_pendingLoginCharacter.platform,_loc1_);
            }
            _pendingLoginCharacter = null;
            return;
         }
         Application.userController.loginUserSSO(false,AppEnvironment.appPlatform.id,PlatformConfig.ssoInfo);
      }
   }
}
