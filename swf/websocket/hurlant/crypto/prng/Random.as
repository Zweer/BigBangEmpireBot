package websocket.hurlant.crypto.prng
{
   import flash.system.Capabilities;
   import flash.system.System;
   import flash.text.Font;
   import flash.utils.ByteArray;
   import flash.utils.getTimer;
   import websocket.hurlant.util.Memory;
   
   public class Random
   {
       
      
      private var state:IPRNG;
      
      private var ready:Boolean = false;
      
      private var pool:ByteArray;
      
      private var psize:int;
      
      private var pptr:int;
      
      private var seeded:Boolean = false;
      
      public function Random(param1:Class = null)
      {
         var _loc2_:* = 0;
         super();
         if(param1 == null)
         {
            param1 = ARC4;
         }
         state = new param1() as IPRNG;
         psize = state.getPoolSize();
         pool = new ByteArray();
         pptr = 0;
         while(pptr < psize)
         {
            _loc2_ = uint(65536 * Math.random());
            pptr = Number(pptr) + 1;
            pool[Number(pptr)] = _loc2_ >>> 8;
            pptr = Number(pptr) + 1;
            pool[Number(pptr)] = _loc2_ & 255;
         }
         pptr = 0;
         seed();
      }
      
      public function seed(param1:int = 0) : void
      {
         if(param1 == 0)
         {
            param1 = new Date().getTime();
         }
         pptr = Number(pptr) + 1;
         var _loc2_:* = Number(pptr);
         var _loc3_:* = pool[_loc2_] ^ param1 & 255;
         pool[_loc2_] = _loc3_;
         pptr = Number(pptr) + 1;
         _loc3_ = Number(pptr);
         _loc2_ = pool[_loc3_] ^ param1 >> 8 & 255;
         pool[_loc3_] = _loc2_;
         pptr = Number(pptr) + 1;
         _loc2_ = Number(pptr);
         _loc3_ = pool[_loc2_] ^ param1 >> 16 & 255;
         pool[_loc2_] = _loc3_;
         pptr = Number(pptr) + 1;
         _loc3_ = Number(pptr);
         _loc2_ = pool[_loc3_] ^ param1 >> 24 & 255;
         pool[_loc3_] = _loc2_;
         pptr = pptr % psize;
         seeded = true;
      }
      
      public function autoSeed() : void
      {
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeUnsignedInt(System.totalMemory);
         _loc2_.writeUTF(Capabilities.serverString);
         _loc2_.writeUnsignedInt(getTimer());
         _loc2_.writeUnsignedInt(new Date().getTime());
         var _loc1_:Array = Font.enumerateFonts(true);
         var _loc5_:int = 0;
         var _loc4_:* = _loc1_;
         for each(var _loc3_ in _loc1_)
         {
            _loc2_.writeUTF(_loc3_.fontName);
            _loc2_.writeUTF(_loc3_.fontStyle);
            _loc2_.writeUTF(_loc3_.fontType);
         }
         _loc2_.position = 0;
         while(_loc2_.bytesAvailable >= 4)
         {
            seed(_loc2_.readUnsignedInt());
         }
      }
      
      public function nextBytes(param1:ByteArray, param2:int) : void
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
         if(!ready)
         {
            if(!seeded)
            {
               autoSeed();
            }
            state.init(pool);
            pool.length = 0;
            pptr = 0;
            ready = true;
         }
         return state.next();
      }
      
      public function dispose() : void
      {
         var _loc1_:* = 0;
         _loc1_ = uint(0);
         while(_loc1_ < pool.length)
         {
            pool[_loc1_] = Math.random() * 256;
            _loc1_++;
         }
         pool.length = 0;
         pool = null;
         state.dispose();
         state = null;
         psize = 0;
         pptr = 0;
         Memory.gc();
      }
      
      public function toString() : String
      {
         return "random-" + state.toString();
      }
   }
}
