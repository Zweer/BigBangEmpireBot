package com.playata.framework.core.io
{
   public class Directory
   {
       
      
      private var _handle:IFileHandle = null;
      
      public function Directory(param1:IFileHandle)
      {
         super();
         _handle = param1;
      }
      
      public function get handle() : IFileHandle
      {
         return _handle;
      }
      
      public function getFile(param1:String) : File
      {
         return FileSystem.getDirectoryFile(_handle,param1);
      }
      
      public function getDirectory(param1:String) : Directory
      {
         return FileSystem.getDirectoryDirectory(_handle,param1);
      }
      
      public function get fileListing() : Vector.<String>
      {
         return FileSystem.fileListing(_handle);
      }
      
      public function get directoryListing() : Vector.<String>
      {
         return FileSystem.directoryListing(_handle);
      }
      
      public function copy(param1:IFileHandle) : void
      {
         FileSystem.copy(_handle,param1);
      }
      
      public function createDirectory() : void
      {
         FileSystem.createDirectory(_handle);
      }
      
      public function deleteDirectory(param1:Boolean = false) : void
      {
         FileSystem.deleteDirectory(_handle,param1);
      }
      
      public function get fullPath() : String
      {
         return FileSystem.fullPath(_handle);
      }
      
      public function get name() : String
      {
         return FileSystem.name(_handle);
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
