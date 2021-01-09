package com.playata.framework.data
{
   import com.playata.framework.core.Runtime;
   import com.playata.framework.core.TypedObject;
   import com.playata.framework.core.collection.IntMap;
   import com.playata.framework.core.logging.Logger;
   import com.playata.framework.core.util.JsonUtil;
   
   public class DataObject extends TypedObject
   {
       
      
      public function DataObject(param1:Object = null)
      {
         super(param1);
      }
      
      public static function createOrUpdateMap(param1:Class, param2:IntMap, param3:Object) : *
      {
         var _loc4_:TypedObject = null;
         if(!(param3 is TypedObject))
         {
            _loc4_ = new TypedObject(param3);
         }
         else
         {
            _loc4_ = param3 as TypedObject;
         }
         if(!_loc4_.hasData("id"))
         {
            return null;
         }
         if(!param2.exists(_loc4_.getInt("id")))
         {
            param2.setData(_loc4_.getInt("id"),Runtime.newInstance(param1,[param3]));
         }
         else
         {
            (param2.getData(_loc4_.getInt("id")) as DataObject).update(_loc4_);
         }
         return param2.getData(_loc4_.getInt("id"));
      }
      
      public static function createOrUpdate(param1:Class, param2:DataObject, param3:Object) : *
      {
         var _loc4_:TypedObject = null;
         if(!(param3 is TypedObject))
         {
            _loc4_ = new TypedObject(param3);
         }
         else
         {
            _loc4_ = param3 as TypedObject;
         }
         if(param2 == null || _loc4_.hasData("id") && param2.getInt("id") != _loc4_.getInt("id"))
         {
            param2 = Runtime.newInstance(param1,[param3]);
         }
         else
         {
            param2.update(_loc4_);
         }
         return param2;
      }
      
      public function update(param1:TypedObject) : void
      {
         extend(param1);
      }
      
      override public function getData(param1:String, param2:Object = null) : Object
      {
         if(hasData(param1))
         {
            return super.getData(param1);
         }
         throw new Error("Error in DataObject! Tried to retrieve unknown field in DataObject data! key=" + param1.toString());
      }
      
      public function getFromJson(param1:String, param2:Object = null) : Object
      {
         if(param1 != "")
         {
            try
            {
               var _loc4_:* = JsonUtil.decode(param1);
               return _loc4_;
            }
            catch(e:Error)
            {
               Logger.debug("Exception: \'" + e.message + "\'");
               Logger.debug("JSON: \'" + param1 + "\'");
               var _loc5_:* = param2;
               return _loc5_;
            }
            return param2;
         }
         return param2;
      }
   }
}
