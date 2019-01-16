package com.playata.framework.display.lib.flash
{
   import com.playata.framework.core.TypedObject;
   import com.playata.framework.display.ui.controls.IRichLabel;
   
   public class FlashRichLabel extends FlashRichTextField implements IRichLabel
   {
       
      
      public function FlashRichLabel(param1:TypedObject)
      {
         super(param1);
         interactionEnabled = false;
      }
   }
}
