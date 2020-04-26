package websocket.socket.io.parser
{
   import com.playata.framework.core.logging.Logger;
   
   public class Encoder
   {
       
      
      public function Encoder()
      {
         super();
      }
      
      public function encode(param1:*, param2:Function) : void
      {
         var _loc3_:* = null;
         Logger.debug("encoding packet " + param1);
         if(param1.type == null)
         {
            throw new Error("Incorrect object type");
         }
         if(5 == param1.type || 6 == param1.type)
         {
            throw new Error("Encoder Does not support binary data");
         }
         _loc3_ = encodeAsString(param1);
         §§push(param2([_loc3_]));
      }
      
      public function encodeAsString(param1:*) : String
      {
         var _loc2_:String = "4";
         var _loc3_:Boolean = false;
         _loc2_ = _loc2_ + param1.type;
         if(param1.nsp && "/" != param1.nsp)
         {
            _loc3_ = true;
            Logger.debug("nsp : " + _loc3_);
            _loc2_ = _loc2_ + param1.nsp;
            Logger.debug("obj.nsp : " + param1.nsp);
         }
         if(null != param1.id)
         {
            if(_loc3_)
            {
               _loc2_ = _loc2_ + ",";
               _loc3_ = false;
            }
            _loc2_ = _loc2_ + param1.id;
         }
         if(null != param1.data)
         {
            if(_loc3_)
            {
               _loc2_ = _loc2_ + ",";
            }
            _loc2_ = _loc2_ + websocket.adobe.serialization.json.JSON.encode(param1.data);
         }
         Logger.debug("encoded " + param1 + " as " + _loc2_);
         return _loc2_;
      }
   }
}
