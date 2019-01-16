package com.playata.framework.core.io
{
   import com.playata.framework.core.data.IByteArray;
   
   public class FileSystem
   {
      
      private static var _fileHandler:IFileSystemHandler = null;
      
      private static var _applicationDirectory:Directory = null;
      
      private static var _applicationStorageDirectory:Directory = null;
      
      private static var _desktopDirectory:Directory = null;
      
      private static var _documentsDirectory:Directory = null;
      
      private static var _userDirectory:Directory = null;
       
      
      public function FileSystem()
      {
         super();
      }
      
      public static function get isAvailable() : Boolean
      {
         return init();
      }
      
      public static function get applicationDirectory() : Directory
      {
         if(_applicationDirectory == null)
         {
            _applicationDirectory = FileSystem.getDirectory(FileSystemType.ApplicationDirectory,null);
         }
         return _applicationDirectory;
      }
      
      public static function get applicationStorageDirectory() : Directory
      {
         if(_applicationStorageDirectory == null)
         {
            _applicationStorageDirectory = FileSystem.getDirectory(FileSystemType.ApplicationStorageDirectory,null);
         }
         return _applicationStorageDirectory;
      }
      
      public static function get desktopDirectory() : Directory
      {
         if(_desktopDirectory == null)
         {
            _desktopDirectory = FileSystem.getDirectory(FileSystemType.DesktopDirectory,null);
         }
         return _desktopDirectory;
      }
      
      public static function get documentsDirectory() : Directory
      {
         if(_documentsDirectory == null)
         {
            _documentsDirectory = FileSystem.getDirectory(FileSystemType.DocumentsDirectory,null);
         }
         return _documentsDirectory;
      }
      
      public static function get userDirectory() : Directory
      {
         if(_userDirectory == null)
         {
            _userDirectory = FileSystem.getDirectory(FileSystemType.UserDirectory,null);
         }
         return _userDirectory;
      }
      
      public static function getFile(param1:FileSystemType, param2:String) : File
      {
         if(!init())
         {
            return null;
         }
         return _fileHandler.getFile(param1,param2);
      }
      
      public static function getDirectory(param1:FileSystemType, param2:String) : Directory
      {
         if(!init())
         {
            return null;
         }
         return _fileHandler.getDirectory(param1,param2);
      }
      
      public static function getDirectoryFile(param1:IFileHandle, param2:String) : File
      {
         if(!init())
         {
            return null;
         }
         return _fileHandler.getDirectoryFile(param1,param2);
      }
      
      public static function getDirectoryDirectory(param1:IFileHandle, param2:String) : Directory
      {
         if(!init())
         {
            return null;
         }
         return _fileHandler.getDirectoryDirectory(param1,param2);
      }
      
      public static function directoryListing(param1:IFileHandle) : Vector.<String>
      {
         if(!init())
         {
            return null;
         }
         return _fileHandler.directoryListing(param1);
      }
      
      public static function fileListing(param1:IFileHandle) : Vector.<String>
      {
         if(!init())
         {
            return null;
         }
         return _fileHandler.fileListing(param1);
      }
      
      public static function getBytes(param1:IFileHandle, param2:IByteArray = null) : IByteArray
      {
         if(!init())
         {
            return null;
         }
         return _fileHandler.getBytes(param1,param2);
      }
      
      public static function getContent(param1:IFileHandle) : String
      {
         if(!init())
         {
            return null;
         }
         return _fileHandler.getContent(param1);
      }
      
      public static function saveBytes(param1:IFileHandle, param2:IByteArray) : void
      {
         if(!init())
         {
            return;
         }
         _fileHandler.saveBytes(param1,param2);
      }
      
      public static function saveContent(param1:IFileHandle, param2:String) : void
      {
         if(!init())
         {
            return;
         }
         _fileHandler.saveContent(param1,param2);
      }
      
      public static function copy(param1:IFileHandle, param2:IFileHandle, param3:Boolean = false) : void
      {
         if(!init())
         {
            return;
         }
         _fileHandler.copy(param1,param2,param3);
      }
      
      public static function createDirectory(param1:IFileHandle) : void
      {
         if(!init())
         {
            return;
         }
         _fileHandler.createDirectory(param1);
      }
      
      public static function deleteDirectory(param1:IFileHandle, param2:Boolean = false) : void
      {
         if(!init())
         {
            return;
         }
         _fileHandler.deleteDirectory(param1,param2);
      }
      
      public static function deleteFile(param1:IFileHandle) : void
      {
         if(!init())
         {
            return;
         }
         _fileHandler.deleteFile(param1);
      }
      
      public static function exists(param1:IFileHandle) : Boolean
      {
         if(!init())
         {
            return false;
         }
         return _fileHandler.exists(param1);
      }
      
      public static function fullPath(param1:IFileHandle) : String
      {
         if(!init())
         {
            return null;
         }
         return _fileHandler.fullPath(param1);
      }
      
      public static function name(param1:IFileHandle) : String
      {
         if(!init())
         {
            return null;
         }
         return _fileHandler.name(param1);
      }
      
      public static function size(param1:IFileHandle) : Number
      {
         if(!init())
         {
            return 0;
         }
         return _fileHandler.size(param1);
      }
      
      public static function isDirectory(param1:IFileHandle) : Boolean
      {
         if(!init())
         {
            return false;
         }
         return _fileHandler.isDirectory(param1);
      }
      
      public static function setPreventBackup(param1:IFileHandle, param2:Boolean) : void
      {
         if(!init())
         {
            return;
         }
         _fileHandler.setPreventBackup(param1,param2);
      }
      
      public static function isPreventBackup(param1:IFileHandle) : Boolean
      {
         if(!init())
         {
            return false;
         }
         return _fileHandler.isPreventBackup(param1);
      }
      
      private static function init() : Boolean
      {
         if(_fileHandler != null)
         {
            return true;
         }
         return false;
      }
   }
}
