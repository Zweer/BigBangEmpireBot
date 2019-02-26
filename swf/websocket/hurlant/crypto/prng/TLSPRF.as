package websocket.hurlant.crypto.prng
{
   import flash.utils.ByteArray;
   import flash.utils.IDataOutput;
   import websocket.hurlant.crypto.hash.HMAC;
   import websocket.hurlant.crypto.hash.MD5;
   import websocket.hurlant.crypto.hash.SHA1;
   import websocket.hurlant.util.Memory;
   
   public class TLSPRF
   {
       
      
      private var seed:ByteArray;
      
      private var s1:ByteArray;
      
      private var s2:ByteArray;
      
      private var a1:ByteArray;
      
      private var a2:ByteArray;
      
      private var p1:ByteArray;
      
      private var p2:ByteArray;
      
      private var d1:ByteArray;
      
      private var d2:ByteArray;
      
      private var hmac_md5:HMAC;
      
      private var hmac_sha1:HMAC;
      
      public function TLSPRF(param1:ByteArray, param2:String, param3:ByteArray)
      {
         super();
         var _loc5_:int = Math.ceil(param1.length / 2);
         var _loc6_:ByteArray = new ByteArray();
         var _loc7_:ByteArray = new ByteArray();
         _loc6_.writeBytes(param1,0,_loc5_);
         _loc7_.writeBytes(param1,param1.length - _loc5_,_loc5_);
         var _loc4_:ByteArray = new ByteArray();
         _loc4_.writeUTFBytes(param2);
         _loc4_.writeBytes(param3);
         this.seed = _loc4_;
         this.s1 = _loc6_;
         this.s2 = _loc7_;
         hmac_md5 = new HMAC(new MD5());
         hmac_sha1 = new HMAC(new SHA1());
         this.a1 = hmac_md5.compute(_loc6_,this.seed);
         this.a2 = hmac_sha1.compute(_loc7_,this.seed);
         p1 = new ByteArray();
         p2 = new ByteArray();
         d1 = new ByteArray();
         d2 = new ByteArray();
         d1.position = 16;
         d1.writeBytes(this.seed);
         d2.position = 20;
         d2.writeBytes(this.seed);
      }
      
      public function nextBytes(param1:IDataOutput, param2:int) : void
      {
         while(true, true)
         {
            param2--;
            if(!param2)
            {
               break;
            }
            param1.writeByte(nextByte());
         }
      }
      
      public function nextByte() : int
      {
         if(p1.bytesAvailable == 0)
         {
            more_md5();
         }
         if(p2.bytesAvailable == 0)
         {
            more_sha1();
         }
         return p1.readUnsignedByte() ^ p2.readUnsignedByte();
      }
      
      public function dispose() : void
      {
         seed = dba(seed);
         s1 = dba(s1);
         s2 = dba(s2);
         a1 = dba(a1);
         a2 = dba(a2);
         p1 = dba(p1);
         p2 = dba(p2);
         d1 = dba(d1);
         d2 = dba(d2);
         hmac_md5.dispose();
         hmac_md5 = null;
         hmac_sha1.dispose();
         hmac_sha1 = null;
         Memory.gc();
      }
      
      public function toString() : String
      {
         return "tls-prf";
      }
      
      private function dba(param1:ByteArray) : ByteArray
      {
         var _loc2_:* = 0;
         _loc2_ = uint(0);
         while(_loc2_ < param1.length)
         {
            param1[_loc2_] = 0;
            _loc2_++;
         }
         param1.length = 0;
         return null;
      }
      
      private function more_md5() : void
      {
         d1.position = 0;
         d1.writeBytes(a1);
         var _loc1_:int = p1.position;
         var _loc2_:ByteArray = hmac_md5.compute(s1,d1);
         a1 = hmac_md5.compute(s1,a1);
         p1.writeBytes(_loc2_);
         p1.position = _loc1_;
      }
      
      private function more_sha1() : void
      {
         d2.position = 0;
         d2.writeBytes(a2);
         var _loc1_:int = p2.position;
         var _loc2_:ByteArray = hmac_sha1.compute(s2,d2);
         a2 = hmac_sha1.compute(s2,a2);
         p2.writeBytes(_loc2_);
         p2.position = _loc1_;
      }
   }
}
