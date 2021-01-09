package websocket.hurlant.util.der
{
   import flash.utils.ByteArray;
   
   public class ObjectIdentifier implements IAsn1Type
   {
       
      
      private var type:uint;
      
      private var len:uint;
      
      private var oid:Array;
      
      public function ObjectIdentifier(param1:uint, param2:uint, param3:*)
      {
         super();
         this.type = param1;
         this.len = param2;
         if(param3 is ByteArray)
         {
            parse(param3 as ByteArray);
         }
         else if(param3 is String)
         {
            generate(param3 as String);
         }
         else
         {
            throw new Error("Invalid call to new ObjectIdentifier");
         }
      }
      
      private function generate(param1:String) : void
      {
         oid = param1.split(".");
      }
      
      private function parse(param1:ByteArray) : void
      {
         var _loc3_:* = false;
         var _loc5_:uint = param1.readUnsignedByte();
         var _loc2_:Array = [];
         _loc2_.push(uint(_loc5_ / 40));
         _loc2_.push(uint(_loc5_ % 40));
         var _loc4_:uint = 0;
         while(param1.bytesAvailable > 0)
         {
            _loc5_ = param1.readUnsignedByte();
            _loc3_ = (_loc5_ & 128) == 0;
            _loc5_ = _loc5_ & 127;
            _loc4_ = _loc4_ * 128 + _loc5_;
            if(_loc3_)
            {
               _loc2_.push(_loc4_);
               _loc4_ = 0;
            }
         }
         oid = _loc2_;
      }
      
      public function getLength() : uint
      {
         return len;
      }
      
      public function getType() : uint
      {
         return type;
      }
      
      public function toDER() : ByteArray
      {
         var _loc4_:int = 0;
         var _loc3_:int = 0;
         var _loc2_:Array = [];
         _loc2_[0] = oid[0] * 40 + oid[1];
         _loc4_ = 2;
         while(_loc4_ < oid.length)
         {
            _loc3_ = parseInt(oid[_loc4_]);
            if(_loc3_ < 128)
            {
               _loc2_.push(_loc3_);
            }
            else if(_loc3_ < 16384)
            {
               _loc2_.push(_loc3_ >> 7 | 128);
               _loc2_.push(_loc3_ & 127);
            }
            else if(_loc3_ < 2097152)
            {
               _loc2_.push(_loc3_ >> 14 | 128);
               _loc2_.push(_loc3_ >> 7 & 127 | 128);
               _loc2_.push(_loc3_ & 127);
            }
            else if(_loc3_ < 268435456)
            {
               _loc2_.push(_loc3_ >> 21 | 128);
               _loc2_.push(_loc3_ >> 14 & 127 | 128);
               _loc2_.push(_loc3_ >> 7 & 127 | 128);
               _loc2_.push(_loc3_ & 127);
            }
            else
            {
               throw new Error("OID element bigger than we thought. :(");
            }
            _loc4_++;
         }
         len = _loc2_.length;
         if(type == 0)
         {
            type = 6;
         }
         _loc2_.unshift(len);
         _loc2_.unshift(type);
         var _loc1_:ByteArray = new ByteArray();
         _loc4_ = 0;
         while(_loc4_ < _loc2_.length)
         {
            _loc1_[_loc4_] = _loc2_[_loc4_];
            _loc4_++;
         }
         return _loc1_;
      }
      
      public function toString() : String
      {
         return DER.indent + oid.join(".");
      }
      
      public function dump() : String
      {
         return "OID[" + type + "][" + len + "][" + toString() + "]";
      }
   }
}
