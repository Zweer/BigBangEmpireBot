package com.playata.application.request
{
   import com.playata.application.AppConfig;
   import com.playata.framework.core.util.JsonUtil;
   import com.playata.framework.core.util.StringUtil;
   import com.playata.framework.network.NetworkCore;
   import com.playata.framework.network.request.RemoteRequest;
   import com.playata.framework.network.request.RequestData;
   
   public class InfoMessageRequest extends RemoteRequest
   {
       
      
      private var _onComplete:Function = null;
      
      public function InfoMessageRequest()
      {
         super();
      }
      
      public function send(param1:Function) : void
      {
         _onComplete = param1;
         var _loc2_:String = AppConfig.urlPublic;
         if(_loc2_.indexOf("index.php") != -1)
         {
            _loc2_ = StringUtil.replace(_loc2_,"index.php","infoMessage.php");
         }
         else if(StringUtil.endsWith(_loc2_,"/"))
         {
            _loc2_ = _loc2_ + "infoMessage.php";
         }
         else if(StringUtil.endsWith(_loc2_,"/"))
         {
            _loc2_ = _loc2_ + "/infoMessage.php";
         }
         createRequest(_loc2_,RequestData.fromData({"refresh":true}));
         sendRequest(NetworkCore.current.serverConnection);
      }
      
      override public function get requestName() : String
      {
         return "infoMessage";
      }
      
      override public function onRequestCompleted(param1:String, param2:String, param3:int) : void
      {
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = param1;
         var _loc4_:* = null;
         if(_loc7_ == "")
         {
            _loc5_ = param2;
            _loc6_ = null;
            try
            {
               _loc6_ = JsonUtil.decode(_loc5_);
               if(_loc6_ == null)
               {
                  throw new Error("Failed to decode JSON");
               }
               _loc4_ = _loc6_;
            }
            catch(e:Error)
            {
               if(!_loc5_)
               {
                  _loc7_ = "errorIO";
               }
               else
               {
                  _loc7_ = "errorInvalidResponseFormat";
               }
            }
         }
         else
         {
            _loc7_ = _loc7_ + " " + param3;
         }
         if(_loc7_ == "")
         {
            _onComplete(_loc4_,true);
         }
         else
         {
            _onComplete(null,false);
         }
      }
   }
}
