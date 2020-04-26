package com.playata.framework.core
{
   import com.playata.framework.core.util.JsonUtil;
   import flash.utils.Dictionary;
   
   public class TypedObject
   {
       
      
      protected var _data:Object = null;
      
      public function TypedObject(param1:Object = null)
      {
         super();
         if(param1 is TypedObject)
         {
            param1 = (param1 as TypedObject).rawData;
         }
         if(param1 === null)
         {
            param1 = {};
         }
         _data = param1;
      }
      
      public static function fromJsonString(param1:String) : TypedObject
      {
         try
         {
            var _loc3_:* = new TypedObject(JsonUtil.decode(param1));
            return _loc3_;
         }
         catch(e:Error)
         {
            var _loc4_:* = TypedObject.empty;
            return _loc4_;
         }
         return TypedObject.empty;
      }
      
      public static function get empty() : TypedObject
      {
         return new TypedObject({});
      }
      
      public function dispose() : void
      {
         _data = null;
      }
      
      public function get rawData() : Object
      {
         return _data;
      }
      
      public function get length() : int
      {
         var _loc1_:int = 0;
         var _loc4_:int = 0;
         var _loc3_:* = _data;
         for(var _loc2_ in _data)
         {
            _loc1_++;
         }
         return _loc1_;
      }
      
      public function get asJsonString() : String
      {
         return JsonUtil.encode(_data);
      }
      
      public function get asDictionary() : Dictionary
      {
         var _loc1_:Dictionary = new Dictionary();
         var _loc4_:int = 0;
         var _loc3_:* = _data;
         for(var _loc2_ in _data)
         {
            _loc1_[_loc2_] = _data[_loc2_];
         }
         return _loc1_;
      }
      
      public function get keys() : Vector.<String>
      {
         var _loc1_:Vector.<String> = new Vector.<String>(0);
         var _loc4_:int = 0;
         var _loc3_:* = _data;
         for(var _loc2_ in _data)
         {
            _loc1_.push(_loc2_);
         }
         return _loc1_;
      }
      
      public function get valuesAsInt() : Vector.<int>
      {
         var _loc1_:Vector.<int> = new Vector.<int>(0);
         var _loc4_:int = 0;
         var _loc3_:* = _data;
         for each(var _loc2_ in _data)
         {
            _loc1_.push(_loc2_);
         }
         return _loc1_;
      }
      
      public function get valuesAsString() : Vector.<String>
      {
         var _loc1_:Vector.<String> = new Vector.<String>(0);
         var _loc4_:int = 0;
         var _loc3_:* = _data;
         for each(var _loc2_ in _data)
         {
            _loc1_.push(_loc2_);
         }
         return _loc1_;
      }
      
      public function extend(param1:TypedObject) : void
      {
         if(param1 == null)
         {
            return;
         }
         var _loc4_:int = 0;
         var _loc3_:* = param1.rawData;
         for(var _loc2_ in param1.rawData)
         {
            _data[_loc2_] = param1.rawData[_loc2_];
         }
      }
      
      public function deleteData(param1:String) : void
      {
      }
      
      public function hasData(param1:String, param2:Boolean = false) : Boolean
      {
         if(_data == null)
         {
            return false;
         }
         if(_data[param1] === undefined)
         {
            return false;
         }
         if(param2 && _data[param1] === null)
         {
            return false;
         }
         return true;
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
      
      public function setFunction(param1:String, param2:Function) : void
      {
         setData(param1,param2);
      }
      
      public function getFunction(param1:String, param2:Function = null) : Function
      {
         return getData(param1,param2) as Function;
      }
      
      public function setArray(param1:String, param2:Array) : void
      {
         setData(param1,param2);
      }
      
      public function getArray(param1:String, param2:Array = null) : Array
      {
         return getData(param1,param2) as Array;
      }
      
      public function getIntVector(param1:String, param2:Vector.<int> = null) : Vector.<int>
      {
         if(!hasData(param1,true))
         {
            return param2;
         }
         return Vector.<int>(getArray(param1));
      }
      
      public function getStringVector(param1:String, param2:Vector.<String> = null) : Vector.<String>
      {
         if(!hasData(param1,true))
         {
            return param2;
         }
         return Vector.<String>(getArray(param1));
      }
      
      public function getNumberVector(param1:String, param2:Vector.<Number> = null) : Vector.<Number>
      {
         if(!hasData(param1,true))
         {
            return param2;
         }
         return Vector.<Number>(getArray(param1));
      }
      
      public function getBooleanVector(param1:String, param2:Vector.<Boolean> = null) : Vector.<Boolean>
      {
         if(!hasData(param1,true))
         {
            return param2;
         }
         return Vector.<Boolean>(getArray(param1));
      }
      
      public function setTypedObject(param1:String, param2:TypedObject) : void
      {
         setData(param1,param2);
      }
      
      public function getTypedObject(param1:String, param2:TypedObject = null) : TypedObject
      {
         if(_data[param1] === undefined)
         {
            return param2;
         }
         return new TypedObject(_data[param1]);
      }
      
      public function getTypedObjectFromJson(param1:String, param2:TypedObject = null) : TypedObject
      {
         if(_data[param1] === undefined)
         {
            return param2;
         }
         var _loc3_:String = getString(param1);
         var _loc4_:Object = {};
         if(_loc3_ != "")
         {
            try
            {
               _loc4_ = JsonUtil.decode(_loc3_);
            }
            catch(e:Error)
            {
               var _loc6_:* = param2;
               return _loc6_;
            }
         }
         return new TypedObject(_loc4_);
      }
      
      public function setData(param1:String, param2:Object) : void
      {
         _data[param1] = param2;
      }
      
      public function getData(param1:String, param2:Object = null) : Object
      {
         if(_data[param1] === undefined)
         {
            return param2;
         }
         return _data[param1];
      }
   }
}
