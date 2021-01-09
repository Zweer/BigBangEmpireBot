package com.playata.framework.core.lib.flash
{
   import com.playata.framework.core.data.IByteArray;
   import flash.utils.ByteArray;
   
   public class FlashByteArray implements IByteArray
   {
       
      
      public var flashByteArray:ByteArray = null;
      
      public function FlashByteArray(param1:ByteArray = null)
      {
         super();
         if(param1 == null)
         {
            flashByteArray = new ByteArray();
         }
         else
         {
            flashByteArray = param1;
         }
      }
      
      public function get bytesAvailable() : uint
      {
         return flashByteArray.bytesAvailable;
      }
      
      public function get objectEncoding() : uint
      {
         return flashByteArray.objectEncoding;
      }
      
      public function set objectEncoding(param1:uint) : void
      {
         flashByteArray.objectEncoding = param1;
      }
      
      public function get position() : uint
      {
         return flashByteArray.position;
      }
      
      public function set position(param1:uint) : void
      {
         flashByteArray.position = param1;
      }
      
      public function get length() : uint
      {
         return flashByteArray.length;
      }
      
      public function set length(param1:uint) : void
      {
         flashByteArray.length = param1;
      }
      
      public function deflate() : void
      {
         flashByteArray.deflate();
      }
      
      public function inflate() : void
      {
         flashByteArray.inflate();
      }
      
      public function compress(param1:String = "zlib") : void
      {
         flashByteArray.compress(param1);
      }
      
      public function uncompress(param1:String = "zlib") : void
      {
         flashByteArray.uncompress(param1);
      }
      
      public function clear() : void
      {
         return flashByteArray.clear();
      }
      
      public function getByte(param1:uint) : int
      {
         return flashByteArray[param1];
      }
      
      public function readByte() : int
      {
         return flashByteArray.readByte();
      }
      
      public function readUnsignedByte() : uint
      {
         return flashByteArray.readUnsignedByte();
      }
      
      public function writeByte(param1:int) : void
      {
         flashByteArray.writeByte(param1);
      }
      
      public function readBytes(param1:IByteArray, param2:uint = 0, param3:uint = 0) : void
      {
         flashByteArray.readBytes(FlashByteArray(param1).flashByteArray,param2,param3);
      }
      
      public function writeBytes(param1:IByteArray, param2:uint = 0, param3:uint = 0) : void
      {
         flashByteArray.writeBytes(FlashByteArray(param1).flashByteArray,param2,param3);
      }
      
      public function readBoolean() : Boolean
      {
         return flashByteArray.readBoolean();
      }
      
      public function writeBoolean(param1:Boolean) : void
      {
         flashByteArray.writeBoolean(param1);
      }
      
      public function readShort() : int
      {
         return flashByteArray.readShort();
      }
      
      public function readUnsignedShort() : uint
      {
         return flashByteArray.readUnsignedShort();
      }
      
      public function writeShort(param1:int) : void
      {
         flashByteArray.writeShort(param1);
      }
      
      public function readInt() : int
      {
         return flashByteArray.readInt();
      }
      
      public function writeInt(param1:int) : void
      {
         flashByteArray.writeInt(param1);
      }
      
      public function readUnsignedInt() : uint
      {
         return flashByteArray.readUnsignedInt();
      }
      
      public function writeUnsignedInt(param1:uint) : void
      {
         flashByteArray.writeUnsignedInt(param1);
      }
      
      public function readFloat() : Number
      {
         return flashByteArray.readFloat();
      }
      
      public function writeFloat(param1:Number) : void
      {
         flashByteArray.writeFloat(param1);
      }
      
      public function readDouble() : Number
      {
         return flashByteArray.readDouble();
      }
      
      public function writeDouble(param1:Number) : void
      {
         flashByteArray.writeDouble(param1);
      }
      
      public function readMultiByte(param1:uint, param2:String) : String
      {
         return flashByteArray.readMultiByte(param1,param2);
      }
      
      public function writeMultiByte(param1:String, param2:String) : void
      {
         flashByteArray.writeMultiByte(param1,param2);
      }
      
      public function readUTF() : String
      {
         return flashByteArray.readUTF();
      }
      
      public function writeUTF(param1:String) : void
      {
         flashByteArray.writeUTF(param1);
      }
      
      public function readUTFBytes(param1:uint) : String
      {
         return flashByteArray.readUTFBytes(param1);
      }
      
      public function writeUTFBytes(param1:String) : void
      {
         flashByteArray.writeUTFBytes(param1);
      }
      
      public function readObject() : *
      {
         return flashByteArray.readObject();
      }
      
      public function writeObject(param1:*) : void
      {
         flashByteArray.writeObject(param1);
      }
   }
}
