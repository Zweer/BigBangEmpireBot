package com.playata.framework.network.request
{
   import com.playata.framework.core.TypedObject;
   import com.playata.framework.core.error.Exception;
   
   public class RequestResponseData
   {
       
      
      private var _data:TypedObject;
      
      public function RequestResponseData(param1:Object)
      {
         _data = TypedObject.empty;
         super();
         _data = new TypedObject(param1);
      }
      
      public function get asJsonString() : String
      {
         return _data.asJsonString;
      }
      
      public function get asTypedObject() : TypedObject
      {
         return _data;
      }
      
      public function hasKey(param1:String) : Boolean
      {
         return _data.hasData(param1);
      }
      
      public function getInt(param1:String) : int
      {
         if(!_data || !_data.hasData(param1))
         {
            throw new Exception("unknown key \'" + param1 + "\'");
         }
         return _data.getInt(param1);
      }
      
      public function getString(param1:String) : String
      {
         if(!_data || !_data.hasData(param1))
         {
            throw new Exception("unknown key \'" + param1 + "\'");
         }
         return _data.getString(param1);
      }
      
      public function getBoolean(param1:String) : Boolean
      {
         if(!_data || !_data.hasData(param1))
         {
            throw new Exception("unknown key \'" + param1 + "\'");
         }
         return _data.getBoolean(param1);
      }
      
      public function getTypedObject(param1:String) : TypedObject
      {
         if(!_data || !_data.hasData(param1))
         {
            throw new Exception("unknown key \'" + param1 + "\'");
         }
         return _data.getTypedObject(param1);
      }
   }
}
