package com.playata.framework.display.filter
{
   public class AdjustColorFilter implements IDisplayObjectFilter
   {
       
      
      public var brightness:Number;
      
      public var contrast:Number;
      
      public var hue:Number;
      
      public var saturation:Number;
      
      public function AdjustColorFilter(param1:Number = 0, param2:Number = 0, param3:Number = 0, param4:Number = 0)
      {
         super();
         this.brightness = param1;
         this.contrast = param2;
         this.hue = param3;
         this.saturation = param4;
      }
      
      public function get name() : String
      {
         return "adjustcolor";
      }
      
      public function equals(param1:IDisplayObjectFilter) : Boolean
      {
         if(!(param1 is AdjustColorFilter))
         {
            return false;
         }
         var _loc2_:AdjustColorFilter = param1 as AdjustColorFilter;
         return _loc2_.brightness == this.brightness && _loc2_.contrast == this.contrast && _loc2_.hue == this.hue && _loc2_.saturation == this.saturation;
      }
   }
}
