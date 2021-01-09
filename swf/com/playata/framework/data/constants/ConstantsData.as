package com.playata.framework.data.constants
{
   import com.playata.framework.core.Runtime;
   import com.playata.framework.core.TypedObject;
   import com.playata.framework.core.collection.GenericMap;
   import com.playata.framework.core.collection.StringMap;
   import com.playata.framework.core.util.BitFlag;
   
   public class ConstantsData extends TypedObject
   {
      
      private static var _constantsClassCache:GenericMap = new GenericMap();
      
      private static var _constantsDataCache:StringMap = new StringMap();
       
      
      private var _bitFlagDataCache:StringMap;
      
      public function ConstantsData(param1:TypedObject)
      {
         _bitFlagDataCache = new StringMap();
         super(param1);
      }
      
      public static function clearCache() : void
      {
         _constantsClassCache = new GenericMap();
         _constantsDataCache = new StringMap();
      }
      
      public static function getConstantsData(param1:String) : *
      {
         return Constants.current.constant(param1);
      }
      
      public static function getCount(param1:String) : int
      {
         var _loc3_:Object = getConstantsData(param1);
         var _loc2_:int = 0;
         var _loc6_:int = 0;
         var _loc5_:* = _loc3_;
         for(var _loc4_ in _loc3_)
         {
            _loc2_++;
         }
         return _loc2_;
      }
      
      public static function getIdExists(param1:String, param2:Object) : Boolean
      {
         var _loc3_:Object = getConstantsData(param1);
         return _loc3_[param2] !== undefined;
      }
      
      public static function getIntVectorIds(param1:String) : Vector.<int>
      {
         var _loc3_:Object = getConstantsData(param1);
         var _loc2_:Vector.<int> = new Vector.<int>(0);
         var _loc6_:int = 0;
         var _loc5_:* = _loc3_;
         for(var _loc4_ in _loc3_)
         {
            _loc2_.push(_loc4_);
         }
         return _loc2_;
      }
      
      public static function getStringVectorIds(param1:String) : Vector.<String>
      {
         var _loc3_:Object = getConstantsData(param1);
         var _loc2_:Vector.<String> = new Vector.<String>(0);
         var _loc6_:int = 0;
         var _loc5_:* = _loc3_;
         for(var _loc4_ in _loc3_)
         {
            _loc2_.push(_loc4_);
         }
         return _loc2_;
      }
      
      public static function getConstantsDataObject(param1:Object, param2:Class) : ConstantsData
      {
         var _loc3_:* = null;
         var _loc8_:* = null;
         var _loc7_:* = null;
         if(param1 === null)
         {
            return null;
         }
         var _loc6_:String = null;
         var _loc4_:String = null;
         if(!_constantsClassCache.exists(param2))
         {
            _loc6_ = param2["CONSTANTS_KEY"];
            _loc4_ = param2["ID_NAME"];
            _constantsClassCache.setData(param2,new TypedObject({
               "constantsName":_loc6_,
               "constantsIdName":_loc4_
            }));
         }
         else
         {
            _loc3_ = _constantsClassCache.getData(param2);
            _loc6_ = _loc3_.getString("constantsName");
            _loc4_ = _loc3_.getString("constantsIdName");
         }
         var _loc5_:String = _loc6_ + "_" + param1.toString();
         if(!_constantsDataCache.exists(_loc5_))
         {
            _loc8_ = getConstantsData(_loc6_);
            if(!_loc8_)
            {
               return null;
            }
            if(_loc8_[param1] === undefined || _loc8_[param1] === null)
            {
               return null;
            }
            _loc7_ = new TypedObject(_loc8_[param1]);
            _loc7_.setData(_loc4_,param1);
            _constantsDataCache.setData(_loc5_,Runtime.newInstance(param2,[_loc7_]));
         }
         return _constantsDataCache.getData(_loc5_);
      }
      
      public function get constantKeys() : Vector.<String>
      {
         var _loc1_:Vector.<String> = new Vector.<String>(0);
         var _loc2_:String = (this as Object).constructor["ID_NAME"];
         var _loc5_:int = 0;
         var _loc4_:* = _data;
         for(var _loc3_ in _data)
         {
            if(_loc3_ != _loc2_)
            {
               _loc1_.push(_loc3_);
            }
         }
         return _loc1_;
      }
      
      protected function getId(param1:String) : *
      {
         if(!hasData(param1))
         {
            return null;
         }
         return getData(param1);
      }
      
      protected function getBitFlagData(param1:String, param2:Class) : BitFlag
      {
         var _loc3_:int = 0;
         if(!hasData(param1))
         {
            return null;
         }
         if(!_bitFlagDataCache.exists(param1))
         {
            _loc3_ = getInt(param1);
            _bitFlagDataCache.setData(param1,Runtime.newInstance(param2,[getInt(param1)]));
         }
         return _bitFlagDataCache.getData(param1);
      }
      
      protected function getSubData(param1:String, param2:Object, param3:Object, param4:Class) : ConstantsData
      {
         var _loc5_:* = null;
         var _loc10_:* = null;
         if(param3 === null)
         {
            return null;
         }
         var _loc7_:Object = getData(param1);
         if(!_loc7_)
         {
            return null;
         }
         var _loc6_:String = null;
         if(!_constantsClassCache.exists(param4))
         {
            _loc6_ = param4["ID_NAME"];
            _constantsClassCache.setData(param4,new TypedObject({"constantsIdName":_loc6_}));
         }
         else
         {
            _loc5_ = _constantsClassCache.getData(param4);
            _loc6_ = _loc5_.getString("constantsIdName");
         }
         var _loc9_:String = (this as Object).constructor["CONSTANTS_KEY"];
         var _loc8_:String = _loc9_ + "_" + param2.toString() + "_" + param1 + "_" + param3.toString();
         if(!_constantsDataCache.exists(_loc8_))
         {
            if(_loc7_[param3] === undefined || _loc7_[param3] === null)
            {
               return null;
            }
            _loc10_ = new TypedObject(_loc7_[param3]);
            _loc10_.setData(_loc6_,param3);
            _constantsDataCache.setData(_loc8_,Runtime.newInstance(param4,[_loc10_]));
         }
         return _constantsDataCache.getData(_loc8_);
      }
      
      protected function getSubIntVectorIds(param1:String) : Vector.<int>
      {
         var _loc2_:Vector.<int> = new Vector.<int>(0);
         var _loc3_:Object = getData(param1);
         if(!_loc3_)
         {
            return _loc2_;
         }
         var _loc6_:int = 0;
         var _loc5_:* = _loc3_;
         for(var _loc4_ in _loc3_)
         {
            _loc2_.push(_loc4_);
         }
         return _loc2_;
      }
      
      protected function getSubStringVectorIds(param1:String) : Vector.<String>
      {
         var _loc2_:Vector.<String> = new Vector.<String>(0);
         var _loc3_:Object = getData(param1);
         if(!_loc3_)
         {
            return _loc2_;
         }
         var _loc6_:int = 0;
         var _loc5_:* = _loc3_;
         for(var _loc4_ in _loc3_)
         {
            _loc2_.push(_loc4_);
         }
         return _loc2_;
      }
   }
}
