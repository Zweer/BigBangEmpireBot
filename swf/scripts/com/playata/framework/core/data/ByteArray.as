package com.playata.framework.core.data
{
   import com.playata.framework.core.lib.flash.FlashByteArray;
   
   public class ByteArray implements IByteArray
   {
       
      
      private var _byteArray:IByteArray = null;
      
      public function ByteArray()
      {
         super();
         _byteArray = new FlashByteArray();
      }
      
      public static function fromClass(param1:Class) : IByteArray
      {
         return new FlashByteArray(new param1());
      }
      
      public function get bytesAvailable() : uint
      {
         return _byteArray.bytesAvailable;
      }
      
      public function get objectEncoding() : uint
      {
         return _byteArray.objectEncoding;
      }
      
      public function set objectEncoding(param1:uint) : void
      {
         _byteArray.objectEncoding = param1;
      }
      
      public function get position() : uint
      {
         return _byteArray.position;
      }
      
      public function set position(param1:uint) : void
      {
         _byteArray.position = param1;
      }
      
      public function get length() : uint
      {
         return _byteArray.length;
      }
      
      public function set length(param1:uint) : void
      {
         _byteArray.length = param1;
      }
      
      public function deflate() : void
      {
         _byteArray.deflate();
      }
      
      public function inflate() : void
      {
         _byteArray.inflate();
      }
      
      public function compress(param1:String = "zlib") : void
      {
         _byteArray.compress(param1);
      }
      
      public function uncompress(param1:String = "zlib") : void
      {
         _byteArray.uncompress(param1);
      }
      
      public function clear() : void
      {
         return _byteArray.clear();
      }
      
      public function getByte(param1:uint) : int
      {
         return _byteArray.getByte(param1);
      }
      
      public function readByte() : int
      {
         return _byteArray.readByte();
      }
      
      public function readUnsignedByte() : uint
      {
         return _byteArray.readUnsignedByte();
      }
      
      public function writeByte(param1:int) : void
      {
         _byteArray.writeByte(param1);
      }
      
      public function readBytes(param1:IByteArray, param2:uint = 0, param3:uint = 0) : void
      {
         _byteArray.readBytes(param1,param2,param3);
      }
      
      public function writeBytes(param1:IByteArray, param2:uint = 0, param3:uint = 0) : void
      {
         _byteArray.writeBytes(param1,param2,param3);
      }
      
      public function readBoolean() : Boolean
      {
         return _byteArray.readBoolean();
      }
      
      public function writeBoolean(param1:Boolean) : void
      {
         _byteArray.writeBoolean(param1);
      }
      
      public function readShort() : int
      {
         return _byteArray.readShort();
      }
      
      public function readUnsignedShort() : uint
      {
         return _byteArray.readUnsignedShort();
      }
      
      public function writeShort(param1:int) : void
      {
         _byteArray.writeShort(param1);
      }
      
      public function readInt() : int
      {
         return _byteArray.readInt();
      }
      
      public function writeInt(param1:int) : void
      {
         _byteArray.writeInt(param1);
      }
      
      public function readUnsignedInt() : uint
      {
         return _byteArray.readUnsignedInt();
      }
      
      public function writeUnsignedInt(param1:uint) : void
      {
         _byteArray.writeUnsignedInt(param1);
      }
      
      public function readFloat() : Number
      {
         return _byteArray.readFloat();
      }
      
      public function writeFloat(param1:Number) : void
      {
         _byteArray.writeFloat(param1);
      }
      
      public function readDouble() : Number
      {
         return _byteArray.readDouble();
      }
      
      public function writeDouble(param1:Number) : void
      {
         _byteArray.writeDouble(param1);
      }
      
      public function readMultiByte(param1:uint, param2:String) : String
      {
         return _byteArray.readMultiByte(param1,param2);
      }
      
      public function writeMultiByte(param1:String, param2:String) : void
      {
         _byteArray.writeMultiByte(param1,param2);
      }
      
      public function readUTF() : String
      {
         return _byteArray.readUTF();
      }
      
      public function writeUTF(param1:String) : void
      {
         _byteArray.writeUTF(param1);
      }
      
      public function readUTFBytes(param1:uint) : String
      {
         return _byteArray.readUTFBytes(param1);
      }
      
      public function writeUTFBytes(param1:String) : void
      {
         _byteArray.writeUTFBytes(param1);
      }
      
      public function readObject() : *
      {
         return _byteArray.readObject();
      }
      
      public function writeObject(param1:*) : void
      {
         _byteArray.writeObject(param1);
      }
   }
}
