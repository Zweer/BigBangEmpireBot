package com.playata.framework.display.ui.controls
{
   import com.playata.framework.core.collection.StringMap;
   import com.playata.framework.core.error.Exception;
   import com.playata.framework.core.signal.ISignal;
   import com.playata.framework.core.signal.Signal;
   
   public class TabGroup
   {
       
      
      private var _tabs:StringMap;
      
      private var _numTabs:int;
      
      private var _onTabSelected:ISignal = null;
      
      public function TabGroup()
      {
         super();
         _tabs = new StringMap();
         _onTabSelected = new Signal();
      }
      
      public function addTab(param1:String, param2:Tab) : void
      {
         if(_tabs.exists(param1))
         {
            throw new Exception("Tabs must be unique!");
         }
         param2.group = this;
         param2.id = param1;
         _tabs.setData(param2.id,param2);
         _numTabs = Number(_numTabs) + 1;
      }
      
      public function activateTab(param1:String, param2:Boolean = false) : void
      {
         var _loc3_:Tab = getTab(param1);
         if(_loc3_ != null)
         {
            onTabClicked(_loc3_);
            if(param2)
            {
               var _loc5_:int = 0;
               var _loc4_:* = _tabs;
               for each(_loc3_ in _tabs)
               {
                  _loc3_.selected = _loc3_.id == param1;
               }
            }
         }
      }
      
      public function getTab(param1:String) : Tab
      {
         if(!_tabs.exists(param1))
         {
            return null;
         }
         return _tabs.getData(param1);
      }
      
      public function get tabCount() : int
      {
         return _numTabs;
      }
      
      public function dispose() : void
      {
         _tabs = null;
      }
      
      public function get selectedTab() : Tab
      {
         var _loc3_:int = 0;
         var _loc2_:* = _tabs;
         for each(var _loc1_ in _tabs)
         {
            if(_loc1_.selected)
            {
               return _loc1_;
            }
         }
         return null;
      }
      
      public function get onTabSelected() : ISignal
      {
         return _onTabSelected;
      }
      
      function onTabClicked(param1:Tab) : void
      {
         var _loc4_:int = 0;
         var _loc3_:* = _tabs;
         for each(var _loc2_ in _tabs)
         {
            _loc2_.selected = _loc2_.id == param1.id;
         }
         _onTabSelected.dispatch(param1.id);
      }
   }
}
