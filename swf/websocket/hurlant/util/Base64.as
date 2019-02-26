package websocket.hurlant.util
{
   import flash.utils.ByteArray;
   
   public class Base64
   {
      
      private static const _encodeChars:Vector.<int> = InitEncoreChar();
      
      private static const _decodeChars:Vector.<int> = InitDecodeChar();
       
      
      public function Base64()
      {
         super();
      }
      
      public static function encodeByteArray(param1:ByteArray) : String
      {
         var _loc3_:* = 0;
         var _loc6_:ByteArray = new ByteArray();
         _loc6_.length = (2 + param1.length - (param1.length + 2) % 3) * 4 / 3;
         var _loc5_:int = 0;
         var _loc2_:int = param1.length % 3;
         var _loc4_:int = param1.length - _loc2_;
         while(_loc5_ < _loc4_)
         {
            _loc5_++;
            _loc5_++;
            _loc5_++;
            _loc3_ = param1[_loc5_] << 16 | param1[_loc5_] << 8 | param1[_loc5_];
            _loc3_ = _encodeChars[_loc3_ >>> 18] << 24 | _encodeChars[_loc3_ >>> 12 & 63] << 16 | _encodeChars[_loc3_ >>> 6 & 63] << 8 | _encodeChars[_loc3_ & 63];
            _loc6_.writeInt(_loc3_);
         }
         if(_loc2_ == 1)
         {
            _loc3_ = int(param1[_loc5_]);
            _loc3_ = _encodeChars[_loc3_ >>> 2] << 24 | _encodeChars[(_loc3_ & 3) << 4] << 16 | 15616 | 61;
            _loc6_.writeInt(_loc3_);
         }
         else if(_loc2_ == 2)
         {
            _loc5_++;
            _loc3_ = param1[_loc5_] << 8 | param1[_loc5_];
            _loc3_ = _encodeChars[_loc3_ >>> 10] << 24 | _encodeChars[_loc3_ >>> 4 & 63] << 16 | _encodeChars[(_loc3_ & 15) << 2] << 8 | 61;
            _loc6_.writeInt(_loc3_);
         }
         _loc6_.position = 0;
         return _loc6_.readUTFBytes(_loc6_.length);
      }
      
      public static function decodeToByteArray(param1:String) : ByteArray
      {
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc6_:int = 0;
         var _loc4_:int = 0;
         var _loc9_:* = null;
         _loc4_ = param1.length;
         _loc6_ = 0;
         _loc9_ = new ByteArray();
         var _loc5_:ByteArray = new ByteArray();
         _loc5_.writeUTFBytes(param1);
         loop0:
         while(_loc6_ < _loc4_)
         {
            do
            {
               _loc6_++;
               _loc7_ = _decodeChars[_loc5_[_loc6_]];
            }
            while(_loc6_ < _loc4_ && _loc7_ == -1);
            
            if(_loc7_ != -1)
            {
               do
               {
                  _loc6_++;
                  _loc8_ = _decodeChars[_loc5_[_loc6_]];
               }
               while(_loc6_ < _loc4_ && _loc8_ == -1);
               
               if(_loc8_ != -1)
               {
                  _loc9_.writeByte(_loc7_ << 2 | (_loc8_ & 48) >> 4);
                  while(true, true)
                  {
                     _loc6_++;
                     _loc2_ = _loc5_[_loc6_];
                     if(_loc2_ == 61)
                     {
                        break;
                     }
                     _loc2_ = _decodeChars[_loc2_];
                     if(!(_loc6_ < _loc4_ && _loc2_ == -1))
                     {
                        if(_loc2_ != -1)
                        {
                           _loc9_.writeByte((_loc8_ & 15) << 4 | (_loc2_ & 60) >> 2);
                           while(true, true)
                           {
                              _loc6_++;
                              _loc3_ = _loc5_[_loc6_];
                              if(_loc3_ == 61)
                              {
                                 break;
                              }
                              _loc3_ = _decodeChars[_loc3_];
                              if(!(_loc6_ < _loc4_ && _loc3_ == -1))
                              {
                                 if(_loc3_ != -1)
                                 {
                                    _loc9_.writeByte((_loc2_ & 3) << 6 | _loc3_);
                                    continue loop0;
                                 }
                                 break loop0;
                              }
                           }
                           return _loc9_;
                        }
                        break loop0;
                     }
                  }
                  return _loc9_;
               }
               break;
            }
            break;
         }
         _loc9_.position = 0;
         return _loc9_;
      }
      
      public static function encode(param1:String) : String
      {
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeUTFBytes(param1);
         return encodeByteArray(_loc2_);
      }
      
      public static function decode(param1:String) : String
      {
         var _loc2_:ByteArray = decodeToByteArray(param1);
         return _loc2_.readUTFBytes(_loc2_.length);
      }
      
      public static function InitEncoreChar() : Vector.<int>
      {
         var _loc1_:int = 0;
         var _loc2_:Vector.<int> = new Vector.<int>();
         var _loc3_:String = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";
         _loc1_ = 0;
         while(_loc1_ < 64)
         {
            _loc2_.push(_loc3_.charCodeAt(_loc1_));
            _loc1_++;
         }
         return _loc2_;
      }
      
      public static function InitDecodeChar() : Vector.<int>
      {
         var _loc1_:Vector.<int> = new Vector.<int>();
         _loc1_.push(-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,62,-1,-1,-1,63,52,53,54,55,56,57,58,59,60,61,-1,-1,-1,-1,-1,-1,-1,0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,-1,-1,-1,-1,-1,-1,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,-1,-1,-1,-1,-2,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1);
         return _loc1_;
      }
   }
}
