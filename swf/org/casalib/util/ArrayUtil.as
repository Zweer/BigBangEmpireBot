package org.casalib.util
{
   public class ArrayUtil
   {
       
      
      public function ArrayUtil()
      {
         super();
      }
      
      public static function getItemByKeys(param1:Array, param2:Object) : *
      {
         var _loc4_:* = undefined;
         var _loc5_:Boolean = false;
         var _loc6_:* = null;
         var _loc3_:int = -1;
         while(++_loc3_ < param1.length)
         {
            _loc4_ = param1[_loc3_];
            _loc5_ = true;
            for(_loc6_ in param2)
            {
               if(!_loc4_.hasOwnProperty(_loc6_) || _loc4_[_loc6_] != param2[_loc6_])
               {
                  _loc5_ = false;
               }
            }
            if(_loc5_)
            {
               return _loc4_;
            }
         }
         return null;
      }
      
      public static function getItemsByKeys(param1:Array, param2:Object) : Array
      {
         var _loc5_:* = undefined;
         var _loc6_:Boolean = false;
         var _loc7_:* = null;
         var _loc3_:Array = new Array();
         var _loc4_:int = -1;
         while(++_loc4_ < param1.length)
         {
            _loc5_ = param1[_loc4_];
            _loc6_ = true;
            for(_loc7_ in param2)
            {
               if(!_loc5_.hasOwnProperty(_loc7_) || _loc5_[_loc7_] != param2[_loc7_])
               {
                  _loc6_ = false;
               }
            }
            if(_loc6_)
            {
               _loc3_.push(_loc5_);
            }
         }
         return _loc3_;
      }
      
      public static function getItemByAnyKey(param1:Array, param2:Object) : *
      {
         var _loc4_:* = undefined;
         var _loc5_:* = null;
         var _loc3_:int = -1;
         while(++_loc3_ < param1.length)
         {
            _loc4_ = param1[_loc3_];
            for(_loc5_ in param2)
            {
               if(_loc4_.hasOwnProperty(_loc5_) && _loc4_[_loc5_] == param2[_loc5_])
               {
                  return _loc4_;
               }
            }
         }
         return null;
      }
      
      public static function getItemsByAnyKey(param1:Array, param2:Object) : Array
      {
         var _loc5_:* = undefined;
         var _loc6_:Boolean = false;
         var _loc7_:* = null;
         var _loc3_:Array = new Array();
         var _loc4_:int = -1;
         while(++_loc4_ < param1.length)
         {
            _loc5_ = param1[_loc4_];
            _loc6_ = true;
            for(_loc7_ in param2)
            {
               if(_loc5_.hasOwnProperty(_loc7_) && _loc5_[_loc7_] == param2[_loc7_])
               {
                  _loc3_.push(_loc5_);
                  break;
               }
            }
         }
         return _loc3_;
      }
      
      public static function getItemByKey(param1:Array, param2:String, param3:*) : *
      {
         var _loc4_:* = undefined;
         for each(_loc4_ in param1)
         {
            if(_loc4_.hasOwnProperty(param2))
            {
               if(_loc4_[param2] == param3)
               {
                  return _loc4_;
               }
            }
         }
         return null;
      }
      
      public static function getItemsByKey(param1:Array, param2:String, param3:*) : Array
      {
         var _loc5_:* = undefined;
         var _loc4_:Array = new Array();
         for each(_loc5_ in param1)
         {
            if(_loc5_.hasOwnProperty(param2))
            {
               if(_loc5_[param2] == param3)
               {
                  _loc4_.push(_loc5_);
               }
            }
         }
         return _loc4_;
      }
      
      public static function getItemByType(param1:Array, param2:Class) : *
      {
         var _loc3_:* = undefined;
         for each(_loc3_ in param1)
         {
            if(_loc3_ is param2)
            {
               return _loc3_;
            }
         }
         return null;
      }
      
      public static function getItemsByType(param1:Array, param2:Class) : Array
      {
         var _loc4_:* = undefined;
         var _loc3_:Array = new Array();
         for each(_loc4_ in param1)
         {
            if(_loc4_ is param2)
            {
               _loc3_.push(_loc4_);
            }
         }
         return _loc3_;
      }
      
      public static function getValuesByKey(param1:Array, param2:String) : Array
      {
         var _loc4_:* = undefined;
         var _loc3_:Array = new Array();
         for each(_loc4_ in param1)
         {
            if(_loc4_.hasOwnProperty(param2))
            {
               _loc3_.push(_loc4_[param2]);
            }
         }
         return _loc3_;
      }
      
      public static function equals(param1:Array, param2:Array) : Boolean
      {
         var _loc3_:uint = param1.length;
         if(_loc3_ != param2.length)
         {
            return false;
         }
         while(_loc3_--)
         {
            if(param1[_loc3_] != param2[_loc3_])
            {
               return false;
            }
         }
         return true;
      }
      
      public static function addItemsAt(param1:Array, param2:Array, param3:int = 2147483647) : Boolean
      {
         if(param2.length == 0)
         {
            return false;
         }
         var _loc4_:Array = param2.concat();
         _loc4_.splice(0,0,param3,0);
         param1.splice.apply(null,_loc4_);
         return true;
      }
      
      public static function removeDuplicates(param1:Array) : Array
      {
         return param1.filter(ArrayUtil._removeDuplicatesFilter);
      }
      
      protected static function _removeDuplicatesFilter(param1:*, param2:int, param3:Array) : Boolean
      {
         return param2 == 0?true:param3.lastIndexOf(param1,param2 - 1) == -1;
      }
      
      public static function removeItem(param1:Array, param2:*) : uint
      {
         var _loc3_:int = param1.indexOf(param2);
         var _loc4_:uint = 0;
         while(_loc3_ != -1)
         {
            param1.splice(_loc3_,1);
            _loc3_ = param1.indexOf(param2,_loc3_);
            _loc4_++;
         }
         return _loc4_;
      }
      
      public static function removeItems(param1:Array, param2:Array) : Boolean
      {
         var _loc3_:Boolean = false;
         var _loc4_:uint = param1.length;
         while(_loc4_--)
         {
            if(param2.indexOf(param1[_loc4_]) > -1)
            {
               param1.splice(_loc4_,1);
               _loc3_ = true;
            }
         }
         return _loc3_;
      }
      
      public static function retainItems(param1:Array, param2:Array) : Boolean
      {
         var _loc3_:Boolean = false;
         var _loc4_:uint = param1.length;
         while(_loc4_--)
         {
            if(param2.indexOf(param1[_loc4_]) == -1)
            {
               param1.splice(_loc4_,1);
               _loc3_ = true;
            }
         }
         return _loc3_;
      }
      
      public static function contains(param1:Array, param2:*) : uint
      {
         var _loc3_:int = param1.indexOf(param2,0);
         var _loc4_:uint = 0;
         while(_loc3_ != -1)
         {
            _loc3_ = param1.indexOf(param2,_loc3_ + 1);
            _loc4_++;
         }
         return _loc4_;
      }
      
      public static function containsAll(param1:Array, param2:Array) : Boolean
      {
         var _loc3_:uint = param2.length;
         while(_loc3_--)
         {
            if(param1.indexOf(param2[_loc3_]) == -1)
            {
               return false;
            }
         }
         return true;
      }
      
      public static function containsAny(param1:Array, param2:Array) : Boolean
      {
         var _loc3_:uint = param2.length;
         while(_loc3_--)
         {
            if(param1.indexOf(param2[_loc3_]) > -1)
            {
               return true;
            }
         }
         return false;
      }
      
      public static function getIndexOfDifference(param1:Array, param2:Array, param3:uint = 0) : int
      {
         var _loc4_:int = param3 - 1;
         while(++_loc4_ < param1.length)
         {
            if(param1[_loc4_] != param2[_loc4_])
            {
               return _loc4_;
            }
         }
         return -1;
      }
      
      public static function random(param1:Array) : *
      {
         return ArrayUtil.randomize(param1)[0];
      }
      
      public static function randomize(param1:Array) : Array
      {
         var _loc2_:Array = new Array();
         var _loc3_:Array = param1.sort(ArrayUtil._sortRandom,Array.RETURNINDEXEDARRAY);
         var _loc4_:int = -1;
         while(++_loc4_ < param1.length)
         {
            _loc2_.push(param1[_loc3_[_loc4_]]);
         }
         return _loc2_;
      }
      
      protected static function _sortRandom(param1:*, param2:*) : int
      {
         return !!NumberUtil.randomIntegerWithinRange(0,1)?1:-1;
      }
      
      public static function sum(param1:Array) : Number
      {
         var _loc2_:* = 0;
         var _loc3_:uint = param1.length;
         while(_loc3_--)
         {
            _loc2_ = Number(_loc2_ + param1[_loc3_]);
         }
         return _loc2_;
      }
      
      public static function average(param1:Array) : Number
      {
         if(param1.length == 0)
         {
            return 0;
         }
         return ArrayUtil.sum(param1) / param1.length;
      }
      
      public static function getLowestValue(param1:Array) : Number
      {
         return param1[param1.sort(16 | 8)[0]];
      }
      
      public static function getHighestValue(param1:Array) : Number
      {
         return param1[param1.sort(16 | 8)[param1.length - 1]];
      }
   }
}
