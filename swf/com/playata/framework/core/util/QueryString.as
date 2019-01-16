package com.playata.framework.core.util
{
   import com.playata.framework.core.TypedObject;
   
   public class QueryString
   {
       
      
      private var _url:String;
      
      private var _queryString:String;
      
      private var _parameters:TypedObject;
      
      public function QueryString(param1:String)
      {
         super();
         readQueryString(param1);
      }
      
      public function get url() : String
      {
         return _url;
      }
      
      public function get queryString() : String
      {
         return _queryString;
      }
      
      public function get parameters() : TypedObject
      {
         return _parameters;
      }
      
      private function readQueryString(param1:String) : void
      {
         var _loc6_:* = null;
         var _loc4_:int = 0;
         var _loc3_:* = null;
         var _loc5_:int = 0;
         var _loc2_:* = null;
         var _loc7_:* = null;
         _parameters = new TypedObject();
         _url = param1;
         _queryString = param1.split("?")[1];
         if(_queryString)
         {
            _loc6_ = _queryString.split("&");
            _loc4_ = 0;
            while(_loc4_ < _loc6_.length)
            {
               _loc3_ = _loc6_[_loc4_];
               _loc5_ = _loc3_.indexOf("=");
               if(_loc5_ > 0)
               {
                  _loc2_ = _loc3_.substring(0,_loc5_);
                  _loc7_ = _loc3_.substring(_loc5_ + 1);
                  _parameters.setString(_loc2_,_loc7_);
               }
               _loc4_++;
            }
         }
      }
   }
}
