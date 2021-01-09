package com.playata.framework.data
{
   import com.playata.framework.core.TypedObject;
   import flash.net.SharedObject;
   
   public class LocalDataObject
   {
       
      
      protected var _name:String;
      
      protected var _so:SharedObject;
      
      public function LocalDataObject(param1:String, param2:TypedObject = null)
      {
         super();
         _name = param1;
         _so = SharedObject.getLocal(_name);
         if(param2 != null)
         {
            extend(param2);
         }
      }
      
      public function dispose(param1:Boolean = true) : void
      {
         if(param1)
         {
            save();
         }
      }
      
      public function extend(param1:TypedObject) : void
      {
         var _loc4_:int = 0;
         var _loc3_:* = param1.rawData;
         for(var _loc2_ in param1.rawData)
         {
            setData(_loc2_,param1.rawData[_loc2_]);
         }
      }
      
      public function get data() : TypedObject
      {
         var _loc1_:TypedObject = new TypedObject();
         var _loc2_:Boolean = true;
         var _loc5_:int = 0;
         var _loc4_:* = _so.data;
         for(var _loc3_ in _so.data)
         {
            _loc2_ = false;
            _loc1_.setData(_loc3_,_so.data[_loc3_]);
         }
         if(_loc2_)
         {
            return null;
         }
         return _loc1_;
      }
      
      public function get rawData() : Object
      {
         return _so.data;
      }
      
      public function get keys() : Array
      {
         var _loc1_:Array = [];
         var _loc4_:int = 0;
         var _loc3_:* = _so.data;
         for(var _loc2_ in _so.data)
         {
            _loc1_.push(_loc2_);
         }
         return _loc1_;
      }
      
      public function hasData(param1:String) : Boolean
      {
         return _so.data.hasOwnProperty(param1);
      }
      
      public function deleteData(param1:String) : void
      {
      }
      
      public function setInt(param1:String, param2:int) : void
      {
         setData(param1,param2);
      }
      
      public function getInt(param1:String, param2:int = 0) : int
      {
         return getData(param1,param2) as int;
      }
      
      public function setString(param1:String, param2:String) : void
      {
         setData(param1,param2);
      }
      
      public function getString(param1:String, param2:String = null) : String
      {
         return getData(param1,param2) as String;
      }
      
      public function setNumber(param1:String, param2:Number) : void
      {
         setData(param1,param2);
      }
      
      public function getNumber(param1:String, param2:Number = 0) : Number
      {
         return getData(param1,param2) as Number;
      }
      
      public function setBoolean(param1:String, param2:Boolean) : void
      {
         setData(param1,param2);
      }
      
      public function getBoolean(param1:String, param2:Boolean = false) : Boolean
      {
         return getData(param1,param2) as Boolean;
      }
      
      public function getTypedObject(param1:String, param2:TypedObject = null) : TypedObject
      {
         return new TypedObject(getData(param1,param2));
      }
      
      public function getArray(param1:String, param2:Array = null) : Array
      {
         return getData(param1,param2) as Array;
      }
      
      public function addArrayValue(param1:String, param2:*) : void
      {
         if(!hasData(param1))
         {
            setData(param1,[]);
         }
         _so.data[param1].push(param2);
      }
      
      public function clearArray(param1:String) : void
      {
         setData(param1,[]);
      }
      
      public function getArrayLength(param1:String) : int
      {
         if(!hasData(param1))
         {
            return 0;
         }
         var _loc2_:Array = getData(param1) as Array;
         if(!_loc2_)
         {
            return 0;
         }
         return _loc2_.length;
      }
      
      public function clear() : void
      {
         _so.clear();
      }
      
      public function save() : void
      {
         _so.flush();
      }
      
      public function toString() : String
      {
         return "[LocalDataObject (name: " + _name + ")]";
      }
      
      protected function setData(param1:Object, param2:*) : void
      {
         _so.data[param1] = param2;
      }
      
      protected function getData(param1:String, param2:Object = null) : *
      {
         return !!hasData(param1)?_so.data[param1]:param2;
      }
   }
}
