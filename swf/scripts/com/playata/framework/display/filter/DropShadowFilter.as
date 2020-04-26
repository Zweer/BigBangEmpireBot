package com.playata.framework.display.filter
{
   public class DropShadowFilter implements IDisplayObjectFilter
   {
       
      
      public var distance:Number;
      
      public var angle:Number;
      
      public var color:uint;
      
      public var alpha:Number;
      
      public var blur:Number;
      
      public var resolution:Number;
      
      public function DropShadowFilter(param1:Number = 4.0, param2:Number = 0.785, param3:uint = 0, param4:Number = 0.5, param5:Number = 1.0, param6:Number = 0.5)
      {
         super();
         this.distance = param1;
         this.angle = param2;
         this.color = param3;
         this.alpha = param4;
         this.blur = param5;
         this.resolution = param6;
      }
      
      public function get name() : String
      {
         return "dropshadow";
      }
      
      public function equals(param1:IDisplayObjectFilter) : Boolean
      {
         if(!(param1 is DropShadowFilter))
         {
            return false;
         }
         var _loc2_:DropShadowFilter = param1 as DropShadowFilter;
         return _loc2_.distance == this.distance && _loc2_.angle == this.angle && _loc2_.color == this.color && _loc2_.alpha == this.alpha && _loc2_.blur == this.blur && _loc2_.resolution == this.resolution;
      }
   }
}
