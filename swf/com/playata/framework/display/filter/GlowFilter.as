package com.playata.framework.display.filter
{
   public class GlowFilter implements IDisplayObjectFilter
   {
       
      
      public var color:uint;
      
      public var alpha:Number;
      
      public var blur:Number;
      
      public var resolution:Number;
      
      public var strength:Number;
      
      public function GlowFilter(param1:uint = 16776960, param2:Number = 1.0, param3:Number = 1.0, param4:Number = 0.5, param5:Number = 2.0)
      {
         super();
         this.color = param1;
         this.alpha = param2;
         this.blur = param3;
         this.resolution = param4;
         this.strength = param5;
      }
      
      public function get name() : String
      {
         return "glow";
      }
      
      public function equals(param1:IDisplayObjectFilter) : Boolean
      {
         if(!(param1 is GlowFilter))
         {
            return false;
         }
         var _loc2_:GlowFilter = param1 as GlowFilter;
         return _loc2_.color == this.color && _loc2_.alpha == this.alpha && _loc2_.blur == this.blur && _loc2_.resolution == this.resolution && _loc2_.strength == this.strength;
      }
   }
}
