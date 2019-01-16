package com.playata.application.module
{
   import com.playata.application.AppConfig;
   import com.playata.application.AppContextMenu;
   import com.playata.application.AppEnvironment;
   import com.playata.application.AppLayout;
   import com.playata.application.Application;
   import com.playata.application.data.application.ApplicationOptions;
   import com.playata.application.data.goal.ClientGoalUtil;
   import com.playata.application.main.FriendBar;
   import com.playata.application.request.AppRequestResponseData;
   import com.playata.application.ui.ViewManager;
   import com.playata.application.ui.dialogs.DialogRedeemVoucher;
   import com.playata.application.ui.dialogs.DialogUpdatedPP;
   import com.playata.application.ui.dialogs.DialogUpdatedToS;
   import com.playata.application.ui.effects.EffectsLayer;
   import com.playata.application.ui.effects.flash.FlashEffectsLayer;
   import com.playata.application.ui.elements.application.Curtain;
   import com.playata.application.ui.elements.application.UiBlocker;
   import com.playata.application.ui.elements.application.UiInfoMessage;
   import com.playata.application.ui.elements.avatar.PreviewAvatar;
   import com.playata.application.ui.elements.debug.UiDebugPanel;
   import com.playata.application.ui.elements.generic.dialog.UiTwoChoiceDialog;
   import com.playata.application.ui.panels.PanelCreateCharacter;
   import com.playata.framework.application.Environment;
   import com.playata.framework.core.Core;
   import com.playata.framework.core.Runtime;
   import com.playata.framework.core.logging.Logger;
   import com.playata.framework.display.DisplayObjectFactory;
   import com.playata.framework.display.IDisplayObject;
   import com.playata.framework.display.layout.LayoutUtil;
   import com.playata.framework.localization.LocText;
   import flash.display.InteractiveObject;
   import flash.geom.Rectangle;
   import visuals.ui.base.SymbolApplicationGeneric;
   import visuals.ui.elements.debug.SymbolDebugPanelGeneric;
   
   public class AppUIModule extends AppModuleBase
   {
       
      
      private var _applicationVO:SymbolApplicationGeneric = null;
      
      private var _viewManager:ViewManager = null;
      
      private var _friendBar:FriendBar = null;
      
      private var _clientGoalUtil:ClientGoalUtil;
      
      private var _curtain:Curtain = null;
      
      private var _debugPanel:UiDebugPanel = null;
      
      private var _infoMessage:UiInfoMessage = null;
      
      private var _effects:EffectsLayer;
      
      public function AppUIModule(param1:Application)
      {
         super(param1);
      }
      
      override public function dispose() : void
      {
         _viewManager.dispose();
         _viewManager = null;
         if(_debugPanel)
         {
            _debugPanel.dispose();
            _debugPanel = null;
         }
         if(_infoMessage)
         {
            _infoMessage.dispose();
            _infoMessage = null;
         }
         _friendBar.dispose();
         _applicationVO.removeChild(_curtain.content);
         _curtain = null;
         Environment.display.displayContext.stage.removeChild(_applicationVO);
         _applicationVO = null;
      }
      
      public function get infoMessage() : UiInfoMessage
      {
         return _infoMessage;
      }
      
      public function get friendBar() : FriendBar
      {
         return _friendBar;
      }
      
      public function closeCurtain(param1:Function) : void
      {
         _curtain.close(param1);
      }
      
      public function onAppReady() : void
      {
         if(_viewManager.activePanel == "create_character" && platform.showIngameServerSelection)
         {
            (_viewManager.activePanelInstance as PanelCreateCharacter).serverSelection.setToCurrentServer();
         }
         if(Environment.panelManager.loadProgressCallback != null)
         {
            Environment.panelManager.loadProgressCallback(1);
         }
         _curtain.open();
      }
      
      public function completeInitialization() : void
      {
         var _loc2_:* = null;
         if(_viewManager)
         {
            return;
         }
         _viewManager = new ViewManager(_applicationVO,null);
         var _loc1_:Boolean = Environment.info.isTestMode;
         if(_loc1_)
         {
            _loc2_ = new SymbolDebugPanelGeneric();
            _debugPanel = new UiDebugPanel(_loc2_);
            Environment.display.displayContext.stage.addChild(_loc2_);
         }
         _infoMessage = new UiInfoMessage(_applicationVO.infoMessage,Environment.info.isTouchScreen);
         new AppContextMenu(_applicationVO.nativeInstance as InteractiveObject);
         if(Environment.info.isNativeMobile)
         {
            _applicationVO.panels.friendbar.bringToTop();
         }
         _friendBar = new FriendBar(_applicationVO.panels.friendbar);
         AppEnvironment.friendBar = _friendBar;
         PreviewAvatar.hidePantiesAllowed = AppEnvironment.appPlatform.isHidePantiesAllowed;
         PreviewAvatar.hideBraAllowed = AppEnvironment.appPlatform.isHideBraAllowed;
      }
      
      override public function onInit(param1:ApplicationOptions = null) : void
      {
         var _loc3_:int = 0;
         var _loc4_:* = null;
         var _loc2_:* = null;
         Logger.debug("[AppUIModule] Instantiating main application vo...");
         _applicationVO = new SymbolApplicationGeneric();
         _applicationVO.syncInstances();
         Logger.debug("[AppUIModule] Removing unused panels...");
         _applicationVO.panels.removeChildByName("panelCharacter");
         _applicationVO.panels.removeChildByName("panelCharacterAppearance");
         _applicationVO.panels.removeChildByName("panelCharacterAppearancePhotographer");
         _applicationVO.panels.removeChildByName("panelCreateCharacter");
         _applicationVO.panels.removeChildByName("panelQuestProgress");
         _applicationVO.panels.removeChildByName("panelQuests");
         _applicationVO.panels.removeChildByName("panelCitymap");
         _applicationVO.panels.removeChildByName("panelBattle");
         _applicationVO.panels.removeChildByName("panelStatQuest");
         _applicationVO.panels.removeChildByName("panelDuels");
         _applicationVO.panels.removeChildByName("panelShop");
         _applicationVO.panels.removeChildByName("panelWorkNew");
         _applicationVO.panels.removeChildByName("panelMovieOffers");
         _applicationVO.panels.removeChildByName("panelMovieProgress");
         _applicationVO.panels.removeChildByName("panelGuild");
         _applicationVO.panels.removeChildByName("panelDungeon");
         _applicationVO.panels.removeChildByName("panelSlotMachine");
         _applicationVO.panels.removeChildByName("panelSlotMachine");
         _loc3_ = 0;
         while(_loc3_ < _applicationVO.panels.numChildren)
         {
            _loc4_ = _applicationVO.panels.getChildAt(_loc3_);
            if(_loc4_.name.indexOf("panel") >= 0)
            {
               _loc4_.visible = false;
            }
            _loc3_++;
         }
         Logger.debug("[AppUIModule] Adding main application vo to stage...");
         Environment.display.displayContext.stage.addChild(_applicationVO);
         _applicationVO.infoMessage.visible = false;
         Logger.debug("[AppUIModule] Creating curtain...");
         _curtain = new Curtain(_applicationVO.curtain);
         _applicationVO.curtainLayer.addChild(_curtain.content);
         Logger.debug("[AppUIModule] Creating effects layer...");
         _effects = new FlashEffectsLayer();
         Environment.display.displayContext.stage.addChild(_effects.genericLayer);
         if(Environment.layout.allowResize)
         {
            _loc2_ = LayoutUtil.deviceAdjustedAppSize;
            _applicationVO.curtain.background.width = _loc2_.width;
            _applicationVO.curtain.background.height = _loc2_.height;
            _applicationVO.blockerLayer.width = _loc2_.width;
            _applicationVO.blockerLayer.height = _loc2_.height + AppLayout.friendbarCorrection;
            _applicationVO.blockerLayer.blockIndicator.y = _applicationVO.blockerLayer.blockIndicator.y + (LayoutUtil.deviceAdjustedHeightCorrection + AppLayout.friendbarCorrection);
            _applicationVO.blockerLayer.blockBackground.y = _applicationVO.blockerLayer.blockBackground.y + (LayoutUtil.deviceAdjustedHeightCorrection + AppLayout.friendbarCorrection);
         }
         Logger.debug("[AppUIModule] Init UI...");
         Environment.panelManager.init(new UiBlocker(_applicationVO.blockerLayer),DisplayObjectFactory.createQuadFromSettings({
            "x":0,
            "y":0,
            "width":Environment.layout.appWidth,
            "height":Environment.layout.appHeight,
            "color":0,
            "alpha":0.5
         }),null);
         _clientGoalUtil = new ClientGoalUtil(Environment.display.displayContext.nativeStage);
      }
      
      public function onUserAssigned() : void
      {
         if(Environment.platform.isStandalone)
         {
            if(!Application.userController.appUser.showFriendbar)
            {
               _friendBar.hide();
            }
         }
      }
      
      override public function onUserLogin(param1:AppRequestResponseData) : void
      {
         data = param1;
         try
         {
            if(Application.userController.user && Application.userController.appUser.showFriendbar)
            {
               _friendBar.login(Application.userController.user.id,Application.userController.user.sessionId);
            }
            if(Application.userController.appUser.hasPendingToSUpdate)
            {
               Environment.panelManager.showDialog(new DialogUpdatedToS());
            }
            if(Application.userController.appUser.hasPendingPPUpdate)
            {
               Environment.panelManager.showDialog(new DialogUpdatedPP());
            }
            if(Environment.info.isNativeMobile && !AppEnvironment.appPlatform.isNutaku)
            {
               if(Core.config.hasCfg("current_version_mobile"))
               {
                  var hasNewMobileVersion:Boolean = parseInt(Core.current.info.airDescriptorVersionNumber) < AppConfig.currentVersionMobile;
                  if(hasNewMobileVersion)
                  {
                     var downloadCallback:Function = function():void
                     {
                        platform.openLink(AppConfig.urlStorePlayata);
                     };
                     Environment.panelManager.showDialog(new UiTwoChoiceDialog(LocText.current.text("dialog/app_update_available/title"),LocText.current.text("dialog/app_update_available/text"),LocText.current.text("dialog/app_update_available/button_download"),LocText.current.text("dialog/app_update_available/button_later"),downloadCallback));
                  }
               }
            }
            if(Environment.startupParams && Environment.startupParams.indexOf("resource_request=") != -1)
            {
               var resourceRequest:String = Environment.startupParams;
               resourceRequest = resourceRequest.substring(resourceRequest.indexOf("resource_request=") + 17);
               Environment.clearStartupParams();
               if(resourceRequest.indexOf("_3_") != -1)
               {
                  var openMailboxDialog:Function = function():void
                  {
                     _viewManager.baseUserPanel.openMailboxDialog(true);
                  };
                  Runtime.delayFunction(openMailboxDialog,0.5);
               }
               else
               {
                  (Environment.application as Application).createResourceRequest(resourceRequest);
               }
            }
            else if(Environment.startupParams && Environment.startupParams == "voucher")
            {
               Environment.panelManager.showDialog(new DialogRedeemVoucher());
            }
            return;
         }
         catch(e:Error)
         {
            return;
         }
      }
      
      override public function onUserLogout() : void
      {
         if(_viewManager)
         {
            _viewManager.reset();
            _viewManager.setUser(null);
            platform.setPageTitle(LocText.current.text("general/common_title_bar"),_viewManager.titleBarPrefix);
            _viewManager.showPanel("create_character");
         }
         if(_friendBar)
         {
            _friendBar.logout();
         }
         Environment.panelManager.dialogManager.closeAllDialogs();
      }
      
      override public function onRefreshData(param1:Object) : void
      {
         if(_viewManager)
         {
            if(param1.user || param1.character)
            {
               _viewManager.setUser(Application.userController.appUser);
            }
            if(param1.user || param1.character || param1.inventory || param1.duel || param1.opponents || param1.quests || param1.quest || param1.items || param1.work)
            {
               _viewManager.refresh();
            }
         }
      }
   }
}
