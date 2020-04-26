package com.playata.application.ui.elements.account_settings
{
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.framework.display.IDisplayObject;
   import com.playata.framework.display.IDisplayObjectContainer;
   import com.playata.framework.display.ui.controls.ILabel;
   
   public class UiOptionButton extends UiButton
   {
       
      
      public function UiOptionButton(param1:IDisplayObject, param2:String, param3:Function)
      {
         super(param1,"",param3);
         this.caption = param2;
      }
      
      public function set caption(param1:String) : void
      {
         var _loc2_:ILabel = (_content as IDisplayObjectContainer).getChildByName("caption") as ILabel;
         _loc2_.autoFontSize = true;
         _loc2_.text = param1;
      }
   }
}
