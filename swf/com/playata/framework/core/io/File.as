package com.playata.framework.core.io
{
   import com.playata.framework.core.data.IByteArray;
   
   public class File
   {
       
      
      private var _handle:IFileHandle = null;
      
      public function File(param1:IFileHandle)
      {
         super();
         _handle = param1;
      }
      
      public function get handle() : IFileHandle
      {
         return _handle;
      }
      
      public function getBytes(param1:IByteArray = null) : IByteArray
      {
         return FileSystem.getBytes(_handle,param1);
      }
      
      public function get content() : String
      {
         return FileSystem.getContent(_handle);
      }
      
      public function saveBytes(param1:IByteArray) : void
      {
         FileSystem.saveBytes(_handle,param1);
      }
      
      public function saveContent(param1:String) : void
      {
         FileSystem.saveContent(_handle,param1);
      }
      
      public function copy(param1:File, param2:Boolean = false) : void
      {
         FileSystem.copy(_handle,param1._handle,param2);
      }
      
      public function get fullPath() : String
      {
         return FileSystem.fullPath(_handle);
      }
      
      public function get name() : String
      {
         return FileSystem.name(_handle);
      }
      
      public function get size() : Number
      {
         return FileSystem.size(_handle);
      }
      
      public function deleteFile() : void
      {
         FileSystem.deleteFile(_handle);
      }
      
      public function get exists() : Boolean
      {
         return FileSystem.exists(_handle);
      }
      
      public function get isDirectory() : Boolean
      {
         return FileSystem.isDirectory(_handle);
      }
      
      public function set preventBackup(param1:Boolean) : void
      {
         FileSystem.setPreventBackup(_handle,param1);
      }
      
      public function get preventBackup() : Boolean
      {
         return FileSystem.isPreventBackup(_handle);
      }
   }
}
