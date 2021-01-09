package com.playata.framework.geom
{
   import flash.geom.Point;
   
   public class Vector2D
   {
      
      public static var DEGRAD:Number = 0.017453292519943295;
      
      public static var RADDEG:Number = 57.29577951308232;
       
      
      private var _x:Number;
      
      private var _y:Number;
      
      public function Vector2D(param1:Number = 0, param2:Number = 0)
      {
         super();
         _x = param1;
         _y = param2;
      }
      
      public static function distanceSqrPoints(param1:Number, param2:Number, param3:Number, param4:Number) : Number
      {
         var _loc5_:Number = param1 - param3;
         var _loc6_:Number = param2 - param4;
         return _loc5_ * _loc5_ + _loc6_ * _loc6_;
      }
      
      public static function angleBetween(param1:Vector2D, param2:Vector2D) : Number
      {
         if(!param1.isNormalized)
         {
            param1 = param1.clone();
            param1.normalize();
         }
         if(!param2.isNormalized)
         {
            param2 = param2.clone();
            param2.normalize();
         }
         return Math.acos(param1.dot(param2)) * 180 / 3.14159265358979;
      }
      
      public static function degToVec(param1:Number) : Vector2D
      {
         var _loc2_:Number = param1 * DEGRAD;
         return new Vector2D(Math.cos(_loc2_),Math.sin(_loc2_));
      }
      
      public static function radToVec(param1:Number) : Vector2D
      {
         return new Vector2D(Math.sin(param1),Math.cos(param1));
      }
      
      public function get x() : Number
      {
         return _x;
      }
      
      public function get y() : Number
      {
         return _y;
      }
      
      public function set x(param1:Number) : void
      {
         _x = param1;
      }
      
      public function set y(param1:Number) : void
      {
         _y = param1;
      }
      
      public function add(param1:Vector2D) : Vector2D
      {
         return new Vector2D(_x + param1.x,_y + param1.y);
      }
      
      public function subtract(param1:Vector2D) : Vector2D
      {
         return new Vector2D(_x - param1.x,_y - param1.y);
      }
      
      public function multiply(param1:Number) : Vector2D
      {
         return new Vector2D(_x * param1,_y * param1);
      }
      
      public function divide(param1:Number) : Vector2D
      {
         return new Vector2D(_x / param1,_y / param1);
      }
      
      public function selfAdd(param1:Vector2D) : Vector2D
      {
         _x = _x + param1.x;
         _y = _y + param1.y;
         return this;
      }
      
      public function selfSubtract(param1:Vector2D) : Vector2D
      {
         _x = _x - param1.x;
         _y = _y - param1.y;
         return this;
      }
      
      public function selfMultiply(param1:Number) : Vector2D
      {
         _x = _x * param1;
         _y = _y * param1;
         return this;
      }
      
      public function selfDivide(param1:Number) : Vector2D
      {
         _x = _x / param1;
         _y = _y / param1;
         return this;
      }
      
      public function distance(param1:Vector2D) : Number
      {
         var _loc2_:Number = _x - param1.x;
         var _loc3_:Number = _y - param1.y;
         return Math.sqrt(_loc2_ * _loc2_ + _loc3_ * _loc3_);
      }
      
      public function distancePoint(param1:Point) : Number
      {
         var _loc2_:Number = _x - param1.x;
         var _loc3_:Number = _y - param1.y;
         return Math.sqrt(_loc2_ * _loc2_ + _loc3_ * _loc3_);
      }
      
      public function distanceSqr(param1:Vector2D) : Number
      {
         var _loc2_:Number = _x - param1.x;
         var _loc3_:Number = _y - param1.y;
         return _loc2_ * _loc2_ + _loc3_ * _loc3_;
      }
      
      public function get magnitude() : Number
      {
         return Math.sqrt(_x * _x + _y * _y);
      }
      
      public function get length() : Number
      {
         return magnitude;
      }
      
      public function normalize() : void
      {
         var _loc1_:Number = Math.sqrt(_x * _x + _y * _y);
         if(_loc1_ == 0)
         {
            _x = 0;
            _y = 0;
         }
         else
         {
            _x = _x / _loc1_;
            _y = _y / _loc1_;
         }
      }
      
      public function getNormalized() : Vector2D
      {
         var _loc1_:Number = Math.sqrt(_x * _x + _y * _y);
         return new Vector2D(_x / _loc1_,_y / _loc1_);
      }
      
      public function get isNormalized() : Boolean
      {
         return length == 1;
      }
      
      public function clone() : Vector2D
      {
         return new Vector2D(x,y);
      }
      
      public function equals(param1:Vector2D) : Boolean
      {
         return _x == param1.x && _y == param1.y;
      }
      
      public function zero() : Vector2D
      {
         _x = 0;
         _y = 0;
         return this;
      }
      
      public function get isZero() : Boolean
      {
         return _x == 0 && _y == 0;
      }
      
      public function get angle() : Number
      {
         return Math.atan2(_y,_x) * 180 / 3.14159265358979;
      }
      
      public function reverse() : Vector2D
      {
         _x = -_x;
         _y = -_y;
         return this;
      }
      
      public function sign(param1:Vector2D) : int
      {
         return perpRight.dot(param1) < 0?-1:1;
      }
      
      public function dot(param1:Vector2D) : Number
      {
         return _x * param1.x + _y * param1.y;
      }
      
      public function cross(param1:Vector2D) : Number
      {
         return _x * param1.y - _y * param1.x;
      }
      
      public function rotate(param1:Number) : void
      {
         var _loc2_:Number = param1 * DEGRAD;
         var _loc3_:Number = Math.cos(_loc2_);
         var _loc4_:Number = Math.sin(_loc2_);
         _x = _x * _loc3_ - _y * _loc4_;
         _y = _y * _loc3_ + _x * _loc4_;
      }
      
      public function get perpRight() : Vector2D
      {
         return new Vector2D(-_y,_x);
      }
      
      public function limit(param1:Number) : void
      {
         var _loc2_:Number = magnitude;
         if(_loc2_ > param1)
         {
            selfDivide(_loc2_);
            selfMultiply(param1);
         }
      }
      
      public function toPoint() : Point
      {
         return new Point(_x,_y);
      }
      
      public function toString() : String
      {
         return "x:" + int(_x * 100) / 100 + ",\ty:" + int(_y * 100) / 100;
      }
   }
}
