package com.playata.application.ui.elements.generic.button
{
   import com.playata.framework.display.IDisplayObject;
   import com.playata.framework.display.ui.controls.ILabel;
   
   public class UiTextWithIconButton extends UiTextButton
   {
       
      
      private var _icon:IDisplayObject;
      
      public function UiTextWithIconButton(param1:IDisplayObject, param2:String, param3:String, param4:Function, param5:IDisplayObject, param6:Boolean = true, param7:String = "center")
      {
         _icon = param5;
         super(param1,param2,param3,param4,param6,param7);
      }
      
      override protected function adjustWidth() : void
      {
         if(!_dynamicWidthAdjustment)
         {
            return;
         }
         var _loc1_:Object = content as Object;
         var _loc5_:ILabel = _loc1_.caption as ILabel;
         var _loc4_:Number = _loc5_.width;
         var _loc2_:Number = _loc5_.textWidth + 6;
         var _loc3_:Number = _loc2_ - _loc4_ + 22;
         if(_widthAdjustment == _loc3_ && _widthAdjustment > 0)
         {
            return;
         }
         if(_loc2_ > _loc4_)
         {
            _widthAdjustment = _loc3_;
            _loc5_.width = _loc5_.width + _widthAdjustment;
            _loc1_.bg.width = _loc1_.bg.width + _widthAdjustment * 1.05;
            if(_dynamicWidthAdjustmentAlign == "center")
            {
               _loc5_.x = _loc5_.x - (Math.round(_widthAdjustment / 2) + 2);
               _icon.x = _icon.x - (Math.round(_widthAdjustment / 2) + 2);
               _loc1_.bg.x = _loc1_.bg.x - Math.round(_widthAdjustment / 2);
            }
            else if(_dynamicWidthAdjustmentAlign != "left")
            {
               if(_dynamicWidthAdjustmentAlign == "right")
               {
                  _loc5_.x = _loc5_.x - Math.round(_widthAdjustment);
                  _loc1_.bg.x = _loc1_.bg.x - Math.round(_widthAdjustment);
               }
            }
         }
      }
   }
}
