package com.playata.framework.display.lib.flash
{
   import com.playata.framework.core.TypedObject;
   import com.playata.framework.display.ui.controls.ILabelArea;
   import flash.text.TextField;
   
   public class FlashLabelArea extends FlashTextField implements ILabelArea
   {
       
      
      public function FlashLabelArea(param1:TypedObject, param2:TextField = null)
      {
         super(param1,param2);
         interactionEnabled = false;
      }
      
      public static function setNativeInstance(param1:ILabelArea, param2:TextField) : void
      {
         (param1 as FlashLabelArea)._textField = param2;
         (param1 as FlashLabelArea)._displayObject = param2;
         param1.interactionEnabled = false;
         (param1 as FlashLabelArea).applyStyles();
      }
      
      public static function fromNative(param1:TextField) : FlashLabelArea
      {
         return new FlashLabelArea(null,param1);
      }
   }
}
