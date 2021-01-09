package websocket.jimisaacs.utils
{
   public dynamic class QueryParameters extends Parameters
   {
       
      
      public function QueryParameters(param1:String = "")
      {
         super();
         addStr(param1);
      }
      
      override public function addParam(param1:*, param2:*) : void
      {
         var _loc3_:RegExp = /\s+/g;
         param1 = String(param1).replace(_loc3_,"_");
         param2 = encodeURI(String(param2));
         super.addParam(param1,param2);
      }
      
      private function addStr(param1:String) : void
      {
         var _loc4_:* = null;
         var _loc3_:Array = param1.split("&");
         var _loc6_:int = 0;
         var _loc5_:* = _loc3_;
         for each(var _loc2_ in _loc3_)
         {
            if(_loc2_.indexOf("=") >= 0)
            {
               _loc4_ = _loc2_.split("=");
               addParam(_loc4_[0],_loc4_[1]);
            }
            else if(_loc2_.length > 0)
            {
               addParam(_loc2_,"");
            }
         }
      }
      
      public function get queryString() : String
      {
         var _loc2_:int = 0;
         var _loc1_:Array = [];
         _loc2_ = 0;
         while(_loc2_ < super.length)
         {
            _loc1_[_loc2_] = super.properties[_loc2_].name;
            if(super.properties[_loc2_].value != "")
            {
               var _loc3_:* = _loc2_;
               var _loc4_:* = _loc1_[_loc3_] + ("=" + super.properties[_loc2_].value);
               _loc1_[_loc3_] = _loc4_;
            }
            _loc2_++;
         }
         if(_loc1_.length > 0)
         {
            return _loc1_.join("&");
         }
         return "";
      }
      
      public function set queryString(param1:String) : void
      {
         super.clear();
         addStr(param1);
      }
      
      public function valueOf() : Object
      {
         return queryString;
      }
      
      public function toString() : String
      {
         return queryString;
      }
   }
}
