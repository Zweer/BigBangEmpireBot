package org.casalib.util
{
   public class ClassUtil
   {
       
      
      public function ClassUtil()
      {
         super();
      }
      
      public static function construct(param1:Class, ... rest) : *
      {
         if(rest.length > 10)
         {
            throw new Error("You have passed more arguments than the \"construct\" method accepts (accepts ten or less).");
         }
         switch(rest.length)
         {
            case 0:
               return new param1();
            case 1:
               return new param1(rest[0]);
            case 2:
               return new param1(rest[0],rest[1]);
            case 3:
               return new param1(rest[0],rest[1],rest[2]);
            case 4:
               return new param1(rest[0],rest[1],rest[2],rest[3]);
            case 5:
               return new param1(rest[0],rest[1],rest[2],rest[3],rest[4]);
            case 6:
               return new param1(rest[0],rest[1],rest[2],rest[3],rest[4],rest[5]);
            case 7:
               return new param1(rest[0],rest[1],rest[2],rest[3],rest[4],rest[5],rest[6]);
            case 8:
               return new param1(rest[0],rest[1],rest[2],rest[3],rest[4],rest[5],rest[6],rest[7]);
            case 9:
               return new param1(rest[0],rest[1],rest[2],rest[3],rest[4],rest[5],rest[6],rest[7],rest[8]);
            case 10:
               return new param1(rest[0],rest[1],rest[2],rest[3],rest[4],rest[5],rest[6],rest[7],rest[8],rest[9]);
            default:
               return;
         }
      }
   }
}
