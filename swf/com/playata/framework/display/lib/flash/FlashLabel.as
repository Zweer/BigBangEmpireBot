package com.playata.framework.display.lib.flash
{
   import com.playata.framework.core.TypedObject;
   import com.playata.framework.display.ui.controls.ILabel;
   import flash.text.TextField;
   
   public class FlashLabel extends FlashTextField implements ILabel
   {
       
      
      public function FlashLabel(param1:TypedObject, param2:TextField = null)
      {
         super(param1,param2);
         interactionEnabled = false;
      }
      
      public static function setNativeInstance(param1:ILabel, param2:TextField) : void
      {
         (param1 as FlashLabel)._textField = param2;
         (param1 as FlashLabel)._displayObject = param2;
         param1.interactionEnabled = false;
         (param1 as FlashLabel).applyStyles();
      }
      
      public static function fromNative(param1:TextField) : FlashLabel
      {
         return new FlashLabel(null,param1);
      }
   }
}
