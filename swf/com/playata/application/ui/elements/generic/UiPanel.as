package com.playata.application.ui.elements.generic
{
   import com.playata.application.ui.panels.AppPanelBase;
   import com.playata.framework.core.logging.Logger;
   import com.playata.framework.display.IDisplayObjectContainer;
   
   public class UiPanel extends AppPanelBase
   {
       
      
      protected var _vo:IDisplayObjectContainer = null;
      
      protected var _shown:Boolean = true;
      
      public function UiPanel(param1:IDisplayObjectContainer)
      {
         super(param1);
         _vo = param1;
      }
      
      public function dispose() : void
      {
         hide();
         _vo = null;
      }
      
      override public function show(param1:* = null) : void
      {
         super.show(param1);
         if(_shown == true)
         {
            Logger.debug("[Application] Warning: Showing panel which was already shown!");
         }
         _shown = true;
         _vo.visible = true;
      }
      
      public function hide() : void
      {
         if(_shown == false)
         {
            Logger.debug("[Application] Warning: Hiding panel which was already hidden!");
         }
         _shown = false;
         _vo.visible = false;
      }
      
      public function get shown() : Boolean
      {
         return _shown;
      }
      
      public function get container() : IDisplayObjectContainer
      {
         return _vo;
      }
   }
}
