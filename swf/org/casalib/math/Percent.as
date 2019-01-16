package org.casalib.math
{
   public class Percent
   {
       
      
      protected var _percent:Number;
      
      public function Percent(param1:Number = 0, param2:Boolean = true)
      {
         super();
         if(param2)
         {
            this.decimalPercentage = param1;
         }
         else
         {
            this.percentage = param1;
         }
      }
      
      public function get percentage() : Number
      {
         return 100 * this._percent;
      }
      
      public function set percentage(param1:Number) : void
      {
         this._percent = param1 * 0.01;
      }
      
      public function get decimalPercentage() : Number
      {
         return this._percent;
      }
      
      public function set decimalPercentage(param1:Number) : void
      {
         this._percent = param1;
      }
      
      public function equals(param1:Percent) : Boolean
      {
         return this.decimalPercentage == param1.decimalPercentage;
      }
      
      public function clone() : Percent
      {
         return new Percent(this.decimalPercentage);
      }
      
      public function valueOf() : Number
      {
         return this.decimalPercentage;
      }
      
      public function toString() : String
      {
         return this.decimalPercentage.toString();
      }
   }
}
