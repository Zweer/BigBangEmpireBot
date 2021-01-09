package com.playata.framework.core.collection
{
   import flash.utils.Dictionary;
   
   public dynamic class GenericMap extends Dictionary
   {
       
      
      public function GenericMap()
      {
         super();
      }
      
      public static function fromDictionary(param1:Dictionary) : GenericMap
      {
         var _loc2_:GenericMap = new GenericMap();
         var _loc5_:int = 0;
         var _loc4_:* = param1;
         for(var _loc3_ in param1)
         {
            _loc2_.setData(_loc3_,param1[_loc3_]);
         }
         return _loc2_;
      }
      
      public function get asDictionary() : Dictionary
      {
         var _loc1_:Dictionary = new Dictionary();
         var _loc4_:int = 0;
         var _loc3_:* = this;
         for(var _loc2_ in this)
         {
            _loc1_[_loc2_] = this[_loc2_];
         }
         return _loc1_;
      }
      
      public function get length() : int
      {
         var _loc1_:int = 0;
         var _loc4_:int = 0;
         var _loc3_:* = this;
         for(var _loc2_ in this)
         {
            _loc1_++;
         }
         return _loc1_;
      }
      
      public function containsValue(param1:Object) : Boolean
      {
         var _loc4_:int = 0;
         var _loc3_:* = this;
         for each(var _loc2_ in this)
         {
            if(_loc2_ == param1)
            {
               return true;
            }
         }
         return false;
      }
      
      public function exists(param1:Object) : Boolean
      {
         return this[param1] !== undefined;
      }
      
      public function remove(param1:Object) : void
      {
      }
      
      public function clear() : void
      {
         .super.length = 0;
      }
      
      public function setData(param1:Object, param2:Object) : void
      {
         this[param1] = param2;
      }
      
      public function getData(param1:Object) : *
      {
         return this[param1];
      }
      
      public function extend(param1:GenericMap) : void
      {
         var _loc4_:int = 0;
         var _loc3_:* = param1;
         for(var _loc2_ in param1)
         {
            setData(_loc2_,param1.getData(_loc2_));
         }
      }
      
      public function get keys() : Vector.<Object>
      {
         var _loc1_:Vector.<Object> = new Vector.<Object>(0);
         var _loc4_:int = 0;
         var _loc3_:* = this;
         for(var _loc2_ in this)
         {
            _loc1_.push(_loc2_);
         }
         return _loc1_;
      }
      
      public function get values() : Vector.<Object>
      {
         var _loc1_:Vector.<Object> = new Vector.<Object>(0);
         var _loc4_:int = 0;
         var _loc3_:* = this;
         for each(var _loc2_ in this)
         {
            _loc1_.push(_loc2_);
         }
         return _loc1_;
      }
   }
}
