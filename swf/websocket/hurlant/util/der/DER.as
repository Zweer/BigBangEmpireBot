package websocket.hurlant.util.der
{
   import flash.utils.ByteArray;
   
   public class DER
   {
      
      public static var indent:String = "";
       
      
      public function DER()
      {
         super();
      }
      
      public static function parse(param1:ByteArray, param2:* = null) : IAsn1Type
      {
         var _loc6_:* = 0;
         var _loc3_:* = null;
         var _loc10_:int = 0;
         var _loc9_:* = null;
         var _loc18_:* = null;
         var _loc19_:* = null;
         var _loc15_:* = false;
         var _loc7_:Boolean = false;
         var _loc17_:* = null;
         var _loc20_:* = undefined;
         var _loc14_:int = 0;
         var _loc21_:* = null;
         var _loc16_:* = null;
         var _loc12_:* = null;
         var _loc11_:* = null;
         var _loc4_:* = null;
         var _loc22_:* = null;
         var _loc8_:* = int(param1.readUnsignedByte());
         var _loc5_:* = (_loc8_ & 32) != 0;
         _loc8_ = _loc8_ & 31;
         var _loc13_:* = int(param1.readUnsignedByte());
         if(_loc13_ >= 128)
         {
            _loc6_ = _loc13_ & 127;
            _loc13_ = 0;
            while(_loc6_ > 0)
            {
               _loc13_ = _loc13_ << 8 | param1.readUnsignedByte();
               _loc6_--;
            }
         }
         var _loc23_:* = _loc8_;
         switch(_loc23_)
         {
            case 0:
            case 16:
               _loc10_ = param1.position;
               _loc9_ = new Sequence(_loc8_,_loc13_);
               _loc18_ = param2 as Array;
               if(_loc18_ != null)
               {
                  _loc18_ = _loc18_.concat();
               }
               while(param1.position < _loc10_ + _loc13_)
               {
                  _loc19_ = null;
                  if(_loc18_ != null)
                  {
                     _loc19_ = _loc18_.shift();
                  }
                  if(_loc19_ != null)
                  {
                     while(_loc19_ && _loc19_.optional)
                     {
                        _loc15_ = _loc19_.value is Array;
                        _loc7_ = isConstructedType(param1);
                        if(_loc15_ != _loc7_)
                        {
                           _loc9_.push(_loc19_.defaultValue);
                           _loc9_[_loc19_.name] = _loc19_.defaultValue;
                           _loc19_ = _loc18_.shift();
                           continue;
                        }
                        break;
                     }
                  }
                  if(_loc19_ != null)
                  {
                     _loc17_ = _loc19_.name;
                     _loc20_ = _loc19_.value;
                     if(_loc19_.extract)
                     {
                        _loc14_ = getLengthOfNextElement(param1);
                        _loc21_ = new ByteArray();
                        _loc21_.writeBytes(param1,param1.position,_loc14_);
                        _loc9_[_loc17_ + "_bin"] = _loc21_;
                     }
                     _loc16_ = DER.parse(param1,_loc20_);
                     _loc9_.push(_loc16_);
                     _loc9_[_loc17_] = _loc16_;
                  }
                  else
                  {
                     _loc9_.push(DER.parse(param1));
                  }
               }
               return _loc9_;
            case 17:
               _loc10_ = param1.position;
               _loc12_ = new Set(_loc8_,_loc13_);
               while(param1.position < _loc10_ + _loc13_)
               {
                  _loc12_.push(DER.parse(param1));
               }
               return _loc12_;
            case 2:
               _loc3_ = new ByteArray();
               param1.readBytes(_loc3_,0,_loc13_);
               _loc3_.position = 0;
               return new Integer(_loc8_,_loc13_,_loc3_);
            case 6:
               _loc3_ = new ByteArray();
               param1.readBytes(_loc3_,0,_loc13_);
               _loc3_.position = 0;
               return new ObjectIdentifier(_loc8_,_loc13_,_loc3_);
            default:
               trace("I DONT KNOW HOW TO HANDLE DER stuff of TYPE " + _loc8_);
            case 3:
               if(param1[param1.position] == 0)
               {
                  param1.position++;
                  _loc13_--;
               }
            case 4:
               _loc11_ = new ByteString(_loc8_,_loc13_);
               param1.readBytes(_loc11_,0,_loc13_);
               return _loc11_;
            case 5:
               return null;
            case 19:
               _loc4_ = new PrintableString(_loc8_,_loc13_);
               _loc4_.setString(param1.readMultiByte(_loc13_,"US-ASCII"));
               return _loc4_;
            case 34:
            case 20:
               _loc4_ = new PrintableString(_loc8_,_loc13_);
               _loc4_.setString(param1.readMultiByte(_loc13_,"latin1"));
               return _loc4_;
            case 23:
               _loc22_ = new UTCTime(_loc8_,_loc13_);
               _loc22_.setUTCTime(param1.readMultiByte(_loc13_,"US-ASCII"));
               return _loc22_;
         }
      }
      
      private static function getLengthOfNextElement(param1:ByteArray) : int
      {
         var _loc4_:* = 0;
         var _loc2_:uint = param1.position;
         param1.position++;
         var _loc3_:* = int(param1.readUnsignedByte());
         if(_loc3_ >= 128)
         {
            _loc4_ = _loc3_ & 127;
            _loc3_ = 0;
            while(_loc4_ > 0)
            {
               _loc3_ = _loc3_ << 8 | param1.readUnsignedByte();
               _loc4_--;
            }
         }
         _loc3_ = int(_loc3_ + (param1.position - _loc2_));
         param1.position = _loc2_;
         return _loc3_;
      }
      
      private static function isConstructedType(param1:ByteArray) : Boolean
      {
         var _loc2_:int = param1[param1.position];
         return (_loc2_ & 32) != 0;
      }
      
      public static function wrapDER(param1:int, param2:ByteArray) : ByteArray
      {
         var _loc3_:ByteArray = new ByteArray();
         _loc3_.writeByte(param1);
         var _loc4_:int = param2.length;
         if(_loc4_ < 128)
         {
            _loc3_.writeByte(_loc4_);
         }
         else if(_loc4_ < 256)
         {
            _loc3_.writeByte(129);
            _loc3_.writeByte(_loc4_);
         }
         else if(_loc4_ < 65536)
         {
            _loc3_.writeByte(130);
            _loc3_.writeByte(_loc4_ >> 8);
            _loc3_.writeByte(_loc4_);
         }
         else if(_loc4_ < 16777216)
         {
            _loc3_.writeByte(131);
            _loc3_.writeByte(_loc4_ >> 16);
            _loc3_.writeByte(_loc4_ >> 8);
            _loc3_.writeByte(_loc4_);
         }
         else
         {
            _loc3_.writeByte(132);
            _loc3_.writeByte(_loc4_ >> 24);
            _loc3_.writeByte(_loc4_ >> 16);
            _loc3_.writeByte(_loc4_ >> 8);
            _loc3_.writeByte(_loc4_);
         }
         _loc3_.writeBytes(param2);
         _loc3_.position = 0;
         return _loc3_;
      }
   }
}
