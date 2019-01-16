package com.playata.framework.core.cache
{
   import com.playata.framework.core.TypedObject;
   import com.playata.framework.core.logging.Logger;
   import com.playata.framework.core.util.DateTime;
   import com.playata.framework.core.util.TimeUtil;
   import com.playata.framework.data.LocalDataObject;
   
   public class Cache
   {
       
      
      public function Cache()
      {
         super();
      }
      
      public static function setData(param1:String, param2:TypedObject, param3:Boolean = false) : void
      {
         var _loc4_:* = null;
         try
         {
            _loc4_ = new LocalDataObject(param1);
            if(param3)
            {
               _loc4_.clear();
            }
            _loc4_.extend(param2);
            _loc4_.save();
            return;
         }
         catch(e:Error)
         {
            Logger.debug("[Cache] Warning: saving data to SharedObject failed. Error: " + e.message);
            return;
         }
      }
      
      public static function getData(param1:String) : TypedObject
      {
         var _loc2_:* = null;
         try
         {
            _loc2_ = new LocalDataObject(param1);
            var _loc4_:* = _loc2_.data;
            return _loc4_;
         }
         catch(e:Error)
         {
            Logger.debug("[Cache] Warning: getting data from SharedObject failed. Error: " + e.message);
         }
         return null;
      }
      
      public static function setDailyData(param1:String) : void
      {
         var _loc2_:TypedObject = new TypedObject({
            "key":param1,
            "creation_timestamp":TimeUtil.now
         });
         setData(param1,_loc2_);
      }
      
      public static function hasDailyData(param1:String) : Boolean
      {
         var _loc2_:TypedObject = getData(param1);
         if(!_loc2_)
         {
            return false;
         }
         var _loc3_:int = _loc2_.getInt("creation_timestamp");
         return DateTime.now.isToday(_loc3_);
      }
      
      public static function deleteData(param1:String) : void
      {
         var _loc2_:* = null;
         try
         {
            _loc2_ = new LocalDataObject(param1);
            _loc2_.clear();
            _loc2_.save();
            return;
         }
         catch(e:Error)
         {
            Logger.debug("[Cache] Warning: deleting data from SharedObject failed. Error: " + e.message);
            return;
         }
      }
   }
}
