package websocket.hurlant.crypto.hash
{
   import flash.utils.ByteArray;
   
   public class MAC implements IHMAC
   {
       
      
      private var hash:IHash;
      
      private var bits:uint;
      
      private var pad_1:ByteArray;
      
      private var pad_2:ByteArray;
      
      private var innerHash:ByteArray;
      
      private var outerHash:ByteArray;
      
      private var outerKey:ByteArray;
      
      private var innerKey:ByteArray;
      
      public function MAC(param1:IHash, param2:uint = 0)
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         super();
         this.hash = param1;
         this.bits = param2;
         innerHash = new ByteArray();
         outerHash = new ByteArray();
         innerKey = new ByteArray();
         outerKey = new ByteArray();
         if(param1 != null)
         {
            _loc3_ = param1.getPadSize();
            pad_1 = new ByteArray();
            pad_2 = new ByteArray();
            _loc4_ = 0;
            while(_loc4_ < _loc3_)
            {
               pad_1.writeByte(54);
               pad_2.writeByte(92);
               _loc4_++;
            }
         }
      }
      
      public function setPadSize(param1:int) : void
      {
      }
      
      public function getHashSize() : uint
      {
         if(bits != 0)
         {
            return bits / 8;
         }
         return hash.getHashSize();
      }
      
      public function compute(param1:ByteArray, param2:ByteArray) : ByteArray
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         if(pad_1 == null)
         {
            _loc3_ = hash.getPadSize();
            pad_1 = new ByteArray();
            pad_2 = new ByteArray();
            _loc4_ = 0;
            while(_loc4_ < _loc3_)
            {
               pad_1.writeByte(54);
               pad_2.writeByte(92);
               _loc4_++;
            }
         }
         innerKey.length = 0;
         outerKey.length = 0;
         innerKey.writeBytes(param1);
         innerKey.writeBytes(pad_1);
         innerKey.writeBytes(param2);
         innerHash = hash.hash(innerKey);
         outerKey.writeBytes(param1);
         outerKey.writeBytes(pad_2);
         outerKey.writeBytes(innerHash);
         outerHash = hash.hash(outerKey);
         if(bits > 0 && bits < 8 * outerHash.length)
         {
            outerHash.length = bits / 8;
         }
         return outerHash;
      }
      
      public function dispose() : void
      {
         hash = null;
         bits = 0;
      }
      
      public function toString() : String
      {
         return "mac-" + (bits > 0?bits + "-":"") + hash.toString();
      }
   }
}
