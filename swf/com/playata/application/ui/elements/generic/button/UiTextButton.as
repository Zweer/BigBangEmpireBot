package com.playata.application.ui.elements.generic.button
{
   import com.playata.framework.display.IDisplayObject;
   import com.playata.framework.display.ui.controls.ILabel;
   
   public class UiTextButton extends UiButton
   {
       
      
      protected var _dynamicWidthAdjustment:Boolean = true;
      
      protected var _dynamicWidthAdjustmentAlign:String = "center";
      
      protected var _widthAdjustment:Number = 0;
      
      public function UiTextButton(param1:IDisplayObject, param2:String, param3:String, param4:Function, param5:Boolean = true, param6:String = "center")
      {
         super(param1,param3,param4);
         var _loc7_:Object = param1 as Object;
         _loc7_.caption.text = param2;
         _dynamicWidthAdjustment = param5;
         _dynamicWidthAdjustmentAlign = param6;
         adjustWidth();
      }
      
      public function fitText() : void
      {
         var _loc1_:Object = content as Object;
         var _loc2_:ILabel = _loc1_.caption as ILabel;
         _loc2_.autoFontSize = true;
      }
      
      public function get caption() : String
      {
         var _loc1_:Object = content as Object;
         return _loc1_.caption.text;
      }
      
      public function set caption(param1:String) : void
      {
         var _loc2_:Object = content as Object;
         _loc2_.caption.text = param1;
         adjustWidth();
      }
      
      public function changeWidth(param1:Number) : void
      {
         var _loc2_:Object = content as Object;
         var _loc4_:ILabel = _loc2_.caption as ILabel;
         var _loc3_:Number = param1 - _loc2_.bg.width;
         _loc4_.width = _loc4_.width + _loc3_;
         _loc2_.bg.width = _loc2_.bg.width + _loc3_;
         if(_dynamicWidthAdjustmentAlign == "center")
         {
            _loc4_.x = _loc4_.x - Math.round(_loc3_ / 2);
            _loc2_.bg.x = _loc2_.bg.x - Math.round(_loc3_ / 2);
         }
         else if(_dynamicWidthAdjustmentAlign != "left")
         {
            if(_dynamicWidthAdjustmentAlign == "right")
            {
               _loc4_.x = _loc4_.x - Math.round(_loc3_);
               _loc2_.bg.x = _loc2_.bg.x - Math.round(_loc3_);
            }
         }
      }
      
      protected function adjustWidth() : void
      {
         if(!_dynamicWidthAdjustment)
         {
            return;
         }
         var _loc1_:Object = content as Object;
         var _loc4_:ILabel = _loc1_.caption as ILabel;
         var _loc3_:Number = _loc4_.width;
         var _loc2_:Number = _loc4_.textWidth;
         if(_widthAdjustment > 0)
         {
            return;
         }
         if(_loc2_ > _loc3_)
         {
            _widthAdjustment = _loc2_ - _loc3_ + 10;
            _loc4_.width = _loc4_.width + _widthAdjustment;
            _loc1_.bg.width = _loc1_.bg.width + _widthAdjustment;
            if(_dynamicWidthAdjustmentAlign == "center")
            {
               _loc4_.x = _loc4_.x - Math.round(_widthAdjustment / 2);
               _loc1_.bg.x = _loc1_.bg.x - Math.round(_widthAdjustment / 2);
            }
            else if(_dynamicWidthAdjustmentAlign != "left")
            {
               if(_dynamicWidthAdjustmentAlign == "right")
               {
                  _loc4_.x = _loc4_.x - Math.round(_widthAdjustment);
                  _loc1_.bg.x = _loc1_.bg.x - Math.round(_widthAdjustment);
               }
            }
         }
      }
      
      override public function set enabled(param1:Boolean) : void
      {
         .super.enabled = param1;
         var _loc2_:Object = content as Object;
         var _loc3_:ILabel = _loc2_.caption as ILabel;
         _loc3_.textColor = !!_enabled?16777215:10066329;
      }
   }
}
