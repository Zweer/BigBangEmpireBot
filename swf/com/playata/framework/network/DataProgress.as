package com.playata.framework.network
{
   public class DataProgress
   {
       
      
      public var bytesLoaded:Number = 0;
      
      public var bytesTotal:Number = 0;
      
      public function DataProgress(param1:Number, param2:Number)
      {
         super();
         this.bytesLoaded = param1;
         this.bytesTotal = param2;
      }
      
      public function get isLoaded() : Boolean
      {
         return bytesLoaded >= bytesTotal;
      }
      
      public function get loadRatio() : Number
      {
         return bytesLoaded / bytesTotal;
      }
      
      public function get loadPercentage() : Number
      {
         return loadRatio * 100;
      }
   }
}
