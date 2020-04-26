package com.playata.application.ui.elements.generic.tab
{
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.framework.display.IDisplayObject;
   
   public class UiTabButton extends UiButton
   {
       
      
      private var _tabButton:IDisplayObject = null;
      
      public function UiTabButton(param1:IDisplayObject, param2:String, param3:String, param4:Function)
      {
         _tabButton = param1;
         super(param1,param3,param4);
         this.caption = param2;
         if(tabButtonAsObject.clear.hasOwnProperty("backgroundGray"))
         {
            tabButtonAsObject.clear.backgroundGray.visible = false;
         }
      }
      
      public function set tabbed(param1:Boolean) : void
      {
         tabButtonAsObject.tabbed.visible = param1;
         tabButtonAsObject.clear.visible = !param1;
      }
      
      public function get tabbed() : Boolean
      {
         return tabButtonAsObject.tabbed.visible;
      }
      
      public function set caption(param1:String) : void
      {
         tabButtonAsObject.tabbed.caption.autoFontSize = true;
         tabButtonAsObject.clear.caption.autoFontSize = true;
         tabButtonAsObject.tabbed.caption.text = param1;
         tabButtonAsObject.clear.caption.text = param1;
      }
      
      public function setTextSize(param1:int, param2:int) : void
      {
         tabButtonAsObject.tabbed.caption.fontSize = param1;
         tabButtonAsObject.clear.caption.fontSize = param1;
         tabButtonAsObject.tabbed.caption.y = tabButtonAsObject.tabbed.caption.y - param2;
         tabButtonAsObject.clear.caption.y = tabButtonAsObject.clear.caption.y - param2;
      }
      
      public function set gray(param1:Boolean) : void
      {
         if(tabButtonAsObject.clear.hasOwnProperty("backgroundGray"))
         {
            tabButtonAsObject.clear.backgroundBrown.visible = !param1;
            tabButtonAsObject.clear.backgroundGray.visible = param1;
            tabButtonAsObject.clear.caption.textColor = !!param1?16777215:4406069;
         }
      }
      
      private function get tabButtonAsObject() : Object
      {
         return _tabButton as Object;
      }
   }
}
