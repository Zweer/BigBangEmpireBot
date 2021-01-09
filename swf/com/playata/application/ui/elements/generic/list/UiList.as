package com.playata.application.ui.elements.generic.list
{
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.framework.application.Environment;
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.ui.Direction;
   import com.playata.framework.display.ui.controls.FixedList;
   
   public class UiList extends FixedList
   {
       
      
      public function UiList(param1:Sprite, param2:Class, param3:int, param4:UiButton, param5:UiButton, param6:Boolean, param7:Boolean, param8:Function = null, param9:String = null)
      {
         super(param1,param2,param3,Direction.VERTICAL,param4,param5,param6,param7,param8,param9);
      }
      
      override protected function scrollUp(param1:int) : void
      {
         super.scrollUp(param1);
         if(!_btnScrollUp || !_btnScrollUp.visible || !_btnScrollUp.enabled)
         {
            return;
         }
         Environment.audio.playFX("ui_button_click.mp3");
      }
      
      override protected function scrollDown(param1:int) : void
      {
         super.scrollDown(param1);
         if(!_btnScrollDown || !_btnScrollDown.visible || !_btnScrollDown.enabled)
         {
            return;
         }
         Environment.audio.playFX("ui_button_click.mp3");
      }
   }
}
