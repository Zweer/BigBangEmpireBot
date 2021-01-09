package com.playata.framework.core.util
{
   import com.adobe.crypto.MD5;
   import com.playata.framework.core.error.Exception;
   
   public class CryptoUtil
   {
       
      
      public function CryptoUtil()
      {
         super();
         throw new Exception("This class may not be instantiated directly. Use its static functions instead.");
      }
      
      public static function md5Hash(param1:String) : String
      {
         return MD5.hash(param1);
      }
   }
}
