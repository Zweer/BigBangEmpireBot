package com.playata.framework.network
{
   import com.playata.framework.core.enum.Enum;
   
   public class UriDataType extends Enum
   {
      
      public static const STRING:UriDataType = new UriDataType();
      
      public static const BINARY:UriDataType = new UriDataType();
      
      {
         initEnum(UriDataType);
      }
      
      public function UriDataType()
      {
         super();
      }
   }
}
