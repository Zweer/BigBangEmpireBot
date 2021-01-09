package com.playata.framework.display
{
   import flash.geom.Rectangle;
   
   public class AnchorContainer
   {
       
      
      protected var _currentSize:Rectangle;
      
      protected var _anchorDisplayObjects:Vector.<AnchorDisplayObject>;
      
      public function AnchorContainer(param1:Rectangle)
      {
         super();
         _currentSize = param1;
         _anchorDisplayObjects = new Vector.<AnchorDisplayObject>(0);
      }
      
      public function add(param1:IDisplayObject, param2:AnchorPoint, param3:Number = 1, param4:Number = 0) : void
      {
         update(param1,param2,param3,param4);
      }
      
      public function update(param1:IDisplayObject, param2:AnchorPoint, param3:Number = 1, param4:Number = 0) : void
      {
         var _loc5_:AnchorDisplayObject = new AnchorDisplayObject();
         _loc5_.displayObject = param1;
         _loc5_.anchorPoint = param2;
         _loc5_.percentage = param3;
         _loc5_.offset = param4;
         _anchorDisplayObjects.push(_loc5_);
      }
      
      public function remove(param1:IDisplayObject) : void
      {
         var _loc4_:int = 0;
         var _loc2_:* = null;
         var _loc6_:int = 0;
         var _loc5_:* = _anchorDisplayObjects;
         for each(var _loc3_ in _anchorDisplayObjects)
         {
            if(_loc3_.displayObject == param1)
            {
               _loc2_ = _loc3_;
               break;
            }
         }
         if(_loc2_)
         {
            _loc4_ = _anchorDisplayObjects.indexOf(_loc2_);
            if(_loc4_ != -1)
            {
               _anchorDisplayObjects.removeAt(_loc4_);
            }
         }
      }
      
      public function clear() : void
      {
         _anchorDisplayObjects.length = 0;
      }
      
      public function setSize(param1:Rectangle) : void
      {
         var _loc3_:* = null;
         if(_anchorDisplayObjects.length == 0)
         {
            _currentSize = param1;
            return;
         }
         var _loc7_:Number = param1.y - _currentSize.y;
         var _loc6_:Number = param1.x - _currentSize.x;
         var _loc2_:Number = param1.x + param1.width - (_currentSize.x + _currentSize.width);
         var _loc8_:Number = param1.y + param1.height - (_currentSize.y + _currentSize.height);
         var _loc5_:Number = param1.width;
         var _loc9_:Number = param1.height;
         var _loc11_:int = 0;
         var _loc10_:* = _anchorDisplayObjects;
         for each(var _loc4_ in _anchorDisplayObjects)
         {
            _loc3_ = _loc4_.anchorPoint;
            if(_loc3_ == AnchorPoint.TOP_FIXED)
            {
               _loc4_.displayObject.y = _loc4_.displayObject.y + Math.round(_loc7_ * _loc4_.percentage);
            }
            else if(_loc3_ == AnchorPoint.LEFT_FIXED)
            {
               _loc4_.displayObject.x = _loc4_.displayObject.x + Math.round(_loc6_ * _loc4_.percentage);
            }
            else if(_loc3_ == AnchorPoint.RIGHT_FIXED)
            {
               _loc4_.displayObject.x = _loc4_.displayObject.x + Math.round(_loc2_ * _loc4_.percentage);
            }
            else if(_loc3_ == AnchorPoint.BOTTOM_FIXED)
            {
               _loc4_.displayObject.y = _loc4_.displayObject.y + Math.round(_loc8_ * _loc4_.percentage);
            }
            else if(_loc3_ == AnchorPoint.WIDTH_PERCENTAGE)
            {
               _loc4_.displayObject.x = _loc5_ * _loc4_.percentage + _loc4_.offset;
            }
            else if(_loc3_ == AnchorPoint.HEIGHT_PERCENTAGE)
            {
               _loc4_.displayObject.y = _loc9_ * _loc4_.percentage + _loc4_.offset;
            }
            else if(_loc3_ == AnchorPoint.TOP_LEFT)
            {
               _loc4_.displayObject.y = _loc4_.displayObject.y + Math.round(_loc7_ * _loc4_.percentage);
               _loc4_.displayObject.x = _loc4_.displayObject.x + Math.round(_loc6_ * _loc4_.percentage);
            }
            else if(_loc3_ == AnchorPoint.TOP_RIGHT)
            {
               _loc4_.displayObject.y = _loc4_.displayObject.y + Math.round(_loc7_ * _loc4_.percentage);
               _loc4_.displayObject.x = _loc4_.displayObject.x + Math.round(_loc2_ * _loc4_.percentage);
            }
            else if(_loc3_ == AnchorPoint.BOTTOM_LEFT)
            {
               _loc4_.displayObject.y = _loc4_.displayObject.y + Math.round(_loc8_ * _loc4_.percentage);
               _loc4_.displayObject.x = _loc4_.displayObject.x + Math.round(_loc6_ * _loc4_.percentage);
            }
            else if(_loc3_ == AnchorPoint.BOTTOM_RIGHT)
            {
               _loc4_.displayObject.y = _loc4_.displayObject.y + Math.round(_loc8_ * _loc4_.percentage);
               _loc4_.displayObject.x = _loc4_.displayObject.x + Math.round(_loc2_ * _loc4_.percentage);
            }
            else if(_loc3_ == AnchorPoint.LEFT_RIGHT)
            {
               _loc4_.displayObject.width = _loc4_.displayObject.width + Math.round(_loc2_ * _loc4_.percentage);
            }
            else if(_loc3_ == AnchorPoint.TOP_BOTTOM)
            {
               _loc4_.displayObject.height = _loc4_.displayObject.height + Math.round(_loc8_ * _loc4_.percentage);
            }
         }
         _currentSize = param1;
      }
   }
}
