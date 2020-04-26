package com.playata.framework.display.filter
{
   public class TintFilter implements IDisplayObjectFilter
   {
       
      
      public var color:uint;
      
      public var amount:Number;
      
      public function TintFilter(param1:uint, param2:Number = 1)
      {
         super();
         this.color = param1;
         this.amount = param2;
      }
      
      public function get name() : String
      {
         return "tint";
      }
      
      public function equals(param1:IDisplayObjectFilter) : Boolean
      {
         if(!(param1 is TintFilter))
         {
            return false;
         }
         var _loc2_:TintFilter = param1 as TintFilter;
         return _loc2_.color == this.color && _loc2_.amount == this.amount;
      }
   }
}
