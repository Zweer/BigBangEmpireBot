package com.playata.framework.display.filter
{
   public class ContrastFilter implements IDisplayObjectFilter
   {
       
      
      public var value:Number;
      
      public function ContrastFilter(param1:Number)
      {
         super();
         this.value = param1;
      }
      
      public function get name() : String
      {
         return "contrast";
      }
      
      public function equals(param1:IDisplayObjectFilter) : Boolean
      {
         if(!(param1 is ContrastFilter))
         {
            return false;
         }
         var _loc2_:ContrastFilter = param1 as ContrastFilter;
         return _loc2_.value == this.value;
      }
   }
}
