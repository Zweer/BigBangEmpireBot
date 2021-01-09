package com.greensock.plugins
{
   import com.greensock.TweenLite;
   import flash.display.DisplayObject;
   import flash.geom.ColorTransform;
   
   public class ColorTransformPlugin extends TintPlugin
   {
      
      public static const API:Number = 2;
       
      
      public function ColorTransformPlugin()
      {
         super();
         _propName = "colorTransform";
      }
      
      override public function _onInitTween(param1:Object, param2:*, param3:TweenLite) : Boolean
      {
         var _loc4_:ColorTransform = null;
         var _loc6_:* = null;
         var _loc7_:Number = NaN;
         var _loc5_:ColorTransform = new ColorTransform();
         if(param1 is DisplayObject)
         {
            _transform = DisplayObject(param1).transform;
            _loc4_ = _transform.colorTransform;
         }
         else if(param1 is ColorTransform)
         {
            _loc4_ = param1 as ColorTransform;
         }
         else
         {
            return false;
         }
         if(param2 is ColorTransform)
         {
            _loc5_.concat(param2);
         }
         else
         {
            _loc5_.concat(_loc4_);
         }
         for(_loc6_ in param2)
         {
            if(_loc6_ == "tint" || _loc6_ == "color")
            {
               if(param2[_loc6_] != null)
               {
                  _loc5_.color = int(param2[_loc6_]);
               }
            }
            else if(!(_loc6_ == "tintAmount" || _loc6_ == "exposure" || _loc6_ == "brightness"))
            {
               _loc5_[_loc6_] = param2[_loc6_];
            }
         }
         if(!(param2 is ColorTransform))
         {
            if(!isNaN(param2.tintAmount))
            {
               _loc7_ = param2.tintAmount / (1 - (_loc5_.redMultiplier + _loc5_.greenMultiplier + _loc5_.blueMultiplier) / 3);
               _loc5_.redOffset = _loc5_.redOffset * _loc7_;
               _loc5_.greenOffset = _loc5_.greenOffset * _loc7_;
               _loc5_.blueOffset = _loc5_.blueOffset * _loc7_;
               _loc5_.redMultiplier = _loc5_.greenMultiplier = _loc5_.blueMultiplier = 1 - param2.tintAmount;
            }
            else if(!isNaN(param2.exposure))
            {
               _loc5_.redOffset = _loc5_.greenOffset = _loc5_.blueOffset = 255 * (param2.exposure - 1);
               _loc5_.redMultiplier = _loc5_.greenMultiplier = _loc5_.blueMultiplier = 1;
            }
            else if(!isNaN(param2.brightness))
            {
               _loc5_.redOffset = _loc5_.greenOffset = _loc5_.blueOffset = Math.max(0,(param2.brightness - 1) * 255);
               _loc5_.redMultiplier = _loc5_.greenMultiplier = _loc5_.blueMultiplier = 1 - Math.abs(param2.brightness - 1);
            }
         }
         _init(_loc4_,_loc5_);
         return true;
      }
   }
}
