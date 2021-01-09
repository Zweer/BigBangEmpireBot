package com.playata.application.ui.elements.generic.tab
{
   import com.playata.framework.display.IDisplayObject;
   
   public class UiTabIconOnlyButton extends UiTabButton
   {
      
      public static const LOGIN_EMAIL:int = 1;
      
      public static const LOGIN_FACEBOOK:int = 2;
      
      public static const LOGIN_MOBILE:int = 3;
      
      public static const LOGIN_GAMESERVICE_ANDROID:int = 4;
      
      public static const LOGIN_GAMESERVICE_IOS:int = 5;
       
      
      public function UiTabIconOnlyButton(param1:IDisplayObject, param2:Function, param3:int)
      {
         super(param1,null,null,param2);
         this.icon = param3;
         contentAsObject.clear.visible = false;
      }
      
      override public function set caption(param1:String) : void
      {
      }
      
      public function set icon(param1:int) : void
      {
         contentAsObject.tabbed.gotoAndStop(param1);
         contentAsObject.clear.gotoAndStop(param1);
      }
      
      private function get contentAsObject() : Object
      {
         return _content as Object;
      }
   }
}
