package websocket.hurlant.util
{
   import flash.utils.ByteArray;
   
   public class ArrayUtil
   {
       
      
      public function ArrayUtil()
      {
         super();
      }
      
      public static function equals(param1:ByteArray, param2:ByteArray) : Boolean
      {
         var _loc3_:int = 0;
         if(param1.length != param2.length)
         {
            return false;
         }
         var _loc4_:int = param1.length;
         _loc3_ = 0;
         while(_loc3_ < _loc4_)
         {
            if(param1[_loc3_] != param2[_loc3_])
            {
               return false;
            }
            _loc3_++;
         }
         return true;
      }
   }
}
