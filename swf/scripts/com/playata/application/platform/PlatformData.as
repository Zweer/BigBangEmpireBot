package com.playata.application.platform
{
   import com.playata.application.AppConfig;
   import com.playata.framework.application.Environment;
   import com.playata.framework.core.Core;
   import com.playata.framework.core.TypedObject;
   import com.playata.framework.core.logging.Logger;
   import com.playata.framework.core.util.JsonUtil;
   import com.playata.framework.network.NetworkCore;
   import com.playata.framework.network.request.RemoteRequest;
   import com.playata.framework.network.request.RequestData;
   
   public class PlatformData extends RemoteRequest
   {
      
      private static var _onPlatformSet:Function = null;
       
      
      private var _platform:String = null;
      
      public function PlatformData(param1:String)
      {
         super();
         _platform = param1;
      }
      
      public static function setPlatformData(param1:String, param2:String, param3:String, param4:Function) : void
      {
         _onPlatformSet = param4;
         var _loc5_:PlatformData = new PlatformData(param1);
         _loc5_.requestPlatformData(param2,param3);
      }
      
      override public function get requestName() : String
      {
         return "platformData";
      }
      
      public function requestPlatformData(param1:String, param2:String) : void
      {
         createRequest(AppConfig.urlPlatformRequest,RequestData.fromData({
            "platform":_platform,
            "locale":param1,
            "server_id":param2
         }));
         sendRequest(NetworkCore.current.serverConnection);
      }
      
      override public function onRequestCompleted(param1:String, param2:String, param3:int) : void
      {
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = param1;
         var _loc4_:Object = null;
         if(_loc7_ == "")
         {
            _loc5_ = param2;
            _loc6_ = null;
            try
            {
               _loc6_ = new TypedObject(JsonUtil.decode(_loc5_));
               if(_loc6_.rawData == null)
               {
                  throw new Error("Failed to decode JSON");
               }
               if(!_loc6_.hasData("data"))
               {
                  throw new Error("Field \'data\' not found.");
               }
               if(!_loc6_.hasData("error"))
               {
                  throw new Error("Field \'error\' not found.");
               }
               if(_loc6_.getString("error") === null)
               {
                  throw new Error("Field \'error\' not a string.");
               }
               if(_loc6_.getString("error") == "")
               {
                  _loc4_ = _loc6_.getData("data");
               }
               else
               {
                  _loc7_ = _loc6_.getString("error");
                  _loc4_ = null;
                  Logger.error("[Request] Error on server-side detected: " + _loc7_);
               }
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
            Core.config.extend(new TypedObject(_loc4_),true);
            _onPlatformSet(true);
         }
         else
         {
            Environment.reportError(_loc7_,request,false,true);
            _onPlatformSet(false);
         }
      }
   }
}
