package com.playata.application.util
{
   import flash.events.StatusEvent;
   import flash.net.LocalConnection;
   
   public class MultiClientChecker
   {
       
      
      private var _connectionName:String;
      
      private var _onDuplicateClientFound:Function;
      
      private var _sender:LocalConnection;
      
      private var _receiver:LocalConnection;
      
      public function MultiClientChecker(param1:String, param2:int, param3:Function)
      {
         super();
         _connectionName = param1 + "_" + param2;
         _onDuplicateClientFound = param3;
         _receiver = new LocalConnection();
         _receiver.allowDomain("*");
         _receiver.allowInsecureDomain("*");
         _receiver.client = this;
         _sender = new LocalConnection();
         _sender.allowDomain("*");
         _sender.allowInsecureDomain("*");
         _sender.addEventListener("status",onStatusEvent);
         send();
      }
      
      private function listen() : void
      {
         try
         {
            _receiver.connect(_connectionName);
            return;
         }
         catch(e:Error)
         {
            return;
         }
      }
      
      private function send() : void
      {
         try
         {
            _receiver.connect("return_" + _connectionName);
         }
         catch(e:Error)
         {
         }
         _sender.send(_connectionName,"onCheckForSameUser");
      }
      
      private function onStatusEvent(param1:StatusEvent) : void
      {
         if(param1.level == "error")
         {
            try
            {
               _receiver.close();
            }
            catch(e:Error)
            {
            }
            listen();
         }
      }
      
      public function onOtherClientClosed() : void
      {
         _receiver.close();
         listen();
      }
      
      public function onCheckForSameUser() : void
      {
         _receiver.close();
         _onDuplicateClientFound();
         _sender.send("return_" + _connectionName,"onOtherClientClosed");
      }
      
      public function dispose() : void
      {
         try
         {
            _receiver.close();
         }
         catch(e:Error)
         {
         }
         _receiver = null;
         _sender = null;
      }
   }
}
