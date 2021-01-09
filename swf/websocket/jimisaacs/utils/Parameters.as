package websocket.jimisaacs.utils
{
   import flash.utils.Dictionary;
   import flash.utils.Proxy;
   import flash.utils.flash_proxy;
   
   public dynamic class Parameters extends Proxy
   {
       
      
      private var _props:Dictionary;
      
      public function Parameters(... rest)
      {
         super();
         _props = new Dictionary(true);
         add.apply(this,rest);
      }
      
      public function addParam(param1:*, param2:*) : void
      {
         _props[param1] = param2;
      }
      
      public function clear() : void
      {
         var _loc3_:int = 0;
         var _loc2_:* = _props;
         for(var _loc1_ in _props)
         {
            _props[_loc1_] = null;
            delete _props[_loc1_];
         }
      }
      
      public function addObj(param1:Object) : void
      {
         var _loc4_:int = 0;
         var _loc3_:* = param1;
         for(var _loc2_ in param1)
         {
            addParam(_loc2_,param1[_loc2_]);
         }
      }
      
      public function add(... rest) : void
      {
         var _loc4_:int = 0;
         var _loc3_:* = rest;
         for each(var _loc2_ in rest)
         {
            addObj(_loc2_);
         }
      }
      
      public function get properties() : Array
      {
         var _loc1_:Array = [];
         var _loc4_:int = 0;
         var _loc3_:* = _props;
         for(var _loc2_ in _props)
         {
            _loc1_.push({
               "name":_loc2_,
               "value":_props[_loc2_]
            });
         }
         return _loc1_;
      }
      
      public function set properties(param1:Array) : void
      {
         clear();
         addObj(param1);
      }
      
      public function get length() : int
      {
         return properties.length;
      }
      
      override flash_proxy function setProperty(param1:*, param2:*) : void
      {
         addParam(param1,param2);
      }
      
      override flash_proxy function deleteProperty(param1:*) : Boolean
      {
         if(_props[param1])
         {
            _props[param1] = null;
            delete _props[param1];
            return true;
         }
         return false;
      }
      
      override flash_proxy function getProperty(param1:*) : *
      {
         if(isNaN(param1))
         {
            return _props[param1];
         }
         return properties[param1].value;
      }
      
      override flash_proxy function nextNameIndex(param1:int) : int
      {
         return param1 < length?param1 + 1:0;
      }
      
      override flash_proxy function nextName(param1:int) : String
      {
         return properties[param1 - 1].name;
      }
      
      override flash_proxy function nextValue(param1:int) : *
      {
         return properties[param1 - 1].value;
      }
   }
}
