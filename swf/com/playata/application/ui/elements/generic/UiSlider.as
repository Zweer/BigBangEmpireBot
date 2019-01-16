package com.playata.application.ui.elements.generic
{
   import com.playata.framework.display.IDisplayObject;
   import com.playata.framework.display.ui.Direction;
   import com.playata.framework.display.ui.controls.Button;
   import com.playata.framework.display.ui.controls.Slider;
   
   public class UiSlider extends Slider
   {
       
      
      public function UiSlider(param1:IDisplayObject, param2:IDisplayObject, param3:Button, param4:String, param5:Number, param6:Number, param7:uint, param8:Boolean = false)
      {
         super(param1,param2,param3,param4,param5,param6,param7,!!param8?Direction.VERTICAL:Direction.HORIZONTAL);
      }
   }
}
