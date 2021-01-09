package com.playata.framework.display.filter
{
   public class BlurFilter implements IDisplayObjectFilter
   {
       
      
      public var blurX:Number;
      
      public var blurY:Number;
      
      public var quality:int;
      
      public function BlurFilter(param1:Number, param2:Number, param3:int = 1)
      {
         super();
         this.blurX = param1;
         this.blurY = param2;
         this.quality = param3;
      }
      
      public function get name() : String
      {
         return "blur";
      }
      
      public function equals(param1:IDisplayObjectFilter) : Boolean
      {
         if(!(param1 is BlurFilter))
         {
            return false;
         }
         var _loc2_:BlurFilter = param1 as BlurFilter;
         return _loc2_.blurX == this.blurX && _loc2_.blurY == this.blurY && _loc2_.quality == this.quality;
      }
   }
}
