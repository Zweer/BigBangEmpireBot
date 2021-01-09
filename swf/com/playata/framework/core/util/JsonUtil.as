package com.playata.framework.core.util
{
   import com.playata.framework.core.error.Exception;
   
   public class JsonUtil
   {
       
      
      public function JsonUtil()
      {
         super();
         throw new Exception("This class may not be instantiated directly. Use its static functions instead.");
      }
      
      public static function encode(param1:Object) : String
      {
         return JSON.stringify(param1);
      }
      
      public static function decode(param1:String) : *
      {
         return JSON.parse(param1);
      }
   }
}
