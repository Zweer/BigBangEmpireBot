package websocket.jimisaacs.data
{
   import websocket.jimisaacs.utils.QueryParameters;
   
   public class URL
   {
       
      
      private var _protocol:String;
      
      private var _hostname:String;
      
      private var _port:String;
      
      private var _pathname:String;
      
      private var _search:QueryParameters;
      
      private var _hash:String;
      
      public function URL(param1:String = "")
      {
         super();
         parse(param1);
      }
      
      public function parse(param1:String) : void
      {
         if(param1.indexOf("//") == -1)
         {
            param1 = "http://" + param1;
         }
         var _loc3_:Array = param1.split("//");
         _protocol = _loc3_.shift().split(":")[0];
         _loc3_ = _loc3_[0].split("/");
         host = _loc3_.shift();
         var _loc2_:String = _loc3_.join("/");
         if(_loc2_.indexOf("?") >= 0)
         {
            if(_loc2_.indexOf("#") >= 0)
            {
               if(_loc2_.indexOf("?") < _loc2_.indexOf("#"))
               {
                  _pathname = _loc2_.substring(0,_loc2_.indexOf("?"));
                  _search = new QueryParameters(_loc2_.substring(_loc2_.indexOf("?") + 1,_loc2_.indexOf("#")));
                  _hash = _loc2_.substring(_loc2_.indexOf("#") + 1,_loc2_.length);
               }
               else
               {
                  _pathname = _loc2_.substring(0,_loc2_.indexOf("#"));
                  _search = new QueryParameters(_loc2_.substring(_loc2_.indexOf("#") + 1,_loc2_.length).replace("?",""));
                  _hash = "";
               }
            }
            else
            {
               _pathname = _loc2_.substring(0,_loc2_.indexOf("?"));
               _search = new QueryParameters(_loc2_.substring(_loc2_.indexOf("?") + 1,_loc2_.length));
               _hash = "";
            }
         }
         else if(_loc2_.indexOf("#") >= 0)
         {
            _pathname = _loc2_.substring(0,_loc2_.indexOf("#"));
            _search = new QueryParameters();
            _hash = _loc2_.substring(_loc2_.indexOf("#") + 1,_loc2_.length);
         }
         else
         {
            _pathname = _loc2_.substring(0,_loc2_.length);
            _search = new QueryParameters();
            _hash = "";
         }
      }
      
      public function get href() : String
      {
         var _loc1_:String = protocol + "//" + host;
         if(pathname != "")
         {
            _loc1_ = _loc1_ + ("/" + pathname);
         }
         if(search != "")
         {
            _loc1_ = _loc1_ + ("?" + search);
         }
         if(hash != "")
         {
            _loc1_ = _loc1_ + ("#" + hash);
         }
         return _loc1_;
      }
      
      public function set href(param1:String) : void
      {
         parse(param1);
      }
      
      public function get protocol() : String
      {
         return _protocol;
      }
      
      public function set protocol(param1:String) : void
      {
         _protocol = param1;
      }
      
      public function get host() : String
      {
         var _loc1_:String = _hostname;
         if(_port != "")
         {
            _loc1_ = _loc1_ + (":" + _port);
         }
         return _loc1_;
      }
      
      public function set host(param1:String) : void
      {
         if(param1.indexOf(":") >= 0)
         {
            _hostname = param1.substring(0,param1.indexOf(":"));
            _port = param1.substring(param1.indexOf(":") + 1,param1.length);
         }
         else
         {
            _hostname = param1;
            _port = "";
         }
      }
      
      public function get hostname() : String
      {
         return _hostname;
      }
      
      public function set hostname(param1:String) : void
      {
         _hostname = param1;
      }
      
      public function get port() : String
      {
         return _port;
      }
      
      public function set port(param1:String) : void
      {
         _port = param1;
      }
      
      public function get pathname() : String
      {
         return _pathname;
      }
      
      public function set pathname(param1:String) : void
      {
         _pathname = param1;
      }
      
      public function get search() : String
      {
         return _search.queryString;
      }
      
      public function set search(param1:String) : void
      {
         _search.queryString = param1.replace("?","");
      }
      
      public function get parameters() : QueryParameters
      {
         return _search;
      }
      
      public function set parameters(param1:*) : void
      {
         _search.add(param1);
      }
      
      public function get hash() : String
      {
         return _hash;
      }
      
      public function set hash(param1:String) : void
      {
         _hash = param1.replace("#","");
      }
      
      public function valueOf() : Object
      {
         return this.href;
      }
      
      public function toString() : String
      {
         return this.href;
      }
   }
}
