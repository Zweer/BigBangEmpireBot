package starling.rendering
{
   import flash.display3D.VertexBuffer3D;
   import flash.utils.Dictionary;
   import starling.core.Starling;
   import starling.utils.StringUtil;
   
   public class VertexDataFormat
   {
      
      private static var sFormats:Dictionary = new Dictionary();
       
      
      private var _format:String;
      
      private var _vertexSize:int;
      
      private var _attributes:Vector.<VertexDataAttribute>;
      
      public function VertexDataFormat()
      {
         super();
         _attributes = new Vector.<VertexDataAttribute>();
      }
      
      public static function fromString(param1:String) : VertexDataFormat
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         if(param1 in sFormats)
         {
            return sFormats[param1];
         }
         _loc2_ = new VertexDataFormat();
         _loc2_.parseFormat(param1);
         _loc3_ = _loc2_._format;
         if(_loc3_ in sFormats)
         {
            _loc2_ = sFormats[_loc3_];
         }
         sFormats[param1] = _loc2_;
         sFormats[_loc3_] = _loc2_;
         return _loc2_;
      }
      
      public function extend(param1:String) : VertexDataFormat
      {
         return fromString(_format + ", " + param1);
      }
      
      public function getSize(param1:String) : int
      {
         return getAttribute(param1).size;
      }
      
      public function getSizeIn32Bits(param1:String) : int
      {
         return getAttribute(param1).size / 4;
      }
      
      public function getOffset(param1:String) : int
      {
         return getAttribute(param1).offset;
      }
      
      public function getOffsetIn32Bits(param1:String) : int
      {
         return getAttribute(param1).offset / 4;
      }
      
      public function getFormat(param1:String) : String
      {
         return getAttribute(param1).format;
      }
      
      public function getName(param1:int) : String
      {
         return _attributes[param1].name;
      }
      
      public function hasAttribute(param1:String) : Boolean
      {
         var _loc3_:int = 0;
         var _loc2_:int = _attributes.length;
         _loc3_ = 0;
         while(_loc3_ < _loc2_)
         {
            if(_attributes[_loc3_].name == param1)
            {
               return true;
            }
            _loc3_++;
         }
         return false;
      }
      
      public function setVertexBufferAt(param1:int, param2:VertexBuffer3D, param3:String) : void
      {
         var _loc4_:VertexDataAttribute = getAttribute(param3);
         Starling.context.setVertexBufferAt(param1,param2,_loc4_.offset / 4,_loc4_.format);
      }
      
      private function parseFormat(param1:String) : void
      {
         var _loc5_:* = null;
         var _loc4_:int = 0;
         var _loc3_:int = 0;
         var _loc6_:int = 0;
         var _loc10_:* = null;
         var _loc7_:* = null;
         var _loc9_:* = null;
         var _loc2_:* = null;
         var _loc8_:* = null;
         if(param1 != null && param1 != "")
         {
            _attributes.length = 0;
            _format = "";
            _loc5_ = param1.split(",");
            _loc4_ = _loc5_.length;
            _loc3_ = 0;
            _loc6_ = 0;
            while(_loc6_ < _loc4_)
            {
               _loc10_ = _loc5_[_loc6_];
               _loc7_ = _loc10_.split(":");
               if(_loc7_.length != 2)
               {
                  throw new ArgumentError("Missing colon: " + _loc10_);
               }
               _loc9_ = StringUtil.trim(_loc7_[0]);
               _loc2_ = StringUtil.trim(_loc7_[1]);
               if(_loc9_.length == 0 || _loc2_.length == 0)
               {
                  throw new ArgumentError("Invalid format string: " + _loc10_);
               }
               _loc8_ = new VertexDataAttribute(_loc9_,_loc2_,_loc3_);
               _loc3_ = _loc3_ + _loc8_.size;
               _format = _format + ((_loc6_ == 0?"":", ") + _loc8_.name + ":" + _loc8_.format);
               _attributes[_attributes.length] = _loc8_;
               _loc6_++;
            }
            _vertexSize = _loc3_;
         }
         else
         {
            _format = "";
         }
      }
      
      public function toString() : String
      {
         return _format;
      }
      
      function getAttribute(param1:String) : VertexDataAttribute
      {
         var _loc4_:* = null;
         var _loc3_:int = 0;
         var _loc2_:int = _attributes.length;
         _loc3_ = 0;
         while(_loc3_ < _loc2_)
         {
            _loc4_ = _attributes[_loc3_];
            if(_loc4_.name == param1)
            {
               return _loc4_;
            }
            _loc3_++;
         }
         return null;
      }
      
      function get attributes() : Vector.<VertexDataAttribute>
      {
         return _attributes;
      }
      
      public function get formatString() : String
      {
         return _format;
      }
      
      public function get vertexSize() : int
      {
         return _vertexSize;
      }
      
      public function get vertexSizeIn32Bits() : int
      {
         return _vertexSize / 4;
      }
      
      public function get numAttributes() : int
      {
         return _attributes.length;
      }
   }
}
