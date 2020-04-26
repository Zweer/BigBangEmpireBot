package websocket.hurlant.util.der
{
   import flash.utils.ByteArray;
   
   public dynamic class Sequence extends Array implements IAsn1Type
   {
       
      
      protected var type:uint;
      
      protected var len:uint;
      
      public function Sequence(param1:uint = 48, param2:uint = 0)
      {
         super();
         this.type = param1;
         this.len = param2;
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
         var _loc3_:int = 0;
         var _loc1_:* = null;
         var _loc2_:ByteArray = new ByteArray();
         _loc3_ = 0;
         while(_loc3_ < length)
         {
            _loc1_ = this[_loc3_];
            if(_loc1_ == null)
            {
               _loc2_.writeByte(5);
               _loc2_.writeByte(0);
            }
            else
            {
               _loc2_.writeBytes(_loc1_.toDER());
            }
            _loc3_++;
         }
         return DER.wrapDER(type,_loc2_);
      }
      
      public function toString() : String
      {
         var _loc4_:int = 0;
         var _loc2_:Boolean = false;
         var _loc1_:String = DER.indent;
         DER.indent = DER.indent + "    ";
         var _loc3_:String = "";
         _loc4_ = 0;
         while(_loc4_ < length)
         {
            if(this[_loc4_] != null)
            {
               _loc2_ = false;
               var _loc7_:int = 0;
               var _loc6_:* = this;
               for(var _loc5_ in this)
               {
                  if(_loc4_.toString() != _loc5_ && this[_loc4_] == this[_loc5_])
                  {
                     _loc3_ = _loc3_ + (_loc5_ + ": " + this[_loc4_] + "\n");
                     _loc2_ = true;
                     break;
                  }
               }
               if(!_loc2_)
               {
                  _loc3_ = _loc3_ + (this[_loc4_] + "\n");
               }
            }
            _loc4_++;
         }
         DER.indent = _loc1_;
         return DER.indent + "Sequence[" + type + "][" + len + "][\n" + _loc3_ + "\n" + _loc1_ + "]";
      }
      
      public function findAttributeValue(param1:String) : IAsn1Type
      {
         var _loc5_:* = undefined;
         var _loc3_:* = undefined;
         var _loc4_:* = null;
         var _loc7_:int = 0;
         var _loc6_:* = this;
         for each(var _loc2_ in this)
         {
            if(_loc2_ is Set)
            {
               _loc5_ = _loc2_[0];
               if(_loc5_ is Sequence)
               {
                  _loc3_ = _loc5_[0];
                  if(_loc3_ is ObjectIdentifier)
                  {
                     _loc4_ = _loc3_ as ObjectIdentifier;
                     if(_loc4_.toString() == param1)
                     {
                        return _loc5_[1] as IAsn1Type;
                     }
                  }
               }
            }
         }
         return null;
      }
   }
}
