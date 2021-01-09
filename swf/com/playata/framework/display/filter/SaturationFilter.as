package com.playata.framework.display.filter
{
   public class SaturationFilter implements IDisplayObjectFilter
   {
       
      
      public var value:Number;
      
      public function SaturationFilter(param1:Number)
      {
         super();
         this.value = param1;
      }
      
      public function get name() : String
      {
         return "saturation";
      }
      
      public function equals(param1:IDisplayObjectFilter) : Boolean
      {
         if(!(param1 is SaturationFilter))
         {
            return false;
         }
         var _loc2_:SaturationFilter = param1 as SaturationFilter;
         return _loc2_.value == this.value;
      }
   }
}
