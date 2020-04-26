package com.playata.framework.display.ui.controls
{
   import com.playata.framework.display.IDisplayObject;
   
   public class Button extends Control
   {
       
      
      public function Button(param1:IDisplayObject, param2:Function = null)
      {
         super(param1);
         if(param2 != null)
         {
            this.onClick.add(param2);
         }
      }
   }
}
