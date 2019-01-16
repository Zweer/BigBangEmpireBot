package com.playata.framework.display.filter
{
   public class GrayscaleFilter implements IDisplayObjectFilter
   {
       
      
      public var a:Number = 1;
      
      public var r:Number = 0.299;
      
      public var g:Number = 0.587;
      
      public var b:Number = 0.114;
      
      public function GrayscaleFilter(param1:Number = 1, param2:Number = 0.299, param3:Number = 0.587, param4:Number = 0.114)
      {
         super();
         this.a = param1;
         this.r = param2;
         this.g = param3;
         this.b = param4;
      }
      
      public function get name() : String
      {
         return "grayscale";
      }
      
      public function equals(param1:IDisplayObjectFilter) : Boolean
      {
         if(!(param1 is GrayscaleFilter))
         {
            return false;
         }
         var _loc2_:GrayscaleFilter = param1 as GrayscaleFilter;
         return _loc2_.a == this.a && _loc2_.r == this.r && _loc2_.g == this.g && _loc2_.b == this.b;
      }
   }
}
