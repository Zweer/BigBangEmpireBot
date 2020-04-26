package websocket.adobe.net.proxies
{
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.events.ProgressEvent;
   import flash.net.Socket;
   
   public class RFC2817Socket extends Socket
   {
       
      
      private var proxyHost:String = null;
      
      private var host:String = null;
      
      private var proxyPort:int = 0;
      
      private var port:int = 0;
      
      private var deferredEventHandlers:Object;
      
      private var buffer:String;
      
      public function RFC2817Socket(param1:String = null, param2:int = 0)
      {
         deferredEventHandlers = {};
         buffer = new String();
         if(param1 != null && param2 != 0)
         {
            super(param1,param2);
         }
      }
      
      public function setProxyInfo(param1:String, param2:int) : void
      {
         this.proxyHost = param1;
         this.proxyPort = param2;
         var _loc4_:Object = this.deferredEventHandlers["socketData"];
         var _loc3_:Object = this.deferredEventHandlers["connect"];
         if(_loc4_ != null)
         {
            super.removeEventListener("socketData",_loc4_.listener,_loc4_.useCapture);
         }
         if(_loc3_ != null)
         {
            super.removeEventListener("connect",_loc3_.listener,_loc3_.useCapture);
         }
      }
      
      override public function connect(param1:String, param2:int) : void
      {
         if(this.proxyHost == null)
         {
            this.redirectConnectEvent();
            this.redirectSocketDataEvent();
            super.connect(param1,param2);
         }
         else
         {
            this.host = param1;
            this.port = param2;
            super.addEventListener("connect",this.onConnect);
            super.addEventListener("socketData",this.onSocketData);
            super.connect(this.proxyHost,this.proxyPort);
         }
      }
      
      private function onConnect(param1:Event) : void
      {
         this.writeUTFBytes("CONNECT " + this.host + ":" + this.port + " HTTP/1.1\n\n");
         this.flush();
         this.redirectConnectEvent();
      }
      
      private function onSocketData(param1:ProgressEvent) : void
      {
         while(this.bytesAvailable != 0)
         {
            this.buffer = this.buffer + this.readUTFBytes(1);
            if(this.buffer.search(/\r?\n\r?\n$/) != -1)
            {
               this.checkResponse(param1);
               break;
            }
         }
      }
      
      private function checkResponse(param1:ProgressEvent) : void
      {
         var _loc2_:* = null;
         var _loc3_:String = this.buffer.substr(this.buffer.indexOf(" ") + 1,3);
         if(_loc3_.search(/^2/) == -1)
         {
            _loc2_ = new IOErrorEvent("ioError");
            _loc2_.text = "Error connecting to the proxy [" + this.proxyHost + "] on port [" + this.proxyPort + "]: " + this.buffer;
            this.dispatchEvent(_loc2_);
         }
         else
         {
            this.redirectSocketDataEvent();
            this.dispatchEvent(new Event("connect"));
            if(this.bytesAvailable > 0)
            {
               this.dispatchEvent(param1);
            }
         }
         this.buffer = null;
      }
      
      private function redirectConnectEvent() : void
      {
         super.removeEventListener("connect",onConnect);
         var _loc1_:Object = this.deferredEventHandlers["connect"];
         if(_loc1_ != null)
         {
            super.addEventListener("connect",_loc1_.listener,_loc1_.useCapture,_loc1_.priority,_loc1_.useWeakReference);
         }
      }
      
      private function redirectSocketDataEvent() : void
      {
         super.removeEventListener("socketData",onSocketData);
         var _loc1_:Object = this.deferredEventHandlers["socketData"];
         if(_loc1_ != null)
         {
            super.addEventListener("socketData",_loc1_.listener,_loc1_.useCapture,_loc1_.priority,_loc1_.useWeakReference);
         }
      }
      
      override public function addEventListener(param1:String, param2:Function, param3:Boolean = false, param4:int = 0, param5:Boolean = false) : void
      {
         if(param1 == "connect" || param1 == "socketData")
         {
            this.deferredEventHandlers[param1] = {
               "listener":param2,
               "useCapture":param3,
               "priority":param4,
               "useWeakReference":param5
            };
         }
         else
         {
            super.addEventListener(param1,param2,param3,param4,param5);
         }
      }
   }
}
