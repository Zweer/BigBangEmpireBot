package com.playata.framework.core.io
{
   import com.playata.framework.core.data.IByteArray;
   
   public interface IFileSystemHandler
   {
       
      
      function getFile(param1:FileSystemType, param2:String) : File;
      
      function getDirectory(param1:FileSystemType, param2:String) : Directory;
      
      function getDirectoryFile(param1:IFileHandle, param2:String) : File;
      
      function getDirectoryDirectory(param1:IFileHandle, param2:String) : Directory;
      
      function fileListing(param1:IFileHandle) : Vector.<String>;
      
      function directoryListing(param1:IFileHandle) : Vector.<String>;
      
      function getBytes(param1:IFileHandle, param2:IByteArray = null) : IByteArray;
      
      function getContent(param1:IFileHandle) : String;
      
      function saveBytes(param1:IFileHandle, param2:IByteArray) : void;
      
      function saveContent(param1:IFileHandle, param2:String) : void;
      
      function copy(param1:IFileHandle, param2:IFileHandle, param3:Boolean = false) : void;
      
      function deleteFile(param1:IFileHandle) : void;
      
      function deleteDirectory(param1:IFileHandle, param2:Boolean = false) : void;
      
      function fullPath(param1:IFileHandle) : String;
      
      function name(param1:IFileHandle) : String;
      
      function size(param1:IFileHandle) : Number;
      
      function exists(param1:IFileHandle) : Boolean;
      
      function isDirectory(param1:IFileHandle) : Boolean;
      
      function setPreventBackup(param1:IFileHandle, param2:Boolean) : void;
      
      function isPreventBackup(param1:IFileHandle) : Boolean;
      
      function createDirectory(param1:IFileHandle) : void;
   }
}
