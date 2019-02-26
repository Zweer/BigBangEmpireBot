package websocket.socket.io.parser
{
   import com.playata.framework.core.logging.Logger;
   
   public class Decoder
   {
       
      
      public function Decoder()
      {
         super();
      }
      
      public function decode(param1:String) : Object
      {
         var _loc2_:Object = decodeString(param1);
         if(5 == _loc2_.type || 6 == _loc2_.type)
         {
            throw new Error("Decoder Does not support binary data");
         }
         return _loc2_;
      }
      
      public function decodeString(param1:String) : Object
      {
         var _loc4_:* = null;
         var _loc6_:* = null;
         param1 = param1.substr(1);
         var _loc2_:Object = {};
         var _loc5_:int = 0;
         _loc2_.type = Number(param1.charAt(0));
         if(5 == _loc2_.type || 6 == _loc2_.type)
         {
            _loc2_.attachments = "";
            while(true, true)
            {
               _loc5_++;
               if(param1.charAt(_loc5_) == "-")
               {
                  break;
               }
               _loc2_.attachments = _loc2_.attachments + param1.charAt(_loc5_);
            }
            _loc2_.attachments = Number(_loc2_.attachments);
         }
         if("/" == param1.charAt(_loc5_ + 1))
         {
            _loc2_.nsp = "";
            while(true, true)
            {
               _loc5_++;
               if(_loc5_)
               {
                  _loc4_ = param1.charAt(_loc5_);
                  if("," != _loc4_)
                  {
                     _loc2_.nsp = _loc2_.nsp + _loc4_;
                     if(_loc5_ + 1 != param1.length)
                     {
                        continue;
                     }
                     break;
                  }
                  break;
               }
               break;
            }
         }
         else
         {
            _loc2_.nsp = "/";
         }
         var _loc3_:String = param1.charAt(_loc5_ + 1);
         if("" != _loc3_ && !isNaN(Number(_loc3_)))
         {
            _loc2_.id = "";
            while(true, true)
            {
               _loc5_++;
               if(_loc5_)
               {
                  _loc4_ = param1.charAt(_loc5_);
                  if(null == _loc4_ || isNaN(Number(_loc4_)))
                  {
                     _loc5_--;
                     break;
                  }
                  _loc2_.id = _loc2_.id + param1.charAt(_loc5_);
                  if(_loc5_ + 1 != param1.length)
                  {
                     continue;
                  }
                  break;
               }
               break;
            }
            _loc2_.id = Number(_loc2_.id);
         }
         _loc5_++;
         if(param1.charAt(_loc5_))
         {
            try
            {
               _loc6_ = param1.substr(_loc5_);
               _loc2_.data = websocket.adobe.serialization.json.JSON.decode(_loc6_);
            }
            catch(e:Error)
            {
               _loc2_.data = param1.substr(_loc5_);
            }
         }
         Logger.debug("decoded " + param1 + " as " + _loc2_);
         return _loc2_;
      }
   }
}
