package com.playata.application
{
   import com.playata.application.data.application.ApplicationOptions;
   import com.playata.application.data.character.CharacterSelectionEntry;
   import com.playata.application.data.item_pattern.ItemPatterns;
   import com.playata.application.data.optical_changes.OpticalChanges;
   import com.playata.application.data.resource.ResourceFeature;
   import com.playata.application.data.user.User;
   import com.playata.application.messaging.Message;
   import com.playata.application.messaging.MessageRouter;
   import com.playata.application.module.AppAdvertismentModule;
   import com.playata.application.module.AppAutoLogoutModule;
   import com.playata.application.module.AppMainGameModule;
   import com.playata.application.module.AppTrackingModule;
   import com.playata.application.module.AppUIModule;
   import com.playata.application.platform.ServerInfo;
   import com.playata.application.request.AppRequestResponseData;
   import com.playata.application.request.ApplicationRequest;
   import com.playata.application.request.ApplicationSocketHandler;
   import com.playata.application.request.UserActionRequest;
   import com.playata.application.ui.ViewManager;
   import com.playata.application.ui.elements.action_bar.ActionBarLayer;
   import com.playata.application.ui.elements.application.UiInfoMessage;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.application.ui.elements.generic.dialog.UiInfoDialog;
   import com.playata.application.util.MultiClientChecker;
   import com.playata.framework.abtest.ABTests;
   import com.playata.framework.advertisement.AdvertisementCore;
   import com.playata.framework.application.ApplicationConfig;
   import com.playata.framework.application.ApplicationSession;
   import com.playata.framework.application.Environment;
   import com.playata.framework.application.IApplicationBase;
   import com.playata.framework.application.IApplicationSessionHandler;
   import com.playata.framework.application.request.ActionRequestResponse;
   import com.playata.framework.assets.AssetType;
   import com.playata.framework.assets.IAssetLoader;
   import com.playata.framework.assets.definition.AssetDefinition;
   import com.playata.framework.core.Core;
   import com.playata.framework.core.TypedObject;
   import com.playata.framework.core.logging.Logger;
   import com.playata.framework.core.signal.Signal;
   import com.playata.framework.core.util.StringUtil;
   import com.playata.framework.core.util.TimeUtil;
   import com.playata.framework.data.constants.Constants;
   import com.playata.framework.data.constants.ConstantsAssetDefinitionData;
   import com.playata.framework.display.ui.panels.PanelManager;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import com.playata.framework.localization.Locale;
   import com.playata.framework.localization.assets.LocTextAssetDefinitionData;
   import com.playata.framework.metric.MetricCore;
   import com.playata.framework.network.NetworkCore;
   import com.playata.framework.network.request.RequestData;
   import com.playata.framework.platform.PlatformConfig;
   
   public class Application implements IApplicationSessionHandler, IApplicationBase
   {
      
      protected static var _lastInteractionActivityTimestamp:int = 0;
      
      protected static var _onInteraction:Signal = null;
      
      protected static var _registrationBlocked:Boolean = false;
      
      protected static var _redirectUrl:String = "";
      
      public static var userController:AppUserController = null;
       
      
      protected var _isActive:Boolean = true;
      
      protected var _panelManager:PanelManager;
      
      protected var _appSession:ApplicationSession;
      
      protected var _metrics:MetricCore;
      
      protected var _advertisment:AdvertisementCore;
      
      protected var _abTests:ABTests;
      
      protected var _ui:AppUIModule = null;
      
      protected var _mainGame:AppMainGameModule = null;
      
      protected var _appAdvertisment:AppAdvertismentModule = null;
      
      protected var _autoLogout:AppAutoLogoutModule = null;
      
      protected var _tracking:AppTrackingModule = null;
      
      protected var _multiClientChecker:MultiClientChecker = null;
      
      public function Application()
      {
         super();
         _appSession = new ApplicationSession(this);
         userController.application = this;
         _ui = new AppUIModule(this);
         _mainGame = new AppMainGameModule(this);
         _appAdvertisment = new AppAdvertismentModule(this);
         _autoLogout = new AppAutoLogoutModule(this);
         _tracking = new AppTrackingModule(this);
         resetLastInteractionActivityTimestamp();
         UiButton.onClickGlobal = onClickButtonGlobal;
      }
      
      public static function get tracking() : AppTrackingModule
      {
         if(!Environment.application)
         {
            return null;
         }
         return (Environment.application as Application)._tracking;
      }
      
      public static function get lastInteractionActivityTimestamp() : int
      {
         return _lastInteractionActivityTimestamp;
      }
      
      public static function resetLastInteractionActivityTimestamp() : void
      {
         _lastInteractionActivityTimestamp = TimeUtil.now;
      }
      
      public static function get onInteraction() : Signal
      {
         if(_onInteraction === null)
         {
            _onInteraction = new Signal();
         }
         return _onInteraction;
      }
      
      public static function get redirectUrl() : String
      {
         return _redirectUrl;
      }
      
      public static function set redirectUrl(param1:String) : void
      {
         _redirectUrl = param1;
      }
      
      public static function set setRegistrationBlocked(param1:Boolean) : void
      {
         _registrationBlocked = param1;
      }
      
      public static function get isRegistrationBlocked() : Boolean
      {
         return _registrationBlocked || AppConfig.blockRegistration;
      }
      
      public static function reloadApplication() : void
      {
         Environment.platform.reload();
      }
      
      public static function stopCommunication() : void
      {
         try
         {
            ViewManager.instance.baseUserPanel.stopSyncGame();
            NetworkCore.current.serverConnection.disconnect();
            NetworkCore.current.serverConnection.socketTransportLayer.enabled = false;
            return;
         }
         catch(e:Error)
         {
            return;
         }
      }
      
      public function dispose() : void
      {
         Logger.debug("[Application] Destroying...");
         _autoLogout.dispose();
         _ui.dispose();
         _mainGame.dispose();
         MessageRouter.removeAllListeners(handleMessages);
      }
      
      public function initUi() : void
      {
         Logger.info("[Application] Initializing UI");
         new ActionBarLayer(Environment.display.displayContext.stage);
         _panelManager = new PanelManager();
         Environment.panelManager = _panelManager;
      }
      
      public function start(param1:Function) : void
      {
         Logger.info("[Application] Starting App");
         _panelManager.loadProgressCallback = param1;
         initGame();
      }
      
      public function initApplication() : void
      {
         Logger.info("[Application] Initializing Application");
         _metrics = new MetricCore();
         _advertisment = new AdvertisementCore();
         _abTests = new ABTests();
         session.start();
      }
      
      public function initGame(param1:ApplicationOptions = null) : void
      {
         options = param1;
         Logger.debug("[Application] Initializing Game...");
         MessageRouter.addListener("ApplicationMessage.notifyCreateCharacterComplete",handleMessages);
         MessageRouter.addListener("ApplicationMessage.updateUserAndCharacter",handleMessages);
         if(options && options.additionalSSOLoginParams)
         {
            userController.additionalSSOLoginParams = options.additionalSSOLoginParams;
         }
         _mainGame.onInit(options);
         _ui.onInit(options);
         _appAdvertisment.onInit(options);
         _autoLogout.onInit(options);
         Logger.debug("[Application] Loading locale...");
         var onLocaleLoaded:Function = function():void
         {
            Environment.panelManager.unlockApplication();
            var _loc1_:RequestData = new RequestData({"no_text":true});
            _loc1_.setString("locale_version",AppConfig.localeVersion);
            _loc1_.setString("locale",Environment.info.defaultLocale);
            _loc1_.setString("swf_main_hash",getHashFromUrl(AppConfig.urlSwfMain));
            _loc1_.setString("swf_character_hash",getHashFromUrl(AppConfig.urlSwfCharacter));
            _loc1_.setString("swf_ui_hash",getHashFromUrl(AppConfig.urlSwfUi));
            _loc1_.setString("swf_movie_cover_hash",getHashFromUrl(AppConfig.urlSwfMovieCover));
            Environment.application.sendActionRequest("initGame",_loc1_,handleRequestResponse);
         };
         var onConstantsLoaded:Function = function():void
         {
            loadLocale(currentLocale,onLocaleLoaded);
         };
         Environment.panelManager.lockApplication();
         var constantsLoader:IAssetLoader = Environment.assetManager.getLoader(AssetType.CONSTANTS);
         constantsLoader.enqueue(new AssetDefinition("constants",new ConstantsAssetDefinitionData(AppConfig.constantsVersion + ApplicationConfig.clientVersion,"amf3")),true);
         constantsLoader.load(null,onConstantsLoaded);
      }
      
      public function sendActionRequest(param1:String, param2:Object, param3:Function, param4:Boolean = true, param5:Boolean = false) : void
      {
         action = param1;
         data = param2;
         callback = param3;
         lockApplication = param4;
         instant = param5;
         if(lockApplication)
         {
            new ApplicationRequest(action,data,function(param1:String, param2:RequestData, param3:Object, param4:String):void
            {
               var _loc5_:* = null;
               if(callback != null)
               {
                  _loc5_ = new ActionRequestResponse();
                  _loc5_.action = param1;
                  _loc5_.request = param2;
                  _loc5_.data = param3;
                  _loc5_.error = param4;
                  callback(_loc5_);
               }
            });
         }
         else
         {
            new UserActionRequest(action,data,function(param1:String, param2:RequestData, param3:Object, param4:String):void
            {
               var _loc5_:* = null;
               if(callback != null)
               {
                  _loc5_ = new ActionRequestResponse();
                  _loc5_.action = param1;
                  _loc5_.request = param2;
                  _loc5_.data = param3;
                  _loc5_.error = param4;
                  callback(_loc5_);
               }
            },instant);
         }
      }
      
      public function get infoMessage() : UiInfoMessage
      {
         return _ui.infoMessage;
      }
      
      public function set currentLocale(param1:Locale) : void
      {
      }
      
      public function get currentLocale() : Locale
      {
         return new Locale(Environment.info.defaultLocale,AppConfig.localeVersion);
      }
      
      public function get session() : ApplicationSession
      {
         return _appSession;
      }
      
      public function get metrics() : MetricCore
      {
         return _metrics;
      }
      
      public function get advertisment() : AdvertisementCore
      {
         return _advertisment;
      }
      
      public function get abTests() : ABTests
      {
         return _abTests;
      }
      
      public function updateData(param1:Object) : void
      {
         MessageRouter.dispatch(new Message("ApplicationMessage.updateUserAndCharacter",param1,null));
      }
      
      public function loadLocale(param1:Locale, param2:Function) : void
      {
         var _loc3_:IAssetLoader = Environment.assetManager.getLoader(AssetType.LOC_TEXT);
         _loc3_.enqueue(new AssetDefinition(param1.locale,new LocTextAssetDefinitionData(param1,"json")),true);
         _loc3_.load(null,param2);
      }
      
      public function showServerFullDialog() : void
      {
         if(!AppEnvironment.appPlatform.isSSO)
         {
            Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("error/server_full/title"),LocText.current.text("error/server_full/text"),LocText.current.text("general/button_ok")));
         }
         else
         {
            Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("error/server_full/title"),LocText.current.text("error/server_full/text"),LocText.current.text("general/button_ok"),onServerFullConfirm));
         }
      }
      
      public function get isActive() : Boolean
      {
         return _isActive;
      }
      
      public function onActivate(param1:int) : void
      {
         _isActive = true;
         session.start(Math.ceil(param1 / 1000));
      }
      
      public function onDeactivate() : void
      {
         _isActive = false;
         session.stop();
      }
      
      public function onNewSession() : void
      {
      }
      
      public function onRenewSession(param1:int, param2:int) : void
      {
      }
      
      public function onContinueSession() : void
      {
      }
      
      public function onStopSession(param1:int) : void
      {
      }
      
      public function onRegister(param1:Object) : void
      {
         refreshData(param1);
      }
      
      public function onUserAssigned() : void
      {
         _mainGame.onUserAssigned();
         _ui.onUserAssigned();
      }
      
      public function onUserUnassigned() : void
      {
      }
      
      public function onLoginComplete() : void
      {
         _ui.onAppReady();
      }
      
      public function onLogin(param1:Object, param2:Boolean) : void
      {
         var _loc5_:* = null;
         var _loc4_:* = null;
         var _loc3_:AppRequestResponseData = new AppRequestResponseData(param1);
         if(param2 && _loc3_.hasData("text",true))
         {
            LocText.current.setData(_loc3_.text,Environment.info.defaultLocale);
            ViewManager.instance.refreshPanelLocalization();
         }
         resetLastInteractionActivityTimestamp();
         _mainGame.onUserLogin(_loc3_);
         _appAdvertisment.onUserLogin(_loc3_);
         if(_loc3_.hasData("character"))
         {
            refreshData(param1);
         }
         _multiClientChecker = new MultiClientChecker("pstar_" + ServerInfo.serverId,_loc3_.user.id,onDuplicateClientActive);
         _tracking.onUserLogin(_loc3_);
         _autoLogout.onUserLogin(_loc3_);
         _ui.onUserLogin(_loc3_);
         NetworkCore.current.serverConnection.socketTransportLayer.enabled = true;
         ItemPatterns.instance.sortPattern();
         OpticalChanges.instance.resetNewOpticalChangeCategories();
         if(Environment.platform.isKongregate && !Environment.info.isTestMode)
         {
            _loc5_ = PlatformConfig.kongregateUserId;
            _loc4_ = PlatformConfig.kongregateGameAuthToken;
            Environment.application.sendActionRequest("useKongregatePaymentItem",{
               "kongregate_user_id":_loc5_,
               "kongregate_game_auth_token":_loc4_
            },null,false);
         }
         User.current.registerNotificationDevice();
      }
      
      public function onLogout() : void
      {
         if(_multiClientChecker)
         {
            _multiClientChecker.dispose();
            _multiClientChecker = null;
         }
         Environment.billing.resetProducts();
         _tracking.onUserLogout();
         _ui.onUserLogout();
         _appAdvertisment.onUserLogout();
         NetworkCore.current.serverConnection.disconnect();
         NetworkCore.current.serverConnection.socketTransportLayer.enabled = false;
      }
      
      public function onServerSelectionChange(param1:String, param2:String) : void
      {
         if(!_redirectUrl)
         {
            return;
         }
         var _loc3_:String = _redirectUrl;
         _loc3_ = StringUtil.replace(_loc3_,"<serverid>",param2);
         AppEnvironment.appPlatform.redirectServer(_loc3_);
      }
      
      public function onCharacterSelectionChange(param1:String, param2:String, param3:CharacterSelectionEntry = null) : void
      {
         if(!_redirectUrl)
         {
            return;
         }
         var _loc4_:String = _redirectUrl;
         _loc4_ = StringUtil.replace(_loc4_,"<serverid>",param2);
         AppEnvironment.appPlatform.redirectServer(_loc4_);
      }
      
      public function createResourceRequest(param1:String) : void
      {
         Environment.application.sendActionRequest("createResourceRequest",{"resource_request":param1},handleRequestResponse);
      }
      
      private function onClickButtonGlobal(param1:InteractionEvent) : void
      {
         resetLastInteractionActivityTimestamp();
         _onInteraction.dispatch();
      }
      
      private function onAutoLoginSuccess() : void
      {
      }
      
      private function onAutoLoginFail() : void
      {
         ViewManager.instance.showPanel("create_character");
      }
      
      private function onDuplicateClientActive() : void
      {
         stopCommunication();
         Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/session_expired/title"),LocText.current.text("dialog/session_expired/text"),LocText.current.text("general/button_reload"),reloadApplication));
         AppEnvironment.showReloadInfo();
      }
      
      private function refreshText(param1:Object) : void
      {
         if(LocText.current == null)
         {
            LocText.current = new LocText(new TypedObject(param1),Environment.info.defaultLocale);
         }
         else
         {
            LocText.current.setData(new TypedObject(param1),Environment.info.defaultLocale);
         }
      }
      
      private function onServerFullConfirm() : void
      {
         reloadApplication();
         AppEnvironment.showReloadInfo();
      }
      
      private function refreshData(param1:Object) : void
      {
         if(param1 === null)
         {
            return;
         }
         var _loc2_:TypedObject = new TypedObject(param1);
         if(_loc2_.hasData("server_timestamp_offset",true))
         {
            TimeUtil.serverTimestampOffset = param1.server_timestamp_offset;
         }
         if(_loc2_.hasData("text",true))
         {
            refreshText(param1.text);
         }
         if(_loc2_.hasData("locale_version",true))
         {
            Core.config.extend(new TypedObject({"localeVersion":_loc2_.getString("locale_version")}),true);
         }
         userController.updateData(new TypedObject(param1));
         _mainGame.onRefreshData(param1);
         _ui.onRefreshData(param1);
         _mainGame.onAfterRefreshData(param1);
      }
      
      private function getHashFromUrl(param1:String) : String
      {
         if(!param1)
         {
            return "";
         }
         if(param1.indexOf("?") === -1)
         {
            return "";
         }
         return param1.substr(param1.indexOf("?") + 1);
      }
      
      private function handleRequestResponse(param1:ActionRequestResponse) : void
      {
         response = param1;
         Logger.debug("[Application] Handling request response for: " + response.action);
         var _loc3_:* = response.action;
         switch(_loc3_)
         {
            case "initGame":
               if(response.error == "")
               {
                  if(Constants.current)
                  {
                     Constants.current.setData(response.appResponse.constants);
                  }
                  else
                  {
                     Constants.current = new Constants(response.appResponse.constants);
                  }
                  Core.config.extend(response.appResponse.extendedConfig);
                  NetworkCore.current.serverConnection.socketHandler = new ApplicationSocketHandler();
                  ServerInfo.setDefaultServerSelectionData(response.data.server_selection_data);
                  ServerInfo.setLeaderboardServerSelectionData(response.data.leaderboard_server_selection_data);
                  _mainGame.onInitGame();
                  refreshData(response.data);
                  _ui.completeInitialization();
                  userController.autoLoginUser(onAutoLoginSuccess,onAutoLoginFail);
               }
               else if(response.error == "errRequestMaintenance" || response.error == "errRequestOutdatedClientVersion")
               {
                  reloadApplication();
                  AppEnvironment.showMaintenanceInfo();
               }
               else if(response.error == "errInvalidLocaleVersion" || response.error == "errInvalidSwfHash")
               {
                  Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/invalid_client_version/title"),!!LocText.current.hasText("dialog/invalid_client_version/force_text")?LocText.current.text("dialog/invalid_client_version/force_text"):LocText.current.text("dialog/invalid_client_version/text"),LocText.current.text("general/button_ok")));
                  Environment.reportError(response.error,response.request,false,true);
               }
               else
               {
                  var errorTitle:String = "Oops..";
                  var errorMessage:String = "Application Error! Application failed to initialized: " + response.error;
                  var errorButton:String = "Reload";
                  Environment.panelManager.showDialog(new UiInfoDialog(errorTitle,errorMessage,errorButton,function():void
                  {
                     reloadApplication();
                  }));
                  AppEnvironment.showReloadInfo();
               }
               break;
            case "createResourceRequest":
               if(response.error == "")
               {
                  var resourceRequest:String = response.request.getString("resource_request");
                  var resourceFeatureType:int = parseInt(resourceRequest.substr(resourceRequest.lastIndexOf("_") + 1));
                  var resourceFeature:ResourceFeature = new ResourceFeature(resourceFeatureType);
                  Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/accept_resource_request/title"),resourceFeature.resourceRequestAcceptedMessage(response.appResponse.from_character_name),LocText.current.text("general/button_ok")));
               }
               else
               {
                  var toName:String = null;
                  if(response.error == "errCreateSelfResourceRequest")
                  {
                     Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/accept_resource_request/title"),LocText.current.text("dialog/accept_resource_request/message_no_self_accept",User.current.character.name),LocText.current.text("general/button_ok")));
                  }
                  else if(response.error.indexOf("errCreatePendingResourceRequest_") != -1)
                  {
                     toName = response.error.substr("errCreatePendingResourceRequest_".length);
                     Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/accept_resource_request/title"),LocText.current.text("dialog/accept_resource_request/message_old_request_pending",User.current.character.name,toName),LocText.current.text("general/button_ok")));
                  }
                  else if(response.error.indexOf("errCreateAlreadyAcceptedResourceRequest_") != -1)
                  {
                     toName = response.error.substr("errCreateAlreadyAcceptedResourceRequest_".length);
                     Environment.panelManager.showDialog(new UiInfoDialog(LocText.current.text("dialog/accept_resource_request/title"),LocText.current.text("dialog/accept_resource_request/message_today_already_accepted",User.current.character.name,toName),LocText.current.text("general/button_ok")));
                  }
                  else if(response.error != "errInvalidArguments")
                  {
                     if(response.error != "errAcceptInvalidStatus")
                     {
                        Environment.reportError(response.error,response.request,false,true);
                     }
                  }
               }
               break;
            default:
               throw new Error("Failure handling response to action \'" + response.action + "\'. Action not supported");
         }
      }
      
      private function handleMessages(param1:Message) : void
      {
         var _loc2_:* = param1.type;
         switch(_loc2_)
         {
            case "ApplicationMessage.notifyCreateCharacterComplete":
               refreshData(param1.data);
               _ui.friendBar.login(User.current.id,User.current.sessionId);
               ItemPatterns.instance.sortPattern();
               break;
            case "ApplicationMessage.updateUserAndCharacter":
               refreshData(param1.data);
               break;
            default:
               throw new Error("Encountered unknown message type! type=" + param1.type);
         }
      }
   }
}
