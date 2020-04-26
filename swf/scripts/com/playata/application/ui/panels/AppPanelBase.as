package com.playata.application.ui.panels
{
   import com.playata.application.AppEnvironment;
   import com.playata.application.platform.AppPlatform;
   import com.playata.framework.application.Environment;
   import com.playata.framework.display.IDisplayObjectContainer;
   import com.playata.framework.display.ui.panels.PanelBase;
   import com.playata.framework.display.ui.panels.PanelManager;
   
   public class AppPanelBase extends PanelBase
   {
       
      
      public function AppPanelBase(param1:IDisplayObjectContainer = null)
      {
         super(param1);
      }
      
      public function get platform() : AppPlatform
      {
         return AppEnvironment.appPlatform;
      }
      
      public function get panelManager() : PanelManager
      {
         return Environment.panelManager;
      }
   }
}
