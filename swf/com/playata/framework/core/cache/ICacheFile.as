package com.playata.framework.core.cache
{
   import com.playata.framework.core.data.IByteArray;
   
   public interface ICacheFile
   {
       
      
      function isValid(param1:String) : Boolean;
      
      function save(param1:IByteArray, param2:String) : void;
      
      function get data() : IByteArray;
   }
}
