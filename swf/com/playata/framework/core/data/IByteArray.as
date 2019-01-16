package com.playata.framework.core.data
{
   public interface IByteArray
   {
       
      
      function get bytesAvailable() : uint;
      
      function get objectEncoding() : uint;
      
      function set objectEncoding(param1:uint) : void;
      
      function get position() : uint;
      
      function set position(param1:uint) : void;
      
      function get length() : uint;
      
      function set length(param1:uint) : void;
      
      function deflate() : void;
      
      function inflate() : void;
      
      function compress(param1:String = "zlib") : void;
      
      function uncompress(param1:String = "zlib") : void;
      
      function clear() : void;
      
      function getByte(param1:uint) : int;
      
      function readByte() : int;
      
      function readUnsignedByte() : uint;
      
      function writeByte(param1:int) : void;
      
      function readBytes(param1:IByteArray, param2:uint = 0, param3:uint = 0) : void;
      
      function writeBytes(param1:IByteArray, param2:uint = 0, param3:uint = 0) : void;
      
      function readBoolean() : Boolean;
      
      function writeBoolean(param1:Boolean) : void;
      
      function readShort() : int;
      
      function readUnsignedShort() : uint;
      
      function writeShort(param1:int) : void;
      
      function readInt() : int;
      
      function writeInt(param1:int) : void;
      
      function readUnsignedInt() : uint;
      
      function writeUnsignedInt(param1:uint) : void;
      
      function readFloat() : Number;
      
      function writeFloat(param1:Number) : void;
      
      function readDouble() : Number;
      
      function writeDouble(param1:Number) : void;
      
      function readMultiByte(param1:uint, param2:String) : String;
      
      function writeMultiByte(param1:String, param2:String) : void;
      
      function readUTF() : String;
      
      function writeUTF(param1:String) : void;
      
      function readUTFBytes(param1:uint) : String;
      
      function writeUTFBytes(param1:String) : void;
      
      function readObject() : *;
      
      function writeObject(param1:*) : void;
   }
}
