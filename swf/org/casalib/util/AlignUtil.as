package org.casalib.util
{
   import flash.display.DisplayObject;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class AlignUtil
   {
      
      public static const BOTTOM:String = "bottom";
      
      public static const BOTTOM_CENTER:String = "bottomCenter";
      
      public static const BOTTOM_LEFT:String = "bottomLeft";
      
      public static const BOTTOM_RIGHT:String = "bottomRight";
      
      public static const CENTER:String = "center";
      
      public static const LEFT:String = "left";
      
      public static const MIDDLE:String = "middle";
      
      public static const MIDDLE_CENTER:String = "middleCenter";
      
      public static const MIDDLE_LEFT:String = "middleLeft";
      
      public static const MIDDLE_RIGHT:String = "middleRight";
      
      public static const RIGHT:String = "right";
      
      public static const TOP:String = "top";
      
      public static const TOP_CENTER:String = "topCenter";
      
      public static const TOP_LEFT:String = "topLeft";
      
      public static const TOP_RIGHT:String = "topRight";
       
      
      public function AlignUtil()
      {
         super();
      }
      
      public static function align(param1:String, param2:DisplayObject, param3:Rectangle, param4:Boolean = true, param5:Boolean = false) : void
      {
         var _loc6_:Point = AlignUtil._getPosition(param1,param2.width,param2.height,param3,param5);
         var _loc7_:Point = DisplayObjectUtil.getOffsetPosition(param2);
         param2.x = _loc6_.x + _loc7_.x;
         param2.y = _loc6_.y + _loc7_.y;
         if(param4)
         {
            AlignUtil.alignToPixel(param2);
         }
      }
      
      public static function alignRectangle(param1:String, param2:Rectangle, param3:Rectangle, param4:Boolean = true, param5:Boolean = false) : Rectangle
      {
         var _loc6_:Rectangle = param2.clone();
         _loc6_.offsetPoint(AlignUtil._getPosition(param1,param2.width,param2.height,param3,param5));
         if(param4)
         {
            _loc6_.x = Math.round(_loc6_.x);
            _loc6_.y = Math.round(_loc6_.y);
         }
         return _loc6_;
      }
      
      public static function alignToPixel(param1:DisplayObject) : void
      {
         param1.x = Math.round(param1.x);
         param1.y = Math.round(param1.y);
      }
      
      public static function alignBottom(param1:DisplayObject, param2:Rectangle, param3:Boolean = true, param4:Boolean = false) : void
      {
         AlignUtil.align(AlignUtil.BOTTOM,param1,param2,param3,param4);
      }
      
      public static function alignBottomLeft(param1:DisplayObject, param2:Rectangle, param3:Boolean = true, param4:Boolean = false) : void
      {
         AlignUtil.align(AlignUtil.BOTTOM_LEFT,param1,param2,param3,param4);
      }
      
      public static function alignBottomCenter(param1:DisplayObject, param2:Rectangle, param3:Boolean = true, param4:Boolean = false) : void
      {
         AlignUtil.align(AlignUtil.BOTTOM_CENTER,param1,param2,param3,param4);
      }
      
      public static function alignBottomRight(param1:DisplayObject, param2:Rectangle, param3:Boolean = true, param4:Boolean = false) : void
      {
         AlignUtil.align(AlignUtil.BOTTOM_RIGHT,param1,param2,param3,param4);
      }
      
      public static function alignCenter(param1:DisplayObject, param2:Rectangle, param3:Boolean = true) : void
      {
         AlignUtil.align(AlignUtil.CENTER,param1,param2,param3);
      }
      
      public static function alignLeft(param1:DisplayObject, param2:Rectangle, param3:Boolean = true, param4:Boolean = false) : void
      {
         AlignUtil.align(AlignUtil.LEFT,param1,param2,param3,param4);
      }
      
      public static function alignMiddle(param1:DisplayObject, param2:Rectangle, param3:Boolean = true) : void
      {
         AlignUtil.align(AlignUtil.MIDDLE,param1,param2,param3);
      }
      
      public static function alignMiddleLeft(param1:DisplayObject, param2:Rectangle, param3:Boolean = true, param4:Boolean = false) : void
      {
         AlignUtil.align(AlignUtil.MIDDLE_LEFT,param1,param2,param3,param4);
      }
      
      public static function alignMiddleCenter(param1:DisplayObject, param2:Rectangle, param3:Boolean = true) : void
      {
         AlignUtil.align(AlignUtil.MIDDLE_CENTER,param1,param2,param3);
      }
      
      public static function alignMiddleRight(param1:DisplayObject, param2:Rectangle, param3:Boolean = true, param4:Boolean = false) : void
      {
         AlignUtil.align(AlignUtil.MIDDLE_RIGHT,param1,param2,param3,param4);
      }
      
      public static function alignRight(param1:DisplayObject, param2:Rectangle, param3:Boolean = true, param4:Boolean = false) : void
      {
         AlignUtil.align(AlignUtil.RIGHT,param1,param2,param3,param4);
      }
      
      public static function alignTop(param1:DisplayObject, param2:Rectangle, param3:Boolean = true, param4:Boolean = false) : void
      {
         AlignUtil.align(AlignUtil.TOP,param1,param2,param3,param4);
      }
      
      public static function alignTopLeft(param1:DisplayObject, param2:Rectangle, param3:Boolean = true, param4:Boolean = false) : void
      {
         AlignUtil.align(AlignUtil.TOP_LEFT,param1,param2,param3,param4);
      }
      
      public static function alignTopCenter(param1:DisplayObject, param2:Rectangle, param3:Boolean = true, param4:Boolean = false) : void
      {
         AlignUtil.align(AlignUtil.TOP_CENTER,param1,param2,param3,param4);
      }
      
      public static function alignTopRight(param1:DisplayObject, param2:Rectangle, param3:Boolean = true, param4:Boolean = false) : void
      {
         AlignUtil.align(AlignUtil.TOP_RIGHT,param1,param2,param3,param4);
      }
      
      protected static function _getPosition(param1:String, param2:uint, param3:uint, param4:Rectangle, param5:Boolean) : Point
      {
         var _loc6_:Point = new Point();
         switch(param1)
         {
            case AlignUtil.BOTTOM_LEFT:
            case AlignUtil.LEFT:
            case AlignUtil.MIDDLE_LEFT:
            case AlignUtil.TOP_LEFT:
               _loc6_.x = !!param5?Number(param4.x - param2):Number(param4.x);
               break;
            case AlignUtil.BOTTOM_CENTER:
            case AlignUtil.CENTER:
            case AlignUtil.MIDDLE_CENTER:
            case AlignUtil.TOP_CENTER:
               _loc6_.x = (param4.width - param2) * 0.5 + param4.x;
               break;
            case AlignUtil.BOTTOM_RIGHT:
            case AlignUtil.MIDDLE_RIGHT:
            case AlignUtil.RIGHT:
            case AlignUtil.TOP_RIGHT:
               _loc6_.x = !!param5?Number(param4.right):Number(param4.right - param2);
         }
         switch(param1)
         {
            case AlignUtil.TOP:
            case AlignUtil.TOP_CENTER:
            case AlignUtil.TOP_LEFT:
            case AlignUtil.TOP_RIGHT:
               _loc6_.y = !!param5?Number(param4.y - param3):Number(param4.y);
               break;
            case AlignUtil.MIDDLE:
            case AlignUtil.MIDDLE_CENTER:
            case AlignUtil.MIDDLE_LEFT:
            case AlignUtil.MIDDLE_RIGHT:
               _loc6_.y = (param4.height - param3) * 0.5 + param4.y;
               break;
            case AlignUtil.BOTTOM:
            case AlignUtil.BOTTOM_CENTER:
            case AlignUtil.BOTTOM_LEFT:
            case AlignUtil.BOTTOM_RIGHT:
               _loc6_.y = !!param5?Number(param4.bottom):Number(param4.bottom - param3);
         }
         return _loc6_;
      }
   }
}
