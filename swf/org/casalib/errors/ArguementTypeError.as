package org.casalib.errors
{
   public class ArguementTypeError extends ArgumentError
   {
       
      
      public function ArguementTypeError(param1:String = null)
      {
         super(param1 == null?"You passed an argument with an incorrect type to this method.":"The argument type you passed for parameter \"" + param1 + "\" is not allowed by this method.");
      }
   }
}
