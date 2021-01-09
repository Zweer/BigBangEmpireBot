package com.playata.framework.display.ui.panels
{
   import com.playata.framework.core.signal.ISignal;
   import com.playata.framework.core.signal.Signal;
   import com.playata.framework.display.AnchorContainer;
   import com.playata.framework.display.DisplayCore;
   import com.playata.framework.display.DisplayCoreConfig;
   import com.playata.framework.display.DisplayObjectFactory;
   import com.playata.framework.display.IDisplayObject;
   import com.playata.framework.display.IDisplayObjectContainer;
   import flash.geom.Rectangle;
   
   public class PanelBase implements IPanel
   {
       
      
      protected var _onShowPrepareProgress:ISignal = null;
      
      protected var _onShown:ISignal = null;
      
      protected var _currentWidth:Number;
      
      protected var _currentHeight:Number;
      
      protected var _anchorContainer:AnchorContainer;
      
      protected var _ui:IDisplayObjectContainer;
      
      public function PanelBase(param1:IDisplayObjectContainer = null)
      {
         super();
         if(!param1)
         {
            _ui = DisplayObjectFactory.createSpriteFromSettings({});
         }
         else
         {
            _ui = param1;
         }
         initPanel();
      }
      
      public function get ui() : IDisplayObjectContainer
      {
         return _ui;
      }
      
      protected function initSignals() : void
      {
         _onShowPrepareProgress = new Signal();
         _onShown = new Signal();
      }
      
      public function initPanel() : void
      {
         _anchorContainer = new AnchorContainer(new Rectangle(0,0,DisplayCoreConfig.layout.appDefaultWidth,DisplayCoreConfig.layout.appDefaultHeight));
         _currentWidth = DisplayCoreConfig.layout.appDefaultWidth;
         _currentHeight = DisplayCoreConfig.layout.appDefaultHeight;
         initSignals();
         init();
         if(_ui)
         {
            _ui.onAddedToStage.addOnce(firstTimeAddedToStage);
         }
      }
      
      protected function firstTimeAddedToStage(param1:IDisplayObject) : void
      {
         firstDisplay();
      }
      
      protected function init() : void
      {
      }
      
      public function show(param1:* = null) : void
      {
         onShown.dispatch();
      }
      
      public function set visible(param1:Boolean) : void
      {
         _ui.visible = param1;
      }
      
      public function get onShowPrepareProgress() : ISignal
      {
         return _onShowPrepareProgress;
      }
      
      public function get onShown() : ISignal
      {
         return _onShown;
      }
      
      public function hidden() : void
      {
      }
      
      public function get isDisplayed() : Boolean
      {
         return ui.parent == DisplayCore.current.displayContext.stage;
      }
      
      public function firstDisplay() : void
      {
      }
      
      public function refreshAppSize() : void
      {
         _anchorContainer.setSize(new Rectangle(0,0,DisplayCoreConfig.layout.appWidth,DisplayCoreConfig.layout.appHeight));
         _currentWidth = DisplayCoreConfig.layout.appWidth;
         _currentHeight = DisplayCoreConfig.layout.appHeight;
      }
      
      public function refreshLocale() : void
      {
      }
   }
}
