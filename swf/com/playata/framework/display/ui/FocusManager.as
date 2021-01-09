package com.playata.framework.display.ui
{
   import com.playata.framework.core.collection.GenericMap;
   import com.playata.framework.display.DisplayCore;
   import com.playata.framework.display.ui.controls.IControl;
   import com.playata.framework.input.InputCore;
   import com.playata.framework.input.InteractionEvent;
   
   public class FocusManager
   {
       
      
      private var _container:IFocusContainer = null;
      
      private var _focusContainerLookup:GenericMap;
      
      private var _currentTabIndex:int = 0;
      
      public function FocusManager()
      {
         _focusContainerLookup = new GenericMap();
         super();
         InputCore.current.keyboard.onKeyDown.add(onInputKeyDown);
         DisplayCore.current.displayContext.nativeStage.stageFocusRect = false;
      }
      
      public function dispose() : void
      {
         InputCore.current.keyboard.onKeyDown.remove(onInputKeyDown);
         _container = null;
      }
      
      public function set focusContainer(param1:IFocusContainer) : void
      {
         _focusContainerLookup.setData(param1,_container);
         _container = param1;
         _currentTabIndex = 0;
         setFocusOptions();
      }
      
      public function get focusContainer() : IFocusContainer
      {
         return _container;
      }
      
      public function resetFocusContainer() : void
      {
         if(_container == null)
         {
            return;
         }
         if(!_focusContainerLookup.exists(_container))
         {
            return;
         }
         var _loc1_:IFocusContainer = _container;
         _container = _focusContainerLookup.getData(_container);
         _focusContainerLookup.remove(_loc1_);
         _currentTabIndex = 0;
         setFocusOptions();
      }
      
      private function setFocusOptions() : void
      {
         var _loc1_:int = 0;
         if(_container != null)
         {
            if(_container.tabObjects != null && _container.tabObjects.length != 0)
            {
               _loc1_ = 1;
               var _loc4_:int = 0;
               var _loc3_:* = _container.tabObjects;
               for each(var _loc2_ in _container.tabObjects)
               {
                  _loc2_.tabEnabled = true;
                  _loc1_++;
                  _loc2_.tabIndex = _loc1_;
               }
               DisplayCore.current.displayContext.nativeStage.stageFocusRect = true;
               DisplayCore.current.displayContext.nativeStage.tabChildren = true;
            }
            else
            {
               DisplayCore.current.displayContext.nativeStage.stageFocusRect = false;
               DisplayCore.current.displayContext.nativeStage.tabChildren = false;
            }
         }
         else
         {
            DisplayCore.current.displayContext.nativeStage.stageFocusRect = false;
            DisplayCore.current.displayContext.nativeStage.tabChildren = false;
         }
      }
      
      private function onInputKeyDown(param1:InteractionEvent) : void
      {
         if(_container == null || DisplayCore.panelManager.locked)
         {
            return;
         }
         if(param1.charCode == 13)
         {
            if(_container.defaultButton == null)
            {
               return;
            }
            if(_container.defaultButton.hasClick && _container.defaultButton.enabled)
            {
               _container.defaultButton.onClick.dispatch(null);
            }
         }
         else if(param1.charCode == 27)
         {
            _container.onEscape();
         }
      }
   }
}
