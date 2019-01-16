package com.playata.framework.display.ui.panels
{
   import com.playata.framework.core.IDisposable;
   import com.playata.framework.core.collection.IntMap;
   import com.playata.framework.core.logging.Logger;
   import com.playata.framework.core.signal.ISignal;
   import com.playata.framework.core.signal.Signal;
   import com.playata.framework.display.DisplayCore;
   import com.playata.framework.display.DisplayCoreConfig;
   import com.playata.framework.display.IDisplayObject;
   import com.playata.framework.display.IDisplayObjectContainer;
   import com.playata.framework.display.ui.Align;
   import com.playata.framework.display.ui.DragDropManager;
   import com.playata.framework.display.ui.FocusManager;
   import com.playata.framework.display.ui.TooltipLayer;
   import com.playata.framework.display.ui.dialogs.Dialog;
   import com.playata.framework.display.ui.dialogs.DialogManager;
   import flash.system.System;
   
   public class PanelManager implements IDisposable
   {
       
      
      public var loadProgressCallback:Function;
      
      private var _panels:IntMap;
      
      private var _blocker:IDisplayObject;
      
      private var _loader:ILoaderPanel;
      
      private var _dialogManager:DialogManager;
      
      private var _focusManager:FocusManager;
      
      private var _dragDropManager:DragDropManager;
      
      private var _pendingPanelType:int;
      
      private var _currentPanelType:int;
      
      private var _currentPanel:IPanel;
      
      private var _payload;
      
      private var _onPanelShown:ISignal = null;
      
      public function PanelManager()
      {
         super();
         DisplayCore.panelManager = this;
      }
      
      public function dispose() : void
      {
      }
      
      public function init(param1:IDisplayObject, param2:IDisplayObject, param3:ILoaderPanel) : void
      {
         _panels = new IntMap();
         _onPanelShown = new Signal();
         _onPanelShown.addOnce(firstPanelShown);
         _dialogManager = new DialogManager();
         _dialogManager.init(root,param2);
         _focusManager = new FocusManager();
         _dragDropManager = new DragDropManager();
         var _loc4_:TooltipLayer = new TooltipLayer(root);
         _blocker = param1;
         root.addChild(_blocker);
         _blocker.visible = false;
         if(_loader != null)
         {
            _loader = param3;
            root.addChild(_loader.ui);
         }
         _blocker.align(Align.TOP,Align.LEFT);
         if(_loader != null)
         {
            _loader.ui.align(Align.TOP,Align.LEFT);
         }
         Logger.info("[Panel Manager] initialized");
      }
      
      public function createPanel(param1:int, param2:Class) : void
      {
         var _loc3_:PanelBase = new param2();
         _loc3_.refreshAppSize();
         _panels.setData(param1,_loc3_);
         System.pauseForGCIfCollectionImminent(0);
         System.gc();
      }
      
      public function showPanel(param1:int, param2:* = null) : void
      {
         if(_pendingPanelType == param1 || _currentPanelType == param1 && _pendingPanelType == 0)
         {
            return;
         }
         Logger.info("[Panel Manager] Queuing Panel " + param1);
         _payload = param2;
         _pendingPanelType = param1;
         if(_loader != null)
         {
            _loader.onShown.addOnce(onSwitchScreen);
            _loader.show();
         }
         else
         {
            onSwitchScreen();
         }
      }
      
      public function showDialog(param1:Dialog) : void
      {
         _dialogManager.showDialog(param1);
      }
      
      public function lockApplication() : void
      {
         locked = true;
      }
      
      public function unlockApplication() : void
      {
         locked = false;
      }
      
      public function set locked(param1:Boolean) : void
      {
         _blocker.visible = param1;
      }
      
      public function get locked() : Boolean
      {
         return _blocker.visible;
      }
      
      public function refreshAppSize() : void
      {
         var _loc3_:int = 0;
         var _loc2_:* = _panels;
         for each(var _loc1_ in _panels)
         {
            _loc1_.refreshAppSize();
         }
         _dialogManager.refreshAppSize();
         _blocker.width = DisplayCoreConfig.layout.appWidth;
         _blocker.height = DisplayCoreConfig.layout.appHeight;
      }
      
      public function refreshLocale() : void
      {
         var _loc3_:int = 0;
         var _loc2_:* = _panels;
         for each(var _loc1_ in _panels)
         {
            _loc1_.refreshLocale();
         }
      }
      
      public function get onPanelShown() : ISignal
      {
         return _onPanelShown;
      }
      
      public function get currentPanelType() : int
      {
         return _currentPanelType;
      }
      
      public function get currentPanel() : IPanel
      {
         return _currentPanel;
      }
      
      public function getPanel(param1:int) : IPanel
      {
         if(!_panels.exists(param1))
         {
            return null;
         }
         return _panels.getData(param1);
      }
      
      public function get dialogManager() : DialogManager
      {
         return _dialogManager;
      }
      
      public function get focusManager() : FocusManager
      {
         return _focusManager;
      }
      
      public function get dragDropManager() : DragDropManager
      {
         return _dragDropManager;
      }
      
      private function get root() : IDisplayObjectContainer
      {
         return DisplayCore.current.displayContext.stage;
      }
      
      private function usePendingPanel() : void
      {
         if(_currentPanel != null)
         {
            _currentPanel.onShowPrepareProgress.add(onPanelShowProgress);
            _currentPanel.onShown.addOnce(onPanelVisible);
            _currentPanel.visible = false;
            _currentPanel.hidden();
            root.removeChild(_currentPanel.ui);
            _currentPanel = null;
         }
         _currentPanelType = _pendingPanelType;
         _currentPanel = _panels.getData(_currentPanelType);
         _pendingPanelType = 0;
      }
      
      private function showCurrentPanel() : void
      {
         root.addChildAt(_currentPanel.ui,0);
         _currentPanel.visible = true;
         _currentPanel.show(_payload);
         _payload = null;
      }
      
      private function onSwitchScreen() : void
      {
         Logger.info("[Panel Manager] Loader Panel visible --> show Panel " + _pendingPanelType);
         usePendingPanel();
         _currentPanel.onShowPrepareProgress.add(onPanelShowProgress);
         _currentPanel.onShown.addOnce(onPanelVisible);
         showCurrentPanel();
      }
      
      private function onPanelShowProgress(param1:Number) : void
      {
      }
      
      private function firstPanelShown(param1:int) : void
      {
         if(_loader != null)
         {
            loadProgressCallback = _loader.loadProgress;
         }
      }
      
      private function onPanelVisible() : void
      {
         Logger.info("[Panel Manager] Panel " + _currentPanelType + " visible --> hiding loader ");
         _currentPanel.onShowPrepareProgress.remove(onPanelShowProgress);
         if(_loader)
         {
            _loader.hide();
         }
         _onPanelShown.dispatch(_currentPanelType);
      }
   }
}
