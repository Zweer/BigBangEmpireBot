package com.playata.framework.display.lib.flash
{
   import com.playata.framework.core.TypedObject;
   import com.playata.framework.display.ui.controls.IRichLabelArea;
   import flash.text.TextField;
   
   public class FlashRichLabelArea extends FlashRichTextField implements IRichLabelArea
   {
       
      
      public function FlashRichLabelArea(param1:TypedObject, param2:TextField = null)
      {
         super(param1,param2);
         _textField.multiline = true;
         interactionEnabled = false;
      }
      
      public static function fromNative(param1:TextField) : FlashRichLabelArea
      {
         return new FlashRichLabelArea(null,param1);
      }
   }
}
