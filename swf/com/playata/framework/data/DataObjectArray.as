package com.playata.framework.data
{
   import com.playata.framework.core.Runtime;
   import flash.utils.Proxy;
   import flash.utils.flash_proxy;
   
   public class DataObjectArray extends Proxy
   {
       
      
      protected var _data:Array = null;
      
      protected var _clazz:Class = null;
      
      public function DataObjectArray(param1:Array, param2:Class)
      {
         super();
         _data = param1;
         _clazz = param2;
      }
      
      public function get length() : int
      {
         if(_data == null)
         {
            return 0;
         }
         return _data.length;
      }
      
      public function sort(... rest) : *
      {
         return _data.sort.apply(null,rest);
      }
      
      override flash_proxy function nextNameIndex(param1:int) : int
      {
         if(_data == null)
         {
            return 0;
         }
         if(param1 < _data.length)
         {
            return param1 + 1;
         }
         return 0;
      }
      
      override flash_proxy function nextName(param1:int) : String
      {
         return String(param1 - 1);
      }
      
      override flash_proxy function nextValue(param1:int) : *
      {
         var _loc2_:DataObject = Runtime.newInstance(_clazz,[_data[param1 - 1]]);
         return _loc2_;
      }
      
      override flash_proxy function getProperty(param1:*) : *
      {
         return Runtime.newInstance(_clazz,[_data[param1]]);
      }
      
      public function removeAt(param1:*) : Boolean
      {
         return _data.removeAt(param1) != null;
      }
   }
}
