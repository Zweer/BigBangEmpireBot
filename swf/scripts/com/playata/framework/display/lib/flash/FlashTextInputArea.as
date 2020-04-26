package com.playata.framework.display.lib.flash
{
   import com.playata.framework.core.TypedObject;
   import com.playata.framework.display.ui.controls.ITextInputArea;
   import flash.text.TextField;
   
   public class FlashTextInputArea extends FlashTextInput implements ITextInputArea
   {
       
      
      public function FlashTextInputArea(param1:TypedObject, param2:TextField = null)
      {
         super(param1,param2);
         interactionEnabled = true;
      }
      
      public static function setNativeInstance(param1:ITextInputArea, param2:TextField) : void
      {
         (param1 as FlashTextInputArea)._textField = param2;
         (param1 as FlashTextInputArea)._displayObject = param2;
         param1.interactionEnabled = true;
         (param1 as FlashTextInputArea).applyStyles();
      }
      
      public static function fromNative(param1:TextField) : FlashTextInputArea
      {
         return new FlashTextInputArea(null,param1);
      }
   }
}
