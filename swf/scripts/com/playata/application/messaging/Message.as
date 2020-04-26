package com.playata.application.messaging
{
   public class Message
   {
       
      
      private var _type:String;
      
      private var _data:Object;
      
      private var _sender:Object;
      
      public function Message(param1:String, param2:Object = null, param3:Object = null)
      {
         super();
         _type = param1;
         _data = param2;
         _sender = param3;
      }
      
      public function get type() : String
      {
         return _type;
      }
      
      public function get data() : Object
      {
         return _data;
      }
      
      public function get dataAsInt() : int
      {
         return _data as int;
      }
      
      public function get sender() : Object
      {
         return _sender;
      }
   }
}
