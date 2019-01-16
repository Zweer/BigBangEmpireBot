package com.playata.application.ui
{
   import com.playata.framework.display.IDisplayObject;
   import com.playata.framework.display.ui.controls.ITextField;
   import flash.geom.Rectangle;
   import org.casalib.util.AlignUtil;
   
   public class AppUiUtil
   {
       
      
      public function AppUiUtil()
      {
         super();
      }
      
      public static function alignVerticallyCentered(param1:IDisplayObject, param2:Number, ... rest) : void
      {
         var _loc8_:int = 0;
         var _loc6_:* = null;
         var _loc4_:* = 9999999;
         var _loc5_:* = -9999999;
         var _loc11_:IDisplayObject = null;
         _loc8_ = 0;
         while(_loc8_ < rest.length)
         {
            if(rest[_loc8_] is Array)
            {
               _loc6_ = rest[_loc8_] as Array;
               var _loc13_:int = 0;
               var _loc12_:* = _loc6_;
               for each(_loc11_ in _loc6_)
               {
                  if(_loc11_.x < _loc4_)
                  {
                     _loc4_ = Number(_loc11_.x);
                  }
                  if(_loc11_ is ITextField)
                  {
                     if(_loc11_.x + (_loc11_ as ITextField).textWidth > _loc5_)
                     {
                        _loc5_ = Number(_loc11_.x + (_loc11_ as ITextField).textWidth);
                     }
                  }
                  else if(_loc11_.x + _loc11_.width > _loc5_)
                  {
                     _loc5_ = Number(_loc11_.x + _loc11_.width);
                  }
               }
            }
            else
            {
               _loc11_ = rest[_loc8_] as IDisplayObject;
               if(_loc11_.x < _loc4_)
               {
                  _loc4_ = Number(_loc11_.x);
               }
               if(_loc11_ is ITextField)
               {
                  if(_loc11_.x + (_loc11_ as ITextField).textWidth > _loc5_)
                  {
                     _loc5_ = Number(_loc11_.x + (_loc11_ as ITextField).textWidth);
                  }
               }
               else if(_loc11_.x + _loc11_.width > _loc5_)
               {
                  _loc5_ = Number(_loc11_.x + _loc11_.width);
               }
            }
            _loc8_++;
         }
         var _loc10_:Number = _loc5_ - _loc4_;
         var _loc7_:Rectangle = AlignUtil.alignRectangle("center",new Rectangle(0,1,_loc10_,1),param1.getBounds(param1));
         var _loc9_:Number = _loc7_.x - _loc4_;
         _loc8_ = 0;
         while(_loc8_ < rest.length)
         {
            if(rest[_loc8_] is Array)
            {
               var _loc15_:int = 0;
               var _loc14_:* = rest[_loc8_];
               for each(_loc11_ in rest[_loc8_])
               {
                  _loc11_.x = _loc11_.x + (_loc9_ + param2);
               }
            }
            else
            {
               _loc11_ = rest[_loc8_] as IDisplayObject;
               _loc11_.x = _loc11_.x + (_loc9_ + param2);
            }
            _loc8_++;
         }
      }
   }
}
