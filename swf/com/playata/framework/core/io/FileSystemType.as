package com.playata.framework.core.io
{
   import com.playata.framework.core.enum.Enum;
   
   public class FileSystemType extends Enum
   {
      
      public static const ApplicationDirectory:FileSystemType = new FileSystemType();
      
      public static const ApplicationStorageDirectory:FileSystemType = new FileSystemType();
      
      public static const DesktopDirectory:FileSystemType = new FileSystemType();
      
      public static const DocumentsDirectory:FileSystemType = new FileSystemType();
      
      public static const UserDirectory:FileSystemType = new FileSystemType();
      
      {
         initEnum(FileSystemType);
      }
      
      public function FileSystemType()
      {
         super();
      }
   }
}
