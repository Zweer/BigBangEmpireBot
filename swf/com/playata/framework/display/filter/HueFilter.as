package com.playata.framework.display.filter
{
   public class HueFilter implements IDisplayObjectFilter
   {
       
      
      public var value:Number;
      
      public function HueFilter(param1:Number)
      {
         super();
         this.value = param1;
      }
      
      public function get name() : String
      {
         return "hue";
      }
      
      public function equals(param1:IDisplayObjectFilter) : Boolean
      {
         if(!(param1 is HueFilter))
         {
            return false;
         }
         var _loc2_:HueFilter = param1 as HueFilter;
         return _loc2_.value == this.value;
      }
   }
}
