package com.playata.framework.display.filter
{
   public class BrightnessFilter implements IDisplayObjectFilter
   {
       
      
      public var value:Number;
      
      public function BrightnessFilter(param1:Number)
      {
         super();
         this.value = param1;
      }
      
      public function get name() : String
      {
         return "brightness";
      }
      
      public function equals(param1:IDisplayObjectFilter) : Boolean
      {
         if(!(param1 is BrightnessFilter))
         {
            return false;
         }
         var _loc2_:BrightnessFilter = param1 as BrightnessFilter;
         return _loc2_.value == this.value;
      }
   }
}
