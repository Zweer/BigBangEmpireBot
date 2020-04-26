package websocket.hurlant.crypto.tls
{
   import flash.utils.ByteArray;
   import websocket.hurlant.crypto.hash.HMAC;
   import websocket.hurlant.crypto.symmetric.ICipher;
   import websocket.hurlant.crypto.symmetric.IVMode;
   import websocket.hurlant.util.ArrayUtil;
   
   public class TLSConnectionState implements IConnectionState
   {
       
      
      private var bulkCipher:uint;
      
      private var cipherType:uint;
      
      private var CIPHER_key:ByteArray;
      
      private var CIPHER_IV:ByteArray;
      
      private var cipher:ICipher;
      
      private var ivmode:IVMode;
      
      private var macAlgorithm:uint;
      
      private var MAC_write_secret:ByteArray;
      
      private var hmac:HMAC;
      
      private var seq_lo:uint;
      
      private var seq_hi:uint;
      
      public function TLSConnectionState(param1:uint = 0, param2:uint = 0, param3:uint = 0, param4:ByteArray = null, param5:ByteArray = null, param6:ByteArray = null)
      {
         super();
         this.bulkCipher = param1;
         this.cipherType = param2;
         this.macAlgorithm = param3;
         MAC_write_secret = param4;
         hmac = MACs.getHMAC(param3);
         CIPHER_key = param5;
         CIPHER_IV = param6;
         cipher = BulkCiphers.getCipher(param1,param5,769);
         if(cipher is IVMode)
         {
            ivmode = cipher as IVMode;
            ivmode.IV = param6;
         }
      }
      
      public function decrypt(param1:uint, param2:uint, param3:ByteArray) : ByteArray
      {
         var _loc7_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = 0;
         var _loc8_:* = null;
         var _loc4_:* = null;
         if(cipherType == 0)
         {
            if(bulkCipher != 0)
            {
               cipher.decrypt(param3);
            }
         }
         else
         {
            _loc7_ = new ByteArray();
            _loc7_.writeBytes(param3,param3.length - CIPHER_IV.length,CIPHER_IV.length);
            cipher.decrypt(param3);
            CIPHER_IV = _loc7_;
            ivmode.IV = _loc7_;
         }
         if(macAlgorithm != 0)
         {
            _loc5_ = new ByteArray();
            _loc6_ = uint(param3.length - hmac.getHashSize());
            _loc5_.writeUnsignedInt(seq_hi);
            _loc5_.writeUnsignedInt(seq_lo);
            _loc5_.writeByte(param1);
            _loc5_.writeShort(769);
            _loc5_.writeShort(_loc6_);
            if(_loc6_ != 0)
            {
               _loc5_.writeBytes(param3,0,_loc6_);
            }
            _loc8_ = hmac.compute(MAC_write_secret,_loc5_);
            _loc4_ = new ByteArray();
            _loc4_.writeBytes(param3,_loc6_,hmac.getHashSize());
            if(!ArrayUtil.equals(_loc8_,_loc4_))
            {
               throw new TLSError("Bad Mac Data",20);
            }
            param3.length = _loc6_;
            param3.position = 0;
         }
         seq_lo = Number(seq_lo) + 1;
         if(seq_lo == 0)
         {
            seq_hi = Number(seq_hi) + 1;
         }
         return param3;
      }
      
      public function encrypt(param1:uint, param2:ByteArray) : ByteArray
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:ByteArray = null;
         if(macAlgorithm != 0)
         {
            _loc3_ = new ByteArray();
            _loc3_.writeUnsignedInt(seq_hi);
            _loc3_.writeUnsignedInt(seq_lo);
            _loc3_.writeByte(param1);
            _loc3_.writeShort(769);
            _loc3_.writeShort(param2.length);
            if(param2.length != 0)
            {
               _loc3_.writeBytes(param2,0,param2.length);
            }
            _loc5_ = hmac.compute(MAC_write_secret,_loc3_);
            param2.position = param2.length;
            param2.writeBytes(_loc5_);
         }
         param2.position = 0;
         if(cipherType == 0)
         {
            if(bulkCipher != 0)
            {
               cipher.encrypt(param2);
            }
         }
         else
         {
            cipher.encrypt(param2);
            _loc4_ = new ByteArray();
            _loc4_.writeBytes(param2,param2.length - CIPHER_IV.length,CIPHER_IV.length);
            CIPHER_IV = _loc4_;
            ivmode.IV = _loc4_;
         }
         seq_lo = Number(seq_lo) + 1;
         if(seq_lo == 0)
         {
            seq_hi = Number(seq_hi) + 1;
         }
         return param2;
      }
   }
}
