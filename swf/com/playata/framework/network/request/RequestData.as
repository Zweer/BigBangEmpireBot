package com.playata.framework.network.request
{
   import com.playata.framework.core.TypedObject;
   import flash.net.URLVariables;
   
   public class RequestData extends TypedObject
   {
       
      
      public function RequestData(param1:Object = null)
      {
         super(param1);
      }
      
      public static function get empty() : RequestData
      {
         return new RequestData({});
      }
      
      public static function fromData(param1:Object) : RequestData
      {
         return new RequestData(param1);
      }
      
      public function get asURLVariables() : URLVariables
      {
         var _loc1_:URLVariables = new URLVariables();
         var _loc4_:int = 0;
         var _loc3_:* = _data;
         for(var _loc2_ in _data)
         {
            _loc1_[_loc2_] = _data[_loc2_];
         }
         return _loc1_;
      }
   }
}
